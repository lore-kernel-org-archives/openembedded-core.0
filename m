Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97959E7F134
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:43:39 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.3546.1695764610176387204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ke0N6CeC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-578b407045bso7351744a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695764609; x=1696369409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEnvX4xzkZ9+C1SogB7KWXhn4Kbzl7uwgvxUjOmjZOE=;
        b=Ke0N6CeCL9ANd71IMIGzcN80b0BE1fZ/gaWBA3L9tkW3uMnYotS5SjEoQ5SdPk8Qt3
         luTdcidQlrucYSB0In6Zu1Qaq8dhFcsKHq1PeAWMywIazWe7P12sf1y7gURnYayvOfm+
         Xrd2Ub1q5AMXgE1GIZ4Lwca4PkIr3+ZO3vqs3GAiSCSLqUVZtfIwS+G4iLAXH0sVreop
         lFlETcmDviXY9oc8R1OjXekAhNBnoDe/eBTyiVAU+W9unfujcFVgGflG2EYXO1fo2+Uq
         NHTlMZuSgS2uweb/jjJYMhABFnzvVxgsPqsrFi47Er1jOaAbcMNywkw2nf0w/Wf2f1yR
         4XtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764609; x=1696369409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEnvX4xzkZ9+C1SogB7KWXhn4Kbzl7uwgvxUjOmjZOE=;
        b=SCOmxh7MBlUOjbZLH0UxQEkQ67HwKHdK2afaalelpaQ/B7MwdLSU6RaO7YrrN2F/ww
         0DHtd5DJ00KcpZ5QyziDOkBrRJS0heSBs8zJi6RfdgiEe8w+pi5nBbOroi+3gzcG78G/
         uw33Fp/ydNOaqN9xrniwh6b/oJzpgNaO7CTXrJDP6Uq4gHbcjiq5UQyz6P0yBv/5GRT2
         TdUd7d7BEG9SKuQLM43FMcDGETTMXRNvfOcpzLuTq21jv6P9opp1UUVzN93SAowv6iMj
         5+5wReK8VKJoQiHV+YKpDoI19fo69xnHBnKYYWARSrEbhdsU/LnVIV8eoXtM4bsU/4nX
         lwXQ==
X-Gm-Message-State: AOJu0YzYtLeg+KCA83504MDf5QIORsAXOQ5T/xHYp9W3pT6J1dFrsKn7
	aw14TJGq6iP+m11JTJAoW2qeRoYKGukUExodEaQ=
X-Google-Smtp-Source: AGHT+IFngqXBTqslX7m5NERHH1MqUOvHGtEr6Wk56AoBpodOZEAN4+t6wL/Ms17ZiNvfAUbC5u5iGQ==
X-Received: by 2002:a05:6a21:3388:b0:151:b96f:88b4 with SMTP id yy8-20020a056a21338800b00151b96f88b4mr144935pzb.23.1695764609100;
        Tue, 26 Sep 2023 14:43:29 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b5247cac3dsm11487713pli.110.2023.09.26.14.43.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:43:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/10] linux-yocto: update CVE exclusions
Date: Tue, 26 Sep 2023 11:43:11 -1000
Message-Id: <51ce40e9f994bcce5cd484dff5346b4dd2bff1fc.1695764457.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695764457.git.steve@sakoman.com>
References: <cover.1695764457.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188270

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.1.inc               | 157 ++++++++++++++----
 1 file changed, 123 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 4e809940db..1656ffc8b5 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-08-25 16:54:59.886795 for version 6.1.38"
+# Generated at 2023-09-23 10:45:45.248445 for version 6.1.46
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.38"
+    this_version = "6.1.46"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4839,6 +4839,8 @@ CVE_CHECK_IGNORE += "CVE-2020-27194"
 # fixed-version: Fixed after version 5.6rc4
 CVE_CHECK_IGNORE += "CVE-2020-2732"
 
+# CVE-2020-27418 has no known resolution
+
 # fixed-version: Fixed after version 5.10rc1
 CVE_CHECK_IGNORE += "CVE-2020-27673"
 
@@ -6464,7 +6466,8 @@ CVE_CHECK_IGNORE += "CVE-2022-40768"
 # fixed-version: Fixed after version 6.0rc4
 CVE_CHECK_IGNORE += "CVE-2022-4095"
 
