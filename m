Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 771AB6E688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 09:55:43 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id l68so12198610qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 02:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=b81xmQEuEKPj3S0UIKpr5nz/Xv1KfDb/ggEbsvZ3HHI=;
	b=AaHY9tFg3YWB25pgzwSTl3JsxcMQKaODcpbHO3xl+Z0zrSsUJll5S9kSbWCi1a7pCR
	0SjhJKu8vOM7haKhEP+nhBq7eyjrbUFdSy8O/pHsE5TW7I+0ft9fdQnvY1WnaZt4nfBL
	uP6GLVEct4iNsBkru4Bf/TzGfIgTqXXqFHmCy/CMzR6WjbYV8GF1fPCEahUiVbpUWupD
	xtVBGRZ/AhbntK8myEjQHD+qQXdkgJdjK+b7z4Ctabz1CbWTcBgdy1zC1yhKNi2Xuw64
	+4Yhe5fTOa4XnfTVJ0wR1UdfIJI1nVWYGFyugix2dS5ryND5ZPt3dXEmsrHPCrZWY401
	V3fg==
X-Gm-Message-State: ALyK8tJqP/GMixXDzQOIJ5sHtDtGnZlr0tB6Jfe7WvunRUgzZGYACoBK5lLEr6mR8W0Ymw==
X-Received: by 10.55.146.71 with SMTP id u68mr12744464qkd.30.1464342943830;
	Fri, 27 May 2016 02:55:43 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id k61sm5090591qtd.5.2016.05.27.02.55.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 May 2016 02:55:42 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 27 May 2016 06:55:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2016 06:55:17 -0300
Message-Id: <20160527095518.21761-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160527095518.21761-1-otavio@ossystems.com.br>
References: <20160527095518.21761-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/3] ca-certificates: Use c_rehash utility
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
X-List-Received-Date: Fri, 27 May 2016 09:55:44 -0000

As now the c_rehash utility is available, we can use it. This removes
the patch to disable its usage allowing for a standard SSL behaviour.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Add rdepends on openssl

 ...01-update-ca-certificates-remove-c-rehash.patch | 46 ----------------------
 .../ca-certificates/ca-certificates_20160104.bb    |  3 +-
 2 files changed, 2 insertions(+), 47 deletions(-)
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
index e0f1939..faefc78 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
@@ -14,7 +14,6 @@ DEPENDS_class-native = ""
 SRCREV = "f54715702c5c0581c9461f78fd84e2c8d2ec243c"
 
 SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
-           file://0001-update-ca-certificates-remove-c-rehash.patch \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://update-ca-certificates-support-Toybox.patch \
@@ -77,4 +76,6 @@ do_install_append_class-native () {
     SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
 }
 
+RDEPENDS_${PN} += "openssl"
+
 BBCLASSEXTEND += "native nativesdk"
-- 
2.8.3


