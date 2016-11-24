Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 10DEA60403
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 23:44:29 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f82so75774892wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 15:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=RF1khCGAUJrbkVildGStbFamd/fVQ+Pu5gGedPJTzVE=;
	b=Mh6x3mj+/yyh22/d7gO1OE+7lzklOy6ih0pfRXiJWTB/aedBmrKIaaJ4VEvIVJLlHf
	cNG0pkJVFOaMy6RvoszROudcdYKveNDzqpAno/mI/eQ3D79WvjJ4i9UkbioUdji7segS
	nPfM4KuBgkhmyBrrE63lVRclAW//cK0fjOtbMhKB7sCItuB75Sdfcc3h5BkDlj364lvi
	A5PJL543C/VZml/pdbwHVLMPPtEJn/oTXzbKp9K2pYoZWu1Eh9/IhNPLUnkcTTs7hhJh
	MmdM7UDCCHApwuDVX0BTEGKVz2L7EDJXyKmt9b6E2GhLyuXrM4d1K6q+VkrNTnZK0XER
	+prQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RF1khCGAUJrbkVildGStbFamd/fVQ+Pu5gGedPJTzVE=;
	b=XGSLUdoXPkhJHv10Mb7Tnf+9JlOn11JfmHzw2Kz7YT4eJsbgUjLhZkL9aoC0NULqxP
	nzz9ruVaAIqsUu32xt8koeeZCXOFyO6b0reWxz+sVxbsa1Rpo0aXV7aldg/KCmwDNyYp
	DPIAYlWUyvJl699IPa0xqSC4wMR6578+ppuemgzoRycnfxnJ/nqq73bMYy05oWG50/Rl
	4pKoYwlGM6s8zp0tr3dC8EMFA1snL8fokx6sbiU9XhjsUSHs9syGFA+yE0ip8C/zt/0m
	gZKZX1CgVa1oAfT+eGlGz9HK49gggKBtvUzwzeshvSk7pTnASg8/C1Fe5x/oVAP2gehO
	c8Rw==
X-Gm-Message-State: AKaTC02ikexb7hBE6NLC9FN64AnXh7FASmuJKwbDUGYRN2e2Yn67V9IYK6FEZ8C168fk0RPP
X-Received: by 10.28.21.1 with SMTP id 1mr4962513wmv.133.1480031070702;
	Thu, 24 Nov 2016 15:44:30 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	yg1sm44209118wjb.12.2016.11.24.15.44.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 15:44:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 23:44:22 +0000
Message-Id: <1480031065-19435-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/4] insane: fix expanded-d test
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
X-List-Received-Date: Thu, 24 Nov 2016 23:44:30 -0000

This test should be looking for the expanded value of ${D} in the expanded value
of pkg_postinst and so on, but one of the getVar() calls was passing
expand=False so the test would never be true.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index d51e73e..9f3065f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1000,9 +1000,8 @@ def package_qa_check_expanded_d(path,name,d,elf,messages):
     for pak in packages:
     # Go through all variables and check if expanded D is found, warn the user accordingly
         for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
-            bbvar = d.getVar(var + "_" + pak, False)
+            bbvar = d.getVar(var + "_" + pak, True)
             if bbvar:
-                # Bitbake expands ${D} within bbvar during the previous step, so we check for its expanded value
                 if expanded_d in bbvar:
                     if var == 'FILES':
                         package_qa_add_message(messages, "expanded-d", "FILES in %s recipe should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference" % pak)
-- 
2.8.1


