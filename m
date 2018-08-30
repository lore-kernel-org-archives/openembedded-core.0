Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4091A746B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 18:27:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7UIRpwk008972
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Aug 2018 11:27:52 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 30 Aug 2018 11:27:50 -0700
To: <openembedded-core@lists.openembedded.org>, Andrej Valek
	<andrej.valek@siemens.com>
References: <8955c839-85a0-d8b0-e36f-8ed6f7152547@siemens.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <2b58bfb4-9acf-f273-1ca0-61d6c8b90bff@windriver.com>
Date: Thu, 30 Aug 2018 14:27:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8955c839-85a0-d8b0-e36f-8ed6f7152547@siemens.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH v2] busybox: update to 1.29.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2018 18:27:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/30/2018 04:25 AM, Andrej Valek wrote:
>    - refresh busybox-udhcpc-no_deconfig.patch
>    - remove obsolete patches which are included in this update
>    - update defconfig

It seems that you just adapted to upstream changes so just say so
in the long log.

I looked at the defconfig changes and I have some minor comments
on that below. I think we should merge the defconfig as is with
a long log comment.

It might be nice to add the setfattr applet but that can be done
later or even in the next release if someone comes up with a real
need rather than thinking that it's  "nice to have".


Also, your patch email was in the wrong format and
even if I work around that, it didn't apply to master.

You email encoding is:

Openpgp: preference=signencrypt
Autocrypt: addr=andrej.valek@siemens.com; prefer-encrypt=mutual; keydata=
         xsBNBFkSzTcBCADSJTRk7Y...bIFUmc7ck3KeuUGKy
         ifrpWD6/7YPXbixv4sAlFl...zmMdr0BPLMsL96nBO
...
    Content-Type: text/plain; charset="utf-8"
    Content-Transfer-Encoding: base64

so while I can read it in an email client such as Thunderbird,
if I save it and try to git am it, that doesn't work since
it's encoded.

Can you resend using:
    Content-Type: text/plain; charset="us-ascii"
    Content-Transfer-Encoding: 7bit
or maybe someone will explain how to deal with this encoding.

Even saving the text doesn't result in a good patch
due to line wrapping (which I tried to fix manually)
and then another error:
   $ git am /tmp/bb-txt/busybox-update-fix.txt
   Applying: busybox: update to 1.29.2
   error: patch failed: \
     meta/recipes-core/busybox/busybox/CVE-2011-5325.patch:1
   error: meta/recipes-core/busybox/busybox/CVE-2011-5325.patch: \
     patch does not apply
   error: patch failed: \
     meta/recipes-core/busybox/busybox/CVE-2017-15873.patch:1
   error: meta/recipes-core/busybox/busybox/CVE-2017-15873.patch: \
     patch does not apply
   ...

I use 'git send-email' and usually remember to us:
    --smtp-server=smtp.example.com
to avoid Outlook being a problem. I expect that some of
your co-workers have dealt with the problem already.

Or maybe just send punch cards! ;-)


Thanks Andrej!

../Randy
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>   ...inittab_1.27.2.bb => busybox-inittab_1.29.2.bb} |   0
>   .../busybox/busybox/CVE-2011-5325.patch            | 481
> ---------------------
>   .../busybox/busybox/CVE-2017-15873.patch           |  95 ----
>   .../busybox/busybox/busybox-CVE-2017-16544.patch   |  43 --
>   .../busybox/busybox-fix-lzma-segfaults.patch       | 106 -----
>   .../busybox/busybox-udhcpc-no_deconfig.patch       |  48 +-
>   meta/recipes-core/busybox/busybox/defconfig        |  46 +-
>   .../busybox/busybox/umount-ignore-c.patch          |  40 --
>   .../{busybox_1.27.2.bb => busybox_1.29.2.bb}       |   9 +-
>   9 files changed, 66 insertions(+), 802 deletions(-)
>   rename meta/recipes-core/busybox/{busybox-inittab_1.27.2.bb =>
> busybox-inittab_1.29.2.bb} (100%)
>   delete mode 100755 meta/recipes-core/busybox/busybox/CVE-2011-5325.patch
>   delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2017-15873.patch
>   delete mode 100644
> meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch
>   delete mode 100644
> meta/recipes-core/busybox/busybox/busybox-fix-lzma-segfaults.patch
>   delete mode 100644 meta/recipes-core/busybox/busybox/umount-ignore-c.patch
>   rename meta/recipes-core/busybox/{busybox_1.27.2.bb =>
> busybox_1.29.2.bb} (82%)
> 

