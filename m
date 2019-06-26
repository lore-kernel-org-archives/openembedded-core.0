Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 57B087E3AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:30:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c2so3466861wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9bxUjNY+yO0MjCxdVOdyeqf1ChRbRHg91kXakMgX5hs=;
	b=OZjOIEu+dF8cEzs05TnWy3MN0RJgJZuvzxZ5EmKX4geU9zoVgNNRqEalmtxi4qMlfZ
	evsQuX9fWCS6JzgxAmzthK2hDZqyJTcj6wK17F2J7nkFbCIUMSVsQ9tUUMe++/VrMw2J
	H887OKvdyaKwi5Yr4NQReC615Lr8i3Ok/l8L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9bxUjNY+yO0MjCxdVOdyeqf1ChRbRHg91kXakMgX5hs=;
	b=pOAS37dndpMGCZDR5sFHRmvIdu6kussEnmL3Qss3eAi4iOo8Dzm0D6w7OONmj8OTgT
	O8r0rXUpBqELCSLf+QZpr1o5nCX2VsfK2+EElsp6cMT52XSN04YY4GoNNZXyGqqa4YgL
	mi6rZUBmKaGnkcDGh6TabFhfrFawYGrZSrk8lSVmxJLmvK9NLtONHYaApHawarn6u8wY
	MCcRVt9nH9O9Cnq4/0/zyI0wWDvqQ5SNWuuw1tv+W8d2FxaCzfPCsVlKWeCVyq2EciHR
	XKhgrveCnEV6P/92EhfXIDLiacLPJusCc91c30gHHPaTh+gwpjw6LVz3eB5w4iehVbRG
	SF4g==
X-Gm-Message-State: APjAAAUUxhb0+94txnQq5rS35T6sbupvh30dMLEkpR5TDFjqQO83OwhR
	3ZK2LfI44GqaNWOAIb6j3KfAzJitloA=
X-Google-Smtp-Source: APXvYqzuadwOsTenlNAmys1Fr6Bi45/qzFWiB9i2h9OFWHL8pK72l4aBrQvJgN+OPqe0hDa6SsU8Xw==
X-Received: by 2002:a5d:430c:: with SMTP id h12mr4363188wrq.163.1561566651791; 
	Wed, 26 Jun 2019 09:30:51 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s63sm1484460wme.17.2019.06.26.09.30.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 26 Jun 2019 09:30:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 17:30:44 +0100
Message-Id: <20190626163044.4606-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626163044.4606-1-richard.purdie@linuxfoundation.org>
References: <20190626163044.4606-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/5] oeqa/runtime/syslog: Add delay to test to avoid failures
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
X-List-Received-Date: Wed, 26 Jun 2019 16:30:51 -0000
Content-Transfer-Encoding: 8bit

On a loaded builder we've seen the log message not make it to the log file
before the ssh command completes. Add a short delay to try and ensure
this does happen. There is unforunately no way to flush syslog in all
cases we test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 449df233d13..3a8271a53a8 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -85,6 +85,9 @@ class SyslogTestConfig(OERuntimeTestCase):
         msg = "Can't log into syslog. Output: %s " % output
         self.assertEqual(status, 0, msg=msg)
 
+        # There is no way to flush the logger to disk in all cases
+        time.sleep(1)
+
         status, output = self.target.run('grep foobar /var/log/messages')
         if status != 0:
             if self.tc.td.get("VIRTUAL-RUNTIME_init_manager") == "systemd":
-- 
2.20.1


