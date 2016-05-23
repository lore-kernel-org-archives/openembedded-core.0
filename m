Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 45CC26FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:45:50 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id i7so19682438qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=17nc7Fdi3JHBaTdZLVu94wjTLhSmjZboYgBn1f3jQIE=;
	b=ZGvBa9q/Y9vE0AzjnTsT9fYPYF8bEzUdL6/gna8AXtWD1srre1GcPCz46Lcz4NYhfQ
	MDfr0B2DdB0EqDyAS+Z3y51wryeGsJm9jLcI2EWj5sFCjvqUqZpY0qUK3S18hC0ruglW
	Q+idJwHW/ETcy/EPNQ+KIO5BxPbuY0ACDjZ+zci75tHKX28ObCDyuSCIjEe7iTla7O0Y
	TvOx+bq3yLAdRGQ4AqOZJGTMDXFTR5wpZ7XqRoxZa0Tfxxf3N1KJglZMdWSpPLUwtNpW
	en4x6pIbGcISeCp885lMDOc480P7ruh4Koht3f/LpvHfgu/jK3KWin85ZqOvGalC3K5d
	Ffng==
X-Gm-Message-State: ALyK8tKavWWenPUaS1gnNx3v6q6+OMRO5Sv2SRjzUcg0FDwz93ozP1+G/GXyK5ZGs4ScsQ==
X-Received: by 10.55.115.69 with SMTP id o66mr101300qkc.67.1464036351690;
	Mon, 23 May 2016 13:45:51 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	127sm4671422qhg.49.2016.05.23.13.45.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 May 2016 13:45:50 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 23 May 2016 17:45:44 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 17:45:26 -0300
Message-Id: <1464036327-4826-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
References: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] ca-certificates: Use c_rehash utility
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
X-List-Received-Date: Mon, 23 May 2016 20:45:51 -0000

As now the c_rehash utility is available, we can use it. This removes
the patch to disable its usage allowing for a standard SSL behaviour.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...01-update-ca-certificates-remove-c-rehash.patch | 46 ----------------------
 .../ca-certificates/ca-certificates_20160104.bb    |  1 -
 2 files changed, 47 deletions(-)
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
deleted file mode 100644
index bf02723..0000000
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Pending
-
-From 111e905fe931da1a3800accfc675cc01c8ee080c Mon Sep 17 00:00:00 2001
-From: Ulf Samuelsson <ulf@emagii.com>
-Date: Tue, 28 Feb 2012 06:42:58 +0100
-Subject: [PATCH] update-ca-certificates: remove c rehash
-
-Updated earlier patch to apply clean on 2012-02-12
-Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
----
- sbin/update-ca-certificates |   20 ++++++++++----------
- 1 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 5375950..c567e3d 100755
---- a/sbin/update-ca-certificates
-+++ b/sbin/update-ca-certificates
-@@ -132,16 +132,16 @@ rm -f "$CERTBUNDLE"
- ADDED_CNT=$(wc -l < "$ADDED")
- REMOVED_CNT=$(wc -l < "$REMOVED")
-
--if [ "$ADDED_CNT" -gt 0 ] || [ "$REMOVED_CNT" -gt 0 ]
--then
--  # only run if set of files has changed
--  if [ "$verbose" = 0 ]
--  then
--    c_rehash . > /dev/null
--  else
--    c_rehash .
--  fi
--fi
-+#if [ "$ADDED_CNT" -gt 0 ] || [ "$REMOVED_CNT" -gt 0 ]
-+#then
-+#  # only run if set of files has changed
-+#  if [ "$verbose" = 0 ]
-+#  then
-+#    c_rehash . > /dev/null
-+#  else
-+#    c_rehash .
-+#  fi
-+#fi
-
- chmod 0644 "$TEMPBUNDLE"
- mv -f "$TEMPBUNDLE" "$CERTBUNDLE"
---
-1.7.4.1
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb b/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
index e0f1939..871bc2e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
@@ -14,7 +14,6 @@ DEPENDS_class-native = ""
 SRCREV = "f54715702c5c0581c9461f78fd84e2c8d2ec243c"
 
 SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
-           file://0001-update-ca-certificates-remove-c-rehash.patch \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://update-ca-certificates-support-Toybox.patch \
-- 
2.8.2


