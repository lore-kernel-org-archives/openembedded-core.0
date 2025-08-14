Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE824CA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 10:03:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.18949.1755165817060065498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 03:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RZxQHSLr;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso3277495e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755165815; x=1755770615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yNSKaNgsUVanuO53u0wIzmNHCtxJCPDpBbqx7MzXws=;
        b=RZxQHSLrjdq4InY4DLcRYeTegLNY2enOMtEZm6rYjMI4Cy//t3+8smCmz2ky4TA+8I
         D8Pl3x5B8ZP21zC3vT2BW4oL1ETuH/7nf1PEFq8LepSYzA6oPwGKC5Aun9wXG6fJJIWx
         VreT+osyKguTaMviZhX/QDtHNNODSnDDOIzLh6tk83Uh4InmqjlI4qbretZdzPBkN3pG
         h93cOiu33yHku26DDW3YjbNLIlXqz2qI0cvVn+0gn6LBmND30oXsD/ecLjNMM5GfvZLn
         4IOkFF7TXn6avrk0kjuMrGKSwuv8l3ZMaXSgVsqPeKgbZU/y6gbk/WjqcbIujjXjyxFO
         Ty9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755165815; x=1755770615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yNSKaNgsUVanuO53u0wIzmNHCtxJCPDpBbqx7MzXws=;
        b=QDKkjhsFbHBUFqQ892Wun0S08C0Bbw/kDpBJeABQ/kbVJZmhUaK6jztqqK8OJvsU/l
         171fNug3EZNZYj84mmMKja7rITQbx+2LsNDSSpFUbSM02Ms9if4dDxwXDc4R4fTGiOAy
         1/eJDAB1XVcjQO7HhPisVrMZsbwGYX+nxvlbn3dpy8ctJxtrhbluVteqaoWFg08anO3V
         gB64sJSAFoeUszq28SfWj24EoZkLpMru9F2c6JafZ/Xzqesv7Y/Pk84mjA8XpVXRF6le
         MDMWOT5vhkDlh04NM+eocF726Xj0VCSmbrT5LlI7awFtbGQanqlWXOVZI96zcqVvL4gV
         U2kw==
X-Gm-Message-State: AOJu0YxltY0yAmX7jBdDVleXUj3gTmMYW0Y2MRgn4+vIuo28L5impcyl
	5NBNXr36WZuhsdB01I5yGGH1xhk3sQP2HSCCudypv9iiFAShUxOKuGLwRow3+A==
X-Gm-Gg: ASbGncuCFuVIyf3bjfmOmeHinw6qS6oSWPibOdwjoneeGeQcdi/1zNFfRG89CZnHfrb
	jbZCsMuBlWcOrqbpmlU5yuhteZggr3SWt847nJSQJqaj9Eed6xCDJwZgAS+D4MHzHDip0rf/B5M
	s2cmiUC93t1ZJLtMcV3LY13kZCLqLZ2MM9Zp6d7KrvhMcdtb8q4z5RuOkTilNi+Aj+SePXqfCSX
	ZxXhDncDNojAs3E5cwtZ5rq83v3v/4r2ArE2WzW57C6Xy70y4tF4YQXTUeEgNm8WLO+K6j4yEym
	WXXV/Jx9r7COqOS9uiMHnSNw0u1UsL/W19NVCYYcje/HDcfpbagdhJ+2dN7rjLg7Xu7ozrFxuIj
	ZRcGajnw1iAXXdtvIoSfISo2i03f1wIVlYTEG+WFa5dq/5smQORrUJAubPEOgoS9jCAUkTg==
X-Google-Smtp-Source: AGHT+IFAE2lekaK5+tfdpBPw3MpM4pt23ywnOUB8MC2ryjSeMJRwTuyk7+fzz8BU7pzWognMEHrG1g==
X-Received: by 2002:a05:600c:1f8d:b0:456:1846:6566 with SMTP id 5b1f17b1804b1-45a1b659d8bmr16348585e9.29.1755165815031;
        Thu, 14 Aug 2025 03:03:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b90fdc85a4sm11217235f8f.60.2025.08.14.03.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:03:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] gcr: fix upstream version check
Date: Thu, 14 Aug 2025 12:03:29 +0200
Message-Id: <20250814100330.2163083-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 10:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221855

From: Alexander Kanavin <alex@linutronix.de>

Add a provision for an optional fourth version component.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/gcr/gcr_4.4.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb b/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
index 25c394c9d0d..f3288c8d36e 100644
--- a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
@@ -15,7 +15,7 @@ CFLAGS += "-D_GNU_SOURCE"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-introspection gettext mime mime-xdg
-UPSTREAM_CHECK_REGEX = "gcr-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
+UPSTREAM_CHECK_REGEX = "gcr-(?P<pver>\d+\.\d+\.(?!9\d+)\d+(\.\d+)?)"
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-- 
2.39.5


