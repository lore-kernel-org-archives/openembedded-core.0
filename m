Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id DDE2B71BF0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:36:51 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id g6-v6so20558646wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b5iMWJJFNl3FZzfahMs5hQ6LxCYdcXKgg6iv6ztzaRU=;
	b=JoflIj0Ld+9YEGCuBbWvPA6ZlnM0yd8jjxlg/m8f1QQaKS4uHzneby9+EVgaw+D9VS
	CTJs6Ga5PCilmORAeARqu9+AP0FKYgutZUOfSMMft2rOlClItJwuj+qkfgCG0mxJjgNK
	E0YtaI8bSM0aiREXMdrZpDOOlKSxUUYq6v8YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b5iMWJJFNl3FZzfahMs5hQ6LxCYdcXKgg6iv6ztzaRU=;
	b=btYWLTtyXtWjMgnj+HT1gE/kfiZ5Ru7YWC1BehXUS9m6QPt1TlViube1syjezGKfvi
	3Kp2ykM9DuRMJgALBbkAy+8VlnT40aDCpLKkiWqAxChn6l5NsIADW6mEDsEZbuVfOI3c
	JzO4DLt11w4FGB9SJLIIiT7p1rmw5oeZKBjdKzcdWYbqolFvQV/66hPW6LlWeR+bdAsG
	4CX6P4gpHCJbUH3BThf1f9cn8ySH7rQGEtrdWepgLBrkuhfJLbxEVPZ76cYXwYO8miiZ
	yNpTrNsixxGtfbebQzlbtxmIoBnmiZDaBJCqUDFJ76iR0MGFSaY+Ysr6HMkuVkcW3Uf1
	mLeA==
X-Gm-Message-State: AOUpUlFQqYfAA7bVIQ7XC/QELmzbsmEg2leQybIFSCPWqWnGIuqgvxgw
	NQNZWC4K+tGdNqZIhPi0QmYowJLwHus=
X-Google-Smtp-Source: AAOMgpdJeejR4Jqd8aMlgmHBcMrcSext+3xusRuyHeSX0L1HZHiY8IC2AncFS1akSs7vF/itxESLaA==
X-Received: by 2002:adf:93a3:: with SMTP id
	32-v6mr8855806wrp.140.1531669012403; 
	Sun, 15 Jul 2018 08:36:52 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.36.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:36:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:35 +0100
Message-Id: <20180715153641.21029-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
References: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/12] oeqa/selftest/devtool: Ensure dbus is built befoe running test
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
X-List-Received-Date: Sun, 15 Jul 2018 15:36:52 -0000

If dbus isn't build first the dbus dependency of dbus-wait can't be detected
through pkgconfig and the test fails:

AssertionError: {'DEPENDS': {'dbus'}} != {}
- {'DEPENDS': {'dbus'}}
+ {} : Some expected variables not found in recipe: {'DEPENDS': {'dbus'}}

Ensure dbus is built and present in the sysroot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d5b6a46d491..723d8e19cfd 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -235,6 +235,8 @@ class DevtoolTests(DevtoolBase):
 
     @OETestID(1423)
     def test_devtool_add_git_local(self):
+        # We need dbus built so that DEPENDS recognition works
+        bitbake('dbus')
         # Fetch source from a remote URL, but do it outside of devtool
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-- 
2.17.1


