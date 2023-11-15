Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F926C47072
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:18:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.5040.1700018281960966190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1b4wV+Ro;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5a9bc2ec556so3923780a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018281; x=1700623081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POKhWiqkmQntmZSVMEM5kZYSfSHrbNcT8JeTiFntHs8=;
        b=1b4wV+RoPu8DTPZiVgpYbTHxAxMbq/38u79HcZ6Eu7GJNRbLio3uByfNKjORVEcwkk
         D8QThIvpuVtBRTsCiTR74YYv81dTudYVdYLuiIIGUc/89Df28W8tTtbbhrz+VogNoZfH
         KM2QShAjGVEypV0qGMfNwk9P5ZFjEkr+anYQcwMG5RNihn18XNU3utfRU+1xBanG9crO
         ZS8sRFbRaP64pRw5kY5J8lb9cCxLUCJqhuKiJpy2CwsHgVoHY9hrm5VCQew210aScHOM
         ZPemQYX6I2QUuKetiieroS2DbxXhmf175ybsTJA3nojz9328OJiGLRW6Q7Uamli3l/gK
         9yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018281; x=1700623081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POKhWiqkmQntmZSVMEM5kZYSfSHrbNcT8JeTiFntHs8=;
        b=edxUnTiQLi4Sx5zA/YeibEB7AJbFCVD7OjXUG3mcox+gvyPeq7ammlgfCphRyaPS3f
         5mHv3iFF2pFfbBqUSIPm7vwKBrbhAI3yIowGL5B0iARIBzASo3Tgp39PDJaGoO22VNTj
         dw/oM4OUxjwii7cWWepv4jxxmEzIuk7rRtRKEnpAwGvksfv8BpCnAcTpovUr73t0n52T
         p5+J4ww1dEmHuC6IIK0PasprQEerWBfLUAewrZTGvCPQwljiW0iaOu7t9l7UQtulbx2d
         Cs17aw2oGkzTrSPuL4pX4ho5E/odZnXrKTsKPiOiI/xA5koxLe12Hw/F9Mtz05zqKIE0
         Nm7w==
X-Gm-Message-State: AOJu0YxZKwgRnW8vl/oztUnowZsvU7uMYESzWpmbijtrfSbe5iVxntoT
	UBQdbmbQ5pYBKY6TngOkKz9JgDtEQgoGTQtgMaPK+w==
X-Google-Smtp-Source: AGHT+IErKz5RH+kjTh4QITCHJ0A9Vd+f+wfopfctdR5D+qc8m1/bw+Li81ij4BVmsdmKIHZ0vFJ3KQ==
X-Received: by 2002:a05:6a20:4420:b0:13a:e955:d958 with SMTP id ce32-20020a056a20442000b0013ae955d958mr10093598pzb.7.1700018280659;
        Tue, 14 Nov 2023 19:18:00 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.17.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:18:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/17] cve-check: slightly more verbose warning when adding the same package twice
Date: Tue, 14 Nov 2023 17:17:28 -1000
Message-Id: <e3574760ee59c1ca7d2698f09ddd37ee568f04f3.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190541

From: Ross Burton <ross.burton@arm.com>

Occasionally the cve-check tool will warn that it is adding the same
package twice.  Knowing what this package is might be the first step
towards understanding where this message comes from.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c1179faec8583a8b7df192cf1cbf221f0e3001fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index c508865738..a91d691c30 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -75,7 +75,7 @@ def cve_check_merge_jsons(output, data):
 
     for product in output["package"]:
         if product["name"] == data["package"][0]["name"]:
-            bb.error("Error adding the same package twice")
+            bb.error("Error adding the same package %s twice" % product["name"])
             return
 
     output["package"].append(data["package"][0])
-- 
2.34.1


