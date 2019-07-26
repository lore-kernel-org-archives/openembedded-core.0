Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED1ED7F1C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 09:35:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6Q9Z1Bk011787
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 02:35:02 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 26 Jul 2019 02:35:01 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2019 05:34:43 -0400
Message-ID: <20190726093443.40634-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190726093443.40634-1-kai.kang@windriver.com>
References: <20190726093443.40634-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] epiphany: set imcompatible with tune mips
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
X-List-Received-Date: Fri, 26 Jul 2019 09:35:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

webkitgtk doesn't work with tune mips and set imcompatible with it.
epiphany depends on webkitgtk and mask it too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.32.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
index de1b6e2f84..d1c6af52ed 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
@@ -16,5 +16,8 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
 SRC_URI[archive.md5sum] = "c4976507bf3de69f27a050ad09531f5a"
 SRC_URI[archive.sha256sum] = "3ccb6859a43b839b714aa425cb185056f1e8604adbaab6a1bc179d1ba641a33f"
 
+# webkitgtk doesn't work with tune 'mips'
+COMPATIBLE_HOST_mipsarch = "${@bb.utils.contains('DEFAULTTUNE', 'mips', 'null', 'mips.*-linux', d)}"
+
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.20.0


