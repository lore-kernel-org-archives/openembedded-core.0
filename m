Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D5FDD62137
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 20:38:48 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id u206so146297846wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 13:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PK/ZaILAd8BFAE3dE+lQ0Sy39s5RdPkyRzoIzSQNEfg=;
	b=WhBm+M3QaRDZL5qFj6V7FN3xCrznNDUNW3N70MMVHX1AsFCTo2u/dxAtDheUaXxwXW
	Lfxdu76wKtqmj8f0GUn44z/RM7K9lG6q3yTip+/+WAu52axDf3j1gVQIe2LhXQxoxQKG
	yElS5z3lhObk+eV7hnPyJ3jtkeKUI6B+bBCOH1VoAvp2lL40Ic6eFn3SeEgFtxpkSJBd
	93xcOenN1C+sAdwPfKp9TGMM3TD0qFCDPeJ4eRqMkc1AbsX+6MkE3dvchn34IiNo9KPt
	7XMO2FOF34DuoMgw4kmcg2T8vbsdYcAFwT2IPClIO2KnGg+Uimglwkfge2/gtoiHhbMx
	A9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PK/ZaILAd8BFAE3dE+lQ0Sy39s5RdPkyRzoIzSQNEfg=;
	b=Enoy+Cylqr8y4nM76t4/DqeD2l7o9Ha4LMO602xvl2+PfQ8f1bk+wr2zIPmzRZSDsN
	qkv22qlcEdAsPbt/fofOt8PVQenyH3qCErGKzB7R5PzBlR3JLV/PodT58nZayunjAWQw
	WiMpAgI4Q6b1eLGyv804g61sBbZmKp290XRWm/hxTpBwAqO/Nr17i1NUihdkbmRNvjP2
	QPSFvkJ5qzJ7UWLNIhSMtelkHZBTKo3IsWAy64+IkdEWdDu9ZX4SlkAB6EFaBYSGTeBv
	jWM/Wd2mK5ewxH1exdJelFe8hkKoYHWJqxAA5X0ketmWX+2CMa8q+J5I0vT/jHJm+l+Q
	MWnA==
X-Gm-Message-State: AOPr4FV/lppD5ls2Y2EV3pUKjC7ER3UwKS4X0x+d62dblkXx2PFrR49sCuNLsPkXaNp7tupr
X-Received: by 10.194.87.103 with SMTP id w7mr36786014wjz.13.1461616728812;
	Mon, 25 Apr 2016 13:38:48 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	j6sm13520791wjb.29.2016.04.25.13.38.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Apr 2016 13:38:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2016 21:38:46 +0100
Message-Id: <1461616726-5866-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] oeqa/sstatetests: add http_proxy to no-op hash test
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
X-List-Received-Date: Mon, 25 Apr 2016 20:38:49 -0000

Add two values for http_proxy to verify that changing it doesn't change any
unexpected tasks.

As this causes uninative to fail to fetch, ensure that uninative is always
disabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/sstatetests.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index acaf405..2c947bb 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -411,7 +411,8 @@ PARALLEL_MAKE = "-j 1"
 DL_DIR = "${TOPDIR}/download1"
 TIME = "111111"
 DATE = "20161111"
-INHERIT_remove = "buildstats-summary buildhistory"
+INHERIT_remove = "buildstats-summary buildhistory uninative"
+http_proxy = ""
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
         bitbake("world meta-toolchain -S none")
@@ -422,7 +423,10 @@ PARALLEL_MAKE = "-j 2"
 DL_DIR = "${TOPDIR}/download2"
 TIME = "222222"
 DATE = "20161212"
+# Always remove uninative as we're changing proxies
+INHERIT_remove = "uninative"
 INHERIT += "buildstats-summary buildhistory"
+http_proxy = "http://example.com/"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
         bitbake("world meta-toolchain -S none")
-- 
2.8.0.rc3


