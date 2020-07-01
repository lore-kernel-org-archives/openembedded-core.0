Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.15438.1593582663880702457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 22:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0615of7F020520
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 22:50:52 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 30 Jun 2020 22:50:45 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 2/2] oescripts: ignore whitespaces when comparing lines
Date: Wed, 1 Jul 2020 13:50:10 +0800
Message-ID: <20200701055010.18031-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701055010.18031-1-Qi.Chen@windriver.com>
References: <20200701055010.18031-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

list-packageconfig-flags.py determines the whitespace numbers according
to the longest package name. This is reasonable for the tool as it's
trying to generate pretty output.

However, in this selftest case, the output is hardcoded. This results in
"pinentry                       gtk2 libcap ncurses qt secret" not recognized
as correct as the expected line is:
"pinentry                     gtk2 libcap ncurses qt secret".

The difference is only about whitespaces. So we should ignore the whitespaces
when comparing lines.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index f697d29b50..726daff7c6 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -133,7 +133,7 @@ class OEListPackageconfigTests(OEScriptTests):
     def check_endlines(self, results,  expected_endlines): 
         for line in results.output.splitlines():
             for el in expected_endlines:
-                if line == el:
+                if line.split() == el.split():
                     expected_endlines.remove(el)
                     break
 
-- 
2.17.1

