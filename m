Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4F92C75689
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 16:33:31 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so99231823wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 09:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xnwueWedVS6YciWqO7K946oR0j5zOljuIiG8d87wYtY=;
	b=vO5AsN73t1UvQ5R4W3ZekWz87E72S4ZwC2zzxzn9Z96VwGJ5aGb4U9PCF+xPwJ3RNS
	+UMK9rDijQhp3uO2e4nZ18hOFK9uImsXCp3hX9NUVzWJUWKiJZIC9yN4A/Wh9zUrD9Nx
	MPu/RjOgedNFp+pSAVlfgQi580VttvBYqN5G9og6aKUCgU4T4Hu9ItS1+HorwzEvn3/M
	Z329p3lAkPs1Fyijjlv+D9FkRWON5UBeOk4TjE8bYtOnfU5WHQLzdc4xC/J9YIY8fQYq
	HjJO/D98o6pkg4O86c2JEPSnv2r9FxGXJCK0tTwwIobzDfdhid2txmrZB0Icj+3GwWQr
	ie5Q==
X-Received: by 10.194.7.97 with SMTP id i1mr53397860wja.107.1432744412551;
	Wed, 27 May 2015 09:33:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id tl3sm5155229wjc.20.2015.05.27.09.33.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 May 2015 09:33:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 18:33:47 +0200
Message-Id: <1432744427-16447-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.1
Subject: [dizzy][PATCH] perf: add LIBNUMA_DEFINES
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
X-List-Received-Date: Wed, 27 May 2015 16:33:35 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
WARNING: QA Issue: perf rdepends on numactl, but it isn't a build dependency? [build-deps]

The numactl is in meta-oe.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 19772d8..1f1f552 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -65,6 +65,7 @@ B = "${WORKDIR}/${BPN}-${PV}"
 SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
 TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
 LIBUNWIND_DEFINES = "${@perf_feature_enabled('perf-libunwind', '', 'NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1',d)}"
+LIBNUMA_DEFINES = "${@perf_feature_enabled('perf-libnuma', '', 'NO_LIBNUMA=1',d)}"
 
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
@@ -80,7 +81,8 @@ EXTRA_OEMAKE = '\
     AR="${AR}" \
     EXTRA_CFLAGS="-ldw" \
     perfexecdir=${libexecdir} \
-    NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${LIBUNWIND_DEFINES} ${SCRIPTING_DEFINES} \
+    NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${LIBUNWIND_DEFINES} \
+    ${SCRIPTING_DEFINES} ${LIBNUMA_DEFINES} \
 '
 
 EXTRA_OEMAKE += "\
-- 
2.4.1


