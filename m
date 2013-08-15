Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id F14BC6B8BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:30 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so181078eek.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=q6PTJtngF45AZIuMaodcvw3yi5EtFKPda1ztAdVpBC0=;
	b=ix+UV+GIsqYGz6pmdeEVJqvphfznbw6RXWlKLFpv1QJiPMP+5L47EQjddzAL059BPK
	ogr4LADPt0eUC2c/4LaNbBldISi8KdP4pMZBfpjcE6mBFrMC6XmKYTfcfVWh8B1Ge+E/
	oa0wjLiT2vCBlEGTt3QlQGsNcbHKbI4s8nQCLcD1XWD/3e1HHN62dm8MopSt1pTN4vZk
	zJrMvAuBIvQCKrVccGm9dH+XfvV4J6iBq1/VyWNA1IpYbznQPxhoXg/taong8eMkNBTZ
	WFRqs/Zk4+fflLU3vpUUigR8bqyBfuPh0Ly4b1yrL2BghiSUnsySxfQu5OPQEm0pyhrt
	Cmiw==
X-Received: by 10.14.183.132 with SMTP id q4mr145796eem.87.1376551411418;
	Thu, 15 Aug 2013 00:23:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bp43sm81956316eeb.4.2013.08.15.00.23.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:41 +0200
Message-Id: <3b596d89bfa7f937ac42c19fbefa66eb82287117.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 30/33] gettext: disable nls when INHIBIT_DEFAULT_DEPS is set
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:31 -0000

* for example in gcc-runtime DEPENDS_GETTEXT from gettext.bbclass isn't
  used because gcc-runtime recipes also set INHIBIT_DEFAULT_DEPS,
  explicitly disable NLS when DEPENDS_GETTEXT is empty
* this is causing undeterministic build
  if you compare i586-oe-linux/libstdc++-v3/config.log in WORKDIR when building
  gcc-runtime before and after building gettext-native you'll see that msgfmt
  isn't found in one of them and gcc-runtime-locale-{de,fr} packages
  aren't created, there is only one file in them:
  gcc-runtime-locale-de/usr/share/locale/de/LC_MESSAGES/libstdc++.mo

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/gettext.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index 95818c6..17c894f 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -10,8 +10,8 @@ def gettext_dependencies(d):
 def gettext_oeconf(d):
     if oe.utils.inherits(d, 'native', 'cross'):
         return '--disable-nls'
-    # Remove the NLS bits if USE_NLS is no.
-    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d, 'nativesdk', 'cross-canadian'):
+    # Remove the NLS bits if USE_NLS is no or INHIBIT_DEFAULT_DEPS is set
+    if (d.getVar('USE_NLS', True) == 'no' or d.getVar('INHIBIT_DEFAULT_DEPS', True)) and not oe.utils.inherits(d, 'nativesdk', 'cross-canadian'):
         return '--disable-nls'
     return "--enable-nls"
 
-- 
1.8.3.2


