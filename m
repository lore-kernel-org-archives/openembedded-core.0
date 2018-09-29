Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B9AFB79978
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 05:41:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T5fcJK003367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 22:41:38 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 22:41:37 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 13:01:15 +0800
Message-ID: <4b3ddabcb4559a6e748f54604291e93d5fb07466.1538197206.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538197206.git.kai.kang@windriver.com>
References: <cover.1538197206.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] cups: fix multilib install file conflicts
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
X-List-Received-Date: Sat, 29 Sep 2018 05:41:41 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

There are comments which contains path of ${libdir} in configure files.
It causes install file conflicts when intall cups and lib32-cups at same
time.

Replace ${libdir} with {nonarch_libdir} of the comment lines in config
files to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/cups/cups.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 717eef03a7..b8ad1e09e5 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -78,6 +78,9 @@ do_install () {
 	    rm -rf ${D}${sysconfdir}/init.d/
 	    rm -rf ${D}${sysconfdir}/rc*
 	fi
+
+	# workaround for multilib install file conflicts
+	sed -i "s:\(^#.*\)${libdir}:\1${nonarch_libdir}:" ${D}${sysconfdir}/cups/cups-files.conf*
 }
 
 PACKAGES =+ "${PN}-lib ${PN}-libimage"
-- 
2.18.0


