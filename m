Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 752CB718DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 17:20:06 +0000 (UTC)
Received: by iecar1 with SMTP id ar1so32630767iec.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gDzoHwcR8nMYSSc7qRKafmGi3fJwXs7Zv8h1DOojCTY=;
	b=eREX8t/9qT1ChSzjq7J3iveEH5HOqIjlbft90RKiTkz15nwt/386VDtZUava2ES9c7
	2WTx38xO9xOW5BtvHkx7ifCDmAtjgq6J/eJqy79BAu5Mb/WTtw6E9FLbFoRg5nSpSxmp
	0mnm7A8wgEO4utU2L4cJ7M5ludaI0f4L8QsbepaWlsQ57Ynv5lb3Vk/j13gRE7El2LZ2
	657dRMglbjMq6oH4YqMaGt2iNPjUNWfiWhcHj/pC4owT/k7wwHFZOUAgKM0UGQfqZlJl
	E6r4IXYDIjLze7crehY+dchmfDhqPXXFp6v5kPDvfZDT6hiAUvnkvTZfZQ7LzXO048nX
	wxlw==
X-Received: by 10.107.129.138 with SMTP id l10mr20436789ioi.37.1425057607198; 
	Fri, 27 Feb 2015 09:20:07 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id r78sm2594257ioi.22.2015.02.27.09.20.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Feb 2015 09:20:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 17:19:55 +0000
Message-Id: <1425057596-28243-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
References: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/6] glibc_2.21.bb: Fix condition to skip parsing the recipe for non-glibc libc
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
X-List-Received-Date: Fri, 27 Feb 2015 17:20:08 -0000

The condition should be uclibc 'or' musl then we know its not glibc
right now it checks with 'and' operator, that condition will never be
true

Change-Id: Ifc48e81fd0b3c18d8e1ef76a18c216dc6acda092
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 6e54046..693d937 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -67,7 +67,7 @@ GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn
 #
 python __anonymous () {
     import re
-    notglibc = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None) and (re.match('.*musl$', d.getVar('TARGET_OS', True)) != None)
+    notglibc = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None) or (re.match('.*musl$', d.getVar('TARGET_OS', True)) != None)
     if notglibc:
         raise bb.parse.SkipPackage("incompatible with target %s" %
                                    d.getVar('TARGET_OS', True))
-- 
2.1.4


