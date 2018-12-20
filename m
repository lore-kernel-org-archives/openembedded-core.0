Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id A18C479DC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 07:35:12 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c73so489309pfe.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 23:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EsZNCWTwoqa9W6OVO3Oky+u7Nr8Mk5UW8dJQNE2AHBU=;
	b=IQqmZCHWguYNwh1XlvHHHrHTkW1kfj99IQd1/ofBsNEHRyz3a/beII6Qu1Ohp2aOri
	o26uCKSYx7kRNUWkFlbrnbOW92OcdsOjXQxkBCDchew7AaqTO4NL9MzmbpusqDEQqXIy
	sUFhCEsgQ9fi5nnjDSYRhsGSoVTjJyP6aPNlp5M0gJu9dHkyFrN3qrhfgtssyqVMsOZK
	trRYC6IVTUgzvQGyoqm84eGN9LNgU94xRILrm2EVSkUY+vElf6CbiySdjLnnu16sUBPa
	fep6UxxgsyV8W+VLyyIpJiYqrdjC0M1PtOFnhAL7yoVzVPbsUtrCEu6FzWTglW/+6NVt
	JaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EsZNCWTwoqa9W6OVO3Oky+u7Nr8Mk5UW8dJQNE2AHBU=;
	b=WkBBNnVffdqxBRwOUC3GN3XgbpFLvElJkGDMnhfAL5XCCjcG12dgrdTJjz5KMdCRDH
	JCHbjFtz0qyCWvzwMyHI/UqbBpWBsAmLkaVipAN66+FEZxYNPaqJzhOK3/ASYUATrMy7
	ZieLduIKbSeipsS2ZYs9+iDfevy5p544HlQjY5zauRUGdHwDzZxpu8iI0wdnP/m0Bz3E
	9naxQF7MAfTfmWUTaVjB9hCHOjmCsuBSGITs7ht4omNA1hGS7YHsrsiDjow+Qzd4Kt+q
	Cl6HpghBQcxSidByqXv4TFQjtUAHpM+8TEo1XL0sAN/y97TFyhf3PrY+OuRRSD4ln2an
	ipmw==
X-Gm-Message-State: AA+aEWbRHTSymlIcUyKq3LK42hMiizEVj/zZQRvQ5ZlUDyyr79MoQuxs
	fFlAOn2owO9qaozY5Ung+Zty1cYOk0E=
X-Google-Smtp-Source: AFSGD/XOh5vltGH6yp8e6h743OTP+dDyTEf9YJNNWJWuoc/RGijzIihSJyuA67EqSiHKYP9mhYjLdQ==
X-Received: by 2002:a62:3141:: with SMTP id x62mr23162725pfx.12.1545291313153; 
	Wed, 19 Dec 2018 23:35:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	y184sm26057020pgd.71.2018.12.19.23.35.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 23:35:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 23:35:02 -0800
Message-Id: <20181220073502.20397-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] populate_sdk_ext.bbclass: Include site.conf in parsing for contents for local.conf
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
X-List-Received-Date: Thu, 20 Dec 2018 07:35:12 -0000
Content-Transfer-Encoding: 8bit

Some distros use site.conf to emit certain variables which are important
for eSDK e.g. DISTRO with out which eSDK will not be able to ger right
metadata when it tries to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e30c49296d..40b0375e0b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -280,6 +280,8 @@ python copy_buildsystem () {
 
     # Create local.conf
     builddir = d.getVar('TOPDIR')
+    if derivative and os.path.exists(builddir + '/conf/site.conf'):
+        shutil.copyfile(builddir + '/conf/site.conf', baseoutpath + '/conf/site.conf')
     if derivative and os.path.exists(builddir + '/conf/auto.conf'):
         shutil.copyfile(builddir + '/conf/auto.conf', baseoutpath + '/conf/auto.conf')
     if derivative:
@@ -297,6 +299,9 @@ python copy_buildsystem () {
                 return origvalue, op, 0, True
         varlist = ['[^#=+ ]*']
         oldlines = []
+        if os.path.exists(builddir + '/conf/site.conf'):
+            with open(builddir + '/conf/site.conf', 'r') as f:
+                oldlines += f.readlines()
         if os.path.exists(builddir + '/conf/auto.conf'):
             with open(builddir + '/conf/auto.conf', 'r') as f:
                 oldlines += f.readlines()
-- 
2.20.1


