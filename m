Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SPc2S-0001Ol-IN
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 18:04:24 +0200
Received: from mail-qa0-f49.google.com ([209.85.216.49])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 02 May 2012 08:54:34 -0700
Received: by qabj40 with SMTP id j40so705842qab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 08:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=IugFNqhZLp061CT5w9rCoH7Aq2bY0Yqoed5C4sjFWEo=;
	b=bTtDQySuGH32bTJY8OVBCsm9fok3/MXAnOXvb+C+RriNXCdEL+tkC8kgMbqvQeAaUl
	uGkb640kSxUOOSx8Cr7TQyGrUzKxTmFA7xZmAFf/kvY5ewEkhtnG7D2PdGz2aBstVnPk
	AE3nYxWWH2vDObvXpX2hnv/mVI1k9iawq2PE71eS5bWaw+GcngYIEKP9wFiTF6nMutPU
	ASMG7mdvmIiPgbEAiTJ+TOoXJKAQBOiL5TfNeHBUtX0nG1rbVJYAkt8jU28wM5R9Puy0
	vMXPbSnk46CWTmsbHH/OjzoN4dI+MFpetWD1JRdoDEA9s+T5OAHTqhaxxomU0w2ScGNP
	vbUg==
Received: by 10.229.147.9 with SMTP id j9mr171825qcv.101.1335974073508;
	Wed, 02 May 2012 08:54:33 -0700 (PDT)
Received: from [10.0.0.113] ([12.70.159.234])
	by mx.google.com with ESMTPS id dv1sm3833038qab.22.2012.05.02.08.54.31
	(version=SSLv3 cipher=OTHER); Wed, 02 May 2012 08:54:32 -0700 (PDT)
Message-ID: <4FA158B5.40701@intel.com>
Date: Wed, 02 May 2012 08:54:29 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1335958246-4192-1-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1335958246-4192-1-git-send-email-jason.wessel@windriver.com>
X-Gm-Message-State: ALoCoQn2P4gUJyK2I/sPaUrZeRdqKk+BbLlOmpq/6Xm9dvZjMOL3FCQbwbX8/7Y4Hck3pi/Km+QO
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
X-List-Received-Date: Wed, 02 May 2012 16:04:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2012 04:30 AM, Jason Wessel wrote:
> By default the runqemu script tries to set the group permissions on any
> tap device it creates.  The TUNSETGROUP ioctl is not implemented on some
> popular host enterprise linux distributions.

Thanks for this, looks good to me without having done any testing on it.

Acked-by: Scott Garman <scott.a.garman@intel.com>

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


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


