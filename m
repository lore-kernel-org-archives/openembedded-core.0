Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34347C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 11:20:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.193687.1673954439490444662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 03:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bOIYXriM;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id j34-20020a05600c1c2200b003da1b054057so9827414wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 03:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=199l8jS6GSFBtC8Dq7womSeRqjDjVpO8cIRVMRxs9Kw=;
        b=bOIYXriMZgY6VD/cedduBnccbJvpoPnf/e0hpyYfH5fdB5TrE5nI3uu+6P5YhWpk99
         PnpveI9NPLWJpTN3hTLVQ4gWecJrtWZi8p7A0Q1zjLW6B9Yhu+e5DL8Z3jkUUYf0VVIN
         +WqnqtpVpkBFAuW/YDBfVAu/zwu9vOKZQMEiFoN2rmyBCw9u9uUOeuDKK7PZfCTCWLN5
         kQQfGP3Us90vCPuvL2wOr6NuL29mZH2D+I1R9HnUhFMZOCjUEr+tsRIgKKA1xoMtUORW
         KpbN3DJAFxLzwbUVcOMS8eM/UrrBCDKP8IKgu8c82M4e3pjm4hTmCuYL1POxrkmQf71I
         hkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=199l8jS6GSFBtC8Dq7womSeRqjDjVpO8cIRVMRxs9Kw=;
        b=cMi2jRhHT1dAGJDlqaFckv3GEENb5uzq78OFufkaLy61yVGMkZljbis94CvOjcPS/N
         WMsGjoV6AU5IAq8J9RCeAUTJBcJoIRWDFEUVIxTgqyO5P+nrB5Wo+8Lqq6TwKbP3AdvY
         8dFhm+mAKCvkqIrC35hRg2s3y8onOAjf+4o58HIZK7FHfw2K7o3VoZtIoK8zUWrVaqRe
         jb7SgG6EzTRApzAbzNTtzwd9J+GFcVyM2DncDTjQ4anZh1JhGEPbh4v1ZevC8BBWmryu
         oDsQemzr5w+YW3cT/BAk4lbAQMZxDtW+zLGLue9Xg9FAk+IScVqvXE5SKLI+kprzYMdo
         XmQw==
X-Gm-Message-State: AFqh2kp6svDqCqdsi7Ai4NNry8FpRT3NGJPNJpRG7wc5SPUjETYqjm6x
	/P3BlNVj/elO3KRK78IssQSDyiWB+rA=
X-Google-Smtp-Source: AMrXdXul6yIE/3P9ozmZugszwZs3yZRvN+gI7fpbRyhYll0fqhwv+zT+8ehr/vpAEPlLouYgNkZZyg==
X-Received: by 2002:a05:600c:4d06:b0:3da:f0a:83d7 with SMTP id u6-20020a05600c4d0600b003da0f0a83d7mr2684806wmp.8.1673954437566;
        Tue, 17 Jan 2023 03:20:37 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id e13-20020a05600c218d00b003daf672a616sm8052851wme.22.2023.01.17.03.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 03:20:37 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] librsvg: Make Vala support dependent on gobject-introspection-data
Date: Tue, 17 Jan 2023 11:20:31 +0000
Message-Id: <20230117112032.23723-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 11:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176032

Build fails as Vala bindings require --enable-introspection:

| checking for gobject-introspection... no (disabled, use --enable-introspection to enable)
| configure: error: Vala bindings require GObject Introspection

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-gnome/librsvg/librsvg_2.54.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
index b2e93a268448..fcc25248c0d1 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
@@ -42,7 +42,7 @@ do_configure[postfuncs] += "cargo_common_do_configure"
 
 inherit rust-target-config
 
-EXTRA_OECONF:class-target = "--enable-vala"
+EXTRA_OECONF:append:class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-vala', '--disable-vala', d)}"
 
 # rust-cross writes the target linker binary into target json definition without any flags.
 # This breaks here because the linker isn't going to work without at least knowing where
-- 
2.39.0


