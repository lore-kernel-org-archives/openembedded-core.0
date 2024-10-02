Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881E9CF6D42
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:34 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.6964.1727874811960258808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1mBjXFOE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7179069d029so4811229b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874811; x=1728479611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KpRNonJqPdwvHuYSlfMaKDEKgIY4tOoJ7MvdB53QZw=;
        b=1mBjXFOE9X7A7yuQftOWjbgBMTnIscC6uTvyBInRbg4M8J9cnTWw0Tk3WLPf1c8UBl
         wNiysJ0IBFUsKBhkerq7Sa+s7JvLs2aAuWNLHglKCygLlTHBy1YXol7+WcXcSQj74t46
         1Kdjgz8ZTM3W8E04IBO4mM48YVd9qA/r/rE/IIkMPYAHvDvFbYC1NXttrqWYLdtS0ssU
         pIfNxZLytOOmwVp/TsMdd0f6HrDkgBQjUS8HD7l5KEg+M9gkCDezTRpTmGuUQCqcw8WM
         WLNljXyAopQnnMjLhmw9L9hrdJjkqvNFPMkpC3jIKdLm+xOf6vM3u8sZLshAOxW2vd8Q
         dXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874811; x=1728479611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KpRNonJqPdwvHuYSlfMaKDEKgIY4tOoJ7MvdB53QZw=;
        b=BN76aPVImFc8+iBpfEoyBXSlVlr82I/evP9mBjcF9ZSNOGCVU0noqIMRmYfBGL5q40
         ZPpK448gSy+Imb/4nT9o9BWVIuYpMu36ilBOeS9vtrakmOLTel/6LpeZDB1EOQBubQxn
         MTrBc78tA6/gSo9j+m3j2fXBGzCwUP47kp7BY88Vk1AtRDUIBK7BHpP06GLveCYIEs4S
         bes/mbW2KqOVG83kt1sG4kSPvu/SJixrY2vUNfmyj+ix2wrqWeqG720oJVR/EJvKb3XF
         1nGC1XG7KMlk48IfdgqOY4t66/p7OwhYEsQaWItdEFWp4nG8l5ipbwBZgq8j87rkRcJU
         lh4w==
X-Gm-Message-State: AOJu0YyRwSoeBw4zWvj/1DkVNxugGgDS1bKedWZhbdDXjtuue2kcu9+Y
	95cd2375dgn2WFcXBLkK68Qu4WgN7UjM1DH67qYeeuRPhWtXu72WSs/UsxWO1GJ0X3ia4feA/GQ
	Mmm4=
X-Google-Smtp-Source: AGHT+IE3Z5CrRg3FnMg21N4WBPt7u3D7YYj7GLQ2v4gSSLwQIRS/EXyIb7+jHL2Tqrs4qQtGylrzXA==
X-Received: by 2002:a05:6a00:b8d:b0:714:160e:8f5f with SMTP id d2e1a72fcca58-71dc5c67997mr4994337b3a.11.1727874811151;
        Wed, 02 Oct 2024 06:13:31 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/16] populate_sdk_base: inherit nopackages
Date: Wed,  2 Oct 2024 06:12:56 -0700
Message-Id: <3b646f322b4ffd5ed520f3815ce0726cf225ced2.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205200

From: Martin Jansa <martin.jansa@gmail.com>

Since this bbclass sets PACKAGES = "", inherit the nopackages
class to skip the various packaging functions which wouldn't
do anything anyway.

This fixes errors from buildhistory changes where packages-split would be empty.

e.g. meta-toolchain build now fails with:
| DEBUG: Executing shell function buildhistory_list_pkg_files
| find: ".../meta-toolchain/1.0/packages-split/*": No such file or directory
| WARNING: exit code 1 from a shell command.
| DEBUG: Python function buildhistory_emit_pkghistory finished

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.com>
Signed-off-by: Atharva Nandanwar <atharvanandanwar@outlook.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index fb00460172..8e50ce93a5 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -1,6 +1,6 @@
 PACKAGES = ""
 
-inherit image-postinst-intercepts image-artifact-names
+inherit image-postinst-intercepts image-artifact-names nopackages
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
-- 
2.34.1


