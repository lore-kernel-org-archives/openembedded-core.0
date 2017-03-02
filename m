Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 02E0E7757A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 14:20:08 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id u48so53250034wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 06:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=5XIDeavW9wiW9LIkzVDcU5AcfexCyGfwtGho6nVYurE=;
	b=qPIH+wxe3JVI36RDJl2iPxw/Vt7dUS9yZWiA4T2Y1lPljW3lGuZvYui4NkLr6t8IhM
	zhTQPnTmdS8+SwJax/nd5XQ/9UIITpME+KJt3dsj+GInlBjeLNy2iFoYz1EoultZKX30
	q3Bcth+kKwbcQgJLb30AIZmTWo8Abe9jZdrQgeHsBO85F0N5xGlrRg9FRFSUIXVINNdb
	sIG+HCE63GU8NmG46w9buErv3a5J0D2KlLo/B3OWYGpyErR7eylZyZT5E67mhl5FMI22
	mLR5pQvP+20UQgiSAQGS88wCU7z0EZy7C7cQ8qv+jp8ZRarn9LJ6JjI3autW7ru0uqZA
	NIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5XIDeavW9wiW9LIkzVDcU5AcfexCyGfwtGho6nVYurE=;
	b=Pzg8vBxFfye017EyPD96cxezvD09MpjTqsR03wUDf7V6DCqjQsUs9HLqiHfijTqzwz
	x8l6ZoXFPmzsOHAEEzLi5sO4to2lVuEXWcnBi9deeSFrScLIiXhUx0y+5SWPO6CputzK
	vCh6qODeGx+18IGZMYZTbVa0bwJI7FKPEWv2d8+IYc3nJfu64KF7VceEpXcxYBMWr11E
	a83BkVdrcI1gBC0SaSi4BTcDUGVTLdMw7mUFLCv4NrDCOE8EKTSl6d4qVUMTmQSWpokC
	ZUcHcDhAqLgvgSkaMpVdXtcUUtfuiGcI7A+QqOX88ZkEwKg0e7crqu3PDlazs8zd+RHl
	6JHQ==
X-Gm-Message-State: AMke39nKTu4MdaPljv7n493C5QWYG/iS17C2JatewEAe4cbdRpMl0jqcmdY8g6y+Junw0oB4
X-Received: by 10.223.171.78 with SMTP id r14mr2315998wrc.113.1488464409334;
	Thu, 02 Mar 2017 06:20:09 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o70sm11390700wmi.26.2017.03.02.06.20.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Mar 2017 06:20:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Mar 2017 14:20:05 +0000
Message-Id: <1488464405-28663-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] meta-estsdk-toolchain: use WORKDIR instead of D to hold locked-sigs
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
X-List-Received-Date: Thu, 02 Mar 2017 14:20:10 -0000

do_locked_sigs() uses ${D} to hold a file as input to the sstate staging code.
Generally this isn't a problem as it happens after packaging, but sometimes (if
the recipe is rebuild, perhaps) do_package() will see the file inside ${D} and
fail because there is an uninstalled file.

Solve this by using a directory under ${WORKDIR} so it can't be packaged.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/meta-extsdk-toolchain.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index 0b8fcf0..235d6ec 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -10,7 +10,7 @@ do_populate_sysroot[deptask] = "do_populate_sysroot"
 # within sstate.bbclass, so if you copy or rename this and expect the same
 # functionality you'll need to modify that as well.
 
-LOCKED_SIGS_INDIR = "${D}/locked-sigs"
+LOCKED_SIGS_INDIR = "${WORKDIR}/locked-sigs"
 
 addtask do_locked_sigs after do_populate_sysroot
 SSTATETASKS += "do_locked_sigs"
-- 
2.8.1


