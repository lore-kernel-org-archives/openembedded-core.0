Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1BB7FEC8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:26 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c9so3351969wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UQjIa1gmPZdpzElSnCIdEezbuNMpzSnLj4NNRB0syt8=;
	b=NPB+xm5HgPWrhWC5CkgSAPdd46OpShS7x8oX5tjPW5Umfk/QxFVDYhG/387bX8U0zE
	hw9DEa5yqxCz03sXPwhlwHHWhlF8TduikjnBa9bD6mcx2aqy55pFPa78JLzDYtzKVxn2
	vU/AAVeI7JdMHVDK5bv6TWFr+Sc+MseUUCkds4aTj+ihzOQimlmfqJ3wvCJBbNj+Mkkh
	CKI212PyVSfuwx3lNPj4JO4mmTkkIHpg1a9ESiQUvJnYaDcJTYE6o03Lw5Z10MD1kfQC
	RQ1LLAKWEIH/7btObnKFg49kckLsdf8f5xs/P6MMHM3vjUev/w9AQQwJKKwFotADQm0v
	Zamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UQjIa1gmPZdpzElSnCIdEezbuNMpzSnLj4NNRB0syt8=;
	b=WT+77uMZ0efuB0sC0C+UlgkI7UVAMrQnH9EVU/oc2+pX5xPlLVRyO7Lng4fcZSTvHo
	Cev1wJocidjvrXbb1XQxecdk3JD+gMLwhRBoTGcWq3d8fjL49LLRIPmGOuZQGDCqj/2O
	LzDvfrcyhfbJUIOdIr922F2Ia1MteE/BV9XQJxOhgkzPm0xWKfomtwz5xfghzt5Y7dou
	uZhpdW/ELBt0TSE0SPcRyq75jFxOmGx9sahXIyfXNedgvfs6hpdQi9T0YgbiSbGNRl6U
	fYxWpGeOe8Kp7qv2Wm6TtjMB92XxfvprilmjFY2Nj7P3fwHdHxFiKdaPe1DD4ksBNP73
	5/yw==
X-Gm-Message-State: APjAAAWYaVSBHnz7yTkxmAapNrLy5wjTclRQYkoFX/BVCILBfz7GfvAV
	4Y/QG91jUKwFxynZ5iCGXmLD9KsPbeA=
X-Google-Smtp-Source: APXvYqy0AmzJFsWIoZNvrBuDRW1pR4l34AKd/EUMvDmyVh0OQWrx2DOSsflPUI7HdgQSpPeAeymF0Q==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr4539181wrn.280.1578490107195; 
	Wed, 08 Jan 2020 05:28:27 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:51 +0100
Message-Id: <20200108132759.95603-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 20/28] ptest: report ptests that couldn't be run at all
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:27 -0000

Currently if a ptest does not produce PASS or FAIL, but simply
errors out, this is not caught or reported; I think some ptests
may have silently regressed due to this.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index aef79f62a98..eb284df439b 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -67,6 +67,11 @@ class PtestRunnerTest(OERuntimeTestCase):
                 extras[testname] = {'status': result}
 
         failed_tests = {}
+
+        for section in sections:
+            if 'exitcode' in sections[section].keys():
+                failed_tests[section] = sections[section]["log"]
+
         for section in results:
             failed_testcases = [ "_".join(test.translate(trans).split()) for test in results[section] if results[section][test] == 'FAILED' ]
             if failed_testcases:
-- 
2.17.1


