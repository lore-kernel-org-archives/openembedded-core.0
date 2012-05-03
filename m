Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQ2TG-0001RM-Mw
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 22:17:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2012 13:07:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149066396"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2012 13:07:51 -0700
Message-ID: <4FA2E597.2030500@linux.intel.com>
Date: Thu, 03 May 2012 13:07:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335968668-3019-1-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1335968668-3019-1-git-send-email-jason.wessel@windriver.com>
Subject: Re: [PATCH] runqemu: Fix TAP='TUNSETGROUP: Invalid argument' by falling back to tunctl -u
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 20:17:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2012 07:24 AM, Jason Wessel wrote:
> By default the runqemu script tries to set the group permissions on any
> tap device it creates.  The TUNSETGROUP ioctl is not implemented on some
> popular host enterprise linux distributions.
>
> Internally the script will exit as follows:
>
> ++ /opt/qemux86/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tunctl -b -g 100
> + TAP='TUNSETGROUP: Invalid argument'
> + STATUS=1
> + '[' 1 -ne 0 ']'
> + echo 'tunctl failed:'
> tunctl failed:
> + echo TUNSETGROUP: Invalid argument
>
> This patch implements a fallback to using the userid as the owner of
> the tap device which is supported by all 2.6 kernels, the default remains
> to try and use the groupid first.
>
> Signed-off-by: Jason Wessel<jason.wessel@windriver.com>
> ---
>   scripts/runqemu-ifup     |   20 +++++++++++++-------
>   scripts/runqemu-internal |    5 +++--
>   2 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
> index f80538f..e4c3daf 100755
> --- a/scripts/runqemu-ifup
> +++ b/scripts/runqemu-ifup
> @@ -34,7 +34,7 @@
>   # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>
>   usage() {
> -	echo "sudo $(basename $0)<gid>  <native-sysroot-basedir>"
> +	echo "sudo $(basename $0)<uid>  <gid>  <native-sysroot-basedir>"
>   }
>
>   if [ $EUID -ne 0 ]; then
> @@ -42,13 +42,14 @@ if [ $EUID -ne 0 ]; then
>   	exit 1
>   fi
>
> -if [ $# -ne 2 ]; then
> +if [ $# -ne 3 ]; then
>   	usage
>   	exit 1
>   fi
>
> -GROUP="-g $1"
> -NATIVE_SYSROOT_DIR=$2
> +USERID="-u $1"
> +GROUP="-g $2"
> +NATIVE_SYSROOT_DIR=$3
>
>   TUNCTL=$NATIVE_SYSROOT_DIR/usr/bin/tunctl
>   if [ ! -x "$TUNCTL" ]; then
> @@ -59,9 +60,14 @@ fi
>   TAP=`$TUNCTL -b $GROUP 2>&1`
>   STATUS=$?
>   if [ $STATUS -ne 0 ]; then
> -	echo "tunctl failed:"
> -	echo $TAP
> -	exit 1
> +# If tunctl -g fails, try using tunctl -u, for older host kernels
> +# which do not support the TUNSETGROUP ioctl
> +	TAP=`$TUNCTL -b $USERID 2>&1`
> +	STATUS=$?
> +	if [ $STATUS -ne 0 ]; then
> +		echo "tunctl failed:"
> +		exit 1
> +	fi
>   fi
>
>   IFCONFIG=`which ifconfig 2>  /dev/null`
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 1831a09..fb0d806 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -173,13 +173,14 @@ if [ "$TAP" = "" ]; then
>       fi
>
>       GROUPID=`id -g`
> +    USERID=`id -u`
>       echo "Setting up tap interface under sudo"
>       # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
>       # but inactive. This looks scary but is harmless
> -    tap=`sudo $QEMUIFUP $GROUPID $OECORE_NATIVE_SYSROOT 2>  /dev/null`
> +    tap=`sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT 2>  /dev/null`
>       if [ $? -ne 0 ]; then
>           # Re-run standalone to see verbose errors
> -        sudo $QEMUIFUP $GROUPID $OECORE_NATIVE_SYSROOT
> +        sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT
>           return
>       fi
>       LOCKFILE="$LOCKDIR/$tap"

Merged into OE-Core

Thanks
	Sau!


