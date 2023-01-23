Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D74BC25B4E
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:26 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.33741.1674440544348107924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fHPyAmho;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 7so7963687pga.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OtUkFxVDIh3IKm4XFBHn1afnu3WoRyMlMFvxmlP72s=;
        b=fHPyAmhofaJaby+5HVDXgCjrlhOpZFFr0aEgeZqc32cGFR05lQauMi80sGC8S1xpYX
         /5HSk8pA8/1PdjD/6E+xG+1bi0CP/MHPv9CQnb/dBjsnUK518ycSlWQBCMRLq8OZjYTY
         8XRqy9lXmhtPJiUbTgVscsptEVJNc5kSXf3REiKvlAmqSOJQVtTyulF4dTRfOB1DQVzc
         Dk8GZOLllxU07kSkjOqrh9w3lQbQqlHz6OIjTahvy8+8EKtuol19s+OsOLqDRUXjAEn+
         /40iVT/b87ZihYmiaI3WYRlTo4pVQekQ/8VXlzOdTwnXTMqt68lrzhPpYESn57E5ecQi
         Uu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OtUkFxVDIh3IKm4XFBHn1afnu3WoRyMlMFvxmlP72s=;
        b=zZSxx+KK64KZ9tA1bB0UNe4Bo8VFBwP3qsh9PYIbvJhHLNX3kq3H6cGBdHf+YtveeK
         5uNMb2nW8TQmZT/81w3d8OEa8fdPRx3DwZkiXXLAVT6adMfsslBg3s7ssx8wP5udTt63
         gcjYFewhjtxAEr/nadGHaBUqDKNi7RiTmLTUmqoMFA+4o3TzjatVZeKQ4V2k8fAmZH9h
         55XDLiyKIZShRuoJKF9kR/CUYLfOY/UCZ4uDU0iR/+sE9cXSKLdLEEjsw0+qOtYRpg05
         O7pdKBo5bPgBMG0FIENlHUHx2xRZ9rHIK6Ede+m2qWoQhMZSHaNBDMlyo4yc6Cwpti18
         mSQw==
X-Gm-Message-State: AFqh2koToDh3+ww2iqHArERfvzqKhty2hQ1tklBDTfXU9NaXDaSurIy3
	gxXaRRK+DhyZtIH4XL0IFt3pwtO4eT34KixSj+4=
X-Google-Smtp-Source: AMrXdXsqrQAyn2EnnotR/z/Eq2gYkfsoId7UrW4sYyWN5GDgjr4a6n9N7X/B4cKKrieU6S4wHtLzZg==
X-Received: by 2002:aa7:9467:0:b0:58b:aaaa:82a9 with SMTP id t7-20020aa79467000000b0058baaaa82a9mr23669168pfq.25.1674440543387;
        Sun, 22 Jan 2023 18:22:23 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/32] classes: image: Set empty weak default IMAGE_LINGUAS
Date: Sun, 22 Jan 2023 16:21:14 -1000
Message-Id: <bc620b0e241f9e1592cdb89e87d49a247bc69767.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176284

From: Alex Kiernan <alex.kiernan@gmail.com>

This is already set in default-distrovars.inc and so this assignment
will almost never succeed. Rather than leaving it to confuse, set an
empty weak default.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb402948158659da7de0fbbb1bb403c8dad06e2b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2139a7e576..c424c4c41d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -177,8 +177,7 @@ python () {
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 
-# some default locales
-IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
+IMAGE_LINGUAS ??= ""
 
 LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS').split()))}"
 
-- 
2.25.1


