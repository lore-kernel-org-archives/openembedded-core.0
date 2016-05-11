Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 54A74738AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:06 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g132so4243393pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=XIoc1Tj+CHRwR/X6FXrjiEnrarijQcXAoF5oUt+uPDI=;
	b=x+CuCtDVM2rceb9rGbb3EtmFUtK6JRHnubqcQGqGkUgfuce0zcTdnbyG09M5JvvAo/
	/ApDnEtsY9xrCvF5rjqLlsI6ABPNhG8F9G6d/ej1BaGSz9ovPwJ038eWMNZ1o/mB4hIu
	P5rfrM79FTrN85apgtpwIHP0obU2os/d4bWAobqKkmorigBUCUsJFbN1Q7HrSSpwuOzK
	E+5+xMRqJrMTZn4YcbaApXz6XscigZNEbwfhg/rYm03/wki/MLuu3VT9MjIQbB5jnk3q
	zIET3CMjqOcqtHPVKVJqDJDYYKnBxdrf8PoTTmVC6xZCOfukqe4rEJ4nGrznqATfGO/V
	jUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=XIoc1Tj+CHRwR/X6FXrjiEnrarijQcXAoF5oUt+uPDI=;
	b=Are1QMjF4bZxujIGgexyP0I3wYAlNnENzU5VTBGF8397/4fO7b7JFj5IbfH5K/WFao
	1mKmAFKUjZD0ovv3NEp89jjH57kkfiHsOFH7YbOC7r79VXDetnr2KhX3qbF/N/K/I58F
	c11QLTsGN9qrnFZMvh5xf+2izjauu6VI71fwuSKM0DJ3ESMPqXSY3AkcFSINqFS8kGGO
	Y+nvMGmpXbPFFEphrdwt807ZqKpV2TI/OTzpdCYf5BC9g1J2fbnDVRKxx1B5KWQTtkcf
	YFk9LeC1cJmDUA8/AvHQ201ixrjLCDt0L4M5ta9JIK3oBXLG5Wy4XVJNarxty9CtXzsX
	sJNw==
X-Gm-Message-State: AOPr4FWjB/nwRr7So6nBQf0NRSMv2c1txj5cgQ2wOzM/pwcg0+bc3Hc7of3tRFnVNsgNow==
X-Received: by 10.98.9.154 with SMTP id 26mr6723363pfj.121.1462988167928;
	Wed, 11 May 2016 10:36:07 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:17 -0700
Message-Id: <925786751ed4765fc7b10cdfbe56e03f0aa5e004.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 14/42] grub: Fix build with gcc-6
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
X-List-Received-Date: Wed, 11 May 2016 17:36:07 -0000

Backport patch which silences following

'../../grub-2.00/grub-core/'`gfxmenu/model.c
../../grub-2.00/grub-core/gettext/gettext.c:37:36: error: storage size of 'main_context' isn't known
 static struct grub_gettext_context main_context, secondary_context;
                                    ^~~~~~~~~~~~
make[3]: *** [gettext/gettext_module-gettext.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ettext-gettext.c-main_context-secondary_c.patch | 39 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch

diff --git a/meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch b/meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch
new file mode 100644
index 0000000..6ec2363
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch
@@ -0,0 +1,39 @@
+From f30c692c1f9ef0e93bee2b408a24baa017f1ca9d Mon Sep 17 00:00:00 2001
+From: Vladimir Serbinenko <phcoder@gmail.com>
+Date: Thu, 7 Nov 2013 01:01:47 +0100
+Subject: [PATCH] 	* grub-core/gettext/gettext.c (main_context),
+ (secondary_context): 	Define after defining type and not before.
+
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ ChangeLog                   | 5 +++++
+ grub-core/gettext/gettext.c | 4 ++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index df73570..4880cef 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -34,8 +34,6 @@ GRUB_MOD_LICENSE ("GPLv3+");
+    http://www.gnu.org/software/autoconf/manual/gettext/MO-Files.html .
+ */
+ 
+-static struct grub_gettext_context main_context, secondary_context;
+-
+ static const char *(*grub_gettext_original) (const char *s);
+ 
+ struct grub_gettext_msg
+@@ -69,6 +67,8 @@ struct grub_gettext_context
+   struct grub_gettext_msg *grub_gettext_msg_list;
+ };
+ 
++static struct grub_gettext_context main_context, secondary_context;
++
+ #define MO_MAGIC_NUMBER 		0x950412de
+ 
+ static grub_err_t
+-- 
+1.9.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 146dde6..aca6e9b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -30,6 +30,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
            file://0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch \
            file://fix-texinfo.patch \
+           file://0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch \
             "
 
 DEPENDS = "flex-native bison-native"
-- 
2.8.2


