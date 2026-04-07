Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EC5EDB7C2
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:56 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75566.1775546027146302108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yJHiIetG;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso35108555e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546025; x=1776150825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CT90VZFAvpsWISE0hnXnwKX8/4gqB+DBOKG5HEgjKQY=;
        b=yJHiIetGsqGyhfDN4bX7HMkjca9/vtFZRzI9LxVNVeSeBeESqiW99TTezpaiKBGPLK
         tJDGkfihvCIPVvbLmvCkbAEPmlCTMiG6yjrlyYihp8eB8uL/c1iO8O3O3LpVPXN28yfY
         qwJJVN5NJSxN3XLQz9Re8oTkd8mN6mnMiC+MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546025; x=1776150825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CT90VZFAvpsWISE0hnXnwKX8/4gqB+DBOKG5HEgjKQY=;
        b=PL5/G0Pq3feiN7hkzUJfRDNEx4VgLAIoD8pfqmaVi9FFeZr77sczcuwpqwuLfjJ7nh
         L6RJLoH/W7SOGEvlB60yECt4DrFZSyPq9KK00rlLUpstAvd8F7bsB2VegxAmqWdtyd+s
         xL9BrCMjyV6/Lkg7lOT6gj/xWNUrRnfXmBNoblwcnidzfoTBYRIGzntkMZBN1/t4u1Mr
         Y72oKp02dts1Xmyfxn0x9yW57FSvDMmQJEgy56vs8x37KyMY0MKSzFWfTLZYOCZncyPp
         kQiDaxfd5vpG7IsexsNcJ1S6F9TasbRdcmns78UKjXVyXiL51O0zx7XTqMcN9N6xVY3I
         5LQw==
X-Gm-Message-State: AOJu0YykiCv6+0p180tqD8pCg+an2vG1qhTWQSyCGP8r67EOz1B7SQFD
	c+VJUb67NnG7Dp/q7H1Eo+ZQpOupijBsXRy4vPzQ6UiD8QByIg4fQqI385PrcVeNn8dizrqCuMI
	UZXwMgm0=
X-Gm-Gg: AeBDiestv/Rbux1+TSLEg7U89IsNwgAnVtWmV6p2cr0g0h4oBQdwCv5yI7PlsEe9r9s
	qMeKMxdtLyXNg+/Org53o/DU9dJTWPsNWqd6UAXKix7j3I0ch6XAtIhYq6zvgEtRwLXOjpobL3U
	MNTnDJQ1k6T04f5il911AjZZ7mXDPlY/+W2N+Z/TNXEV0NqSkf7Ai5scUjZ8JzF2Aibc92XtTk/
	GNXFZVMQHguGq/tyXEcu43HThaN0r/6v2y0Etl/Za5qKYxDlVO2Zi025j+8S9wlJhcfR6bcgboo
	zz6qydjYocx51QlNEoFvoXIF01/gNfVK1DHncFYKVgRNv1XJtTsN9MkjQRj7kCHvEma4tGmoo/h
	CXpC/hX4Cof2re3uL7qJCAxl402JfY69yEkPSGT7lmD7EFPtyk/qAysr0cDlw3v5cFakuTld4YY
	Pl2JqnfaHJF6DHoVy34cb09XFbopg7q+mVTUx36DdpwM/Gt1P38K91NjKA74AeAaWNlfxncmYGJ
	kXo/GID+vm/o25BUMroM5KHsh8=
X-Received: by 2002:a05:600c:444c:b0:488:a977:8de with SMTP id 5b1f17b1804b1-488a9770d4amr124408645e9.16.1775546025330;
        Tue, 07 Apr 2026 00:13:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 05/18] libtheora: mark CVE-2024-56431 as not vulnerable yet
Date: Tue,  7 Apr 2026 09:13:13 +0200
Message-ID: <b9d75be7bc2eaa88a280d52ee0fff322e56d52e2.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234709

From: Peter Marko <peter.marko@siemens.com>

CVE patch [1] aplies only on main branch which is base for 1.2.x.
Branch 1.1 has a different initial commit and does not contain
vulnerable code where the CVE patch applies.

Also Debian [2] marked 1.1 as not vulnerable.

[1] https://gitlab.xiph.org/xiph/theora/-/commit/5665f86b8fd8345bb09469990e79221562ac204b
[2] https://security-tracker.debian.org/tracker/CVE-2024-56431

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Paul Barker <paul@pbarker.dev>

Picked from scarthgap commit 07f35d022b88ab4d297d0252f9909e252b7e4cfe
Reworked from CVE_STATUS to CVE_CHECK_IGNORE

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index ad0be85559b..4066bb1513b 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -22,3 +22,6 @@ CVE_PRODUCT = "theora"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples"
+
+# fixed-version:branch 1.1 is not affected, vulnerable code is not present yet
+CVE_CHECK_IGNORE += "CVE-2024-56431"

