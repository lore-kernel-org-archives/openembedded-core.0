Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5AB077F6D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 02:16:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v852GtIE023167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Sep 2017 19:16:56 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 4 Sep 2017 19:16:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Sep 2017 21:10:52 -0500
Message-ID: <1504577452-63181-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] sysstat: Add ability to enable lm-sensors
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
X-List-Received-Date: Tue, 05 Sep 2017 02:16:55 -0000
Content-Type: text/plain

Add lm-sensors PACKAGECONFIG option.

Change from setting LFLAGS="" to --disable-strip, otherwise lm-sensors will not link
properly.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 61da4cd..0bc7e14 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -17,8 +17,10 @@ DEPENDS += "base-passwd"
 # autotools-brokensep as this package doesn't use automake
 inherit autotools-brokensep gettext systemd
 
-EXTRA_OECONF += "--disable-sensors"
-EXTRA_OEMAKE += 'LFLAGS=""'
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
+
+EXTRA_OECONF += "--disable-stripping"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "sysstat.service"
-- 
1.8.3.1