-# CVE-2022-40982 has no known resolution
+# cpe-stable-backport: Backported in 6.1.44
+CVE_CHECK_IGNORE += "CVE-2022-40982"
 
 # cpe-stable-backport: Backported in 6.1.4
 CVE_CHECK_IGNORE += "CVE-2022-41218"
@@ -6546,9 +6549,9 @@ CVE_CHECK_IGNORE += "CVE-2022-4382"
 # fixed-version: Fixed after version 6.1rc1
 CVE_CHECK_IGNORE += "CVE-2022-43945"
 
-# CVE-2022-44032 has no known resolution
+# CVE-2022-44032 needs backporting (fixed from 6.4rc1)
 
-# CVE-2022-44033 has no known resolution
+# CVE-2022-44033 needs backporting (fixed from 6.4rc1)
 
 # CVE-2022-44034 has no known resolution
 
@@ -6561,13 +6564,16 @@ CVE_CHECK_IGNORE += "CVE-2022-45869"
 
 # CVE-2022-45885 has no known resolution
 
-# CVE-2022-45886 has no known resolution
+# cpe-stable-backport: Backported in 6.1.33
+CVE_CHECK_IGNORE += "CVE-2022-45886"
 
-# CVE-2022-45887 has no known resolution
+# cpe-stable-backport: Backported in 6.1.33
+CVE_CHECK_IGNORE += "CVE-2022-45887"
 
 # CVE-2022-45888 needs backporting (fixed from 6.2rc1)
 
-# CVE-2022-45919 has no known resolution
+# cpe-stable-backport: Backported in 6.1.33
+CVE_CHECK_IGNORE += "CVE-2022-45919"
 
 # fixed-version: Fixed after version 6.1
 CVE_CHECK_IGNORE += "CVE-2022-45934"
@@ -6629,7 +6635,8 @@ CVE_CHECK_IGNORE += "CVE-2022-48424"
 # cpe-stable-backport: Backported in 6.1.33
 CVE_CHECK_IGNORE += "CVE-2022-48425"
 
-# CVE-2022-48502 needs backporting (fixed from 6.1.40)
+# cpe-stable-backport: Backported in 6.1.40
+CVE_CHECK_IGNORE += "CVE-2022-48502"
 
 # fixed-version: Fixed after version 5.0rc1
 CVE_CHECK_IGNORE += "CVE-2023-0030"
@@ -6643,7 +6650,8 @@ CVE_CHECK_IGNORE += "CVE-2023-0047"
 # fixed-version: Fixed after version 6.0rc4
 CVE_CHECK_IGNORE += "CVE-2023-0122"
 
-# CVE-2023-0160 has no known resolution
+# cpe-stable-backport: Backported in 6.1.28
+CVE_CHECK_IGNORE += "CVE-2023-0160"
 
 # cpe-stable-backport: Backported in 6.1.7
 CVE_CHECK_IGNORE += "CVE-2023-0179"
@@ -6726,7 +6734,8 @@ CVE_CHECK_IGNORE += "CVE-2023-1192"
 # fixed-version: Fixed after version 6.1rc3
 CVE_CHECK_IGNORE += "CVE-2023-1195"
 
-# CVE-2023-1206 needs backporting (fixed from 6.1.43)
+# cpe-stable-backport: Backported in 6.1.43
+CVE_CHECK_IGNORE += "CVE-2023-1206"
 
 # fixed-version: Fixed after version 5.18rc1
 CVE_CHECK_IGNORE += "CVE-2023-1249"
@@ -6809,11 +6818,14 @@ CVE_CHECK_IGNORE += "CVE-2023-2008"
 # fixed-version: Fixed after version 6.0rc1
 CVE_CHECK_IGNORE += "CVE-2023-2019"
 
-# CVE-2023-20569 has no known resolution
+# cpe-stable-backport: Backported in 6.1.44
+CVE_CHECK_IGNORE += "CVE-2023-20569"
 
-# CVE-2023-20588 has no known resolution
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE += "CVE-2023-20588"
 
-# CVE-2023-20593 needs backporting (fixed from 6.1.41)
+# cpe-stable-backport: Backported in 6.1.41
+CVE_CHECK_IGNORE += "CVE-2023-20593"
 
 # fixed-version: Fixed after version 6.0rc1
 CVE_CHECK_IGNORE += "CVE-2023-20928"
@@ -6922,7 +6934,7 @@ CVE_CHECK_IGNORE += "CVE-2023-23559"
 # fixed-version: Fixed after version 5.12rc1
 CVE_CHECK_IGNORE += "CVE-2023-23586"
 