...

> diff --git a/meta/recipes-core/busybox/busybox/defconfig
> b/meta/recipes-core/busybox/busybox/defconfig
> index 59d93c7079..f081f281cc 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -1,12 +1,12 @@
>   #
>   # Automatically generated make config: don't edit
> -# Busybox version: 1.27.2
> -# Wed Sep 27 08:56:13 2017
> +# Busybox version: 1.29.1

s/1.29.1/1.29.2/

> +# Thu Jul 19 11:09:46 2018
>   #
>   CONFIG_HAVE_DOT_CONFIG=y
> 
>   #
> -# Busybox Settings
> +# Settings
>   #
>   # CONFIG_DESKTOP is not set
>   # CONFIG_EXTRA_COMPAT is not set
> @@ -78,7 +78,7 @@ CONFIG_NO_DEBUG_LIB=y
>   # CONFIG_EFENCE is not set
> 
>   #
> -# Busybox Library Tuning
> +# Library Tuning
>   #
>   # CONFIG_FEATURE_USE_BSS_TAIL is not set
>   CONFIG_FEATURE_RTMINMAX=y
> @@ -90,6 +90,7 @@ CONFIG_MD5_SMALL=1
>   CONFIG_SHA3_SMALL=1
>   CONFIG_FEATURE_FAST_TOP=y
>   # CONFIG_FEATURE_ETC_NETWORKS is not set
> +# CONFIG_FEATURE_ETC_SERVICES is not set
>   CONFIG_FEATURE_EDITING=y
>   CONFIG_FEATURE_EDITING_MAX_LEN=1024
>   # CONFIG_FEATURE_EDITING_VI is not set
> @@ -321,6 +322,7 @@ CONFIG_TRUE=y
>   CONFIG_TTY=y
>   CONFIG_UNAME=y
>   CONFIG_UNAME_OSNAME="GNU/Linux"
> +# CONFIG_BB_ARCH is not set
>   CONFIG_UNIQ=y
>   CONFIG_UNLINK=y
>   CONFIG_USLEEP=y
> @@ -393,6 +395,14 @@ CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
>   CONFIG_WHICH=y
> 
>   #
> +# klibc-utils
> +#
> +# CONFIG_MINIPS is not set
> +# CONFIG_NUKE is not set
> +# CONFIG_RESUME is not set
> +# CONFIG_RUN_INIT is not set
> +
> +#
>   # Editors
>   #
>   CONFIG_AWK=y
> @@ -678,6 +688,10 @@ CONFIG_FEATURE_MOUNT_LOOP=y
>   CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
>   # CONFIG_FEATURE_MTAB_SUPPORT is not set
>   # CONFIG_VOLUMEID is not set
> +
> +#
> +# Filesystem/Volume identification
> +#
>   # CONFIG_FEATURE_VOLUMEID_BCACHE is not set
>   # CONFIG_FEATURE_VOLUMEID_BTRFS is not set
>   # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
> @@ -725,6 +739,7 @@ CONFIG_FEATURE_CROND_DIR=""
>   # CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
>   # CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
>   # CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
> +# CONFIG_HEXEDIT is not set
>   # CONFIG_I2CGET is not set
>   # CONFIG_I2CSET is not set
>   # CONFIG_I2CDUMP is not set
> @@ -807,6 +822,7 @@ CONFIG_MICROCOM=y
>   # CONFIG_RUNLEVEL is not set
>   # CONFIG_RX is not set
>   # CONFIG_SETSID is not set
> +# CONFIG_SETFATTR is not set

Seems like that might be useful and should be enabled by default
but I don't need it for 2.6

It's not a huge delta:
b278ac0e6 setfattr: new applet
...
    (add/remove: 7/0 grow/shrink: 4/0 up/down: 458/0)
              Total: 458 bytes


