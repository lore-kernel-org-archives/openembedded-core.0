Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id E36866B269
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:42 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d41so190445eek.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=q6PTJtngF45AZIuMaodcvw3yi5EtFKPda1ztAdVpBC0=;
	b=G7Vvxr6OwrpGEmNtPSzVCun4klGU+2aHk3jGQcW2S88+oFWefgmwWTRyV9Csel9k3W
	TAYSe76EkQZ+QWj/lX0IKaoyoVBD+SYe7PsMrj3vcf979Ut/aG3Is6Xk/2E8SvOM7uOn
	kAToU2dpQ6sTtQ05MqasrMES2z1RH+7lVLJl0BkDKgGLZ0lF9MkXkAQxhVeUE8KZhaDz
	wqDATDxsujltJi1Eahfkjnc+ClUB9D6uyG7LcM0aFm20s7pTeJ8PjWyQ7yhf7VJH7JAe
	IjeAs8fjZL+iXSz4KePROOGiO/r0P8wdy8+/Y+McaRPHPXemOEvYg3JAQLPy3vMCKhA7
	TnEA==
X-Received: by 10.14.108.7 with SMTP id p7mr5824190eeg.3.1374667363279;
	Wed, 24 Jul 2013 05:02:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	o5sm65653353eef.5.2013.07.24.05.02.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:40 +0200
Message-Id: <a2e681396ba1cffe5a215dc430010463cb377898.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 18/18] gettext: disable nls when INHIBIT_DEFAULT_DEPS is set
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:43 -0000

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


