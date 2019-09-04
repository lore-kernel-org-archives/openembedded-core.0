Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF6FA7F2FD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 09:36:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x849aDZJ018967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Sep 2019 02:36:23 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 4 Sep 2019 02:36:02 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2019 05:35:54 -0400
Message-ID: <20190904093555.59494-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190904093555.59494-1-kai.kang@windriver.com>
References: <20190904093555.59494-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/3] texinfo: fix multilib file confliction
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
X-List-Received-Date: Wed, 04 Sep 2019 09:36:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Inherit multilib_script to fix file confliction when mutlilib enabled.

| Error: Transaction check error:
|   file /usr/bin/texi2any conflicts between attempted installs of
    lib32-texinfo-6.5-r0.core2_32 and texinfo-6.5-r0.core2_64

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/texinfo/texinfo_6.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_6.5.bb b/meta/recipes-extended/texinfo/texinfo_6.5.bb
index f966457f88..50eae77ad0 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.5.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.5.bb
@@ -42,7 +42,9 @@ SRC_URI[sha256sum] = "d34272e4042c46186ddcd66bd5d980c0ca14ff734444686ccf8131f6ec
 
 tex_texinfo = "texmf/tex/texinfo"
 
-inherit gettext autotools
+inherit gettext autotools multilib_script
+
+MULTILIB_SCRIPTS = "${PN}:${bindir}/texi2any"
 
 EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
 
-- 
2.20.0


