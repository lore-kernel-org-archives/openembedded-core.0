Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F6BC7EE21
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 16:26:22 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.72232.1682871979968398454
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Apr 2023 09:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xifCtdvz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b733fd00bso1270964b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 09:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682871979; x=1685463979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLAED5D4fua5UKTfnfGy8W2MkiveLTmRXfRxYMgz4vo=;
        b=xifCtdvzil7xeEHNC8FFd0SN+iX/S6hi62/Oo4Q1za5IBFAER+EaqZsqOWK3YNqkDM
         XEFvsOvUqEhkvYzWJDzkWrf6KiCMbqsZBnNWV9ew2u4/6bTizPo+9XEvXjTMH73m9Utj
         PSVOl3cAscKsB7r9JL11eS9wdhv/uBm5G1/kSnZCQLTFvDymuVC/b3aZCKqC82GYkszP
         w8sigW8WceDpaghTQ0qQhsPUsGIeuFG01JPFJrFtwDwALnhhfBlZ3s9gK0qVHXzFNjmP
         am3uol50bOF2l73PfISwO2HbXo8g2hIQ9xqBpSDi4XTjFw2DVMm1xe49ZoO5ayJPPqwf
         KLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682871979; x=1685463979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLAED5D4fua5UKTfnfGy8W2MkiveLTmRXfRxYMgz4vo=;
        b=Qdr/Lfit40txis6Rj1CSES4+Vz4g+isofZVPvreWgG9yKemtFTKJCqeb4B4zCAFyS6
         HNVsI52NMIXufxJX4/E1Fe837m7ljKiVhe9krkRHRV4bL9rp3iwhJBT3Tmy6tKmYCIPr
         Ok5a1WWv3swjIoQMEWHVN7QE4ClaaIKGcecQ8htH8Ih6TDuldoatJWzYYioBV5Cl0Fzc
         0D0fPcBiUhl2LaNk79g72F+pIjm79hlgOjnEHy7/k6ktyC8z26zKBuJKs7R9PZAB0pqk
         JeaNH9Vc+0cUu4+MEiRoFAqlXs9sK7B5FRn0lty+0UhVBJaegliK+kXSgHHHXGjl6nYt
         2wtQ==
X-Gm-Message-State: AC+VfDxAQdPoDIFyfxxdLfytPVkSbQQDDu2DL1zh616p+sl+PO9ffW5q
	WyIuatbh64+kwzCn4bs61a3bwBmhSYE9QNgvP+0=
X-Google-Smtp-Source: ACHHUZ7Lo1ilJeLzB7WbvwyR7yU1kUvRTzRn2PItbwYY4UMMuUoQQNs/y6eEHudTsX/FknsbGx1Qhg==
X-Received: by 2002:a05:6a20:7da6:b0:f5:5232:4bde with SMTP id v38-20020a056a207da600b000f552324bdemr11067897pzj.23.1682871978963;
        Sun, 30 Apr 2023 09:26:18 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090abc0800b0024b9e62c1d9sm4443811pjr.41.2023.04.30.09.26.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 09:26:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/9] openssl: Fix CVE-2023-0466
Date: Sun, 30 Apr 2023 06:25:56 -1000
Message-Id: <a80d772593b3a38c062e546557d5f8d76eb71fe4.1682871868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682871868.git.steve@sakoman.com>
References: <cover.1682871868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 16:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180577

From: Omkar Patil <omkar.patil@kpit.com>

Add patch to fix CVE-2023-0466

Link: https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=0d16b7e99aafc0b4a6d729eec65a411a7e025f0a

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2023-0466.patch       | 82 +++++++++++++++++++
 .../openssl/openssl_1.1.1t.bb                 |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
new file mode 100644
index 0000000000..f042aa5da1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
@@ -0,0 +1,82 @@
+From 0d16b7e99aafc0b4a6d729eec65a411a7e025f0a Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Tue, 21 Mar 2023 16:15:47 +0100
+Subject: [PATCH] Fix documentation of X509_VERIFY_PARAM_add0_policy()
+
+The function was incorrectly documented as enabling policy checking.
+
+Fixes: CVE-2023-0466
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Paul Dale <pauli@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/20564)
+
+CVE: CVE-2023-0466
+Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=0d16b7e99aafc0b4a6d729eec65a411a7e025f0a]
+Comment: Refreshed first hunk from CHANGE and NEWS
+Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
+
+---
+ CHANGES                                  | 5 +++++
+ NEWS                                     | 1 +
+ doc/man3/X509_VERIFY_PARAM_set_flags.pod | 9 +++++++--
+ 3 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGES b/CHANGES
+index efccf7838e..b19f1429bb 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -9,6 +9,11 @@
+ 
+  Changes between 1.1.1s and 1.1.1t [7 Feb 2023]
+ 
++  *) Corrected documentation of X509_VERIFY_PARAM_add0_policy() to mention
++     that it does not enable policy checking. Thanks to
++     David Benjamin for discovering this issue. (CVE-2023-0466)
++     [Tomas Mraz]
++
+   *) Fixed X.400 address type confusion in X.509 GeneralName.
+ 
+      There is a type confusion vulnerability relating to X.400 address processing
+diff --git a/NEWS b/NEWS
+index 36a9bb6890..62615693fa 100644
+--- a/NEWS
++++ b/NEWS
+@@ -7,6 +7,7 @@
+ 
+   Major changes between OpenSSL 1.1.1s and OpenSSL 1.1.1t [7 Feb 2023]
+ 
++      o Fixed documentation of X509_VERIFY_PARAM_add0_policy() (CVE-2023-0466)
+       o Fixed X.400 address type confusion in X.509 GeneralName (CVE-2023-0286)
+       o Fixed Use-after-free following BIO_new_NDEF (CVE-2023-0215)
+       o Fixed Double free after calling PEM_read_bio_ex (CVE-2022-4450)
+diff --git a/doc/man3/X509_VERIFY_PARAM_set_flags.pod b/doc/man3/X509_VERIFY_PARAM_set_flags.pod
+index f6f304bf7b..aa292f9336 100644
+--- a/doc/man3/X509_VERIFY_PARAM_set_flags.pod
++++ b/doc/man3/X509_VERIFY_PARAM_set_flags.pod
+@@ -92,8 +92,9 @@ B<trust>.
+ X509_VERIFY_PARAM_set_time() sets the verification time in B<param> to
+ B<t>. Normally the current time is used.
+ 
+-X509_VERIFY_PARAM_add0_policy() enables policy checking (it is disabled
+-by default) and adds B<policy> to the acceptable policy set.
++X509_VERIFY_PARAM_add0_policy() adds B<policy> to the acceptable policy set.
++Contrary to preexisting documentation of this function it does not enable
++policy checking.
+ 
+ X509_VERIFY_PARAM_set1_policies() enables policy checking (it is disabled
+ by default) and sets the acceptable policy set to B<policies>. Any existing
+@@ -377,6 +378,10 @@ and has no effect.
+ 
+ The X509_VERIFY_PARAM_get_hostflags() function was added in OpenSSL 1.1.0i.
+ 
++The function X509_VERIFY_PARAM_add0_policy() was historically documented as
++enabling policy checking however the implementation has never done this.
++The documentation was changed to align with the implementation.
++
+ =head1 COPYRIGHT
+ 
+ Copyright 2009-2020 The OpenSSL Project Authors. All Rights Reserved.
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
index 254cc9bc8d..46875b525c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://reproducibility.patch \
            file://CVE-2023-0464.patch \
            file://CVE-2023-0465.patch \
+           file://CVE-2023-0466.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.34.1


