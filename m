Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548BDE743C8
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 21:57:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.5055.1695938234291679267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 14:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=TEBUOiUn;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3247cefa13aso2971994f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 14:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1695938232; x=1696543032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyMdHS392jCmg5q9Jfd8STmszKGFk8/vJHmyM0JPIJA=;
        b=TEBUOiUnXfsN6iGOR988AVbgbB32pfZrWw2ou33rYisH6000odjNp/aqO9reMKAqxG
         DQWLKB6mYmhKHDbt/uuOILQfSUG38jHD9ULYgZxcHMIhBECY554w3AoZOZy3ga84dZxT
         w1uJv8ZxBGV5OR1bljOpMy7LYuzBeZS7i2t2lM+2hKS24WSALlbx0YXlzPLrMkEkhQSY
         DDPf6e2c26L8k/qe/ZXdUNC9lh2DoOEOJUxS5Z1N1iVc1vsjHyTS4okfsN6gsQFnsv33
         M87pZ711XzWfvshsudXk0+kuvR/Awy4l4Qgs9aQGLL99hZLl4MuKiZKbqo6JgIBYtrWZ
         FKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695938232; x=1696543032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyMdHS392jCmg5q9Jfd8STmszKGFk8/vJHmyM0JPIJA=;
        b=HibaPaQItwjrDLqVLQQTclZY8AzJkWt66a+XMmdS0LjS+2IACgDd1kN11YIVEbOc80
         V2r0wYqznuc720M9Iekt6yyT0+9YtowHTRypr/fNBgat5wB2+LRLQCOnT45B6mjn0kIc
         rY1kxVGHpaCkbpeSsNznWH+mqF1lLb8Skgj+qEDb3jsVSpVW3t3KjcBWB8S8wYSrQH48
         WHz0x5mCG8zyzI+Zk1ex0JJgkFBXNW8Oe8EECTSRfSuWXtr6EEwI6+eU0pf3yXrscko/
         OxA4KUoBFcQ3L0K/KMNmdkwuZ9J9InKnW6dLJAM1ME5/hLMzw06sBoJafUzHmBV8NA5r
         K8ZQ==
X-Gm-Message-State: AOJu0YzFrquJu5qJ91klAFWbcboajIUDZvNFpNlA4B2MGFV7yeThMQgr
	JpDx6W6hbQaLZFdXRtVU/CCB6LoWZ0dzVB3TLzc=
X-Google-Smtp-Source: AGHT+IFLP26Vjhz2ywQtTcsyO+5BpwLbVLNdLXczT0/gA5ZJ0p2xEQ5dgFJ6j0Usp6+3jkPChU6xtA==
X-Received: by 2002:adf:fd03:0:b0:31f:b120:143 with SMTP id e3-20020adffd03000000b0031fb1200143mr2457371wrr.59.1695938232148;
        Thu, 28 Sep 2023 14:57:12 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id c25-20020adfa319000000b00324853fc8adsm2257044wrb.104.2023.09.28.14.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 14:57:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Fawzi Khaber <fawzi.khaber@smile.fr>
Subject: [PATCH 1/2] insane: Add QA check for RRECOMMENDS on non-existent packages
Date: Thu, 28 Sep 2023 23:56:39 +0200
Message-Id: <20230928215640.2683961-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230928215640.2683961-1-yoann.congal@smile.fr>
References: <20230928215640.2683961-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 21:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188382

Add a package QA check for when a package RRECOMMENDS another that won't
be built because it is empty and ALLOW_EMPTY is not set. This happens
usually when ${PN}-dev RRECOMMENDS ${PN} but ${PN} is empty. This is not
an error but might be something to look into.

Example of a generated warning:
WARNING: python3-3.11.2-r0 do_package_qa:
QA Issue: python3-dev -> python3 but won't be build [rrecommends-non-existent]

Note: This QA check is voluntarily not enabled by default.

This will make bugs [YOCTO #8222] and [YOCTO #6839] appear in the QA logs.

Co-authored-by: Fawzi Khaber <fawzi.khaber@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 5743d91240..14334f02a9 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1088,6 +1088,17 @@ def package_qa_check_empty_dirs(pkg, d, messages):
             msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
             oe.qa.add_message(messages, "empty-dirs", msg)
 
+QAPKGTEST[rrecommends-non-existent] = "package_qa_check_rrecommends_non_existent"
+def package_qa_check_rrecommends_non_existent(pkg, d, messages):
+    pkg_data = oe.packagedata.read_subpkgdata_dict(pkg, d)
+    rrecommends = bb.utils.explode_dep_versions2(pkg_data.get("RRECOMMENDS", ""))
+    for rrecommend in rrecommends:
+        rrec_data = oe.packagedata.read_subpkgdata_dict(rrecommend, d)
+        if (rrecommend in (d.getVar("PACKAGES") or "").split()
+                and rrec_data["FILES_INFO"] == "{}"
+                and not bb.utils.to_boolean(rrec_data.get("ALLOW_EMPTY", "0"), False)):
+            oe.qa.add_message(messages, "rrecommends-non-existent", "{0} rrecommends {1} but {1} won't be built".format(pkg, rrecommend))
+
 def package_qa_check_encoding(keys, encode, d):
     def check_encoding(key, enc):
         sane = True
-- 
2.30.2


