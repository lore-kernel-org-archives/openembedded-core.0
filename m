Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7159BC433FE
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 19:10:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.2151.1633893014443436361
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NXf5FEPf;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id k7so48436836wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RA3JScMdfW6jRrFSzZ6xd3Z4JxkDtO9qMr+jFAHJ7vM=;
        b=NXf5FEPfV3z43wC2gXOTMoD8KgQpG8oIBnB2OdeQzX/H8NQdCppU4S677HbGsKPpOM
         9t+21UPCgu89/zFAOhzMdDN9YyquqQswkalEyoezstDIWu/eDNLXGblkT7xkR4OkidCZ
         R5rJJ90BjI8CRsSw2ZzMZpweHX0xA9iVluitVh+vnjV1IUXfT48eqM+HGOlArO2A6c4y
         McyCV4SeT+qUDOdzrLLB4k4zq2dgSRIxBwlyvnb6PQV1mMrPVFxDfDcfMxIACX+elSmQ
         xi2G78rkQlHSL7WVeMnJMc0gKchARe2bEdeAaMdNwaJ0ici3fxheSOVI3cSpN1iK1MI6
         cS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RA3JScMdfW6jRrFSzZ6xd3Z4JxkDtO9qMr+jFAHJ7vM=;
        b=GBybZzqS2crZ7U7g0WsG5nwr+2hDVKY+AItmI8qEwdBKn6DGHV4rlAKf+obSD18UEU
         /MIjyIyyOmRMi8ttSZHm/oEb/711zrzixsrRTP7bfWZr2+L5G4qHQiyzgy5vUxIhhFAt
         vTzn4BNcFPCOJLq2U7mdTy9cD7SqW9N0MwnI3yE/bvJBrGg2djmOHhSUhe9exNx/Tzvr
         ql6S5Y48SHaFW9/ZUvXN5F9IL4zjobYTUib3az31QHC5+0X1QJJYOAG81awyL/foQ0+l
         e8MLvsYE9y9TwxM5KNzN9Uod53yVGdquJe/Isu/rXaPiUoBGcBMq6eUBtS83sqNSdhNP
         ixYQ==
X-Gm-Message-State: AOAM530nHRav8q4IO7l1AIltuklQV9BezG9W/w2I3/EQ6XAFju8JI9Zd
	lvJhpCL/zMJqivKuJJArcv3T2vxDrdg=
X-Google-Smtp-Source: 
 ABdhPJyFyqNlqCBkjUNth3OQlGHnmrPAV6sKpEDJp860SjyXkPv4UDDwjxx+ybCM9e7hZ/xjc58z4A==
X-Received: by 2002:adf:bc48:: with SMTP id a8mr18990330wrh.19.1633893013114;
        Sun, 10 Oct 2021 12:10:13 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id z6sm7962025wmp.1.2021.10.10.12.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 12:10:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/13] librsvg: do not enable nativesdk
Date: Sun, 10 Oct 2021 21:09:59 +0200
Message-Id: <20211010191008.4122049-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010191008.4122049-1-alex@linutronix.de>
References: <20211010191008.4122049-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 19:10:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156797

From: Alexander Kanavin <alex.kanavin@gmail.com>

rust is not currently available for nativesdk builds:

WARNING: Nothing PROVIDES 'nativesdk-libstd-rs' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'virtual/nativesdk-x86_64-pokysdk-linux-rust' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb DEPENDS on or otherwise requires it). Close matches:

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.52.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
index 4e3febc6a2f..acd03101396 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 
 SECTION = "x11/utils"
 DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
 
 inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection rust
 
-- 
2.20.1


