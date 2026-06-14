Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA22CD98DE
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105059.1781424263318273583
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UmT8NBcV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b64c8311so23835165e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424261; x=1782029061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWdKbddSWLuZciYu1AE33ZW0yEWykFEpJVDBmeC80FQ=;
        b=UmT8NBcVwkeQ0i8BDg7aHq/0AMd5DDMPYhDd+2M3nOHHG+DfLoVFTgVSbmYEKyDbHg
         Et/93vqzzg80HL2ymPof0+dJDrrSXzXz1GY0PgP4IMp6W6YJZ5VDzdnzJe/972xUY62C
         iFex3BCb24WQCvnfBnuItRA72IwkmfexTZZoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424261; x=1782029061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWdKbddSWLuZciYu1AE33ZW0yEWykFEpJVDBmeC80FQ=;
        b=bfSCQTZQh36SSRuIcIVZXCG1ht6n2GMtBizNPyaieo1yDDnRmGsVDPQbI7+c1rqgPZ
         xZ7HxYUMQUrEDygohEpWDjCuW1adpEr/IvnJaeOuWzYFuiC2J1AGjZoaAraOYR95bAP0
         O5wXVYmlaRt6d44ly/bowBlHLHlHaoyHC7Iq4Br+IxL8h96+wYof8JaQiGbcUglVoMEc
         TV96DF+X/6JMeWh8JRo/X2Pm8//Fc611INVreKJbhEqjpKSr+m0eutXYbga6vZGQmqHV
         TO2WO6/0xgxyDiO4BN2DhB3qDMF1Lkb1YZvNbnbmRJslBeILnxftyuhms55wUWUqqDtH
         5m4A==
X-Gm-Message-State: AOJu0Yw5uZBQgJo5UVifMBzdD+LN5EpIQBjvsB0L60K1Rl1Q8rfb8jrJ
	Cjz4a/iMavwZ7tJnMFTz0+r9+rZJuazcWsKPd2ae7t2xWCPoCEkOHfQCun/IdjonZm+DzC0iVzC
	+Z3Cs
X-Gm-Gg: Acq92OHEv6bvRL2JlkDXlaLWeGx4KuUPmLAK2DkT3FZ6xvpCgyRVgFHW+HtVnBgdFDA
	U7YJSKiTVBpAQ+rPwdZ3N+QoobGb2oD8aBh7DDkusYb6kVssm1tc7yXna0fQZJmGy0Ip3fdnTRv
	xnfiP9HLsj8n8U7dRL2TppSILrlb1dsOVL5EJvSQ7Gp3f8C2WXgju85v7mb/CZ+elaLvV4w9GwI
	K76bVeuK22YRHl8SumvHne02Oh8GanCoYAZTW2e8W91EO1Wn03apj6Womg+cm4zk6xvxMUpOYmH
	V+F8hjhg9Pf87yBbpx84dXJWeb0zGaBFBZxEvGDH3CogZZEtmeyWippWvhbKt8XNiYJuTy3IJMW
	eBWbBigjDoRky1ZOA6hSAXYN7IQdvdxvVnNR59hQTmT5ioP2lzZL2+ldcEq/73hE3YAPJ/WMyHd
	k5sGzTU/D5/9kHQqzrT6XUB2MA4qLhf0/JyfTkdqPVqbdsnO0cLHOlFB55RdoH6Cg=
X-Received: by 2002:a05:600c:a47:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-490ec4ee63cmr116153895e9.20.1781424261507;
        Sun, 14 Jun 2026 01:04:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 47/56] sqlite3: upgrade 3.53.0 -> 3.53.2
Date: Sun, 14 Jun 2026 09:02:58 +0100
Message-ID: <20260614080307.4017177-47-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238731

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch    | 6 +++---
 .../sqlite/{sqlite3_3.53.0.bb => sqlite3_3.53.2.bb}         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.53.0.bb => sqlite3_3.53.2.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index 77181fe4dff..b4231438ccf 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -1,4 +1,4 @@
-From f98a739032dd863ba8dd315729ded7ad0c86473c Mon Sep 17 00:00:00 2001
+From a324ff380e6e83141f37cbee7b89e87282deb349 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Sun, 12 Oct 2025 23:32:46 +0200
 Subject: [PATCH] Add option to disable zlib
@@ -29,7 +29,7 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
-index 85fe414382..77190a7053 100644
+index fa36dfb..a78ba8b 100644
 --- a/autosetup/sqlite-config.tcl
 +++ b/autosetup/sqlite-config.tcl
 @@ -287,6 +287,14 @@ proc sqlite-configure {buildMode configScript} {
@@ -47,7 +47,7 @@ index 85fe414382..77190a7053 100644
      # Options for ICU: International Components for Unicode
      icu {
        {*} {
-@@ -656,7 +664,7 @@ proc sqlite-check-common-system-deps {} {
+@@ -674,7 +682,7 @@ proc sqlite-check-common-system-deps {} {
      string.h strings.h \
      inttypes.h
  
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.0.bb b/meta/recipes-support/sqlite/sqlite3_3.53.2.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.53.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.53.2.bb
index 75e08e58b16..38045f16048 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.2.bb
@@ -4,6 +4,6 @@ LICENSE = "blessing"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "851e9b38192fe2ceaa65e0baa665e7fa06230c3d9bd1a6a9662d02380d73365a"
+SRC_URI[sha256sum] = "588ad51949419a56ebe81fe56193d510c559eb94c9a57748387860b5d3069316"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"