-# CVE-2023-2430 needs backporting (fixed from 6.2rc5)
+# CVE-2023-2430 needs backporting (fixed from 6.1.50)
 
 # cpe-stable-backport: Backported in 6.1.22
 CVE_CHECK_IGNORE += "CVE-2023-2483"
@@ -6933,6 +6945,8 @@ CVE_CHECK_IGNORE += "CVE-2023-25012"
 # fixed-version: Fixed after version 6.0rc1
 CVE_CHECK_IGNORE += "CVE-2023-2513"
 
+# CVE-2023-25775 needs backporting (fixed from 6.1.53)
+
 # fixed-version: only affects 6.3rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-2598"
 
@@ -6979,7 +6993,8 @@ CVE_CHECK_IGNORE += "CVE-2023-28772"
 # cpe-stable-backport: Backported in 6.1.22
 CVE_CHECK_IGNORE += "CVE-2023-28866"
 
-# CVE-2023-2898 needs backporting (fixed from 6.1.39)
+# cpe-stable-backport: Backported in 6.1.39
+CVE_CHECK_IGNORE += "CVE-2023-2898"
 
 # cpe-stable-backport: Backported in 6.1.16
 CVE_CHECK_IGNORE += "CVE-2023-2985"
@@ -7007,7 +7022,7 @@ CVE_CHECK_IGNORE += "CVE-2023-3106"
 
 # CVE-2023-31082 has no known resolution
 
-# CVE-2023-31083 has no known resolution
+# CVE-2023-31083 needs backporting (fixed from 6.6rc1)
 
 # CVE-2023-31084 needs backporting (fixed from 6.4rc3)
 
@@ -7019,7 +7034,8 @@ CVE_CHECK_IGNORE += "CVE-2023-3111"
 # cpe-stable-backport: Backported in 6.1.35
 CVE_CHECK_IGNORE += "CVE-2023-3117"
 
-# CVE-2023-31248 needs backporting (fixed from 6.1.39)
+# cpe-stable-backport: Backported in 6.1.39
+CVE_CHECK_IGNORE += "CVE-2023-31248"
 
 # cpe-stable-backport: Backported in 6.1.30
 CVE_CHECK_IGNORE += "CVE-2023-3141"
@@ -7083,7 +7099,8 @@ CVE_CHECK_IGNORE += "CVE-2023-3317"
 # cpe-stable-backport: Backported in 6.1.22
 CVE_CHECK_IGNORE += "CVE-2023-33203"
 
-# CVE-2023-33250 has no known resolution
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-33250"
 
 # cpe-stable-backport: Backported in 6.1.22
 CVE_CHECK_IGNORE += "CVE-2023-33288"
@@ -7123,12 +7140,14 @@ CVE_CHECK_IGNORE += "CVE-2023-34255"
 # cpe-stable-backport: Backported in 6.1.29
 CVE_CHECK_IGNORE += "CVE-2023-34256"
 
-# CVE-2023-34319 has no known resolution
+# cpe-stable-backport: Backported in 6.1.44
+CVE_CHECK_IGNORE += "CVE-2023-34319"
 
 # fixed-version: Fixed after version 5.18rc5
 CVE_CHECK_IGNORE += "CVE-2023-3439"
 
-# CVE-2023-35001 needs backporting (fixed from 6.1.39)
+# cpe-stable-backport: Backported in 6.1.39
+CVE_CHECK_IGNORE += "CVE-2023-35001"
 
 # cpe-stable-backport: Backported in 6.1.11
 CVE_CHECK_IGNORE += "CVE-2023-3567"
@@ -7161,19 +7180,25 @@ CVE_CHECK_IGNORE += "CVE-2023-3609"
 # cpe-stable-backport: Backported in 6.1.36
 CVE_CHECK_IGNORE += "CVE-2023-3610"
 
-# CVE-2023-3611 needs backporting (fixed from 6.1.40)
+# cpe-stable-backport: Backported in 6.1.40
+CVE_CHECK_IGNORE += "CVE-2023-3611"
 
 # CVE-2023-3640 has no known resolution
 
-# CVE-2023-37453 has no known resolution
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-37453"
 
 # CVE-2023-37454 has no known resolution
 
-# CVE-2023-3772 has no known resolution
+# CVE-2023-3772 needs backporting (fixed from 6.1.47)
 
