Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web08.10653.1611931840372688107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 06:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l5V6a-0002zG-O7; Fri, 29 Jan 2021 16:50:37 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l5V6a-00065k-MK; Fri, 29 Jan 2021 16:50:36 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@yoctoproject.org,
	Marek Belisko <marek.belisko@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mikko Rapeli <mikko.rapeli@bmw.de>,
	Mauro Queiros <maurofrqueiros@gmail.com>
Subject: [dunfell][PATCH v2 1/3] bitbake: git.py: skip smudging if lfs=0 is set
Date: Fri, 29 Jan 2021 16:50:27 +0200
Message-Id: <20210129145029.22924-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <165EBB517110DB0B.25485@lists.openembedded.org>
References: <165EBB517110DB0B.25485@lists.openembedded.org>
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
 Message-ID: 20210129145029.22924-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mauro Queirós <maurofrqueiros@gmail.com>

Git-LFS objects were being fetched even when lfs=0 was not set.
This patch disables LFS smudging when lfs=0. That way, only the LFS pointers
are downloaded during checkout.

(Bitbake rev: 646d86df7de774255246a3d7051c308e43eb257d)

Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/lib/bb/fetch2/git.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index dcecff5d38..59afc32de1 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -475,6 +475,9 @@ class Git(FetchMethod):
 
         need_lfs = ud.parm.get("lfs", "1") == "1"
 
+        if not need_lfs:
+            ud.basecmd = "GIT_LFS_SKIP_SMUDGE=1 " + ud.basecmd
+
         source_found = False
         source_error = []
 
-- 
2.20.1

