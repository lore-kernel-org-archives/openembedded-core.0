Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2D41974DAC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 19:40:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w48JeShn016778
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 May 2018 12:40:28 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 8 May 2018 12:40:27 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 May 2018 15:40:18 -0400
Message-ID: <1525808418-26089-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: [PATCH] libcap: fix -native and usrmerge builds
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
X-List-Received-Date: Tue, 08 May 2018 19:40:28 -0000
Content-Type: text/plain

When attempting to build a -native package which DEPENDS on
libcap-native the libcap libraries are not found and the build will
fail (for example attempting to build qemu-native with
'PACKAGECONFIG_append = " virtfs"').

It turns out commit 2c9c4a406a0f [libcap: fix (base_)libdir usage]
breaks builds of libcap(-native) when $root_prefix is not "". This is
because the variables which define $root_prefix are also part of
$prefix so you end up with part of the path being used twice, first as
part of 'lib=' in do_compile, and secondly as part of 'prefix=' in
do_install. When $root_prefix is "" this isn't noticed.

By using $baselib we should not re-break the issue which commit
2c9c4a406a0f was fixing but we should avoid doubling down on the
paths thus fixing the -native and usrmerge builds.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/recipes-support/libcap/libcap_2.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
index 47ecf34..6df6745 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG[pam] = "PAM_CAP=yes,PAM_CAP=no,libpam"
 
 EXTRA_OEMAKE = " \
   INDENT=  \
-  lib='${base_libdir}' \
+  lib='${baselib}' \
   RAISE_SETFCAP=no \
   DYNAMIC=yes \
   BUILD_GPERF=yes \
-- 
2.7.4


