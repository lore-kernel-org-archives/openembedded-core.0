Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id B447F7DF3B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 13:55:44 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id y17so2447837wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eHGE//k8UEAL0YjCi3RYxy7ptRclPDZaEKL39WVznkI=;
	b=CXXgT2yiRrjZs0CgoPF26rWOV3+E9eW/E45GUTqNbkIikYD6tdxq0NrXlg2Ov6VUb4
	CBcvTGHdPQT9Dvv0gLh3c7vjz7NFGiAwi3J5mUK16OA969zKQVa46cVpO6PnDe1ChyuG
	sKQ5K9Q3HQokK6mYshQH2DnS23KOFqTXKLY3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eHGE//k8UEAL0YjCi3RYxy7ptRclPDZaEKL39WVznkI=;
	b=UeK0KsWKhVZKmumQ5x82dIpX5zDBkWzPZZWMqurr4LinJC8Nt1kr9vzZzvu42owPmV
	+XTYE4GxZQnk90ObrcLyEIQ0hJEiaICjeNqM7zQ/UiaI+QwujDf1892ctyLgqFkTvjfp
	pDoL86oWhWof7EjwP/FKzuytVjjIk5E7eHfRq4qioIcqAK8Kt+rhNinnQakV+qRINUQP
	KbuJ50BvaANiA+oARCv/o1FliGQc643THdkDU1Qo8dbunpxtlbj0efmB/Ztzgi9DVdz6
	lb8fCtFF910P75EjxUFYvMJcQNMragg+d2z6Ko+HG5XNNJYnwpHcDn+LkoHrqRbHtNRf
	b7uw==
X-Gm-Message-State: APjAAAUgB3bNjUl8Kd5yZo2kCTaKtY9xqjriN7ngT19F49D4VztXL0Cz
	XaNmkYJCoS9xG3w9MDfosiz9v5AavmU=
X-Google-Smtp-Source: APXvYqxgrCfogU5jcZVgY35ms5ilGCvU+sB701HsMNzCFRTq7/tgoIWU9QqfeGIu5qXhH4RyQgh2uw==
X-Received: by 2002:a7b:caea:: with SMTP id t10mr3235290wml.42.1557410145055; 
	Thu, 09 May 2019 06:55:45 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c131sm2625095wma.31.2019.05.09.06.55.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 06:55:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2019 14:55:41 +0100
Message-Id: <20190509135542.6033-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa/runner: Fix subunit setupClass/setupModule failure handling
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
X-List-Received-Date: Thu, 09 May 2019 13:55:45 -0000
Content-Transfer-Encoding: 8bit

The string format for subunit setupClass/setupModule failures is slightly
different, tweak the regex to correctly handle both cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index ca61de8cc0a..930620ea19f 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -109,13 +109,13 @@ class OETestResult(_TestResult):
 
                 # When fails at module or class level the class name is passed as string
                 # so figure out to see if match
-                m = re.search(r"^setUpModule \((?P<module_name>.*)\)$", scase_str)
+                m = re.search(r"^setUpModule \((?P<module_name>.*)\).*$", scase_str)
                 if m:
                     if case.__class__.__module__ == m.group('module_name'):
                         found = True
                         break
 
-                m = re.search(r"^setUpClass \((?P<class_name>.*)\)$", scase_str)
+                m = re.search(r"^setUpClass \((?P<class_name>.*)\).*$", scase_str)
                 if m:
                     class_name = "%s.%s" % (case.__class__.__module__,
                                             case.__class__.__name__)
-- 
2.20.1


