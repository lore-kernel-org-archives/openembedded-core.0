Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.10293.1611931843972341256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 06:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l5V6g-00030k-7i; Fri, 29 Jan 2021 16:50:42 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l5V6g-00069j-6L; Fri, 29 Jan 2021 16:50:42 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@yoctoproject.org,
	Marek Belisko <marek.belisko@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mikko Rapeli <mikko.rapeli@bmw.de>,
	Mauro Queiros <maurofrqueiros@gmail.com>
Subject: [dunfell][PATCH v2 2/3] bitbake: git.py: Use the correct branch to check if the repository has LFS objects.
Date: Fri, 29 Jan 2021 16:50:28 +0200
Message-Id: <20210129145029.22924-2-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129145029.22924-1-mikko.rapeli@bmw.de>
References: <165EBB517110DB0B.25485@lists.openembedded.org>
 <20210129145029.22924-1-mikko.rapeli@bmw.de>
MIME-Version: 1.0
X-Rspam-Score: -0.2 (/)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: FREEMAIL_ENVRCPT(0.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: TAGGED_RCPT(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_FIVE(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: SUSPICIOUS_RECIPS(1.50)
 Symbol: FREEMAIL_CC(0.00)
 Message-ID: 20210129145029.22924-2-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mauro Queirós <maurofrqueiros@gmail.com>

Function "contains_lfs" was only looking at the master branch when searching for LFS
content. LFS may be configured in specific branches only, so we need to use the
correct branch.

(Bitbake rev: 4fa67c2af830035a1ddedc14592ee25a15ebff22)

Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/lib/bb/fetch2/git.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 59afc32de1..d255afeb36 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -566,8 +566,15 @@ class Git(FetchMethod):
         """
         Check if the repository has 'lfs' (large file) content
         """
-        cmd = "%s grep lfs HEAD:.gitattributes | wc -l" % (
-                ud.basecmd)
+
+        if not ud.nobranch:
+            branchname = ud.branches[ud.names[0]]
+        else:
+            branchname = "master"
+
+        cmd = "%s grep lfs origin/%s:.gitattributes | wc -l" % (
+            ud.basecmd, ud.branches[ud.names[0]])
+
         try:
             output = runfetchcmd(cmd, d, quiet=True, workdir=wd)
             if int(output) > 0:
-- 
2.20.1

