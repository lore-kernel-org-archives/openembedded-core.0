Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id BCAE1771B2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 19:40:38 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f65so135835150wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=8muTSKLseTsEIvUXHsY+h49NsnPZAGv06wdXJ7SHyL4=;
	b=d2R82BJYg7vVPKFiH9xVD7KnnzB+5fdCh1uLRwD/Hs7wBQlwLCIDzIc4Weyns9qwwn
	c2gb7vcVfIC3oEf0eDpCdHjhdJQHlh4oIgb5uLLYaOtDSUWKCc7Bk2AHwVAZg4Cl3Hwe
	k/8cQHMh3x8nTxDGJXhLve1CgGaT4+NawaxVQ452pDWoDECbtwDtM1n2Fn3vqopjAHWD
	S7SDPoXkaPR7iT5DeOkplSbOX/vYbk+W6ajsljpKH+xz7c5rLqhdqbRFKc54R30gTAua
	gYWxi/6NcCco4Ji3XfbSCnJ7dyvd3BJWlclc+LyOZpoQSpDoS7GAtIMu/77feo+ai/cJ
	Wpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8muTSKLseTsEIvUXHsY+h49NsnPZAGv06wdXJ7SHyL4=;
	b=e8MQRR2AHuS0GNr8qQn46zEj5xL88LxR7PEKokS0tcwqOsQx6teG0nxvUBy4SuGyu6
	D1RrQ+nTtot1s8m3QH9IKSypLVSHOviwtFtFV8MpRAoWCyEvIDrHh4HMczmT47iyGZl8
	/kq6v9J11FKtplXQd2XPpNURikrRp5TWtJiCkuAL2U8AMXw+WkdCLmTxn8SI0+I5w883
	k/TCwJ8ae2WJ2J94DktNuVwHSX15QEeJXe3Yfw8fg1jyZmReCUlo7gG4N50gHY6dkPbZ
	KzuJPYR7v6TkZIsW9GpNzV+azicwCVWytLKZAhD4jEkiSG3ZJ8Ma9Dq5mY4kiUwPGAkH
	n6KQ==
X-Gm-Message-State: AEkooutUqhr+RXf9pQKgF6xxet8Gg1SGny9aKQP2cN2HEwRIb25R93L9FO/pwM6qc3GfVLcl
X-Received: by 10.28.32.77 with SMTP id g74mr16673614wmg.45.1470685238265;
	Mon, 08 Aug 2016 12:40:38 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	kq2sm34392789wjc.41.2016.08.08.12.40.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 12:40:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 20:40:34 +0100
Message-Id: <1470685234-21936-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] buildhistory: output package variables in a repeatable order
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
X-List-Received-Date: Mon, 08 Aug 2016 19:40:39 -0000

This code was outputting variables by iterating a dictionary.  In Py2 this
always results in the same iteration order but with Py3 the order changes every
execution, which resulted in buildhistory having to store diffs where fields
were simply re-ordered.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/buildhistory.bbclass | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 2db9145..6e5de0e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -318,16 +318,14 @@ def write_pkghistory(pkginfo, d):
         f.write(u"PV = %s\n" %  pkginfo.pv)
         f.write(u"PR = %s\n" %  pkginfo.pr)
 
-        pkgvars = {}
-        pkgvars['PKG'] = pkginfo.pkg if pkginfo.pkg != pkginfo.name else ''
-        pkgvars['PKGE'] = pkginfo.pkge if pkginfo.pkge != pkginfo.pe else ''
-        pkgvars['PKGV'] = pkginfo.pkgv if pkginfo.pkgv != pkginfo.pv else ''
-        pkgvars['PKGR'] = pkginfo.pkgr if pkginfo.pkgr != pkginfo.pr else ''
-        for pkgvar in pkgvars:
-            val = pkgvars[pkgvar]
-            if val:
-                f.write(u"%s = %s\n" % (pkgvar, val))
-
+        if pkginfo.pkg != pkginfo.name:
+            f.write(u"PKG = %s\n" % pkginfo.pkg)
+        if pkginfo.pkge != pkginfo.pe:
+            f.write(u"PKGE = %s\n" % pkginfo.pkge)
+        if pkginfo.pkgv != pkginfo.pv:
+            f.write(u"PKGV = %s\n" % pkginfo.pkgv)
+        if pkginfo.pkgr != pkginfo.pr:
+            f.write(u"PKGR = %s\n" % pkginfo.pkgr)
         f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
         f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
         f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
-- 
2.8.1


