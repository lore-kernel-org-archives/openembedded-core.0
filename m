Return-Path: <ptsneves@gmail.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD49787AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 17:46:00 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id v74so4826994lfa.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 09:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YB81Y1Z0zOwyXHqyqdqBLgKTW+bWWjcT9qWiztwoy2Y=;
	b=nkdu1/eoHIXQNezT3LEzUqCafWYPVYoVEqpIhkk3FyTaljH+5Br/SnVIzw09JhfhLn
	OVu880Y+nSR0lKWT3VD7GuRX6szRgVbO5KW1dp/ly/zPKbeEg+pdreMiQO154NrbhTOT
	zcNZgPaUIo4FUF5OmwHQUsfl8r9fVltCePlt5I1+CkSeMeWmujpwp2Ojf6v1CAG/phZ2
	L4wagSQVIzaMPnB/dPfHTQngMAkWWib3vuIDBfqh60YESBCkbQDnCdDDFh/cgUnXa9zK
	BV6NFYpWnGo0wXfI3Ms2JA5RE4up+zjiYj7D5kVNt56u9gzrx5s3wYtMMpC5Z5ucYTYi
	VwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YB81Y1Z0zOwyXHqyqdqBLgKTW+bWWjcT9qWiztwoy2Y=;
	b=s1sy5SmUMYzWkiStJH6lVH18uaSjdeqDRxoeG63+TFy8GelY/HIua5DcAf4MitKpYB
	YgO+ZQB/4qWQu7PZ+AkfbZHPidDe+a+J4hfTYxQr/5f/oIWZuGNZXzr3qZv2nCDripTE
	5+lknSPtPpQmVyu073lLBt6wUdmcJQ5NBrluc3WSY7qaD7+xHNQKRMNMw3Pv8oyl2wsg
	NCLIYwsoQq9DX2Fu1BieLeuCRCP51NVwUuaqeH+1IDCw2+w/f81duswLRwLWYWI92Xnf
	wR4QjdTlO84M2VM8c2P95bA1/oDilW8W1+1mW9gciEEZ1UAi7qiV/e0anWrVm6XPj2sp
	AcLQ==
X-Gm-Message-State: AKGB3mLSAsy26DpTbRPy6rbioxFlAudmEKS2XxP2uYxCqN5h89pxAI86
	8g89SbhhIiOezuWtbqFXlipyL68=
X-Google-Smtp-Source: ACJfBosxznUCM4WDClS7M5DRX4Br/7qFNobaGKMLuuoY0XzQ0+xeWk1+/ueE/6nSdZFWNUPXqy1TCQ==
X-Received: by 10.46.124.13 with SMTP id x13mr15558422ljc.109.1515779160586;
	Fri, 12 Jan 2018 09:46:00 -0800 (PST)
Received: from localhost.localdomain (user-94-254-243-185.play-internet.pl.
	[94.254.243.185]) by smtp.gmail.com with ESMTPSA id
	b200sm3735525lfg.25.2018.01.12.09.45.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Jan 2018 09:46:00 -0800 (PST)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jan 2018 18:45:54 +0100
Message-Id: <1515779154-17898-1-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Paulo Neves <paulo.de_sousa_neves@nokia.com>
Subject: [PATCH] Fix COMPATIBLE_MACHINE for -native recipe variants.
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
X-List-Received-Date: Fri, 12 Jan 2018 17:46:00 -0000

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

Change-Id: If5085e4e92550b8154033dd56149eb4e358ef266
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


