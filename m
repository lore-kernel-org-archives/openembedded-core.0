Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A9E696FFEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 03:23:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0J3N5Do002402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 19:23:06 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Jan 2016 19:23:05 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 19:23:03 -0800
Message-ID: <dc955f7651afe19ce915cedc95bfb9ab96d52d73.1453173729.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453173729.git.liezhi.yang@windriver.com>
References: <cover.1453173729.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] e2fsprogs: fix PV
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
X-List-Received-Date: Tue, 19 Jan 2016 03:23:07 -0000
Content-Type: text/plain

We had upgraded e2fsprogs from 1.42.9 to 1.43 (WIP), and used:
PV = "1.42+1.43-git${SRCPV}"
But:
$ dpkg --compare-versions 1.42+1.43 gt 1.42.9 && echo greater || echo less
less

It shows that 1.42+1.43 is less than 1.42.9, so this is a downgraded. Use
PV = "1.42.13+git${SRCPV}"
to fix the problem. 1.42.13 is the latest e2fsprogs 1.42 version.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index b1b7931..60b2854 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -9,7 +9,7 @@ SRC_URI += "file://acinclude.m4 \
 "
 
 SRCREV = "0f26747167cc9d82df849b0aad387bf824f04544"
-PV = "1.42+1.43-git${SRCPV}"
+PV = "1.42.13+git${SRCPV}"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
                 --enable-elf-shlibs --disable-libuuid --disable-uuidd \
-- 
1.7.9.5


