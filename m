Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A301C433F5
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:17 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.34436.1638006856011106183
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EJF8FDPy;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so3542521wmi.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=skczMgF0xfBIrNm6RWwnr31aAwQf0Ax294O7gxPKWw0=;
        b=EJF8FDPyXMluo7SlrHiBKXmk3jYQpg0VDqYRYLs3B1iVqpaJmy506WJAEBJ9tPPJb3
         PAmsF7IwZFYRagUZ9iPSAO9k0WMF8aOklqWDk0ZA/3yl7mFvugZCTZ9V1shYUA0Sh+Q6
         0/gsS4mDZxQERxHOvBkohjo8KlaJpqVXLUyTf6D0VvbJOn6Qn2JqFKA/2og0Q2r7IWzM
         qUfcK/qy82pDpc1Us7NCBQI6u6+8woIMUKQOzAaLbu9aRUHlFQSgTMQ0t75sfkSEAXfI
         d6U/mxkM6BI4mjMyOJDwSJNxb3Hf076aiZFdBJrt10Iuswk8+xq62AB0vA4BxE0lKkuR
         5SAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=skczMgF0xfBIrNm6RWwnr31aAwQf0Ax294O7gxPKWw0=;
        b=kmFnbJsDTHt39Gp+ofzXVURFiUe4CW7LOxey4jx4e5c5OXMBN4dQfR805htpM31uKM
         pDEDiW6lVP9XMwzqsvFE/GIYQh+5uxGowxMGthVl0FvvD5R72078Aj0QwoQb0cqkW7HE
         B2qUrfdJpcnkdTqs5JKrJsEceFX2u3gGBaGSS1+X3RjEvuCh7JKdCjEoez0DGClczVEA
         rxVi3jCxobphl8ZfvJ4BirQaYQez7o4jnk5ySGl3Rn2ycSZO4k4Ie88Ng/wRA9nia6/F
         jaMEQ1uUcC70Q76TMjju6Ge91eBShBGJmYjEOjnzWixFamYMtr385uewhOoe+q/sa+kQ
         W3Xg==
X-Gm-Message-State: AOAM532nRxUpWZ29PgWND9f0eBFSKnuEwWr2lFlyqpabkBxHFLn+6Rm4
	bQpdEAfSXOz7lhsGl0IItxo/ouBwZL7PYQ==
X-Google-Smtp-Source: 
 ABdhPJxApKMb+3hJjDDbxDyBZa/93jh8TBUNp8hSntpsXbmGRkStymqm7J7jqQNOPNKEPNk6xsLBiQ==
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr21754109wmi.134.1638006854616;
        Sat, 27 Nov 2021 01:54:14 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/13] go-helloworld: update to latest revision
Date: Sat, 27 Nov 2021 10:53:54 +0100
Message-Id: <20211127095357.1748429-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158859

Adjust SRC_URI, github is only a mirror.

Adjust GO_IMPORT, as it does not match either github
or the official repo.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 4e582edcf1..b3a8631794 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://golang.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI = "git://${GO_IMPORT};branch=master;protocol=https"
-SRCREV = "46695d81d1fae905a270fb7db8a4d11a334562fe"
+SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https"
+SRCREV = "787a929d5a0dfb8bbfcdd2c4a62e0fd89466113f"
 UPSTREAM_CHECK_COMMITS = "1"
 
-GO_IMPORT = "github.com/golang/example"
+GO_IMPORT = "golang.org/x/example"
 GO_INSTALL = "${GO_IMPORT}/hello"
 GO_WORKDIR = "${GO_INSTALL}"
 export GO111MODULE="off"
-- 
2.20.1