>   CONFIG_STRINGS=y
>   CONFIG_TIME=y
>   # CONFIG_TIMEOUT is not set
> @@ -912,6 +928,8 @@ CONFIG_FEATURE_FANCY_PING=y
>   CONFIG_ROUTE=y
>   # CONFIG_SLATTACH is not set
>   # CONFIG_SSL_CLIENT is not set
> +# CONFIG_TC is not set
> +# CONFIG_FEATURE_TC_INGRESS is not set
>   # CONFIG_TCPSVD is not set
>   # CONFIG_UDPSVD is not set
>   CONFIG_TELNET=y
> @@ -949,13 +967,9 @@ CONFIG_FEATURE_WGET_HTTPS=y
>   # CONFIG_FEATURE_WGET_OPENSSL is not set
>   # CONFIG_WHOIS is not set
>   # CONFIG_ZCIP is not set
> -# CONFIG_UDHCPC6 is not set
> -# CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
> -# CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
> -# CONFIG_FEATURE_UDHCPC6_RFC4833 is not set

Ah, these are just moved down a few lines.

>   CONFIG_UDHCPD=y
> -# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
>   # CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
> +# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
>   CONFIG_DHCPD_LEASES_FILE="/var/lib/misc/udhcpd.leases"
>   CONFIG_DUMPLEASES=y
>   # CONFIG_DHCPRELAY is not set
> @@ -963,6 +977,15 @@ CONFIG_UDHCPC=y
>   CONFIG_FEATURE_UDHCPC_ARPING=y
>   CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
>   CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
> +# CONFIG_UDHCPC6 is not set
> +# CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
> +# CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
> +# CONFIG_FEATURE_UDHCPC6_RFC4833 is not set
> +# CONFIG_FEATURE_UDHCPC6_RFC5970 is not set
> +
> +#
> +# Common options for DHCP applets
> +#
>   # CONFIG_FEATURE_UDHCP_PORT is not set
>   CONFIG_UDHCP_DEBUG=0
>   # CONFIG_FEATURE_UDHCP_RFC3397 is not set
> @@ -1045,6 +1068,7 @@ CONFIG_WATCH=y
>   # CONFIG_SV is not set
>   CONFIG_SV_DEFAULT_SERVICE_DIR=""
>   # CONFIG_SVC is not set
> +# CONFIG_SVOK is not set
>   # CONFIG_SVLOGD is not set
>   # CONFIG_CHCON is not set
>   # CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
> @@ -1134,6 +1158,10 @@ CONFIG_FEATURE_SH_HISTFILESIZE=y
>   # System Logging Utilities
>   #
>   CONFIG_KLOGD=y
> +
> +#
> +# klogd should not be used together with syslog to kernel printk buffer
> +#
>   CONFIG_FEATURE_KLOGD_KLOGCTL=y
>   CONFIG_LOGGER=y
>   # CONFIG_LOGREAD is not set
> diff --git a/meta/recipes-core/busybox/busybox/umount-ignore-c.patch
> b/meta/recipes-core/busybox/busybox/umount-ignore-c.patch
> deleted file mode 100644
> index 9fe7998df3..0000000000
> --- a/meta/recipes-core/busybox/busybox/umount-ignore-c.patch
> +++ /dev/null
...
> diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb
> b/meta/recipes-core/busybox/busybox_1.29.2.bb
> similarity index 82%
> rename from meta/recipes-core/busybox/busybox_1.27.2.bb
> rename to meta/recipes-core/busybox/busybox_1.29.2.bb
> index 1ce4823d47..c86b4f57b3 100644
> --- a/meta/recipes-core/busybox/busybox_1.27.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.29.2.bb
> @@ -42,13 +42,8 @@ SRC_URI =
> "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://rcK \
>              file://runlevel \
>              file://makefile-libbb-race.patch \
> -           file://CVE-2011-5325.patch \
> -           file://CVE-2017-15873.patch \
> -           file://busybox-CVE-2017-16544.patch \
> -           file://busybox-fix-lzma-segfaults.patch \
> -           file://umount-ignore-c.patch \
>   "
>   SRC_URI_append_libc-musl = " file://musl.cfg "
> 
> -SRC_URI[tarball.md5sum] = "476186f4bab81781dab2369bfd42734e"
> -SRC_URI[tarball.sha256sum] =
> "9d4be516b61e6480f156b11eb42577a13529f75d3383850bb75c50c285de63df"
> +SRC_URI[tarball.md5sum] = "9cffb6c0e4df06914205f38ac8b40d80"
> +SRC_URI[tarball.sha256sum] =
> "fc250730ea16d28839bfecda3c431683fa6bd4273ffca6b632cbeb3556c914c3"
> 


-- 
# Randy MacLeod
# Wind River Linux

