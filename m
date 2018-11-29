Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6CE6C123
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 12:17:45 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j10so1677514wru.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 04:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m0BnB6YYrky2AeRoxOcx+mdPob8L7tZIHlfOtewK2/s=;
	b=bGCZnI2gp9yH208wUgvj4SONL48Th52euORgGQLIR+mg0yVNQDUkzRZdYAmnZsg9B5
	gj/oEJ6+ztg5tfLkrY3/kQEXoB4kMYAMyNOOjci7nBea93/+IYC67JXXLnyHxnZUcd0T
	z6qH6IpEZJ3LWXRnsrI/ZhDYdTeANlABdA/N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m0BnB6YYrky2AeRoxOcx+mdPob8L7tZIHlfOtewK2/s=;
	b=X84TMZBQRfVThZw8cdbFus/FuEJtTmU8mM18nuxfi1nsYFyh6dTRd78o8esrQodJGy
	eZpbuyxht5lg21BpCD0DBU1MGrQzWgiVOX2AGSI/ccThPPnL3zxbR0H7FWhJuGHpPg7v
	LQUXTq4UqMwwemXkKMQPodPKbCYba6/goxb7oHs88p3ek5P0EF07yqZcHymQBB5Lr+PX
	H1eLHi0gaOucAlgnltUYgEcK/XORrbJaig7pS+/rwq2w2/4ZO5P4Hno+AkIDHbeT8abs
	fZ+4THIgVbXRUdQ9ZBSMkeWDnW9/xXzGpJQe0LZfWasw7+rapy4PX93E8J75pQLSVOnd
	tbfA==
X-Gm-Message-State: AA+aEWbrm3zNnNxlfyvNIrD6/UfhP1QRLYA4ioGSaUw1OK087dUWJbt7
	9haWaZ/wNVqpdce8VjrlYkTYL6XdLUk=
X-Google-Smtp-Source: AFSGD/WCdOd8qiup2hplc5n1sKvCSu0Us0jKukxcqUtR735i9bc3QNSl0Eofi2jS7w7A9AT+9mdSdQ==
X-Received: by 2002:adf:fe11:: with SMTP id n17mr1182055wrr.329.1543493865785; 
	Thu, 29 Nov 2018 04:17:45 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 5sm2717625wmw.8.2018.11.29.04.17.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 04:17:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 12:17:40 +0000
Message-Id: <20181129121744.10052-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/5] oeqa/selftest/buildoptions: Improve ccache test
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
X-List-Received-Date: Thu, 29 Nov 2018 12:17:45 -0000
Content-Transfer-Encoding: 8bit

This test occisionally fails as m4 doesn't recompile, meaning the logfile test
then doesn't find mention of ccache.

To ensure m4 does recompile, clean m4 before force compiling it.

(Reading the test is confusing due to the test cleanup also involving a clean)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 9b87e7fcfcc..c3c90a0b0dc 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -38,6 +38,7 @@ class ImageOptionsTests(OESelftestTestCase):
         self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
         self.add_command_to_tearDown('bitbake -c clean m4')
+        bitbake("m4 -c clean")
         bitbake("m4 -f -c compile")
         log_compile = os.path.join(get_bb_var("WORKDIR","m4"), "temp/log.do_compile")
         with open(log_compile, "r") as f:
-- 
2.19.1


