Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 224BE7FC49
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 20so13835134wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BmM3aXDlxh9a15uv6pr1BfD+qzGArlFvEL9YHmNys1Q=;
	b=HUJQUeI3NbUysHsgrwCitHEJHj+sAxz0CK+lptUDU0d+B7Ciee9G+3IbWoYz0wjVuV
	pGXGobp98wfVor4s0l0zKBxy41TNjHnJhQLtd3xSWKTyeHmJzx6K+Zf+D1EkOzTlKU6f
	OwCiUaZz1QCtXo+KRW1n+kzHqFsNy2fb6P7RFOYc7ew5+6T5gzjUBFdOvXvMQw2pC0+q
	YMXN/A9MqpRzR+vj7fs18gL9xidbIYz4DNporhAiu2hQZD1AhF+Zvpn8ja6/rMCkJSNC
	ZyILUJx6M+YA61u1Z8oiG7RN16DjV8rz6qc/TCN3iOCz5KJXC5Y0Nqgaohu7suSAO9dp
	le0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BmM3aXDlxh9a15uv6pr1BfD+qzGArlFvEL9YHmNys1Q=;
	b=jmBNLr8ZBmGPzwWd0FC1VkUiQNuOIt9jqrYXrJv9qJZcH8suuCiSwBVT1fhcmG8Er1
	HkXvyXNIny8JOv03tDEv34C7a/7eNn/Y9/blyIz3/7GOSVY1zgjaTL/f0h+EJM8wv7Jv
	QDWX8r7Xw4b1k1Hta+UAP1g6gC8D+W60fDTrQfMDGQfVMfnTfZmGZwDyC98QJ1P+Wq3q
	iZqdhMUnsfs5/t9EtUx9uQrS9MEBzCcTOrQBU61XrrLM50KA/rZKiukakm9NhW92Fr00
	fF3plSCvKsrCKko6OLQSXZ/+KhfJijOWLB/vFsbtmCbl0m7XpzrzvxxDKGCVCCPu4nca
	iQJA==
X-Gm-Message-State: APjAAAW802aT0zX2ttdPpctLzHQSAypF/8DJFZwG5cAXymT5ZdTJlk8o
	h3VY4wT5WT9yYA9Y7z1MfvRQGxuP
X-Google-Smtp-Source: APXvYqwxxk6SHp5bVxQFHflvYZ99TUjM4Xps9COUoV4GezxDBPhlPXpKKnnQKR8OOYusev6Sf1di8w==
X-Received: by 2002:a1c:7ed0:: with SMTP id z199mr26929204wmc.58.1579010429618;
	Tue, 14 Jan 2020 06:00:29 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 15:00:05 +0100
Message-Id: <20200114140007.36622-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/20] bash: exclude from ptests
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:29 -0000

Bash's test suite prints a ton of warnings like

warning: UNIX versions number signals and schedule processes differently.
warning: If output differing only in line numbers is produced, please
warning: do not consider this a test failure.

or

warning: please do not consider output differing only in the amount of
warning: white space to be an error.

and indeed some of the tests then fail. Rather than fight with this
non-determinism, let's exclude bash from ptesting.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index bc4aaf6a4ca..0a13bf0a6c1 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -56,10 +56,10 @@ PTESTS_FAST = "\
 #    clutter-1.0-ptest \ # Doesn't build due to depends on cogl-1.0
 #    lz4-ptest \ # Needs a rewrite
 #    rt-tests-ptest \ # Needs to be checked whether it runs at all
+#    bash-ptest \ # Test outcomes are non-deterministic by design
 #"
 
 PTESTS_SLOW = "\
-    bash-ptest \
     busybox-ptest \
     dbus-test-ptest \
     e2fsprogs-ptest \
-- 
2.17.1


