Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id AAB72600BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 10:27:57 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id 77so142307225wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ZAufzgqKdtmmyOYvIa/g7K0b4UQDmQeXXx5BnI8DTeE=;
	b=LQTECnRlrY8DqbS+6TFArITM/tAQKhJ4srZOjryyr4vLoUKv8GFty4/a16Oqb9y3bD
	dkX8gokNRtyd9x9YOVTbCFqbygpqPVmpMeYLw23KVoTRnEWb03bwXB4rCoTpXPMuaGBb
	YO4gYKBLVEBiwFVUASyC4xuoIgaDD0Dt4l9eWjJOWM/7wwNhPokYv7n19PjFQtPyfhFD
	83j6/nI5MiQ7ZE4Yg0ALWTNlOePhfEgk+0nZfqzLvb4xOqNC8nPVo5QpSZF3VD2/z+08
	gNRnMmN7QHtjNRYYeJthMOHtowPIKzPOd7CoB3PMxOuB0Ay1qLU2qxQxC5Oeg3SsgmxT
	MGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZAufzgqKdtmmyOYvIa/g7K0b4UQDmQeXXx5BnI8DTeE=;
	b=G/djSVsmZEDukNoQ/Ydc8HGGkogzYz54wq5eHZuYLN9Y7Jy09tfHKjHH9NIy9kbdKB
	3kjuM+Vc0qfgoyFkq73I4e3IuYjeybavVlw965sF9GnTmn9YhpKZh2gH66CT8NOfofLf
	xILv/GiP3eoQRZ+KDqrxg8cpKbf0keoINb8eg+fu5wM/xfvq2pnEFj0fFgTxR2V886h3
	mxZY3IsLBSguZhJn0a728/JO1WiUXM6m0Ks/8msMzXhX/MTYT4+aNgZhmxHEU4ANS2vU
	T4jjPkgbt0aRS+jy84FskqhFPL/5BjsAEoPnM4qPSpd5NW/IkxeOy1gvwFkGT8MRDn7B
	ugjA==
X-Gm-Message-State: AKS2vOxX4JuBAY3BZ2ZFVLQxLf05z9OuMbcz5kx3kiSON5h0Q7gMvPdr
	XMzqOhrVyHYw6aHrIT4=
X-Received: by 10.223.165.146 with SMTP id g18mr654019wrc.167.1498472878372;
	Mon, 26 Jun 2017 03:27:58 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i131sm14860609wmf.0.2017.06.26.03.27.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 03:27:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 11:27:55 +0100
Message-Id: <20170626102755.26076-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cups: don't change permissions of /var/run/cups/certs in do_package
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
X-List-Received-Date: Mon, 26 Jun 2017 10:27:59 -0000

This directory is deleted by do_install, so luckily the lack of error checking
meant this didn't break.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/cups/cups.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c3fa45941c2..38d90b5ea9d 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -79,13 +79,6 @@ do_install () {
 	fi
 }
 
-python do_package_append() {
-    import subprocess
-    # Change permissions back the way they were, they probably had a reason...
-    workdir = d.getVar('WORKDIR')
-    subprocess.call('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir, shell=True)
-}
-
 PACKAGES =+ "${PN}-lib ${PN}-libimage"
 
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'procps', '', d)}"
-- 
2.11.0


