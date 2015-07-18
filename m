Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id A4D4976102
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:47 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so77376988pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=FDiKhJkaklkCDuqdSLHpTjuutNbGA90WDTs9RKmHOOI=;
	b=iub5WyFZXqjTQfJU7OHQNrnn9VuWqFMEptLcWyqFYJhZH7+dTgXDiL6R0OBQoerkmA
	yLFx8UPFqq1gI1ivadLtdHYIdCu1UQSiMUwb7wPHrhL2aMMlWGEmCeemYUVl+hlzmG7Y
	gL1tnVS8pXMOlI7MVstj7U0SYdnZxm8n//HC5Najx0CoQiOpbjq43fIUqBOdo+/6Yb4L
	XkTshLHEryenKDvsq9POXD2tlkfNvj4DAhtiS5Dtk7VUc3cNlNnRiyHSkz6zSygNs9PJ
	/Qdv/tFGXQ8gb1kLZ0qS9qqXT3BmMCiQ7LZ0Z2q1RXWCpawkrGfxNk4DRxxjBt6RUO+i
	d4Bg==
X-Received: by 10.68.163.68 with SMTP id yg4mr40345527pbb.4.1437232607697;
	Sat, 18 Jul 2015 08:16:47 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	oa14sm14637006pdb.47.2015.07.18.08.16.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:46 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 7B1F5FC12EF; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:14 -0700
Message-Id: <1c9659efe460846f6d7742446389250fd49e7025.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 07/25] perf: add LIBNUMA_DEFINES
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:49 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
WARNING: QA Issue: perf rdepends on numactl, but it isn't a build dependency? [build-deps]

The numactl is in meta-oe.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Armin Kuster <akuster@smtp.gmail.com>
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
1.9.1


