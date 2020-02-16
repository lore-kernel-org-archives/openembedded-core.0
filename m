Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D974660632
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 15:51:02 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m16so16641226wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 07:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iSqvl7ZiJSMpdMVrp/n3Ex6v3m56qjrvXpmw4yRfLAA=;
	b=Ggp7oBP9F9lqULOnVkctyfJRaacbXXJylEIuB5FAF9jYEqsctDjOve29YTc5/L7bxv
	o98wiDKBaOCZyNJf9uCXB6C08h00RdAJE7LaMx7GwBIoK8rpdOlrCkVBvaW2WxEzqFDY
	oQ5Z8jrfxk6iMYJ0yRuuYw1mw3F3+y+84b+YeQiamw6eZV8mUT4QOJtICUocnDshhO+k
	n0PjbBAkgK6o2F/AJbDRJ2zPDLhF61fo21bjRny/xHh8C1ym+sw7IqokbLK6q/IvkQhP
	OHcWofgl8aUZ0+twNqg3+kJcDmYzBdYMCeMpG0b5ldtZ5EVVJ1jtdzOWN6UlKHrupdL0
	jLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iSqvl7ZiJSMpdMVrp/n3Ex6v3m56qjrvXpmw4yRfLAA=;
	b=ehYhZ5NpjWqOB/zIogiOYUsG+YiYLmqbQhHJg0rpGbqAdSP1elIj6CXyLyypDmQxS1
	d2cAQZR2QFztkCFwmaljqU4TRSJMrU6WzPcL3RsplvK/CPtQ2YbUWgKrwxs2wrRKtU2N
	Hlyf9k94z6kh9NoKNaF6/WYhlpliy7inur5ZdLqFRPTFnD/ojNVcWGpqh7GMDk5r6EyI
	PttOZqzl4e2BQinEHAraDd1+RufznPoWewMyOq9sJf87j868vUt5ygbyjphInJ98V6Sa
	CEackA9sJC0fAwPsJr4e8S93HvfgfxB98TlB/o9ojA+p1K76QDYSY9S+1xN1+ZvmJX7d
	ICVA==
X-Gm-Message-State: APjAAAVDLuY40Nm7oqfLx4YWbVkWrSmdMIGHqwyWF9VSAloS0hC/Sw9i
	2mkHW+i0vJuc6y4pS0FttWdcyHU3
X-Google-Smtp-Source: APXvYqw3DdL/xgCHiw1I1qzJQBRJoeTKSmll4713XdVlHHemL4i3Dh9uR1Jgec+W6yJm5MTtnvCgWg==
X-Received: by 2002:a5d:6408:: with SMTP id z8mr16377620wru.122.1581868263224; 
	Sun, 16 Feb 2020 07:51:03 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	t81sm16513271wmg.6.2020.02.16.07.51.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 07:51:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 16:50:05 +0100
Message-Id: <20200216155015.21738-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 01/10] core-image-sato-sdk-ptest: do not pull in ptest-pkgs
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
X-List-Received-Date: Sun, 16 Feb 2020 15:51:03 -0000
Content-Transfer-Encoding: 8bit

The lists of ptests are defined via PTESTS_FAST and PTESTS_SLOW;
specifying 'ptests-pkgs' also pulls in additional ptests that
are specifically excluded from those lists due to causing issues with
ptesting. (particularly bash-ptest is one such item)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 85b5adbc69..58c257c49f 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -3,8 +3,6 @@ require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also includes ptest packages."
 
-IMAGE_FEATURES += "ptest-pkgs"
-
 PROVIDES += "core-image-sato-ptest"
 
 # Also include ptests which may not otherwise be included in a sato image
-- 
2.25.0


