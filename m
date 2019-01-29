Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 32D4D7C2A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 17:43:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v13so23030109wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 09:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Qeko3WIEDnuqopqwAumgJrQcDQGIk9peJGHKQQKh4aI=;
	b=ADukExkzdZgcHCVFskz4Go8f8VGBnhL8p1j2PRc35ahuGngyRebbrJFoj6CeR2blrm
	Lu6ju8j67Ufbw8Lk8vx+Xj0LpE/ElbHKfbQ74r37HykAK8aOtumYb6guiqbiFVXZd23F
	JaGOX6bSJAqkFYqh//PJyj7xssyQaRYwJmUjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Qeko3WIEDnuqopqwAumgJrQcDQGIk9peJGHKQQKh4aI=;
	b=ooe7SJc2Os3OpmQFdH+YC0U3BH8u1qnjCGisanQNlFAFMKk+LZDuO97BNpPAdRPqDq
	U3svgfieoFZ9hWwAoLN9siun+ZSPhlQXVOHQ5QujTUCkXNMwTgVbvVfO4tnur/61Cgmw
	RLAtp/5MIWUpUQ5iGn+2uf3Z4OGX74o/o40reGv4FjzZFXy7hZIXvxihOUANR9aPyRRz
	qTASXWFrdw9VMJLqJMtGk3IV1vqjJdruCX63DnPrXALp9fPbwshEwSn/zqucJUOOQOr/
	Tj/69OzII1nVA8CqXPLxDQ35Yk00S/GHForbF+tRN0b2OnrYe/G9JfZ34OBAE+P2eBXm
	UxOQ==
X-Gm-Message-State: AHQUAuZSaemGrEs4cH6PCzEepjVtZP6RrA6N2jO2Ac2In6dhjz0Fgb/X
	HfeuKDKXEXO+bKMxZh8o8DcPkmYIQeg=
X-Google-Smtp-Source: AHgI3IbvIIlYqAFmkrtofV+fGvqbSrJ8aeD6c09YJhCzv/jT6YDkb/LrBHM349Rp9LuQ6df2tyZ8iA==
X-Received: by 2002:a05:6000:11c3:: with SMTP id
	i3mr22830488wrx.221.1548783794308; 
	Tue, 29 Jan 2019 09:43:14 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n9sm94381894wrx.80.2019.01.29.09.43.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 09:43:13 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 17:43:06 +0000
Message-Id: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/7] oeqa/runtime/ptest: Avoid traceback for tests with no section
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
X-List-Received-Date: Tue, 29 Jan 2019 17:43:14 -0000
Content-Transfer-Encoding: 8bit

Some tests end up without a section, avoid tracebacks trying to use
None as a string in that case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 0972a583eeb..7d8849308d7 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -99,7 +99,7 @@ class PtestRunnerTest(OERuntimeTestCase):
         resmap = {'pass': 'PASSED', 'skip': 'SKIPPED', 'fail': 'FAILED'}
         for section in parse_result.result_dict:
             for test, result in parse_result.result_dict[section]:
-                testname = "ptestresult." + section + "." + "_".join(test.translate(trans).split())
+                testname = "ptestresult." + (section or "No-section") + "." + "_".join(test.translate(trans).split())
                 extras[testname] = {'status': resmap[result]}
 
         failed_tests = {}
-- 
2.19.1


