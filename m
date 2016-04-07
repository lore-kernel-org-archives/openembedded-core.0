Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3878877074
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 08:56:29 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 191so83934637wmq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 01:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=1INSSrFp6AfL937kFNCpPhjgrYxHTu/JmIAHuRTaIhg=;
	b=G92Y/GPALHdOFvPiyFh8kbfe4gLhKKHboOTnLWSKmK7g3eGSCgk3zcRejx00/2tN8y
	BRAWbuWdpzGoOUY1V07OpysZYw4dYeTmi1jAOkZ96tRzcUBEr1edIIBpUtOxIuO9Iv4B
	F71Pm4ek89O7a/5a+Osw/+rCMthpShXIhmF+HyDbDUvXHWGzvRtTNJP/Iicf0LtTIE7H
	FuHFpmCUbCEH8OFo0jWW+f6EV8Xn0+jgp3kdeiB3TnFfwX7L+wzAeEMGCV13bVFNNboU
	5hspA/l1piEZWoMQWiWiSkmArONb94MsuaCgKhxqhiMVgVINLE796w5cVRQlDj4zzqAf
	u+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1INSSrFp6AfL937kFNCpPhjgrYxHTu/JmIAHuRTaIhg=;
	b=QAYX+30RTKAJZXAwD209NaM70dkqFfShHIPAJ9CjJfTk777Tfa55iMofUO+qaV5cDZ
	ozfLNXPngCTWuX/KEDK8wTFk6rCLyb9nt6p/WZAezwGN3cE1bhrCJt/ShFLPa1KKQ10s
	9zfr5SRUYcy2ZBJS1d+pDlzfmljEjmbGtod2BKKuUwzRAwRbbas+wL9zbRzVnAh5l/z0
	01iBskHRIEKKMVvCqMYGkYMnjbhWtCtqcQvied8MN+DMQspKcrZzs7VIXyeCy8dZW5o2
	krN5joGdsgdzhr8IAsBaY9cefAtRkliAn1OrCYCNIIIkKdsAQZuc9/4A0OW5PBDvwq3P
	9ySw==
X-Gm-Message-State: AD7BkJL+txq6Kre5hnHMpzQp5kgDsUkDI/MXVQLXuNFwH8oFaMe6XMcb3coQCJ0M4iGvvsPL
X-Received: by 10.194.48.7 with SMTP id h7mr2307416wjn.81.1460019389869;
	Thu, 07 Apr 2016 01:56:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	w193sm2207144wmd.0.2016.04.07.01.56.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Apr 2016 01:56:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Apr 2016 09:56:27 +0100
Message-Id: <1460019387-1455-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] package: ensure do_split_packages doesn't return duplicates
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
X-List-Received-Date: Thu, 07 Apr 2016 08:56:32 -0000

do_split_package() constructs a list of packages that were created as it
iterates through the files, so if multiple files go into the same package then
the package will be repeated in the output.

Solve this by using a set() to store the created packages so that duplicates are
ignored.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4452e2f..8cf9c16 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -146,7 +146,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 
 
     packages = d.getVar('PACKAGES', True).split()
-    split_packages = []
+    split_packages = set()
 
     if postinst:
         postinst = '#!/bin/sh\n' + postinst + '\n'
@@ -183,7 +183,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
             continue
         on = legitimize_package_name(m.group(1))
         pkg = output_pattern % on
-        split_packages.append(pkg)
+        split_packages.add(pkg)
         if not pkg in packages:
             if prepend:
                 packages = [pkg] + packages
@@ -226,7 +226,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
             hook(f, pkg, file_regex, output_pattern, m.group(1))
 
     d.setVar('PACKAGES', ' '.join(packages))
-    return split_packages
+    return list(split_packages)
 
 PACKAGE_DEPENDS += "file-native"
 
-- 
2.7.0


