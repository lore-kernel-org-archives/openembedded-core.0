Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 334577CB20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 17:47:53 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id i12so19018283wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5284bSQzHBlXo0VMeYFdMygN9pEqzMH3d/zO3VKxcH8=;
	b=DuM/UqMibEPqYr2YBwjacBGQO/sXaiSGZh1KkcdfFdbIiBAavgXVFJN3QTlUQ7jwXs
	dUuZJs/CVmkFntldC9kHe0+KRmeoKKS/QQ2SllkluDON8IvS3/3fB+Fj2qv63WbLIq4w
	MkIrVaYfZDsz/KtoQsSzjstpDusWPg0iCDiZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5284bSQzHBlXo0VMeYFdMygN9pEqzMH3d/zO3VKxcH8=;
	b=medVE9klGUEaKYV4u5N3yBCG6zG7OsHMpVKDKvZRR2NUMJde1dCMAmQjfK33Kidtma
	1LJOox4+VLbqi7ZBxQsFSQOpVnIZFWuvECD6IkIDwYIfaBGu+/7fVWEagstrzaZCKMpS
	1Zsefha0xo9BfztaKc2qNoKfRU7hRoaA92HH6zvZ7d7mLfk76O1zpyKceN3ShM2sCfBn
	N7PQKGDFqjURPOXHQA6v/eaHm5EnVx1LUQwF40OHJyQ/QmWZnYZ6hZzHq00lQKNF9Yyp
	7i3cG7FzFeReJ7R2yRMSZMKXBZhXKjAiWNji2lJ/rTV8k0vu09UCALuMAXBtnDQnynzA
	HfXg==
X-Gm-Message-State: APjAAAX0zhuua2cgnsUTW7ECqCTyjGJJjWkQfIFnuHZBFUZ1bCJYP0YV
	j2sr8oPSULN76ieBXvEStfPNaP68Sjk=
X-Google-Smtp-Source: APXvYqyE3wU0Xy+gyg8HTzY0RPUdZOKZhmv9XkcoEsoMoXD51n5GFzX0qigg9BV5lHKqcsC6CbKstg==
X-Received: by 2002:adf:fc49:: with SMTP id e9mr3539442wrs.2.1551289673597;
	Wed, 27 Feb 2019 09:47:53 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l10sm28754659wrx.45.2019.02.27.09.47.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 09:47:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 17:47:45 +0000
Message-Id: <20190227174746.21127-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190227174746.21127-1-richard.purdie@linuxfoundation.org>
References: <20190227174746.21127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/5] resulttool/report: Ensure test suites with no results show up on the report
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
X-List-Received-Date: Wed, 27 Feb 2019 17:47:53 -0000
Content-Transfer-Encoding: 8bit

ptest suites with no results don't show up on the reports even though we have
a duration for them. Fix this so the fact they report no tests is visible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/report.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 5ffe262f89b..ff1b32c7706 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -30,6 +30,14 @@ class ResultsTextReport(object):
 
     def handle_ptest_result(self, k, status, result):
         if k == 'ptestresult.sections':
+            # Ensure tests without any test results still show up on the report
+            for suite in result['ptestresult.sections']:
+                if suite not in self.ptests:
+                    self.ptests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+                if 'duration' in result['ptestresult.sections'][suite]:
+                    self.ptests[suite]['duration'] = result['ptestresult.sections'][suite]['duration']
+                if 'timeout' in result['ptestresult.sections'][suite]:
+                    self.ptests[suite]['duration'] += " T"
             return
         try:
             _, suite, test = k.split(".", 2)
@@ -48,11 +56,6 @@ class ResultsTextReport(object):
         for tk in self.result_types:
             if status in self.result_types[tk]:
                 self.ptests[suite][tk] += 1
-        if 'ptestresult.sections' in result and suite in result['ptestresult.sections']:
-            if 'duration' in result['ptestresult.sections'][suite]:
-                self.ptests[suite]['duration'] = result['ptestresult.sections'][suite]['duration']
-            if 'timeout' in result['ptestresult.sections'][suite]:
-                self.ptests[suite]['duration'] += " T"
 
     def get_aggregated_test_result(self, logger, testresult):
         test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
-- 
2.20.1


