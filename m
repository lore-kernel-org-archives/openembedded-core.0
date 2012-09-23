Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TFqEg-0003Q0-9C
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Sep 2012 19:44:54 +0200
Received: by eaad12 with SMTP id d12so1323525eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Sep 2012 10:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7JcmfZe1alf26CV/ClsOc3j6xxErF0haZrtHeUFP7iw=;
	b=aX0423Zm8GF8RmlaC48feZqwsDXp9955PWUQX9ktKDlFHInu73cQJSLzSZvjVZcYyB
	gJwm3LiSq5mlYmMR2il/DoMV1N0W1nAaVLHQZVL7L7rNFEV+fG6rIE8uy96cLtHyfQDW
	Ec+BrH6o7iRkraAieIY064GxmhoKZ+BCKksvhxiFiVTdVPzIGInNryk76Vhk+nN3w4Uk
	Gy1wEQairhlZAoJrNAo264l6JhFQo1jElaoJbaBo03YVQ6ACnYaRk2T/aKJX7FT2iW2e
	cxoT9FSZbSyjEXXsvpu3uW+eKiE/rdtfdFLPo7BQtDVQOUQBiiVltEfWdtGeGZNOoyQ3
	Lj6w==
Received: by 10.14.218.134 with SMTP id k6mr12256971eep.14.1348421527203; Sun,
	23 Sep 2012 10:32:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Sun, 23 Sep 2012 10:31:37 -0700 (PDT)
In-Reply-To: <1348331093.4444.218.camel@x121e.pbcl.net>
References: <1348331093.4444.218.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Sep 2012 10:31:37 -0700
Message-ID: <CAMKF1sr_zaF9B-kWwDexh6jwL8S2oKxnBMqg4BQ7eAdEh4X5vA@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Ensure that ${sbindir} is respected
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
X-List-Received-Date: Sun, 23 Sep 2012 17:44:54 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 22, 2012 at 9:24 AM, Phil Blundell <philb@gnu.org> wrote:
> The configure script uses a hard-coded value for ${usrsbin_execdir},
> which is the path that we know as ${sbindir}.  Adjust configure to take
> this from the environment if it's set there, and have do_configure()
> pass it in.

I think our expectation is same as what the configure is defining
which is sbin dir under exec_prefix
why do we want this knob ?

>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/recipes-core/util-linux/util-linux.inc        |    4 +++-
>  .../util-linux/util-linux/configure-sbindir.patch  |   13 +++++++++++++
>  meta/recipes-core/util-linux/util-linux_2.21.2.bb  |    3 ++-
>  3 files changed, 18 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 79e0608..2c5267f 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -38,7 +38,9 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
>                  --enable-kill --enable-last --enable-mesg --enable-partx \
>                  --enable-raw --enable-rdev --enable-reset --disable-login-utils \
>                  --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
> -                --enable-libuuid --enable-libblkid --enable-fsck --without-udev"
> +                --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
> +               usrsbin_execdir='${sbindir}' \
> +"
>
>  FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
>
> diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> new file mode 100644
> index 0000000..5d0a59b
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> @@ -0,0 +1,13 @@
> +--- util-linux-2.21.2/configure.ac~    2012-09-22 09:29:12.354215377 +0100
> ++++ util-linux-2.21.2/configure.ac     2012-09-22 16:47:14.713628946 +0100
> +@@ -67,7 +67,9 @@
> + usrbin_execdir='${exec_prefix}/bin'
> + AC_SUBST([usrbin_execdir])
> +
> +-usrsbin_execdir='${exec_prefix}/sbin'
> ++if [ -z "$usrsbin_execdir" ]; then
> ++   usrsbin_execdir='${exec_prefix}/sbin'
> ++fi
> + AC_SUBST([usrsbin_execdir])
> +
> + usrlib_execdir='${exec_prefix}/'$libdirname
> diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> index 6ef3163..e8f00fc 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> @@ -1,5 +1,5 @@
>  MAJOR_VERSION = "2.21"
> -PR = "r2"
> +PR = "r3"
>  require util-linux.inc
>
>  # note that `lscpu' is under GPLv3+
> @@ -8,6 +8,7 @@ LICENSE_${PN}-lscpu = "GPLv3+"
>  SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
>              file://util-linux-ng-2.16-mount_lock_path.patch \
>              file://uclibc-__progname-conflict.patch \
> +           file://configure-sbindir.patch \
>  "
>
>  SRC_URI[md5sum] = "b75b3cfecb943f74338382fde693c2c3"
> --
> 1.7.9
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


