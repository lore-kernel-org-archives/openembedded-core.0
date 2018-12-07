Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC1774D03
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 12:18:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m22so4344370wml.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2018 04:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nVxcIcwJTDRz2daZbMOhJ6ca8EvVb4f6zb9axxIUcMI=;
	b=Nnhlu1jvxx/5pMW9RvTNq8gmzib2wV9mfrF6T6zgQ20MvYoAQpzI2agYOJ35pSOH+i
	EAU3DZwHMTYKR/CSEuYvSecM7dZMChhjKCwiqBviGxOPGg5t+U3fBFi3WnMzov7ZXUPf
	HSK6DMcM/bTCrY9gIUu0KVaNspsQQXVQdyG84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nVxcIcwJTDRz2daZbMOhJ6ca8EvVb4f6zb9axxIUcMI=;
	b=QlUoUGaBv5baw1L6eknJtILBMeBfreTqAkSVeU3ZdK8Ri8npQatfZ8M/t3JWRYYeO7
	dM1H+1uXdOEedSGJ2+1wsWdoclOG9smOd+ELEBjaXEUxjRB9CTgMnKkc64KfHbjyfvig
	t9N/iGIDqwiMvk0J3r+tQMLQ3zk6mYuouaCOhIMV/r+qMLu6gQKJ3AnrvkpgrjqpmeRd
	+pO7tFZGJ9rpqI/ufs4I/w19HT6v69XJzvphaIFAGHguUpOuZRXTG7OuW+xhBNFf7Jp3
	evvzMRb+LTpzaCaW00m970G+IpqsYts0pPJyS80HJDGsMhGZP/7zdD87wdZUpIK2/P4I
	5qcw==
X-Gm-Message-State: AA+aEWbCN/n4mEmS5Gu7Bm/k+AE69QSmRHOrMQmqPD5Jk0HufYBGgdC3
	Ei3/Gup74xJdM10Ajl0sUmuhSZ3xMBo=
X-Google-Smtp-Source: AFSGD/WYt7SKFh8P9BiB3hk+0g5kHfqRTUlXhn1Ba4s/1RY1aeMHIbKLPwsOUow30mj8c+8cAUChdA==
X-Received: by 2002:a1c:38c4:: with SMTP id f187mr1980866wma.90.1544185126904; 
	Fri, 07 Dec 2018 04:18:46 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o17sm5883424wmg.35.2018.12.07.04.18.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 04:18:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Dec 2018 12:18:45 +0000
Message-Id: <20181207121845.12208-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/selftest/runcmd: Increase timeout delta
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
X-List-Received-Date: Fri, 07 Dec 2018 12:18:46 -0000
Content-Transfer-Encoding: 8bit

Expecting 1s accuracy on a 2s timeout on a heavily loaded system has proven to be
unreliable. Update this to a 5s timeout with a 3s delta which should be achievable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runcmd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index d76d7063c69..a1615cfd20b 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -24,8 +24,8 @@ class RunCmdTests(OESelftestTestCase):
 
     # The delta is intentionally smaller than the timeout, to detect cases where
     # we incorrectly apply the timeout more than once.
-    TIMEOUT = 2
-    DELTA = 1
+    TIMEOUT = 5
+    DELTA = 3
 
     @OETestID(1916)
     def test_result_okay(self):
-- 
2.19.1


