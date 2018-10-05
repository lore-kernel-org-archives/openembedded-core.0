Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 9288574765
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 03:55:21 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [13.68.168.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9C27F20834;
	Fri,  5 Oct 2018 03:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1538711722;
	bh=J1ws6Ktp0uyCDNCqwkXu2JhxVyydMzMK+H4qbhGapKE=;
	h=From:To:Cc:Subject:Date:From;
	b=U86C1IfQpIi13s2HrOxrQV6Qt5mFbcyWRQmVIV2fHrGT5e1y3FOAlnyM2HpMBTibI
	L1/hCfoD6mIaNEnOMD/8dcRZg5A8pSq/eVgp+RAKFG0Vt8ZzBzUXTjz5zpUU0TabSx
	K7kj/MvVkj/gTxX5xvwcBa2T+t9hkvNRtADfazNQ=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 03:55:14 +0000
Message-Id: <20181005035515.4922-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [sumo] [PATCH v1 1/2] ncurses: CVE-2018-10754
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
X-List-Received-Date: Fri, 05 Oct 2018 03:55:22 -0000
Content-Transfer-Encoding: 8bit

* CVE-2018-10754
A NULL pointer dereference was found in the way the _nc_parse_entry
function parses terminfo data for compilation. An attacker able to provide
specially crafted terminfo data could use this flaw to crash the
application parsing it.

Affects < 6.1.20180414

CVE: CVE-2018-10754
Ref: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-10754
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../ncurses/files/CVE-2018-10754.patch        | 34 +++++++++++++++++++
 .../ncurses/ncurses_6.0+20171125.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2018-10754.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2018-10754.patch b/meta/recipes-core/ncurses/files/CVE-2018-10754.patch
new file mode 100644
index 0000000000..e9ba857ed2
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2018-10754.patch
@@ -0,0 +1,34 @@
+From 7c012e7a809634839e39d67271b5df3fdf5a37a3 Mon Sep 17 00:00:00 2001
+From: Sinan Kaya <okaya@kernel.org>
+Date: Fri, 5 Oct 2018 01:27:27 +0000
+Subject: [PATCH] ncurses: NULL Pointer Dereference in _nc_parse_entry function
+ in tinfo/parse_entry.c
+
+CVE: CVE-2018-10754
+Upstream-Status: Backport [https://bugzilla.redhat.com/show_bug.cgi?id=1576119]
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ ncurses/tinfo/parse_entry.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index bbbfcb27..43d28bdc 100644
+--- a/ncurses/tinfo/parse_entry.c
++++ b/ncurses/tinfo/parse_entry.c
+@@ -543,9 +543,11 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
+ 		 * Otherwise, look for a base entry that will already
+ 		 * have picked up defaults via translation.
+ 		 */
+-		for (i = 0; i < entryp->nuses; i++)
+-		    if (!strchr((char *) entryp->uses[i].name, '+'))
++		for (i = 0; i < entryp->nuses; i++) {
++		     if (entryp->uses[i].name != 0
++		     && !strchr(entryp->uses[i].name, '+'))
+ 			has_base_entry = TRUE;
++		}
+ 	    }
+ 
+ 	    postprocess_termcap(&entryp->tterm, has_base_entry);
+-- 
+2.19.0
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb b/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb
index 6c4b96f428..e2d128897a 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb
@@ -3,6 +3,7 @@ require ncurses.inc
 SRC_URI += "file://0001-tic-hang.patch \
             file://0002-configure-reproducible.patch \
             file://config.cache \
+            file://CVE-2018-10754.patch \
 "
 # commit id corresponds to the revision in package version
 SRCREV = "5d849e836052459901cfe0b85a0b2939ff8d2b2a"
-- 
2.19.0


