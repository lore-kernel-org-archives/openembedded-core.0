Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2830978B17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 00:01:42 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x5-v6so6323848pgp.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 17:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=N/Ja/sbR6EfvTTdwiA/T0t0h1fJX3gkKtDMY+BGTIOg=;
	b=PSRj860dqweS+fm/T2otbyY/javT2UPtOmk0SGas/86Q8dOW6dpg0VTduPHPspyR7p
	Fpt0XbHfLdvdsvO3Zj5UG5EDFtjiKwDnhJfxajZCdtN0+96PsbuXE0IY7VhIYD2k9DR+
	NT1V+Z6zcq22Ms8ZFibvPbgv6GBY2XB5q5NirEc5KxfCzB6v6XzAg/eKeCeUXCq0YJce
	t/Vxrc5dN05/akMvjRzqoGked7/zXnY1ufYGnjFOhjIWm5WG19jnEeHFSOY6R7SHwimz
	RLdbn2kq20yVy0/dvauY3LHpqobRkCYIGo3iFVnABjQYZbVE1vvWioZmbJ1S+ASRBz72
	ikzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N/Ja/sbR6EfvTTdwiA/T0t0h1fJX3gkKtDMY+BGTIOg=;
	b=nt60XYajo1Z7vc+LtPSN8qri+SqrXjT5CTWsYVXxrWZjWiKZOGuF+iWnnlEaMYpjMC
	CvBCQq/GGSl9LCU+MXM43N1bCu/bXX8M971ABY0bWG+NVaDR9mU94gCZPGh+Q+Nekn9C
	YrFbB1R8LXjNelp7j+gHAq9RE78gP/NBUC6T9olR633XKyuILh/Y+BgCypo3Tr8UaUIQ
	bTV/JDj6BSSopsf4gx7q69urBFAqg9KWnCCAiBRB+tC3vahRRlu1mlGNeAlwBPeAT7WU
	s/dTyfZvvIp78Z/6MJhyrXoPk9K7UXa4RmC2qQZH3G9KsRq/Hl3Pw6j/6txAQFw98MyW
	Cm5g==
X-Gm-Message-State: AOUpUlEMye7xsxlqYa6FE35MtL3IbgkxhofNQHmSvGi9z/ialeeSH/qL
	8hYBeal8HnO+bSy+/SmQdT1jBcC/
X-Google-Smtp-Source: AAOMgpd2DmGjQbK23RDaC6rb3vUeN4pIQ4xgGDuWyaRa7fKtoF5rNQhBWjK/eu2BXN6hNYR8G0PnuA==
X-Received: by 2002:a63:9e0a:: with SMTP id
	s10-v6mr22305768pgd.326.1532563302988; 
	Wed, 25 Jul 2018 17:01:42 -0700 (PDT)
Received: from ip-172-31-26-116.ap-northeast-2.compute.internal
	(ec2-52-79-39-246.ap-northeast-2.compute.amazonaws.com.
	[52.79.39.246]) by smtp.gmail.com with ESMTPSA id
	o3-v6sm18385392pgv.53.2018.07.25.17.01.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jul 2018 17:01:42 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 00:01:37 +0000
Message-Id: <1532563297-1824-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Tzu Hsiang Lin <t9360341@ntut.org.tw>
Subject: [bitbake-devel][PATCH][1.32] fetch2: fix import error for Python 3.6.5
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
X-List-Received-Date: Thu, 26 Jul 2018 00:01:42 -0000

From: Tzu Hsiang Lin <t9360341@ntut.org.tw>

When running bitbake command with Python 3.6.5 always result in
import error causing by the change of distutils module.
This patch replaces the method to search executable in PATH by
"/usr/bin/env <command>".

Signed-off-by: Tzu Hsiang Lin <t9360341@ntut.org.tw>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 lib/bb/fetch2/clearcase.py | 3 +--
 lib/bb/fetch2/npm.py       | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/bb/fetch2/clearcase.py b/lib/bb/fetch2/clearcase.py
index 70e280a..b0b5eff 100644
--- a/lib/bb/fetch2/clearcase.py
+++ b/lib/bb/fetch2/clearcase.py
@@ -70,7 +70,6 @@ from   bb.fetch2 import FetchMethod
 from   bb.fetch2 import FetchError
 from   bb.fetch2 import runfetchcmd
 from   bb.fetch2 import logger
-from   distutils import spawn
 
 class ClearCase(FetchMethod):
     """Class to fetch urls via 'clearcase'"""
@@ -108,7 +107,7 @@ class ClearCase(FetchMethod):
         else:
             ud.module = ""
 
-        ud.basecmd = d.getVar("FETCHCMD_ccrc", True) or spawn.find_executable("cleartool") or spawn.find_executable("rcleartool")
+        ud.basecmd = d.getVar("FETCHCMD_ccrc") or "/usr/bin/env cleartool || rcleartool"
 
         if data.getVar("SRCREV", d, True) == "INVALID":
           raise FetchError("Set a valid SRCREV for the clearcase fetcher in your recipe, e.g. SRCREV = \"/main/LATEST\" or any other label of your choice.")
diff --git a/lib/bb/fetch2/npm.py b/lib/bb/fetch2/npm.py
index 699ae72..7ccaba9 100644
--- a/lib/bb/fetch2/npm.py
+++ b/lib/bb/fetch2/npm.py
@@ -33,7 +33,6 @@ from   bb.fetch2 import runfetchcmd
 from   bb.fetch2 import logger
 from   bb.fetch2 import UnpackError
 from   bb.fetch2 import ParameterError
-from   distutils import spawn
 
 def subprocess_setup():
     # Python installs a SIGPIPE handler by default. This is usually not what
-- 
2.7.4


