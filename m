Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 49ABB707A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:07:43 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so8579819wiv.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 15:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XbaAqs1NCso4aAo1PxSdnIZAjOU11puU66cPJyQsnnA=;
	b=kBQGJ35NW1o6JgnnCHdmrR2pegsZaUIww6kdmEpx89p1QFVqsCqsgcL93V5mivdT7o
	TWnX2VSdYZFWQr1p/yafKp7wp5FJzNMC3LvA7exi+SUQ4dg6TojI013RhT5divU0Q8V3
	BwI1J2eZ0fhorYU5AKOKU28xXlvJkl+cbYHj7j1Cu+1yM+OEDs9sQckgnEWSizg8Keyb
	kkwyo9LT1g11jop0R6zjqzo5aMTVLp9+nwzUST1N0yFoyPUKLRCY6Z/CST/fiEBy3qVd
	g74MhfckHdf9EqfkZ3tVW9ZimZ7YJy7bkkXrCiXKFxVVFVD7tERo1J7zoQAa6Uv0v3Bn
	cQRg==
X-Gm-Message-State: ALoCoQkg9X190GTWcU9jlsHpMHUbue9CuLh4Pfq8YQekAR6aaSO1HQmEluSiUG07K/a36o4AZFH1
X-Received: by 10.180.92.134 with SMTP id cm6mr7215526wib.72.1406153264653;
	Wed, 23 Jul 2014 15:07:44 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ch5sm9833562wjb.18.2014.07.23.15.07.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 15:07:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 23:07:22 +0100
Message-Id: <1406153243-12346-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [RFC][PATCH 1/2] ptest-gnome: add ptest helper for GNOME packages
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
X-List-Received-Date: Wed, 23 Jul 2014 22:07:48 -0000

Many GNOME packages are using their InstalledTests pattern, where the test suite
can be trivially installed.  To avoid repeating the same logic over and over,
add a class to encapsulate this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/ptest-gnome.bbclass |    8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta/classes/ptest-gnome.bbclass

diff --git a/meta/classes/ptest-gnome.bbclass b/meta/classes/ptest-gnome.bbclass
new file mode 100644
index 0000000..b2949af
--- /dev/null
+++ b/meta/classes/ptest-gnome.bbclass
@@ -0,0 +1,8 @@
+inherit ptest
+
+EXTRA_OECONF_append_class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', '--enable-installed-tests', '--disable-installed-tests', d)}"
+
+FILES_${PN}-ptest += "${libexecdir}/installed-tests/ \
+                      ${datadir}/installed-tests/"
+
+RDEPENDS_${PN}-ptest += "gnome-desktop-testing"
-- 
1.7.10.4


