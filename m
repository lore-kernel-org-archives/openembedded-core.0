Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 22F6260290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 01:23:04 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id u201so7523057oie.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 18:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=f32mXYgdCV0pHtuqN94psDTwaCTiP1C/I/4vbnqAVmI=;
	b=aus02Qm1YV04xDfdrNjExtx+ajexb8+YfU42Ij11yiJCHO8+BEWr7kX8n82F4mWe7u
	ass4gRXNTu0Z/Rd6URcAFra+xgz+Qj9oVwb91APRmKKYVTYOxyCegLAsfvfAZcPWvqIU
	0xhHnM++cr6jk/WoVRvfaGoNDExIy3mVrMdifR45lJULd/Lkx/Ss1GKWBfQEffZIYO8j
	F8dfyKnP9ZRF/RuOPuCkrGAZzkJIvvqOYW83Y4ZU0iBfcJau/m9nmO1tS4QYCHs8wEl0
	HDSBZBOoAhbLII6HtLAwF6ccPrvcMExhy1XA5OWRh9dbrS9wrztYuD6pEencDPNDe5o0
	yE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=f32mXYgdCV0pHtuqN94psDTwaCTiP1C/I/4vbnqAVmI=;
	b=isFP9if9giq420eaYvEjtT/VoselYb5tn9ny2c/StYsdKYXdnQPiJuWhufzCrH0Bt0
	rU+RfHNiw/Byhi8qrSObCwm4GJQmFjdQAZf5dxGjXd7BO/YBZ0/Tzf6lw5O55tJ6WOWR
	SJyL26CM7HmEjBmtRO1PKFYtui8p2++5nmqN9Bz3bfQ40+2tgr/vAf1s9nGHKJ+dJwkE
	tIyOH9Eg7/vNBKGzKy1WSSD+2lDDxSuChxkkV0XmK033eihRGnHpSwyNzhQGSJyjZ/ic
	uJVdFYHkHH1tshOr4N1XnmbqN1SZhB2pGSPhbrxAiHRnSHmTEG7i900nHpv1Ue7smSkC
	686A==
X-Gm-Message-State: ALyK8tJUe3/0d9YoWES9gteUQUNTYnGiBOmXOZEBs3lJ5gy7h4E6kG67s4l009WQF6C2MCn4iiWBbzNEit1onA==
X-Received: by 10.202.91.198 with SMTP id p189mr6272058oib.114.1465780984363; 
	Sun, 12 Jun 2016 18:23:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.129.164 with HTTP; Sun, 12 Jun 2016 18:23:03 -0700 (PDT)
In-Reply-To: <1465780196-7491-1-git-send-email-sarnold@vctlabs.com>
References: <1465780196-7491-1-git-send-email-sarnold@vctlabs.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Sun, 12 Jun 2016 18:23:03 -0700
Message-ID: <CAOLEWZV-OD+Sep2m=0JA9gFeDokX=Buy_HyR8qU=4b=Wx_TCMg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment vars
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
X-List-Received-Date: Mon, 13 Jun 2016 01:23:06 -0000
Content-Type: text/plain; charset=UTF-8

Okay, that wasn't supposed to cut off the v2 after PATCH...

Anyway, this is/was v2 for master branch (needs testing).

Steve

On Sun, Jun 12, 2016 at 6:09 PM, Stephen Arnold <sarnold@vctlabs.com> wrote:
> The main thing is build failures with gold linker, but qemu is also a
> little too aggressive at finding random tools on the build host, so we
> also set the build env for qemu-native and make sure it doesn't reset
> its own (hard-coded) cflags when we don't want it to.
>
> Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc                     | 13 +++++++++++--
>  meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch | 13 +++++++++++++
>  meta/recipes-devtools/qemu/qemu_2.6.0.bb                |  4 +++-
>  3 files changed, 27 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index bf689bb..d5925fd 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -30,8 +30,12 @@ SRC_URI_append_class-native = "\
>
>  EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
>
> -EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
> -                               "
> +EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
> +
> +EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
> +
> +LDFLAGS_append_class-native = " -fuse-ld=bfd"
> +
>  export LIBTOOL="${HOST_SYS}-libtool"
>
>  do_configure_prepend_class-native() {
> @@ -40,6 +44,11 @@ do_configure_prepend_class-native() {
>         if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
>                 export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
>         fi
> +
> +       # Alter target makefiles to accept CFLAGS set via env
> +       sed -i -r \
> +               -e 's/^(C|OP_C|HELPER_C)FLAGS=/\1FLAGS+=/' \
> +               "${S}"/Makefile "${S}"/Makefile.target
>  }
>
>  KVMENABLE = "--enable-kvm"
> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> new file mode 100644
> index 0000000..173394f
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> @@ -0,0 +1,13 @@
> +--- a/configure
> ++++ b/configure
> +@@ -4468,10 +4468,6 @@ fi
> + if test "$gcov" = "yes" ; then
> +   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
> +   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
> +-elif test "$fortify_source" = "yes" ; then
> +-  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
> +-elif test "$debug" = "no"; then
> +-  CFLAGS="-O2 $CFLAGS"
> + fi
> +
> + ##########################################
> diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> index e391326..735d013 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> @@ -8,7 +8,9 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
>              file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
>              file://no-valgrind.patch \
>              file://pathlimit.patch \
> -           "
> +            file://qemu-2.5.0-cflags.patch \
> +"
> +
>  SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
>  SRC_URI[md5sum] = "ca3f70b43f093e33e9e014f144067f13"
>  SRC_URI[sha256sum] = "c9ac4a651b273233d21b8bec32e30507cb9cce7900841febc330956a1a8434ec"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

