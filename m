Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC7727C6E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 20:05:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2EK4Vdt017833
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Mar 2019 13:04:41 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 14 Mar 2019 13:04:20 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 14 Mar 2019 16:04:13 -0400
Message-ID: <1552593854-14059-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [v2][PATCH 1/2] go.bbclass: Export GOARM
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
X-List-Received-Date: Thu, 14 Mar 2019 20:05:08 -0000
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

V2
* Avoid potential undefined situations

 meta/classes/go.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index af331f8..5af4c3e 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -8,6 +8,10 @@ GOROOT = "${STAGING_LIBDIR}/go"
 export GOROOT
 export GOROOT_FINAL = "${libdir}/go"
 
+GOARM[export] = "0"
+GOARM_arm_class-target = "${TARGET_GOARM}"
+GOARM_arm_class-target[export] = "1"
+
 DEPENDS_GOLANG_class-target = "virtual/${TUNE_PKGARCH}-go virtual/${TARGET_PREFIX}go-runtime"
 DEPENDS_GOLANG_class-native = "go-native"
 DEPENDS_GOLANG_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk virtual/${TARGET_PREFIX}go-runtime"
-- 
2.7.4


