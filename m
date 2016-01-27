Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id BF47573289
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 13:21:12 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id 6so6005389qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 05:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K5RDSKJp3flijAJ0T1uB65pXFuINUqVEIJUjdaLLIsU=;
	b=X4PcHdstZU8TUeFg427i/rf2B5Ns03y8oMlkZv8nIvNMm9f7oLXLAEACspIklkV1bj
	O4GqNbGAGQdgnIKHlVDnY4yvcNQh0c7K8fT+PuB/kyJ9VJaf+eRCTmKyIbK5gM0QoiiS
	S3TR7+UwkyynctLbraRM5I/WBNHPCPE7gjCIrzcB5jUj2HCKIcVPcYbktsGpZo/YoLkR
	hq4bOZY33+IX2ppw+Zwo//vYP5hNbyWU1QqvspNr1nw/pZLV9PjKBPX1kdJ7+JRIWGac
	oAjjv301tuKtNbHHd9W4W8cqYVzBfQDpyDftuELxKqCnbYa/sMj+jqe9HH2z8/t+wSSJ
	RlRg==
X-Gm-Message-State: AG10YORIF7Kl9i9SUuXOz76kXyRg5nVWEq6hWNSD1IDhZuuliGI069T6/qzQveadm2IceQ==
X-Received: by 10.140.19.43 with SMTP id 40mr35561692qgg.72.1453900873044;
	Wed, 27 Jan 2016 05:21:13 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	l107sm2604481qge.22.2016.01.27.05.21.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 05:21:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 08:20:57 -0500
Message-Id: <1453900857-28834-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [jethro][PATCH] grub2: fix CVE-2015-8370
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
X-List-Received-Date: Wed, 27 Jan 2016 13:21:12 -0000

CVE-2015-8370:
Integer underflows allow attacks with physicall access to bypass authentication

[YOCTO 8850]

References:
http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-8370

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...E-2015-8370-Grub2-user-pass-vulnerability.patch | 54 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch

diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
new file mode 100644
index 0000000..e06c3bf
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
@@ -0,0 +1,54 @@
+
+Upstream-Status: Accepted
+CVE: CVE-2015-8370
+Signed-off-by: Derek Straka <derek@asterius.io>
+
+From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00 2001
+From: Hector Marco-Gisbert <hecmargi@upv.es>
+Date: Wed, 16 Dec 2015 04:57:18 +0000
+Subject: Fix security issue when reading username and password
+
+This patch fixes two integer underflows at:
+  * grub-core/lib/crypto.c
+  * grub-core/normal/auth.c
+
+CVE-2015-8370
+
+Signed-off-by: Hector Marco-Gisbert <hecmargi@upv.es>
+Signed-off-by: Ismael Ripoll-Ripoll <iripoll@disca.upv.es>
+Also-By: Andrey Borzenkov <arvidjaar@gmail.com>
+---
+diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
+index 010e550..683a8aa 100644
+--- a/grub-core/lib/crypto.c
++++ b/grub-core/lib/crypto.c
+@@ -458,7 +458,8 @@ grub_password_get (char buf[], unsigned buf_size)
+ 
+       if (key == '\b')
+ 	{
+-	  cur_len--;
++	  if (cur_len)
++	    cur_len--;
+ 	  continue;
+ 	}
+ 
+diff --git a/grub-core/normal/auth.c b/grub-core/normal/auth.c
+index c6bd96e..8615c48 100644
+--- a/grub-core/normal/auth.c
++++ b/grub-core/normal/auth.c
+@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned buf_size)
+ 
+       if (key == '\b')
+ 	{
+-	  cur_len--;
+-	  grub_printf ("\b");
++	  if (cur_len)
++	    {
++	      cur_len--;
++	      grub_printf ("\b");
++	    }
+ 	  continue;
+ 	}
+ 
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 312771b..a8c41f8 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -27,6 +27,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
            file://grub2-fix-initrd-size-bug.patch \
+           file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
             "
 
 DEPENDS = "flex-native bison-native xz"
-- 
1.9.1


