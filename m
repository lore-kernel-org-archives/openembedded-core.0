Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A55507C65C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 17:57:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2DHvEus018132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Mar 2019 10:57:14 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 13 Mar 2019 10:57:13 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 13 Mar 2019 13:57:05 -0400
Message-ID: <1552499826-26884-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] go.bbclass: Export GOARM
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
X-List-Received-Date: Wed, 13 Mar 2019 17:57:14 -0000
Content-Type: text/plain

When building GO packages for ARM (v5, v6, v7) it is expected that the
GOARM env variable is set during the build. Not having GOARM exported
will result in GO binaries which can't be executed on the target
(terminate with segfault). Per https://github.com/golang/go/wiki/GoArm

We already have the logic in goarch.bbclass to determine the correct
value of GOARM (see GOARM_TARGET), but currently this is only used to
build go itself (go-cross_1.*.bb requires go-cross.inc --> export
GOARM = "${TARGET_GOARM}").

Here we export GOARM but we do it such that it is only exported if we
are building for 'arm' and only when recipes requiring/inheriting
go.bbclass are be used to build for the target.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

Richard,

MarkH and I were debating this one some. He was suggesting I add
'GOARM ?= ""' so as not to leave things undefined for non-arm target
builds. I however, like the behavior of this as submitted here as
non-arm target builds don't get polluted with a useless export in
their do_compile scripts and such. The question is as presented here
is the behavior deterministic?


meta/classes/go.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index af331f8..72e2c29 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -8,6 +8,9 @@ GOROOT = "${STAGING_LIBDIR}/go"
 export GOROOT
 export GOROOT_FINAL = "${libdir}/go"
 
+GOARM_arm_class-target = "${TARGET_GOARM}"
+export GOARM
+
 DEPENDS_GOLANG_class-target = "virtual/${TUNE_PKGARCH}-go virtual/${TARGET_PREFIX}go-runtime"
 DEPENDS_GOLANG_class-native = "go-native"
 DEPENDS_GOLANG_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk virtual/${TARGET_PREFIX}go-runtime"
-- 
2.7.4


