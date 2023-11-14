Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75D6C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 14:18:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.13519.1699971503093082955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 06:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RO8TU/RH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65F1E1BF208;
	Tue, 14 Nov 2023 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699971500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=epHIcu/2Ag5Tqo/U7gFeC5hSFk9lSw3AbH/LLDK8vEc=;
	b=RO8TU/RHjAC9a2kjR1nhBHnuY6TdqiYH3KT+kkDOBaZlXSikFI/lfIthvzrydel0G++Lnm
	xG8UsiGtd8sFJpQj2Ryj05eFHfCBvxzSdoO8l45N+zh76lBeOsyF4rP6p5ANmvRyiFL9il
	pRpJpRAeL8X+78ZdU7F+wmroV73ED8CQI6p7ZCXRMsSxg4gPiX1J+PbTUEFRK2SL4w0i3Q
	YvuXd3Op3Owe3CuQ0F6Vy/KFWud19epStYjVNzhxXnsMyfoRFPlsPM8si2E68/etQ4gpCz
	2xjK9jYSlpRaSVHBAXzeRSbuTaCvNrFO4L4gnTtiCiUoo1sMjy3DrpLkBeYAjw==
Date: Tue, 14 Nov 2023 15:18:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCHv2] bitbake.conf: drop ${PE} and ${PR} from
 -f{file,macro,debug}-prefix-map
Message-ID: <2023111414182077e85477@mail.local>
References: <20231113072524.119148-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113072524.119148-1-martin.jansa@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190510

Hello Martin,

The perf change uncovers:
https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/8098/steps/12/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/8056/steps/12/logs/warnings

And many more

