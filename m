Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A1AC54E56
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.1994.1709071034769359741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fs5ryi2J;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e554f64971so199937b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071034; x=1709675834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wck+Dfnd/ZAjdp9xOoUEc5BQEa0C2oDhVMDLmwR36Bo=;
        b=fs5ryi2JhRH92iACtHyt3n8XbroqvSGCeRUmNMud1AFaUTenw0hnYL4buEROksNSmG
         kXz03AGDeXpDOzc6C80avzUvorKQCQyQZuhmh1elasVoUMBPmzUG1kWE7p8bBSVLG6n8
         ap3eb7H+Z2MVthVV6G+JV+vNHeb6yYqQPrZlp0HY2kz+St9o1tSimO7kkrmGXFyJFQ4Q
         EoIG4t18kiE00z92nJgKf2oYtlwGYQSAZCuyvbzKjIbPk7/v8ogyrsjhQjAE8dkO6Guu
         tXq4DNXHepesnQtPWjxeHQ9uRXdx6D8Xj1sh4OFTPyIXw5vBFnYXR3vUdqi/z7TLS2FB
         8gRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071034; x=1709675834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wck+Dfnd/ZAjdp9xOoUEc5BQEa0C2oDhVMDLmwR36Bo=;
        b=isqye+Iuk3K3W4kUCGZ1ZuidnQkbRC8d0XamTZXclAANgb0rdGwZZNEoibB91+Gz3N
         Wr8DknMcQTQdkLYU2bBTQH/3MP7YXVbuxS+pR1np9D+WlOOqDWn6qWx1vQUqOg4ehANi
         +zCXagvvcis497gLKJDcBwAfBAN1cRXxpPnZ25aFIGs9p49ALkBkfHD4l9vDu4YRHgV4
         1XD1pmryJhxTo61qQ2BwJmP8bkwwzyTil68upb7iD+hf79aI3CGGCldhlgndIew+H9Mp
         Qy+fqe0cFNaiYAWXiy9TLIoGSF0B3Nlvel61IdxeOlk49jzKmp9kGneufPuj8XsY3ZAD
         lR/g==
X-Gm-Message-State: AOJu0Yz2nZKHavVGAw3wM2607aW8tDiwpUvrB6CNk725Cf55Av53/Z1b
	2J+rpObzbM82HxkcvWWnrBY4JV6ukS4e72KL2Rkva4EZiJA/ABXZ3YmdCEbpFQp7uyqV641hlvk
	I3NU=
X-Google-Smtp-Source: AGHT+IHbp3bf8EK2xRCjH79hRSswN22zNmvcF3/wlDWRGwTEtTKB8EvTJuv1oDak34+X1lNdBtCVzg==
X-Received: by 2002:a05:6a00:9283:b0:6e5:32e9:2954 with SMTP id jw3-20020a056a00928300b006e532e92954mr805830pfb.16.1709071034048;
        Tue, 27 Feb 2024 13:57:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/16] populate_sdk_ext: use ConfigParser instead of SafeConfigParser
Date: Tue, 27 Feb 2024 11:56:50 -1000
Message-Id: <50815c328e677ac079d38dc8555a909f049cf5be.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196302

From: Ross Burton <ross.burton@arm.com>

SafeConfigParser was renamed to ConfigParser in 3.2, and the
SafeConfigParser alias will be removed in 3.12.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Cherry-picked from master: 71b3e7f71727137b4b996cc4160c9cc1581824b8

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index ca1b7753cb..bdd86863c6 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -227,7 +227,7 @@ python copy_buildsystem () {
 
     # Write out config file for devtool
     import configparser
-    config = configparser.SafeConfigParser()
+    config = configparser.ConfigParser()
     config.add_section('General')
     config.set('General', 'bitbake_subdir', conf_bbpath)
     config.set('General', 'init_path', conf_initpath)
-- 
2.34.1


