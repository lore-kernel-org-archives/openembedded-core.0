Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7FB6D5B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:32:55 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id u65so17886149itc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6Nq5gT1MiPmfjuCkZQw07q5NQcpOmdfrclrxsJ/PscA=;
	b=K54inuC/ZENpkO0+9rgj7V/t7nDT6m2V3EpShBdkgPDesudMT6h/Qvm0RxsA+FwBOx
	b6rEmm+ikdVeQzDkxYuTscOkMAMjnVsSPNDKji8o+kprC1hMiwxt6gwPSsNb5KdA0brx
	Ap7XS5+lgvwYvSjEa/dUD7cj3pETSMfJnltxGqfK4bHDoicLe1jb31Ro72aQ+7SV+C/H
	M8PbO58ll+g8IY7voh0/0gsTfliU9Cijrto3M3yZvVodC49K5wSsa0yCJbbFRjyvNcMm
	A+5tqqZAY2ttfi54vhdmWlSCs1ZWi7T9spATKxJb5Z5V4LpurJ45xcZu5Dt7g1KEIJsu
	ezew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6Nq5gT1MiPmfjuCkZQw07q5NQcpOmdfrclrxsJ/PscA=;
	b=MXjtY4fwVDICKrDaLZ2EnjgdYV/wTbvPROU+cr4NNa3kEAKoggVTkkxwwgCmBp00oa
	Z7JSnHYNZ0o9iTOAvqZ7ieGRL1N7evDZ7r4bx/ww7K/5XfDC+vGyIj/w3aI3zosaaqgY
	cgdsYHA/yVUBjyc8Sf8aq1u9nmeHFN3XWwe4UrzFfnFhCfMe80TbQqJmQKrVPlYlKZ/c
	W0HnZFYCdwZNopIC1bI6+0wv05XrSJu1BBdmY/274t4HCIP3X2Fhmq3c727aj8kad7FE
	Pvl1S+BoPUUz8xXgwFuS9WaXjoxkNiZao3rMAplc4grfT5k2AwnDrYS6g+rx7Z+F3Vtl
	HUrQ==
X-Gm-Message-State: APjAAAWr0yK/4RnGke4gK+hpFFrbqKTErhb+1HQNREGf0YbmuKo2nSQW
	61w4FAgBN1q2z6fK41sFMF28howw
X-Google-Smtp-Source: APXvYqzdmA8rVDhBbAYhddu+Kg/lBvHf6C3sZiJwLbfUAVfCCZKqX+GvU4++GlwK+eB44UULcoY7nQ==
X-Received: by 2002:a24:3ac8:: with SMTP id m191mr12882363itm.74.1555936376337;
	Mon, 22 Apr 2019 05:32:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id 19sm5889536itm.6.2019.04.22.05.32.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:32:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:32:39 -0600
Message-Id: <1555936363-18793-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
References: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 2/6] logparser: Add decoding ltp logs
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
X-List-Received-Date: Mon, 22 Apr 2019 12:32:55 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/utils/logparser.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 32fde14..76efac4 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -86,3 +86,28 @@ class PtestParser(object):
                     status = self.results[section][test_name]
                     f.write(status + ": " + test_name + "\n")
 
+
+# ltp log parsing
+class LtpParser(object):
+    def __init__(self):
+        self.results = {}
+        self.section = {'duration': "", 'log': ""}
+
+    def parse(self, logfile):
+        test_regex = {}
+        test_regex['PASSED'] = re.compile(r"PASS")
+        test_regex['FAILED'] = re.compile(r"FAIL")
+        test_regex['SKIPPED'] = re.compile(r"SKIP")
+
+        with open(logfile, errors='replace') as f:
+            for line in f:
+                for t in test_regex:
+                    result = test_regex[t].search(line)
+                    if result:
+                        self.results[line.split()[0].strip()] = t
+
+        for test in self.results:
+            result = self.results[test]
+            self.section['log'] = self.section['log'] + ("%s: %s\n" % (result.strip()[:-2], test.strip()))
+
+        return self.results, self.section
-- 
2.7.4


