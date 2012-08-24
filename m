Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T4jNQ-0004Ek-NJ
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 04:12:00 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 23 Aug 2012 18:58:36 -0700
Received: by dakf10 with SMTP id f10so640628dak.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 18:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=AOVPkSiTa3LukWMqgkQGCB9+ZCEjrVRerxqqXkfyRYY=;
	b=nRFTEQZEnIzmhzwjShqAEKhmogMRaf+JuwRorPT6G9RSY1ZnTbaCAWcnP7ky92GgpL
	bRN8pfg+i3j1isI1jyOGScyVIWK+8owfA08DN8STBXrBlxlrygU8GSS8VJBF01KQiPaC
	noGitc8MvsKKxge8iG3jgm7ubc4HQggWmuHCrAQ/1WsMnhpeYcUsf34/ezIXI4tw3mpm
	Wc6lVQFMtYoQudVic0nl0HjzkYW642GlefWYh5xApJaMb0MD7Xsk7ao6fDemXEXrKnqt
	e70ATfB9VOecNA5zSRAnhw1WCbkAKVrDDgumH1Le0WW763ZEXpm9/5YRUis7k1CPNADh
	NDIA==
Received: by 10.66.74.100 with SMTP id s4mr7322751pav.27.1345773516022;
	Thu, 23 Aug 2012 18:58:36 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id qb6sm7194974pbb.18.2012.08.23.18.58.35
	(version=SSLv3 cipher=OTHER); Thu, 23 Aug 2012 18:58:35 -0700 (PDT)
Message-ID: <5036DFDB.6050302@intel.com>
Date: Thu, 23 Aug 2012 18:58:51 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1345754787-23198-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1345754787-23198-1-git-send-email-sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQnhPRLuziDfKynHEAHk7LiNigvc/f/id1mLqAdt7O7hXt1HRds7lHuK83KwBPvJihhVh2I3
Subject: Re: [PATCH] runqemu: Move the KVM check after the MACHINE/KERNEL Checks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 02:12:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2012 01:46 PM, Saul Wold wrote:
> The MACHINE/KERNEL Checks setup MACHINE is it's unset, the KVM checks valid
> MACHINE is qemux86 or qemux86-64 and fail if it's unset!
>
> [YOCTO #2970]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Thanks for this.

Acked-by: Scott Garman <scott.a.garman@intel.com>

> ---
>   scripts/runqemu |   31 ++++++++++++++++---------------
>   1 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 290f9cc..a3c3509 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -191,6 +191,22 @@ elif [ ! -w /dev/net/tun ] ; then
>   	exit 1
>   fi
>
> +# Report errors for missing combinations of options
> +if [ -z "$MACHINE" -a -z "$KERNEL" ]; then
> +    error "you must specify at least a MACHINE or KERNEL argument"
> +fi
> +if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
> +    error "NFS booting without an explicit ROOTFS path is not yet supported"
> +fi
> +
> +if [ -z "$MACHINE" ]; then
> +    MACHINE=`basename $KERNEL | sed 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
> +    if [ -z "$MACHINE" ]; then
> +        error "Unable to set MACHINE from kernel filename [$KERNEL]"
> +    fi
> +    echo "Set MACHINE to [$MACHINE] based on kernel [$KERNEL]"
> +fi
> +
>   YOCTO_KVM_WIKI="https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu"
>   # Detect KVM configuration
>   if [ "x$KVM_ENABLED" = "xyes" ]; then
> @@ -220,21 +236,6 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
>       fi
>   fi
>
> -# Report errors for missing combinations of options
> -if [ -z "$MACHINE" -a -z "$KERNEL" ]; then
> -    error "you must specify at least a MACHINE or KERNEL argument"
> -fi
> -if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
> -    error "NFS booting without an explicit ROOTFS path is not yet supported"
> -fi
> -
> -if [ -z "$MACHINE" ]; then
> -    MACHINE=`basename $KERNEL | sed 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
> -    if [ -z "$MACHINE" ]; then
> -        error "Unable to set MACHINE from kernel filename [$KERNEL]"
> -    fi
> -    echo "Set MACHINE to [$MACHINE] based on kernel [$KERNEL]"
> -fi
>   machine2=`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'`
>   # MACHINE is now set for all cases
>
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


