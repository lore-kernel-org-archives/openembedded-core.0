Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AC3F4643F
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46605.1773653412173104003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FLRWaky6;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so38779695e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653410; x=1774258210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Q7CBUX4jVr7V2Jz3e9tBDtAhhUKDBP0y94UQnqxh8U=;
        b=FLRWaky6CjcXRI0+o7XBDJEntWgzTonpCqbQ2QrnyrwMaE5eiToipB7YJTUUzT2Gfl
         d8Ckf8JZw31AHgwik/CNNLY7DT0RUbRI7c6gdBkeecwo744a3K5TP5c8sjv10TmfxHPD
         ssSvb0DQ4wTJ6Rqgml9KeWsIvo5dPjbOHCW6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653410; x=1774258210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Q7CBUX4jVr7V2Jz3e9tBDtAhhUKDBP0y94UQnqxh8U=;
        b=VKWOTACL3lQgRCcOT+x2cB1/bCy85ufukmyCwWYOfd95sdRdxdMuGdP0XZpJE8Ofms
         rcmwFPuAcDQER2efN7kiUaUv1+rESFCJzxEZ4VRBfBolJnTq4I0jJewkhw6ritpSv0CX
         wraVSuoo4qCT/RnSWfNuA6Gw/w1uyILnrF4tbHuBkT3XYYZN6GQm0+7MWOoFYpwU7dzK
         kHdCCKDWL5I9dZerh7a0HdkPqW0ybT/+RdGT+phyldHkp7pNtKkG4z8m8vCXS0XFCs/M
         Wr9LYqr5b/kWAbnFoT9RUZZSJnURxU2GJr8kSzVtrnDGlGoKr3Tv6NNc7rHd2RvJVYR8
         XB4g==
X-Gm-Message-State: AOJu0Yye5QpI9C4va8c08ZT6WU18DWlJxaN+070KRWOyvZpN6sxaALJl
	R5RL/6QtI+GlMLr0ZyfTy26AZ0jqxvpvswyg3Kw4+WCN6HHYO1Rpqcw8y/8RXFSiM50Kdw2s5zX
	3m8NB
X-Gm-Gg: ATEYQzx0KKOtk9f1MBVPYx230hTDoO6a0wSXZWqgrXdyNl23IUqCTaIfDkVLyM6G01T
	tE5KinTofZdMXKldAcXXRkODhtwaWO0jHYryv0w9T8H287z7rZo+9FOVBJhh+XpU+8Sx/gFmXvk
	JAK7V5H7w1OdH5JohvTXDPvOI/jFGYVShvZKt6fIAoe/b6tg17KEh5sjMh4sjckmJ7yEW779vPp
	9aBgQbFtTEppGxLfmu15Wgk8HqQSuIFuhSynOflMU4c3V53xXLNpfzFaBEWyFomizYSgQR15ORF
	tUharUnv7Z3wGaCvPOLQffvQ6Q2UjET8iaJViH6TGVK7bxSTnPUZt2uLWDAYjOkMgMalH6Z4FrF
	O1A8fYKYv+j2cQQrwqh4aGuPkw+5+ionMk0n9bew3rQZKZu+LUZm4cbvum+nU3fspU0wZzapOA4
	gz3sdidEElCHh/RjfWFRKd1miwrc7aO+kc4oHY/8sGNtKqT9h7VEv4/eQANc4YvS5u/nruIn1sc
	x96hs9T3kwUpnBeRGe51IlfpSuqNYoyAA==
X-Received: by 2002:a05:600c:1f96:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-485566cf8f0mr221818205e9.3.1773653410145;
        Mon, 16 Mar 2026 02:30:10 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/17] lsb.py: strip ' from os-release file
Date: Mon, 16 Mar 2026 10:28:32 +0100
Message-ID: <8111d2e4b7006f1cd62732e7e12f465568ed37f8.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233234

From: Martin Jansa <martin.jansa@gmail.com>

In gentoo the file looks like this:

NAME='Gentoo'
ID='gentoo'
PRETTY_NAME='Gentoo Linux'
VERSION='2.18'
VERSION_ID='2.18'
HOME_URL='https://www.gentoo.org/'
SUPPORT_URL='https://www.gentoo.org/support/'
BUG_REPORT_URL='https://bugs.gentoo.org/'
ANSI_COLOR='1;32'

' were added with:
https://github.com/gentoo/gentoo/commit/2f590e35c9d3d13d5673163527120b2de97fdc80

before that the os-release file looked like this:

NAME=Gentoo
ID=gentoo
PRETTY_NAME="Gentoo Linux"
ANSI_COLOR="1;32"
HOME_URL="https://www.gentoo.org/"
SUPPORT_URL="https://www.gentoo.org/support/"
BUG_REPORT_URL="https://bugs.gentoo.org/"
VERSION_ID="2.18"

The ' is stripped from the ID later in distro_identifier with:
    # Filter out any non-alphanumerics and convert to lowercase
    distro_id = re.sub(r'\W', '', distro_id).lower()
but not from version which results in a weird NATIVELSBSTRING like:
    NATIVELSBSTRING      = "gentoo-'2.18'"

And similarly the directory name in sstate-cache:

oe-core $ ls -d sstate-cache/gentoo-*
"sstate-cache/gentoo-'2.18'"   sstate-cache/gentoo-2.18

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/lsb.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 43e46380d7b..f2c3c0ff568 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -14,7 +14,7 @@ def get_os_release():
                     key, val = line.rstrip().split('=', 1)
                 except ValueError:
                     continue
-                data[key.strip()] = val.strip('"')
+                data[key.strip()] = val.strip('"\'')
     return data
 
 def release_dict_osr():

