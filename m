Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T03oa-0005Vn-0F
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 07:00:44 +0200
Received: by eekb57 with SMTP id b57so475756eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 21:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=D7NQATDyHIOcDzo9MhLdh0oGu472CmOxG7xQcSKzIkM=;
	b=e6J4P2MnYABddcViwC4eCX84AbdeUf/QZG5l6anHBVysFjCZO2jgtBl/VBE5y/txYR
	SThSjJSMqRiyncOP5k6CA+pmXvx2biEL+7Gcubf24/UJkkzC5QfGHyLzsFUPXcyZdrYg
	lb2aHesVlknXzrp+//EL5ML4cOQ1YV6J5qObAY3wrqI65DxzpoHzlrxd816y6ZuIkUKa
	qlt/qU3KFA9T+4kB1WOaY3SUfWYatO7cu7RduuQxlkjdpldqi9RulFz01RGxC4lheWu8
	kB4ZnqTtLjrR47NDfMXPqFf4HprhYJi8OnHlef736eO78rB8cWMS1n29um/xxU2Oq3B2
	LlBg==
Received: by 10.14.5.67 with SMTP id 43mr6000794eek.15.1344660533468; Fri, 10
	Aug 2012 21:48:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.225.6 with HTTP; Fri, 10 Aug 2012 21:48:23 -0700 (PDT)
In-Reply-To: <081e2a4154575d494f0f56f1b5e4ff70b93ca8e2.1344655148.git.scott.a.garman@intel.com>
References: <cover.1344655148.git.scott.a.garman@intel.com>
	<081e2a4154575d494f0f56f1b5e4ff70b93ca8e2.1344655148.git.scott.a.garman@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Aug 2012 21:48:23 -0700
Message-ID: <CAMKF1so0GJfh7uotOMxMDH2dD4KBbTM1rnGpB6w5yrf9EOaYEw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] runqemu: support booting poky-tiny images
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
X-List-Received-Date: Sat, 11 Aug 2012 05:00:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 10, 2012 at 8:20 PM, Scott Garman <scott.a.garman@intel.com> wrote:
> Added support for booting poky-tiny images, which do not have block
> device support. Note to shut down a running poky-tiny image, you
> need to include the -f option to the poweroff command.
>
> This fixes [YOCTO #2612].
>
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  scripts/runqemu          |    6 ++++++
>  scripts/runqemu-internal |    5 +++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 7454dd4..6f2f861 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -26,6 +26,7 @@ usage() {
>      echo "  KERNEL - the kernel image file to use"
>      echo "  ROOTFS - the rootfs image file or nfsroot directory to use"
>      echo "  MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)"
> +    echo "  TINY - specify 'tiny' if booting a poky-tiny image"


you seem to be mixing poky distro with OE-Core here. As a whole the
patch seems like adding support for ramfs based images. If you intend
to just have images specific to poky then this patch
belongs to OE-Core but if you generalize it enough that non
tiny users can also leverage this then it certainly is good
for OE-Core.

>      echo "  Simplified QEMU command-line options can be passed with:"
>      echo "    nographic - disables video console"
>      echo "    serial - enables a serial console on /dev/ttyS0"
> @@ -37,6 +38,7 @@ usage() {
>      echo "  $MYNAME qemuarm"
>      echo "  $MYNAME qemux86-64 core-image-sato ext3"
>      echo "  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial"
> +    echo "  $MYNAME qemux86 tiny"
>      echo "  $MYNAME qemux86 qemuparams=\"-m 256\""
>      echo "  $MYNAME qemux86 bootparams=\"psplash=false\""
>      exit 1
> @@ -118,6 +120,10 @@ while true; do
>                  LAZY_ROOTFS="true"
>              fi
>              ;;
> +        "tiny")
> +            FSTYPE=cpio.gz
> +            TINY=true
> +            ;;
>          "nographic")
>              SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
>              SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index eeadb24..5147c86 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -453,6 +453,11 @@ if [ "$MACHINE" = "akita" ]; then
>      fi
>  fi
>
> +if [ "x$TINY" = "xtrue" ]; then
> +    QEMUOPTIONS="-initrd $ROOTFS -nographic"
> +    KERNCMDLINE="console=ttyS0 root=/dev/ram0"
> +fi
> +
>  if [ "x$QEMUOPTIONS" = "x" ]; then
>      echo "Error: Unable to support this combination of options"
>      cleanup
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