-# CVE-2023-3773 has no known resolution
+# CVE-2023-3773 needs backporting (fixed from 6.1.47)
 
-# CVE-2023-3776 needs backporting (fixed from 6.1.40)
+# cpe-stable-backport: Backported in 6.1.40
+CVE_CHECK_IGNORE += "CVE-2023-3776"
+
+# cpe-stable-backport: Backported in 6.1.42
+CVE_CHECK_IGNORE += "CVE-2023-3777"
 
 # fixed-version: Fixed after version 6.1rc4
 CVE_CHECK_IGNORE += "CVE-2023-3812"
@@ -7202,25 +7227,89 @@ CVE_CHECK_IGNORE += "CVE-2023-38431"
 # cpe-stable-backport: Backported in 6.1.36
 CVE_CHECK_IGNORE += "CVE-2023-38432"
 
-# CVE-2023-3863 needs backporting (fixed from 6.1.39)
+# cpe-stable-backport: Backported in 6.1.39
+CVE_CHECK_IGNORE += "CVE-2023-3863"
 
-# CVE-2023-4004 needs backporting (fixed from 6.1.42)
+# cpe-stable-backport: Backported in 6.1.36
+CVE_CHECK_IGNORE += "CVE-2023-3865"
+
+# cpe-stable-backport: Backported in 6.1.36
+CVE_CHECK_IGNORE += "CVE-2023-3866"
+
+# cpe-stable-backport: Backported in 6.1.40
+CVE_CHECK_IGNORE += "CVE-2023-3867"
+
+# cpe-stable-backport: Backported in 6.1.42
+CVE_CHECK_IGNORE += "CVE-2023-4004"
 
 # CVE-2023-4010 has no known resolution
 
-# CVE-2023-4128 needs backporting (fixed from 6.5rc5)
+# cpe-stable-backport: Backported in 6.1.43
+CVE_CHECK_IGNORE += "CVE-2023-4015"
+
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE += "CVE-2023-40283"
 
-# CVE-2023-4132 needs backporting (fixed from 6.1.39)
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE += "CVE-2023-4128"
+
+# cpe-stable-backport: Backported in 6.1.39
+CVE_CHECK_IGNORE += "CVE-2023-4132"
 
 # CVE-2023-4133 needs backporting (fixed from 6.3)
 
 # CVE-2023-4134 needs backporting (fixed from 6.5rc1)
 
-# CVE-2023-4147 needs backporting (fixed from 6.1.43)
+# cpe-stable-backport: Backported in 6.1.43
+CVE_CHECK_IGNORE += "CVE-2023-4147"
+
+# cpe-stable-backport: Backported in 6.1.46
+CVE_CHECK_IGNORE += "CVE-2023-4155"
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-4194"
+
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE += "CVE-2023-4206"
+
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE += "CVE-2023-4207"
+
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE += "CVE-2023-4208"
+
+# CVE-2023-4244 needs backporting (fixed from 6.5rc7)
+
+# cpe-stable-backport: Backported in 6.1.45
+CVE_CHECK_IGNORE += "CVE-2023-4273"
+
+# fixed-version: Fixed after version 5.19rc1
+CVE_CHECK_IGNORE += "CVE-2023-4385"
+
+# fixed-version: Fixed after version 5.18
+CVE_CHECK_IGNORE += "CVE-2023-4387"
+
+# fixed-version: Fixed after version 5.18rc3
+CVE_CHECK_IGNORE += "CVE-2023-4389"
+
+# fixed-version: Fixed after version 6.0rc3
+CVE_CHECK_IGNORE += "CVE-2023-4394"
+
+# fixed-version: Fixed after version 5.18
+CVE_CHECK_IGNORE += "CVE-2023-4459"
+
+# CVE-2023-4563 needs backporting (fixed from 6.5rc6)
+
+# CVE-2023-4569 needs backporting (fixed from 6.1.47)
+
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-4611"
+
+# CVE-2023-4622 needs backporting (fixed from 6.5rc1)
 
-# CVE-2023-4155 has no known resolution
+# CVE-2023-4623 needs backporting (fixed from 6.1.53)
 
-# CVE-2023-4194 needs backporting (fixed from 6.5rc5)
+# CVE-2023-4881 needs backporting (fixed from 6.6rc1)
 
-# CVE-2023-4273 needs backporting (fixed from 6.5rc5)
+# CVE-2023-4921 needs backporting (fixed from 6.6rc1)
 
-- 
2.34.1


