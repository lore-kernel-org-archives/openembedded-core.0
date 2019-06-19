Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D953D7E6C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 04:57:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5J4vjKC021051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 21:57:45 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 18 Jun 2019 21:57:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2019 13:09:48 +0800
Message-ID: <07cc026245c6fcd5c20c032fbda1de24822f38e5.1560920959.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1560920959.git.Qi.Chen@windriver.com>
References: <cover.1560920959.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] target-sdk-provides-dummy: add libperl.so.5 to DUMMY_PROVIDES
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
X-List-Received-Date: Wed, 19 Jun 2019 04:57:44 -0000
Content-Type: text/plain

Add libperl.so.5 to DUMMY_PROVIDES to avoid do_rootfs failure like
below.

Error:
Problem: package postgresql-11.3-r0.core2_32 requires libperl.so.5, but none of the providers can be installed

    package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with perl provided by perl-5.30.0-r0.core2_32
    package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with perl-module-strict provided by perl-5.30.0-r0.core2_32

This problem could be reproduced by add 'postgresql' to IMAGE_INSTALL
and then `bitbake core-image-minimal -c populate_sdk'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 50182de..b5e8c0f 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -46,6 +46,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    libperl.so.5 \
     pkgconfig \
     pkgconfig-dev \
     pkgconfig-src \
-- 
1.9.1


