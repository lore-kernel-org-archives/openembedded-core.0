Return-Path: <ptsneves@gmail.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8CD787C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 18:22:23 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id j143so6900749lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 10:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BrHfUY7OwO9vF9qYbtIDEFw6+0qealb/uAkm9a8HEx0=;
	b=oHpzmkoL9BX8xx484DsEyAWKZTSrr71aVyx81TI1sBGGv8ftigL7qdZqkRTnu+WBoa
	IU/kix5rRaag9FrKzQ32bwHRtf257QHiFy5DNandUZRW9/nC+K4YrFT4nrdK623J465y
	0M6z2VUpNqF4SBzLQtvv5KfnGto00IEuR1nTpyAIL3WHWXDSI+bZZTYpoUKqAwo0lZJn
	C6rjRwmmhUqMQ4NAFr5kfmqc46UC0/viPGBWDHyqvBynxu/bkyNO+oJiaCxZm8ZdcE4T
	k3ttWWRm20GRQJaca9iG0QVZKGQVjTxKWuZy8Gi/MqCWH5Z5wbgnfS4uCZMOl66epH9f
	1hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BrHfUY7OwO9vF9qYbtIDEFw6+0qealb/uAkm9a8HEx0=;
	b=EP+5bx9uPPg1rkRqz10jYMjQ2Xm9xEU34Na1AkKS3/JCXokLT8TBgf3x5+/oVS+v17
	QEz83MxCp+fCRstQj7xduIAD60gWAUHMCTOF8ZCJ+QQ1BajWAg86ovEE6/ISJNpRf19s
	ioBCJ+XuOMFA55eUujEQ1aGUKfEfdwUpZX4r4YdeZmwifCAsLHkxG18WMe6u0VzxnakD
	Cr8zDRplEjbEhisfjomskROeXC9iZeDhDbIkv7oWTi2wxtIw1zQPvtzKDJgquTG/S5nk
	GOjfk/rMAAkyLhsQ4b8Aqm0a2Sh6n+qGh6VqR4cmBGXSOgXD1oARYIeGnxpCtmFxEEXG
	vpKg==
X-Gm-Message-State: AKGB3mIyqtoe6/nDmGMrPPoLzsYGEdi5LJzAXj8CRwYbj3cinmt2a8CK
	WEfLYVix3PhWf5HpiLViNoyNX2DBzg==
X-Google-Smtp-Source: ACJfBoumpjJjMNNmfbXJxMqUDxa65T1QZtrj7ch5oxE1DVFA0p32RZuByAnkNKKHkSl/rcqmK0YqpA==
X-Received: by 10.46.17.11 with SMTP id f11mr16641770lje.8.1515781344346;
	Fri, 12 Jan 2018 10:22:24 -0800 (PST)
Received: from localhost.localdomain (user-94-254-243-185.play-internet.pl.
	[94.254.243.185]) by smtp.gmail.com with ESMTPSA id
	s65sm3756396lfi.76.2018.01.12.10.22.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Jan 2018 10:22:23 -0800 (PST)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jan 2018 19:21:59 +0100
Message-Id: <1515781319-18616-1-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Paulo Neves <ptsneves@gmail.com>,
	Paulo Neves <paulo.de_sousa_neves@nokia.com>
Subject: [PATCH v2] base.bbclass: Fix COMPATIBLE_MACHINE for -native recipe variants.
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
X-List-Received-Date: Fri, 12 Jan 2018 18:22:24 -0000

From: Paulo Neves <paulo.de_sousa_neves@nokia.com>

Hello I am having a problem where I want a recipe, along
with its -native version to only be available when allowed
by compatible machine.

In the non native case, COMPATIBLE_MACHINE is correctly
honored. But in the -native version the COMPATIBLE_MACHINE
is not honored because in the native.bbclass there is:

MACHINEOVERRIDES = ""

This change was introduced in
d09e6d883042e5d094cd08d829327c4bbbfae135.
While the explanation provided by the commit is accurate for
specific case mentioned it also breaks the
COMPATIBLE_MACHINE mechanism which relies on the
MACHINEOVERRIDES variable.

Further evidence that this was not intended is that the
exception text is false:

ERROR: Nothing PROVIDES 'x-filter-native'
x-filter-native was skipped: incompatible with machine m1
(not in COMPATIBLE_MACHINE)

And the x-filter-native'.bb recipe header contains:

COMPATIBLE_MACHINE = "^m1$"

So the exception uses ${MACHINE} to report that a
${MACHINEOVERRIDE} was not matched with the
COMPATIBLE_MACHINE, which is a false statement.

This fix attempts to correct the issue with minimal
changes.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d95afb7..d1c31c2 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -488,7 +488,7 @@ python () {
     need_machine = d.getVar('COMPATIBLE_MACHINE')
     if need_machine:
         import re
-        compat_machines = (d.getVar('MACHINEOVERRIDES') or "").split(":")
+        compat_machines = (d.getVar('MACHINEOVERRIDES') or d.getVar('MACHINE')).split(":")
         for m in compat_machines:
             if re.match(need_machine, m):
                 break
-- 
2.7.4


