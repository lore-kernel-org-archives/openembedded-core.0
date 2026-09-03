Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A701C624D7
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 06:44:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1898.1788417850978547001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 23:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LcVYwqRc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so19639875e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 23:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788417849; x=1789022649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aJnzMLLltwAGHmiVIhB7bj2eUsbfr2NrTW5vztnZ3Ts=;
        b=LcVYwqRcOvDJ6vHCWe5V/t94hrcJ0HwqSm4uX2ML8dKgOuTdcihl/YvaDY8Vj3g9Xd
         mPd2mbEmbDW528xpA+02gLYft4LWS3lxGOSnqF1+T4up1vSPgsH44hQs/6BrP+9BOz9Y
         qRAf4Hmd/duxu+HEHXdU7SRBID0G648GM3F7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417849; x=1789022649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aJnzMLLltwAGHmiVIhB7bj2eUsbfr2NrTW5vztnZ3Ts=;
        b=o5PQntVBWVZr6gnXSU+Z3QyUuiMgR0oeN+UW0gAvxCFYXsri/DHPeDSz203WX3WnvO
         UOvfYzS2o560133MIkOHNBNzSElvhzHezQp7eEu2n5BOM3BtUgtGHof/CbJHnoueM+tr
         z2so2POjklcrRVVxCvUqN0m/wwmeRgRnGAdFE6JCi/WCLV4H5squxMUgUZNT+mhdE3OZ
         3Ylx9uEojD5Qn/o7GVbx5OyJ1sIhqmrLFcE66TvVp3ANbePbW3IhqvbWmDVdir7BdzwM
         q6/c+y+go7o2c60qER3W5Lmj/gPFhOEy/i+liIry+pRbKOdGebAK/MMRXc8C4Ixyiwyc
         yc7Q==
X-Gm-Message-State: AFuF++kgQX4IgZyilk1oBR+kg1KJwPrl/ryBOUPLdpV5chmlqf8BSPMq
	64mTtgj3xQHArZdWhW/oJ7rkQk0Wlw1AMJoC7TOUklZdfWVCGrxJWOgKF7V17QlZxAAgCqgv8AE
	2m3Hj7O8=
X-Gm-Gg: AYBFou1QJH+jBYXkkPDlraUhnFAFbOF5zEtH7MptC1LPYIwyepcZ5gaaDzgD/8Zrhil
	78USv2NxeQf+f+QW03rIjsgG6ciblY4FPV+r7rmxMFQYIUlwOiXpBRSijhB+9cn1E43C2ul3fow
	qjNrNR2SS9Wfpkq5km7qu4+dSMS52NeV1uViknVZLtcFizAG1wZVN710GRaq4yyXq5JNdQ8AfYK
	X+FIetMBSkI1x4go/Jcd/LfllliaAojTPGQcLjfYmIRhN25ys3EQZBi+TPz3vrNRGyb6QzN9WVR
	PCQrpA4xz/43+SBlXMvryKtDQpU6hm0asSazvBiyK0rl7jzU4x/2lY+TmB+M6YHppts+UswxzwJ
	L8XJf6JdcVi4ysF4weg2WRzYjCQcmUyEMsq4dObh+RBU5TTflBwU2WjdW8DqFTaLWVdYomq/EgQ
	JaCGM7zR14PxLisQ74rXv85rVh2Jkf0Y3OJtX7OPiTfvPTEhuHUOVBqizThWbN0YVI9wehnYX5H
	RUDp+lWY3uYZvejsw==
X-Received: by 2002:a05:600c:3486:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49ce5591a08mr192786665e9.0.1788417849204;
        Wed, 02 Sep 2026 23:44:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a76d:4840:1f4f:ed41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dead1sm44278175e9.11.2026.09.02.23.44.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 23:44:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3-lxml: upgrade 6.1.2 -> 6.1.3
Date: Thu,  3 Sep 2026 07:44:03 +0100
Message-ID: <20260903064403.3848874-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903064403.3848874-1-richard.purdie@linuxfoundation.org>
References: <20260903064403.3848874-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 06:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245008

Bug fix:
    LP#2165901: External parameter entity parsing was allowed by default (with resolve_entities="internal").

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-lxml_6.1.2.bb => python3-lxml_6.1.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.1.2.bb => python3-lxml_6.1.3.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.1.2.bb b/meta/recipes-devtools/python/python3-lxml_6.1.3.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.1.2.bb
rename to meta/recipes-devtools/python/python3-lxml_6.1.3.bb
index a0162cab3ff..792d5df7889 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.1.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.1.3.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=d1118b9913749904166e8726c5331c11 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "1055241852f2b02068af4a625a5d32c087db193c12251928af2562ecd2239f18"
+SRC_URI[sha256sum] = "45222d94ddd511536f3b2f7d9deae3b2339b4ce0f075f1ca25703b07cad9dd21"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3

