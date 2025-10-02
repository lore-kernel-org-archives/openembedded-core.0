Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67031CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 11:35:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.6479.1759404936352982881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 04:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fzXrk7SK;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-78af9ebe337so702806b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 04:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759404935; x=1760009735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pXupBgtFj1VGB0dxyc10WZrvuUd920WAnORj7O8iWHE=;
        b=fzXrk7SKXG1K5Ni54TfXgTTloso/fUZxekoXuido534PQcOpJMYj1R9f3nQ6CtRHxN
         zq4VBOV2szEaJ8Pr38VOogcrGq4bVoQVa11qG4MH5os4/rdkSvJtvLFpa9jF098zXrAy
         Wf9kvPeN79wo7BRd6GRgYszuxqg0vLk5OUzw1IWXv0d8GeSVMncnP6f6QPdq4Fkh/6OU
         ITtg3X0YhEr5S2RtmK5zbvMUFMiojDvoIwClVO27+Kra2jI+tEw2sWS2GjmRc5sE4Wll
         qYnpHzOjol3Gz5MmtjHAtlAynYiSe5CfPCSzw0SZYKws3dQFnx6FkiwAK2Hv9h538fLu
         iJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759404935; x=1760009735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXupBgtFj1VGB0dxyc10WZrvuUd920WAnORj7O8iWHE=;
        b=axUGIPxSMRRZrMeG/w/I0wVAGm1MdY8KDAEidvhf79hgfbHPYF7560498UCaNVYseO
         LXT3uPh6UOJMfEBTBzTABcSLeKg2D32c8WKS507FwzLkYM7NjmSEo4QLRjpPuv6AyXVg
         IIq0fxPhxIyr2STIdye+FEtgK/rqtirbQHSmJ65IGRDj3RJd61GGMJsorGKz5+3Kcq0N
         /DI7XSvR1vGTrqyrOUFJ5RG1bObzgEi8GvyhfkFmeP238Nz60INcPOGagnFHrbQKz/Kc
         c/RgWTUNYdXBOXMeEaTO5A6CqJm+dtgkawFLbAvIbV6flO7ZiDFYkUJ2R9ocFryvHwHu
         OV+w==
X-Gm-Message-State: AOJu0YzlUwul2zbFpcvJANL4DVM5jSZ3iDTK+KrlczX8w0HlwW8fzOcf
	sc6HbhdjKVPr5s3hErbW7RnkwvQpczDjqWsXxFwhVNEl+jKblr8+64CAJohvTd2f
X-Gm-Gg: ASbGnctKZ09IxFDkd6sEBHBwI3u7kLxbS2KzNENIurZ+W+5i73BjpfLKlBc9uaI5I54
	Ke8wEQB6i4irYnZvU0BKowA24RQ03OcF87CC2K8DsqXCU+9mJkh3f/X/G5ezdmHqRH9Umszv889
	tou/r6HvkrDGiOIySDDoOje+7L+nlASg84B7bcLldl19nV8MXaqD40rmF1k6SLTIVBPrkgOwN0N
	9ww6UodnaU4uRYI+k461tSWOIy9ZtsNGMs5UEL7vqQ55EMDoSSjA8fgcKbubzkRJo3TTGcmoGLw
	vLW6+K+XB9gyDd749wk3Ehaz/DqMKUQb8h8/K3nNp28BIiX5/ybamfGJJjtxfNZZ0BrviS46Qs+
	gtzzk1idHO3PGsFdIT4qLWiH7owyFC68knloutqrxlb6OayHzZU7gDedGO5iCFFDGSe7J
X-Google-Smtp-Source: AGHT+IGTPtsbsFvAhl1zwn4HUDJ563dRJ4buT6REIHZCtP7qDiFbTqwVu4W2CGMN3/3iqBiYX/tN/g==
X-Received: by 2002:a05:6a21:3a86:b0:2c6:cdcc:5dd0 with SMTP id adf61e73a8af0-321c5a3a6b8mr9679529637.0.1759404935403;
        Thu, 02 Oct 2025 04:35:35 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02073d00sm2035524b3a.77.2025.10.02.04.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 04:35:35 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] mesa: 25.2.4
Date: Thu,  2 Oct 2025 13:35:26 +0200
Message-ID: <20251002113526.23868-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 11:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224355

Announcement:
https://lists.freedesktop.org/archives/mesa-dev/2025-October/226554.html

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c3751f3414..7046deeb2b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "f2d6b28562f1d6cb9c17ee8e58eeade7aa5faf927ae71065eadb41e17f92b4f8"
-PV = "25.2.3"
+SRC_URI[sha256sum] = "a370b4c549cbfbe646b319e34d73edb50ed883978f5e95133f282f0eae39ab52"
+PV = "25.2.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.51.0


