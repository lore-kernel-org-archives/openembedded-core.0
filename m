Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B330A7BDC3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 02:29:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0A2TIAA004334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jan 2019 18:29:18 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 9 Jan 2019 18:29:17 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jan 2019 10:37:32 +0800
Message-ID: <59a4bff6f969b511bf8eb453472bcfffa91a2daa.1547087830.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1547087830.git.Qi.Chen@windriver.com>
References: <cover.1547087830.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] target-sdk-provides-dummy: add more perl modules to avoid populate_sdk failure
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
X-List-Received-Date: Thu, 10 Jan 2019 02:29:17 -0000
Content-Type: text/plain

When 'adduser' package, which is from meta-perl layer, is added to rootfs,
we will get do_populate_sdk failure like below.

Error:
 Problem: package perl-module-cwd-5.24.4-r0.core2_64 requires perl-module-dynaloader, but none of the providers can be installed
   - package perl-module-file-temp-5.24.4-r0.core2_64 requires perl-module-cwd, but none of the providers can be installed
   - package perl-module-dynaloader-5.24.4-r0.core2_64 requires perl-module-config, but none of the providers can be installed
   - package adduser-3.118-r0.core2_64 requires perl-module-file-temp, but none of the providers can be installed
   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with perl provided by perl-5.24.4-r0.core2_64

This is because adduser depends on some perl modules which are not
listed in target-sdk-provides-dummy.

So add these perl modules to avoid such failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index edf07c4..26716ac 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -23,11 +23,14 @@ DUMMYPROVIDES = "\
     perl-module-file-glob \
     perl-module-file-path \
     perl-module-file-stat \
+    perl-module-file-temp \
     perl-module-getopt-long \
     perl-module-io-file \
+    perl-module-overload \
     perl-module-posix \
     perl-module-thread-queue \
     perl-module-threads \
+    perl-module-warnings \
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
-- 
1.9.1


