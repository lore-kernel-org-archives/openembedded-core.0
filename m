Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BADAC9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:56 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33585.1790495028014749962
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=D2KeztHV;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso1625338f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495026; x=1791099826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I/cVBnea7LnXXs0VgcP/HtkafhU6jxQyEXhC9rmlNfI=;
        b=D2KeztHVcb395iFm5i8IvgEHbTyOD4I+Jba2p1UAj6vc1W0avPy1Aq6kMeAgDjEF2w
         25eFoMypaXhkzEjdePmUMWZIRaD3kgEdeop9ECVN4TWSp4OI0YdHxOv1iuL94yZFubJl
         XqHH4cY+PuE0eWEe2dJC3W2ChHbuvrawBebFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495026; x=1791099826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=I/cVBnea7LnXXs0VgcP/HtkafhU6jxQyEXhC9rmlNfI=;
        b=Z9KycMUrNUFw86/xONjQ/tqsOB35lSdnNSAb58QmSwiKU55WlKTwhc9HIas8NF0EM9
         /80BA8hGIg74j0dfAMLvGzabPIkTCXU27VxUnhVz3A839pNDJUNOPTXrftc9ul7VNkF1
         Y6Phv0625A2gqbeh45AORpwidDiAAJ+5qd8pEYTQLQrKmza1xRB5OS5b6oE8UAG0yuD1
         MmW3cYi3B1FJDuZNqX4gkjh5jlO5VpoJTRs71km7lBgV5A769LdEO02gdE5bCWB46LKq
         mVDc3WerKGHFYI4bn9z4g7KqRvFC7qBd4iwBPZxZbPu/GlIxZZKNArUstY5qYDY1MSKY
         LvHg==
X-Gm-Message-State: AFq9FYIQt+J+WKUXcOXPjZQ8XquOM4RVnY+Ve6Imf6j4OXAwpj3ZXy6h
	EzAWx6NXrpZgt2g5ECgwcTBkotqfxlgszcUIfU6n/iWre40miogtQ+bAab4/UxJfCaExgj/qe66
	WmLenkfg=
X-Gm-Gg: AYBFou1vfi+FFNWMu2PmliGqwbqzhH0G3FOFam+9xWEolkrgZiorBLJKCNnQ7XkCkaT
	BHoMZiihvh6mN9enxwTzgit67p7NTszI9R+sK8Cdy0ElOT/09+BHRQbF5YtyE98PzTuEvOYr9mJ
	L6So5hQfn/9gZLXADEsWgpp1PPc3QFBdP/DJ4I0HiRS9u+EaZ7ApOXzJo87BXXc+GwWRoRncjy7
	inwxB+49AqQyASdXVPk3GBHVT+5oq2zStdUqVVM70GLIgScwNRt7cOfq5fUC7IjtO7KzYr4scAI
	2xb1i/M0+zFGVrtnK54YxFtJIWX8pAUSA4r+Fw/DaHdGXzqe6zbXo+N5fb/S6f/iLqZ9kKkzrJh
	wPVTrEdQXP0OzWfB41hlNN1j0JS5BAv+gIBn3IwDpNlz81Rg/265AdQX0zG6jTM1Fu6wAI0+6FG
	D3VYo7hTxkN3Jd/Clr+b9UOz8LTwCWaBOwZ4U6dVhSHp3ByCYwuuw0W0NQMBFbyOIF/dSWZt3nV
	LObsK27TifxNpag4MYiv2V0kpuujJxT9+ltUiTEc1HuGP8L4S4/ShkFsK+D6puQ8p9h5S+eVw==
X-Received: by 2002:a5d:5d08:0:b0:487:35c:6e6b with SMTP id ffacd0b85a97d-48872a5c2d7mr20201612f8f.12.1790495026287;
        Sun, 27 Sep 2026 00:43:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/28] toolchain-scripts: fix kernel host tool builds broken in the SDK
Date: Sun, 27 Sep 2026 09:43:02 +0200
Message-ID: <18584d330d0711d1d670c73b806e1f98e1d11c69.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246661

From: Daniel Dragomir <daniel.dragomir@windriver.com>

Building an out-of-tree kernel module with an SDK fails while the kernel is
compiling its own host tools:

  $ cd $SDKTARGETSYSROOT/usr/lib/modules/*/build
  $ make modules_prepare
  ...
  /usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefined
  /usr/include/stdlib.h:219: error: redundant redeclaration of 'strtol'

objtool and the other tools under tools/ ask pkg-config where libelf is, via
HOSTPKG_CONFIG. They are host programs, but the SDK environment sets
PKG_CONFIG_SYSROOT_DIR and PKG_CONFIG_PATH so that pkg-config answers for the
target, and that answer now contains -I/usr/include. Passing /usr/include
explicitly with -I makes the compiler treat those headers as ordinary headers
rather than system headers, so the warnings inside them stop being suppressed
and -Werror turns them into errors.

Ordinary applications built with the SDK are affected too, less visibly: they
pick up a redundant -I$SDKTARGETSYSROOT/usr/include and
-L$SDKTARGETSYSROOT/usr/lib that they never used to get.

Neither the kernel nor the SDK layout changed. What changed is which
pkg-config implementation the SDK ships. pkg-config dropped system
directories such as /usr/include from its answer on its own. pkgconf only
drops them if they are listed in PKG_CONFIG_SYSTEM_INCLUDE_PATH and
PKG_CONFIG_SYSTEM_LIBRARY_PATH, and it compares those lists against paths
that already have the sysroot prepended. So the lists have to hold
sysroot-prefixed paths, and the SDK environment never set them at all.

a3320989ca ("class/pkgconfig: use pkgconf instead of pkgconfig") already
sysroot-prefixed both variables for the build environment, in
pkgconfig.bbclass. Do the same for the SDK environment.

Checked with pkgconf 2.5.1 on a .pc file inside a sysroot, with
PKG_CONFIG_SYSROOT_DIR set:

  before: -I$S/usr/include -I$S/usr/include/bsd-1.0 -L$S/usr/lib -lbsd
  after:  -I$S/usr/include/bsd-1.0 -lbsd

which is what pkg-config used to return for the same input.

The native sysroot directories are listed as well. Setting either variable
replaces pkgconf's built-in list instead of adding to it, and for
nativesdk-pkgconf that built-in list is what currently keeps nativesdk .pc
files from leaking their own -I and -L into host tool builds.

toolchain_create_tree_env_script() is left alone: it already passes an unset
$libdir and $prefix to its own PKG_CONFIG_PATH line, so it needs a separate
look.

Assisted-by: kiro:claude-opus-5
Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1d61d5ba90e07525029343e347dca4963364c55b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 8c062ef0e74..3c1ceb32bf7 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -63,6 +63,8 @@ toolchain_create_sdk_env_script () {
 	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':"$PATH"' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
+	echo 'export PKG_CONFIG_SYSTEM_INCLUDE_PATH=$SDKTARGETSYSROOT'"$prefix"'/include:'"$sdkpathnative${includedir_nativesdk}" >> $script
+	echo 'export PKG_CONFIG_SYSTEM_LIBRARY_PATH=$SDKTARGETSYSROOT'"$libdir"':$SDKTARGETSYSROOT/${baselib}:'"$sdkpathnative${libdir_nativesdk}" >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
 	echo "export OECORE_NATIVE_SYSROOT=\"$sdkpathnative\"" >> $script
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script

