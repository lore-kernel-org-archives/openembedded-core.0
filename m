Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B9FC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 21:34:39 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.5746.1744752878014105050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 14:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ciSwmfh5;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-43ede096d73so42816345e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 14:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744752876; x=1745357676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn6naFd8nDX9GzcHWnsPlPx5E0EmaH6FpE3EqWj7r7I=;
        b=ciSwmfh5hxgxwlPd5jt2LvIr/HOftuWLbeRrgobVZUEscOkpDFjfBmGSrFWoMX/HDU
         GWQu/4r7H/42pZWUltUbiptIKWMZP4RVjx03eGy7AHBSZz8giEf1XjdiqW8Jjd+H8PN4
         5jWwMlnuf3Hthh7x5guu0er6L/aX3MhD/2+0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744752876; x=1745357676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yn6naFd8nDX9GzcHWnsPlPx5E0EmaH6FpE3EqWj7r7I=;
        b=Gj8bKs5I0endErZzGBwhAxV6Jrgn4nWaLrKz6X8cjNT/Togq5Kbb7L7Xv/aVPye3xV
         fkhcYavOpqUtHq86H1e1zeA9QqQBi7CnESaffZ8h/xFuWLWi4WQUqRQz0NYKf4CsYq4z
         ot39Jqqzywk6FpaXgaascD4nLl7LIctJe4lF0AmssuNblwvD2ICKhce981zB5aUHEwFa
         bygaFB+3DImbjl8AFSOT+q0flV7lARoOrOEF/U4rjTOyPsng9uwZi2hpEJRC7cWCF66c
         OLaaGTuKbk2o71Praq/3sfUJJ562FFKHsJR3apn/61WR5JPueqgwIRhBBNi+jQUHDH2r
         jUvg==
X-Gm-Message-State: AOJu0YySACJ0zDTVYk+Hy2/LBMBQX6YvrlzkJVn6PZtFeO6wH7Z3T4HL
	vTcstFiZgOdmPi9iZyjSHokyqLcKYxVRPtpx1cn7Vb351z0MOmsTJHSyZtl604BHXtT1fFE6b6a
	8JCo/Nw==
X-Gm-Gg: ASbGncuupOtx1V9e+iFeSMQUW8WVbIvheIcI+8MTbvB1FGo0dIjNoKVozgXJW8PITds
	UQvk5U2FN+oAk4D8KBGIH7cW3e5TxArTdzIp/rBBkfzTVhN+sv2UzNB4m2ZZFkNYECQ0gOvITg4
	e0tq/VelTUp7+EW5qrkehGcJZrXkGxhc1kWzobXQE7IzaKm6PwLh8O7HRGumG9bZV5ocvf9SIOB
	mXZ//EJFG1SheAqsYamtOLQIPqLaRXTE7i9ibYij7mJXb9EOFYvCwuzlcl0uq9Xj14oB+XRK6W+
	38sdm1gpgHLSboG4NAzftqkhhOpX7JmiUNCIPAz+MsFeyncX7jjKRFp2BDRzI/rZEZyIquEq2/P
	EAFc8JTxdwJcJY5D0gN1yf0MzRuxYOKq9dGkQeffyJud4Kg0=
X-Google-Smtp-Source: AGHT+IHRkJilp0LtN0RcHbLB6Y6RTo762W4cYReyIRQS+CXKcClerTXFGCS686URLNKqOYwoibMW2g==
X-Received: by 2002:a5d:5f93:0:b0:39c:1efb:ec9a with SMTP id ffacd0b85a97d-39ee2729ee8mr861790f8f.6.1744752876122;
        Tue, 15 Apr 2025 14:34:36 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef0002cff7470e58ff5dc.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:2cff:7470:e58f:f5dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445708sm15566944f8f.96.2025.04.15.14.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 14:34:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] rpm-sequoia-crypto-policy: Fix build failure on Debian 12+Strongswan
Date: Tue, 15 Apr 2025 23:34:27 +0200
Message-Id: <20250415213427.2213414-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 21:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214972

From: Yoann Congal <yoann.congal@smile.fr>

rpm-sequoia-crypto-policy tries to validate the configuration files
using host tools. For the Strongswan policy, it uses
"ipsec readwriteconf" which is not available on Debian 12 with
Strongswan installed.
To fix this, add and use an option to skip the problematic validation.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...w-skipping-test_config-for-old-ipsec.patch | 29 +++++++++++++++++++
 .../rpm-sequoia-crypto-policy_git.bb          |  8 +++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch
new file mode 100644
index 0000000000..afb302e75e
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch
@@ -0,0 +1,29 @@
+From f7a8e2c049c2c3e2bfcb801d7b65214c0a5bad77 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Tue, 15 Apr 2025 17:27:20 +0200
+Subject: [PATCH] libreswan: Allow skipping test_config for old ipsec
+
+In some case, /usr/sbin/ipsec does not handle the readwriteconf command.
+e.g. on Debian 12 with strongswan installed.
+As with the other OLD_* variables, add an OLD_LIBRESWAN environment
+variable to skip configuration testing on those systems.
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Upstream-Status: Submitted [https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/merge_requests/237]
+---
+ python/policygenerators/libreswan.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/python/policygenerators/libreswan.py b/python/policygenerators/libreswan.py
+index a2b02f5..d81ec0c 100644
+--- a/python/policygenerators/libreswan.py
++++ b/python/policygenerators/libreswan.py
+@@ -227,6 +227,8 @@ class LibreswanGenerator(ConfigGenerator):
+ 
+     @classmethod
+     def test_config(cls, config):
++        if os.getenv('OLD_LIBRESWAN') == '1':
++            return True
+         if not os.access('/usr/sbin/ipsec', os.X_OK):
+             return True
+ 
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 522e9a393d..4ccfc95c33 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 # Python 3.11+ is needed to build fedora-crypto-policies
 inherit allarch python3native
 
-SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
+SRC_URI = " \
+    git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master \
+    file://0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch \
+"
 
 SRCREV = "032b418a6db842f0eab330eb5909e4604e888728"
 UPSTREAM_CHECK_COMMITS = "1"
@@ -20,10 +23,11 @@ do_compile () {
 	# It speeds up the build and we only need DEFAULT/rpm-sequoia.
 	rm -f $(ls -1 policies/*.pol | grep -v DEFAULT.pol) || echo nothing to delete
 
-	# Don't validate openssh and gnutls policy variants.
+	# Don't validate openssh, gnutls and libreswan policy variants.
 	# Validation may fail and these variants are not needed.
 	export OLD_OPENSSH=1
 	export OLD_GNUTLS=1
+	export OLD_LIBRESWAN=1
 
 	make ASCIIDOC=echo XSLTPROC=echo
 }

