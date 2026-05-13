Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C55CD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 17:06:26 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2329.1778691978140648355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 10:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QCQ0YrJ7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026051317061410df49ebd0000207d4-nuppjs@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026051317061410df49ebd0000207d4
        for <openembedded-core@lists.openembedded.org>;
        Wed, 13 May 2026 19:06:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=q1fDRpeUV6Mltx6G9dZHbDnp9rVhoRFbLfLVxZ09Xjs=;
 b=QCQ0YrJ7J7+7PXuasK4NZJzqIFVyOQ5kNJUd2KRgP9WF11Yj1fKfXu7I1CekDthlMVgKQ0
 TfRqRXVlotmcT/k1BJiT5labbC89z2jawE2Zop1Npi136RbTLGFGi6JzD5A9tYXfmrNAaZJf
 x+6ba5fOrEEoFOg2NjnJxAGHUtV9hynU8XhMV/Mz2+Nmu5v/dChxSY4e0doAWMPGuB6kGlxo
 VYgyDPGLPPLtX+sHAkh385MQByhn77u3C4HottzUrP2/YORzqMJByEP9mFZB21Z6L/t3h4r7
 rmoBnlwAkP9Ga20HBZmrf45lbsETdusUytb8wa0vkDRjSlg41e5xjZWA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [scarthgap][PATCH 1/3] go.bbclass: change GOTMPDIR to improve reproducibility
Date: Wed, 13 May 2026 19:05:31 +0200
Message-ID: <20260513170533.2467950-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 17:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236993

From: Changqing Li <changqing.li@windriver.com>

When cgo is enabled, the Go toolchain writes temporary source files
(*.c) under GOTMPDIR and compiles them there. when -trimpath is passed
to go, Go passes options such as
-ffile-prefix-map=3D$WORK/b387=3D/tmp/go-build internally to the GCC
instance it invokes. The variable WORK is a temporary directory created
under GOTMPDIR, refer the following log:

[snip of compile log]
WORK=3D/build/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/build-tmp/go-buil=
d377321751
cd $WORK/b387
TERM=3D'dumb' x86_64-wrs-linux-gcc -m64 -march=3Dx86-64-v3 -fstack-protecto=
r-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dfor=
mat-security --sysroot=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recip=
e-sysroot -I /tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/sources/buildah-1=
.41.5/src/github.com/containers/buildah/vendor/github.com/proglottis/gpgme =
-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0 -ffile-prefix=
-map=3D$WORK/b387=3D/tmp/go-build -gno-record-gcc-switches -v -D_FILE_OFFSE=
T_BITS=3D64 -I $WORK/b387/ -O2 -g -ffile-prefix-map=3D/tmp/work/x86-64-v3-w=
rs-linux/buildah/1.41.5/sources/buildah-1.41.5=3D/usr/src/debug/buildah/1.4=
1.5 -ffile-prefix-map=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/build=
=3D/usr/src/debug/buildah/1.41.5 -ffile-prefix-map=3D/tmp/work/x86-64-v3-wr=
s-linux/buildah/1.41.5/recipe-sysroot=3D -ffile-prefix-map=3D/tmp/work/x86-=
64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native=3D -pipe -v -ffile-pre=
fix-map=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/sources/buildah-1.41=
.5/src/github.com/containers/buildah/vendor=3D/_/vendor -frandom-seed=3DTZk=
SPVSBUvDMjg4wKjWS -o $WORK/b387/_x004.o -c unset_agent_info.cgo2.c
[snip of compile log]

OE also passes its own DEBUG_PREFIX_MAP to GCC(finally by CGO_CFLAGS),
including -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR}, where B is
${WORKDIR}/build. Because GOTMPDIR defaults to ${WORKDIR}/build-tmp, the
Go temporary directory looks like ${WORKDIR}/build-tmp/go-buildXYZ. Its
prefix therefore begins with ${WORKDIR}/build, so GCC matches the
DEBUG_PREFIX_MAP entry for ${B} first.

As a result, a path such as ${WORKDIR}/build-tmp/go-buildXYZ is
rewritten to ${TARGET_DBGSRC_DIR}-tmp/go-buildXYZ. This breaks the
-ffile-prefix-map option that Go itself adds, because the original WORK
path no longer matches the value Go expects. Since Go creates
go-buildXYZ directories randomly and internally, this causes the build
non-reproducible.

This patch changes GOTMPDIR from ${WORKDIR}/build-tmp to
${WORKDIR}/tmp-go-build so that the path no longer matches ${B}. This
prevents unintended replacements by OE's DEBUG_PREFIX_MAP and
restores reproducibility.

Note that pure go program like go-helloworld under OE will not have this
issue since it doen't use cgo, it is reproducible without this fix

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 0642d2323072f561a4d0eeb9266213387b2997fc)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index d32509aa6d1..61b08a082f7 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -77,7 +77,7 @@ B =3D "${WORKDIR}/build"
 export GOPATH =3D "${B}"
 export GOENV =3D "off"
 export GOPROXY ??=3D "https://proxy.golang.org,direct"
-export GOTMPDIR ?=3D "${WORKDIR}/build-tmp"
+export GOTMPDIR ?=3D "${WORKDIR}/tmp-go-build"
 GOTMPDIR[vardepvalue] =3D ""
=20
 python go_do_unpack() {

