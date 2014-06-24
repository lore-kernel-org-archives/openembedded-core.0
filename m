Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4413065DCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 11:12:52 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id q58so162267wes.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 04:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XbaAqs1NCso4aAo1PxSdnIZAjOU11puU66cPJyQsnnA=;
	b=hiY8HHwTysuMpIuSEq9ILLsjJAdfxP15/yeV97ObjMa8lhrgi2rUNm8qym7Qp6rJe8
	oqyKRnrTgT+7GtP3Hh+6AHC3/KoHpyi4x37TRS3Jrfp/Jv/SLrBMSVMRjt4mqN861YnQ
	iSrwymum5RkB/Sj0NP+jDSX67RzJXjmZe3oR2+rkN7i+4AGMWAppzhlS0WvYhs1RuxAe
	dWwVeK1dKcV9dAGpmxMz9B6r9zGtC4dUZ/4QOROOw2JpIWFfMODtRipZxb6Rhn+7BmaN
	EqBk3TLPgILNlH1IfBT8eO84e+z+ot6hwq4cvNNDLUn7qXy83NVgx18WTrPF+aqmFJGl
	eXOQ==
X-Gm-Message-State: ALoCoQkqvvvElKqAJWtr47WR1oUhYI5Y5x2e0+3RzvAVGROvzCnrbkH5YKEdfOTtwZ36aiMhYD7P
X-Received: by 10.180.75.71 with SMTP id a7mr1453466wiw.27.1403608370028;
	Tue, 24 Jun 2014 04:12:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	a13sm20074214wjs.12.2014.06.24.04.12.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jun 2014 04:12:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 12:12:34 +0100
Message-Id: <1403608354-10812-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][RFC] ptest-gnome: add ptest helper for GNOME packages
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
X-List-Received-Date: Tue, 24 Jun 2014 11:12:56 -0000

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


