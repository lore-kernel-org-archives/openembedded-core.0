Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id CE94F7880B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 13:06:23 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o15so4285415wrf.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jan 2018 05:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=IjAQKyXTfNBfix4UnCsjWKNRnGYa6Gl+eCH923/iGd0=;
	b=Qe0xy+MS2RkXKOzjybwJMgxN+TdFXnWGWDwdNzpbY5TBlpfoNBPfJxnNKaJ2+Jixet
	rUDKYPEQtpzLLURO2Ww1+0/5qOps6lzmclsbfy4dtNiy3LjnPd/SECyzLuG+MQ4OYT6a
	Tb2QCgbL2S68kBLFJGd3ekux7jczHeYuFCJB1Na3OrmlvwNZrjqcAVPEpQQ03nP6jRkJ
	dRSbStWpbtmtC5BNduqjWW13Lia78FgXGuBAioqknuZKL60D86YA3+P0WdZY8D8FIYrg
	bHCNBQSoJ/A15I+fdISVXh6DpBJU3qFO7NM1BLW7nl1xxeejk6h26K47nl0zop5vHVNU
	BRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IjAQKyXTfNBfix4UnCsjWKNRnGYa6Gl+eCH923/iGd0=;
	b=n4vcBR32jiSIcLJCr+MTwd8NX4dRoVTYVMbtBlWsnUDj0E9gZYG5elZTA02CokSYTT
	k6FPWsGrT6qeHvowkCltQJ1WqBOXDSzVQyClhe4tOmtYKSYjJ+OJqQ+1ARP7Iu/sUFbe
	qj6ErKVRbSkGBDeuErM5pr7vrobtmiN6bWOk2IGiErQm5Fp4zr8pWDGJITgl09emkz2/
	NA4LqJlDAFEGSFNknvsQVJmIR+PjpBxGHaiBdd8KvZdX7XWYF73eZEL5pMFGysM4k2he
	AszGSqT8l1q2dwjqht94jZnoZTtEkuM/Em6gJApWZS9o5EmmRfEiZ8EUnU57LFZqArcW
	5+xQ==
X-Gm-Message-State: AKGB3mLyqgLawTxoL2YrwsMsGrTdxZ3/69CPqsqwFZzPh/iKoA8Rs4dE
	Z1x56zDqSil/YlJx0mnzkODLpe1s
X-Google-Smtp-Source: ACJfBos/kHdRFtbWI+v/CDlYOs/KiUs2XgdgtLk5sysKyFlj7GpCLxkOUFdVwL3a+xkfbJiZHiM34w==
X-Received: by 10.223.175.119 with SMTP id z110mr2602477wrc.51.1515157584369; 
	Fri, 05 Jan 2018 05:06:24 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id e7sm4650559wrd.82.2018.01.05.05.06.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jan 2018 05:06:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jan 2018 13:06:22 +0000
Message-Id: <20180105130622.5357-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] debian.bbclass: add a note when a package is renamed
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
X-List-Received-Date: Fri, 05 Jan 2018 13:06:24 -0000

To make it easier to debug problems with renaming caused by debian.bbclass,
explicitly log when packages are renamed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/debian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 8124558b819..5cdbf360dcb 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -120,6 +120,7 @@ python debian_package_name_hook () {
                         if not newpkg.find(mlpre) == 0:
                             newpkg = mlpre + newpkg
                     if newpkg != pkg:
+                        bb.note("debian: renaming %s to %s" % (pkg, newpkg))
                         d.setVar('PKG_' + pkg, newpkg)
                         add_rprovides(pkg, d)
         else:
@@ -138,4 +139,3 @@ python debian_package_name_hook () {
 EXPORT_FUNCTIONS package_name_hook
 
 DEBIAN_NAMES = "1"
-
-- 
2.11.0