On 13/11/2023 08:25:24+0100, Martin Jansa wrote:
> * ${EXTENDPE} and ${PR} was already dropped from ${WORKDIR} in:
>   https://lists.openembedded.org/g/openembedded-core/message/185818
>   adjust -fmacro-prefix-map and -fdebug-prefix-map similarly.
>   As we don't depend on PR in WORKDIR maybe we don't need it in
>   /usr/src/debug paths as well anymore.
> 
> * The interesting side-effect of this is that for DISTROs which still
>   use PR (e.g. webOS OSE), the difference in -fdebug-prefix-map causes
>   all binaries to be slightly different when rebuilt with different PR
>   (due to this path, even when otherwise they are binary reproducible)
>   and when the number of digits in PR changes (e.g. from r9 to r10) it
>   also results in slightly bigger binaries (and more unnecessary changes
>   in buildhistory diffs).
> 
>   For example this foo binary, the difference between "new" and "old" is
>   extra patch applied in SRC_URI (which doesn't affect the foo binary,
>   but was the reason for PR bump).
> 
>   And the binary is bigger with r10, identical with r6 and slightly
>   different due to debug-prefix-map between r6 and r7:
> 
>   $ ls -la 1.0.0-175-*/image/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182460 Nov  8 08:29 1.0.0-175-new-r10/image/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 08:02 1.0.0-175-new-r6/image/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:49 1.0.0-175-new-r7/image/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:39 1.0.0-175-old-r6/image/usr/sbin/foo
> 
>   $ md5sum 1.0.0-175-*/image/usr/sbin/foo
>   8e3ab67d596f8cc2f9c6320dab10af01  1.0.0-175-new-r10/image/usr/sbin/foo
>   f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-new-r6/image/usr/sbin/foo
>   6469a0b10aac233911e63c5ea97b03c0  1.0.0-175-new-r7/image/usr/sbin/foo
>   f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-old-r6/image/usr/sbin/foo
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
> v2: shorten to summary to fix:
> FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 140 characters) (test_mbox.TestMbox.test_shortlog_length)
> 
>  meta/conf/bitbake.conf                            | 8 ++++----
>  meta/recipes-core/ovmf/ovmf_git.bb                | 2 +-
>  meta/recipes-devtools/go/go-cross-canadian.inc    | 2 +-
>  meta/recipes-devtools/rust/cargo_1.70.0.bb        | 2 +-
>  meta/recipes-extended/acpica/acpica_20230628.bb   | 2 +-
>  meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb | 2 +-
>  meta/recipes-kernel/perf/perf.bb                  | 2 +-
>  meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb      | 2 +-
>  8 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 67ff769046..3836a389b8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -648,10 +648,10 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
>  ##################################################################
>  # Beware: applied last to first
>  DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
> - -fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> - -fdebug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> - -fmacro-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> - -fdebug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> + -fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${PV} \
> + -fdebug-prefix-map=${S}=/usr/src/debug/${PN}/${PV} \
> + -fmacro-prefix-map=${B}=/usr/src/debug/${PN}/${PV} \
> + -fdebug-prefix-map=${B}=/usr/src/debug/${PN}/${PV} \
>   -fdebug-prefix-map=${STAGING_DIR_HOST}= \
>   -fmacro-prefix-map=${STAGING_DIR_HOST}= \
>   -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index 6bbe21ac5c..bf67a2a4a8 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -122,7 +122,7 @@ fix_toolchain:append:class-native() {
>  # --debug-prefix-map to nasm (we carry a patch to nasm for this). The
>  # tools definitions are built by ovmf-native so we need to pass this in
>  # at target build time when we know the right values.
> -export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/ovmf/${EXTENDPE}${PV}-${PR}"
> +export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/ovmf/${PV}"
>  export GCC_PREFIX_MAP = "${DEBUG_PREFIX_MAP} -Wno-stringop-overflow -Wno-maybe-uninitialized"
>  
>  GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
> index 45758f3361..0a72e89bbd 100644
> --- a/meta/recipes-devtools/go/go-cross-canadian.inc
> +++ b/meta/recipes-devtools/go/go-cross-canadian.inc
> @@ -8,7 +8,7 @@ PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>  # it uses gcc on build machine during go-cross-canadian bootstrap, but
>  # the gcc version may be old and not support option '-fmacro-prefix-map'
>  # which is one of default values of DEBUG_PREFIX_MAP
> -DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> +DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV} \
>                      -fdebug-prefix-map=${STAGING_DIR_HOST}= \
>                      -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
>                      "
> diff --git a/meta/recipes-devtools/rust/cargo_1.70.0.bb b/meta/recipes-devtools/rust/cargo_1.70.0.bb
> index a5c1064106..9a23ba9d5f 100644
> --- a/meta/recipes-devtools/rust/cargo_1.70.0.bb
> +++ b/meta/recipes-devtools/rust/cargo_1.70.0.bb
> @@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
>  
>  inherit cargo pkgconfig
>  
> -DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
> +DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=/usr/src/debug/${PN}/${PV}"
>  
>  do_cargo_setup_snapshot () {
>  	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
> diff --git a/meta/recipes-extended/acpica/acpica_20230628.bb b/meta/recipes-extended/acpica/acpica_20230628.bb
> index b7921516a2..8ca1f0892f 100644
> --- a/meta/recipes-extended/acpica/acpica_20230628.bb
> +++ b/meta/recipes-extended/acpica/acpica_20230628.bb
> @@ -36,7 +36,7 @@ EXTRA_OEMAKE = "CC='${CC}' \
>                  INSTALLDIR=${bindir} \
>                  INSTALLFLAGS= \
>                  YACC=bison \
> -                YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
> +                YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV}' \
>                  "
>  
>  do_install() {
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> index 99ed82dac4..ca1910966e 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> @@ -24,7 +24,7 @@ RCONFLICTS:${PN} += "jpeg"
>  
>  inherit cmake pkgconfig
>  
> -export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
> +export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV}"
>  
>  # Add nasm-native dependency consistently for all build arches is hard
>  EXTRA_OECMAKE:append:class-native = " -DWITH_SIMD=False"
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index a90acd55ef..dee8b50b31 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -98,7 +98,7 @@ EXTRA_OEMAKE = '\
>      AR="${AR}" \
>      LD="${LD}" \
>      EXTRA_CFLAGS="-ldw -I${S}" \
> -    YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
> +    YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV}' \
>      EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
>      perfexecdir=${libexecdir} \
>      NO_GTK2=1 \
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
> index e65f80d64b..0ad2f80217 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
> @@ -151,7 +151,7 @@ do_configure() {
>      export TMPDIR="${B}/tmp"
>      mkdir -p ${B}/tmp
>      ${S}/configure ${EXTRA_OECONF}
> -    sed -i -e "s,^X86ASMFLAGS=.*,& --debug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} --debug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR},g" ${B}/ffbuild/config.mak
> +    sed -i -e "s,^X86ASMFLAGS=.*,& --debug-prefix-map=${S}=/usr/src/debug/${PN}/${PV} --debug-prefix-map=${B}=/usr/src/debug/${PN}/${PV},g" ${B}/ffbuild/config.mak
>  }
>  
>  # patch out build host paths for reproducibility
> -- 
> 2.42.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190461): https://lists.openembedded.org/g/openembedded-core/message/190461
> Mute This Topic: https://lists.openembedded.org/mt/102557173/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

