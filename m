Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrAQY-0001Rk-A4
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:15:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jul 2012 09:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="178852945"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2012 09:03:49 -0700
Message-ID: <50058CE5.8020800@linux.intel.com>
Date: Tue, 17 Jul 2012 09:03:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] runqemu: Fix running qemu when build without gl
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
X-List-Received-Date: Tue, 17 Jul 2012 16:15:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2012 10:07 AM, Khem Raj wrote:
> When gl is disabled in PACKAGECONFIG then we dont need
> to check for supporting libs to be present before running
> qemu.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   scripts/runqemu          |   14 --------------
>   scripts/runqemu-internal |   17 +++++++++++++++++
>   2 files changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 8d149a2..0b547f2 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -384,20 +384,6 @@ echo "FSTYPE: [$FSTYPE]"
>   setup_sysroot
>   # OECORE_NATIVE_SYSROOT is now set for all cases
>
> -# We can't run without a libGL.so
> -libgl='no'
> -
> -[ -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so ] && libgl='yes'
> -[ -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so ] && libgl='yes'
> -[ -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so ] && libgl='yes'
> -
> -if [ "$libgl" != 'yes' ]; then
> -    echo "You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.
> -    Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.
> -    Fedora package names are: mesa-libGL-devel mesa-libGLU-devel."
> -    exit 1;
> -fi
> -
>   INTERNAL_SCRIPT="$0-internal"
>   if [ ! -f "$INTERNAL_SCRIPT" -o ! -r "$INTERNAL_SCRIPT" ]; then
>   INTERNAL_SCRIPT=`which runqemu-internal`
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 041464d..2598800 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -467,6 +467,23 @@ if [ ! -x "$QEMUBIN" ]; then
>       return
>   fi
>
> +NEED_GL=`ldd $QEMUBIN/$QEMU 2>&1 | grep libGLU`
> +# We can't run without a libGL.so
> +if [ "$NEED_GL" != "" ]; then
> +    libgl='no'
> +
> +    [ -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so ] && libgl='yes'
> +    [ -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so ] && libgl='yes'
> +    [ -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so ] && libgl='yes'
> +
> +    if [ "$libgl" != 'yes' ]; then
> +        echo "You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.
> +        Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.
> +        Fedora package names are: mesa-libGL-devel mesa-libGLU-devel."
> +        exit 1;
> +    fi
> +fi
> +
>   do_quit() {
>       if [ -n "$PIDFILE" ]; then
>           #echo kill `cat $PIDFILE`
>

Merged this patch into OE-Core

Thanks
	Sau!



