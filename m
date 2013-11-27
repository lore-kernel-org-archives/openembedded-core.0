Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 825A66D8C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:07:23 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hm4so7177709wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Y3q4uugBZeFHGDcLpwspKJVj1St4U92YmrnVJFy37Mw=;
	b=QE0bqr0p1e0v/LNrcczOmJ93GjAioOXIpyV9/GPkj6HVxImygUqkvNfBOLEI8rKn+r
	lWhSdBzDmD1lFYsuAPKv8ubAuZ5EFctWE9MTxDSa43yI6yHRygzDokIGCx6mDoJBz3ha
	nzj1wOu5rymUrOxw+W4sTnEObal/I6aB015pPXMqkj6faOUkTBVJLb3YeMqUEJ+mkVQc
	n7YY+Ne0ctMzNZcrUHDIO5xX2Gj/+SeeKhMeuZ0ULU4e8A6+FrkPtmUdEdpoibAU31GJ
	sDwEHd5RCI6AEWVbl5D64x/ZpzWpmXR5OAeX0eSM5Ot1zt30BzSr6rW0HEeoQzD3AbqR
	vXUw==
X-Received: by 10.194.60.103 with SMTP id g7mr15918092wjr.37.1385575642811;
	Wed, 27 Nov 2013 10:07:22 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id w1sm37430090wib.6.2013.11.27.10.07.21
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 10:07:22 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 11:07:05 -0700
Message-Id: <37c0933469ccbac1f2657260e62e3f099526df18.1385575572.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/7] perf: remove /usr/local/include from default makefile includes
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
X-List-Received-Date: Wed, 27 Nov 2013 18:07:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 903ffa6..4fb8956 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -65,16 +65,17 @@ TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
 # supported kernel.
 LDFLAGS="-ldl -lutil"
 
-EXTRA_OEMAKE = \
-		'-C ${S}/tools/perf \
+EXTRA_OEMAKE = "\
+		-C ${S}/tools/perf \
 		O=${B} \
 		CROSS_COMPILE=${TARGET_PREFIX} \
 		ARCH=${ARCH} \
-		CC="${CC}" \
-		AR="${AR}" \
+		'CC=${CC}' \
+		'AR=${AR}' \
 		perfexecdir=${libexecdir} \
 		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
-		'
+		'INCLUDES=-I. $(CONFIG_INCLUDES)' \
+		"
 
 EXTRA_OEMAKE += "\
 	'prefix=${prefix}' \
-- 
1.8.3.4


