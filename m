Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD057C2D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 17:43:19 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f7so23155559wrp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 09:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=k2q8+5uhFZRUrKYkbfDccv9Q7GXwky3CF2q/0x6vTGs=;
	b=gMbSx5tDE6GLU27ES+/ASeGprubknGUzNWXqHh9nzKMprmXVkQEVvFgEMpGbmLu6BX
	tvrt7JMOJcJVnqaAgGXi/sHthUJlhlzUTsRUryRPTtjLMJPz5a4zd1jWO42ZoLlcOq4S
	LVJLkzOV5sJ4j7HBXUKpwRFTfvhQExPpH7B34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=k2q8+5uhFZRUrKYkbfDccv9Q7GXwky3CF2q/0x6vTGs=;
	b=GIXbPG0a5/6TAmhnG7zLLSoQiiAfQQyiWxgKDRqA9ozw5SEhc/romkrcbosMsaIsUh
	geaA13lStH1YhqPgOyb6ktvR0KLHASCgO1SVOBugpkncX+aEV+wovPgnnGh54TqLI8T1
	3d7D7pIdl98kcN8bTGzg6VOk6qBIGMh228xYZIY0Shfn6TaOj1v+lmb65t2GnrKxzvtu
	L5gqXWhqDfvT4x1n5lGhrSjz2/8HS89YxfNc+bY/h74NYTwK1EXHyvF2ipxkEcbNG/RX
	7js/OuvBq21+hmPMkk9PI8KBLGgR2hAkdHZS1+x+oKbBH3CFVCGXjUdAHIAQ04g3fv99
	c41Q==
X-Gm-Message-State: AJcUukdRjAK06mxBX2Ij5Of1GpLuV4+jlDiqzKnGRZQN2DqoABgQisvZ
	WA3mnSNiiPGFzmXM6VUFyeQzJaIKpdA=
X-Google-Smtp-Source: ALg8bN4fh3bnM98T1ybjXOKa3B7B+NU0H+2HD/25lZyEA0Saormn4p05xI60ZWc+YJ2PiSsZGnspEw==
X-Received: by 2002:adf:f28d:: with SMTP id k13mr28034075wro.78.1548783799455; 
	Tue, 29 Jan 2019 09:43:19 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n9sm94381894wrx.80.2019.01.29.09.43.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 09:43:18 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 17:43:10 +0000
Message-Id: <20190129174312.29224-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
References: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/7] oeqa/utils/logparser: Add in support for duration, exitcode and logs by section
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
X-List-Received-Date: Tue, 29 Jan 2019 17:43:19 -0000
Content-Transfer-Encoding: 8bit

Allow parsing of the ptest duration, exit code and timeout keywords
from the logs, returning data on each section.

Also include the logs broken out per section.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py |  4 ++-
 meta/lib/oeqa/utils/logparser.py     | 40 +++++++++++++++++++++++-----
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index ae54a01669a..3cfd7af7e2e 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -49,13 +49,15 @@ class PtestRunnerTest(OERuntimeTestCase):
         extras['ptestresult.rawlogs'] = {'log': output}
 
         # Parse and save results
-        parse_result = PtestParser().parse(ptest_runner_log)
+        parse_result, sections = PtestParser().parse(ptest_runner_log)
         parse_result.log_as_files(ptest_log_dir, test_status = ['pass','fail', 'skip'])
         if os.path.exists(ptest_log_dir_link):
             # Remove the old link to create a new one
             os.remove(ptest_log_dir_link)
         os.symlink(os.path.basename(ptest_log_dir), ptest_log_dir_link)
 
+        extras['ptestresult.sections'] = sections
+
         trans = str.maketrans("()", "__")
         resmap = {'pass': 'PASSED', 'skip': 'SKIPPED', 'fail': 'FAILED'}
         for section in parse_result.result_dict:
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index f8d1c036306..dddea14fc98 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -9,6 +9,7 @@ from . import ftools
 class PtestParser(object):
     def __init__(self):
         self.results = Result()
+        self.sections = {}
 
     def parse(self, logfile):
         test_regex = {}
@@ -19,28 +20,55 @@ class PtestParser(object):
         section_regex = {}
         section_regex['begin'] = re.compile(r"^BEGIN: .*/(.+)/ptest")
         section_regex['end'] = re.compile(r"^END: .*/(.+)/ptest")
+        section_regex['duration'] = re.compile(r"^DURATION: (.+)")
+        section_regex['exitcode'] = re.compile(r"^ERROR: Exit status is (.+)")
+        section_regex['timeout'] = re.compile(r"^TIMEOUT: .*/(.+)/ptest")
+
+        def newsection():
+            return { 'name': "No-section", 'log': "" }
+
+        current_section = newsection()
 
         with open(logfile, errors='replace') as f:
             for line in f:
                 result = section_regex['begin'].search(line)
                 if result:
-                    current_section = result.group(1)
+                    current_section['name'] = result.group(1)
                     continue
 
                 result = section_regex['end'].search(line)
                 if result:
-                    if current_section != result.group(1):
-                        bb.warn("Ptest log section mismatch %s vs. %s" % (current_section, result.group(1)))
-                    current_section = None
+                    if current_section['name'] != result.group(1):
+                        bb.warn("Ptest END log section mismatch %s vs. %s" % (current_section['name'], result.group(1)))
+                    if current_section['name'] in self.sections:
+                        bb.warn("Ptest duplicate section for %s" % (current_section['name']))
+                    self.sections[current_section['name']] = current_section
+                    del self.sections[current_section['name']]['name']
+                    current_section = newsection()
+                    continue
+
+                result = section_regex['timeout'].search(line)
+                if result:
+                    if current_section['name'] != result.group(1):
+                        bb.warn("Ptest TIMEOUT log section mismatch %s vs. %s" % (current_section['name'], result.group(1)))
+                    current_section['timeout'] = True
                     continue
 
+                for t in ['duration', 'exitcode']:
+                    result = section_regex[t].search(line)
+                    if result:
+                        current_section[t] = result.group(1)
+                        continue
+
+                current_section['log'] = current_section['log'] + line 
+
                 for t in test_regex:
                     result = test_regex[t].search(line)
                     if result:
-                        self.results.store(current_section, result.group(1), t)
+                        self.results.store(current_section['name'], result.group(1), t)
 
         self.results.sort_tests()
-        return self.results
+        return self.results, self.sections
 
 class Result(object):
 
-- 
2.19.1


