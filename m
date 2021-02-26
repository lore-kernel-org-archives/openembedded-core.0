Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.10025.1614349508819099586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pTJO8mHk;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.178, mailfrom: steve@sakoman.com)
Received: by mail-il1-f178.google.com with SMTP id z18so8123575ile.9
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qnH2khtB8xM7z7tTZm7v+tNZB5wg/yhKqF8tIcMtxWI=;
        b=pTJO8mHkdpQyHCMI3g+N0uJDdZmIogZAlylgZK8fq408g24i1Efr3Cv6I9fiVkCpni
         Z26TryHKPmU6YuFaXMn8UQnyFRWSA8Pku3Goy+CcyeGgknJ8yvYCvx6Yj3fLHzQw6XBI
         uuwY0r+2B53NQShf8ETziAGYR4htmQD4UNlOjVmRmu+iyB/Z/tKCwXM3mINJZhe1ZiSa
         CatMEzRtvcPoj4tQQoFs034UtP5jXTk29+fc0NUNwwDMb5u5pspIazEG+x3Ipje3qSz6
         5wxUeFAW72H9AvdeQZyULmE6qGv+WmLb1/cGh48D3hmVX0Ibai6EiCHM3NSeiU0nXEGy
         AvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qnH2khtB8xM7z7tTZm7v+tNZB5wg/yhKqF8tIcMtxWI=;
        b=o8ZiJQSCMWBkv+FbFSeYfck1X8kHiI4BD/0cPnNOuTQLJtLeWwdZnkxLXOthxB7QLg
         Yxs0jzqr/qRPT7FkFMFEMDwTfYOdcW0AZGcMgZolahGb+2D5Ygs5VkyQwh6/bSUyQq5w
         iGfy992rolApkMFZ+QHiu4CqVYplWeIp+HXAtaWQxNddxTfnNZlwC3OTo6jroW4hhmlZ
         Zu1+esl70Bl7Fa2tZtLwDMAUohrHaMR68JWhiHgrYtjPQA78eN8Czeep+ANADVHjBSys
         H74jhwDQ3Q5EnZMTlTvgA5+8iba6MUjTX3F+aQZFkZCiwJ31+Vvd2tTQzmfZD1vOxx24
         2bNg==
X-Gm-Message-State: AOAM530NMyCScJPjoCzVJx91gKVLtSHLN3hU7nzYqDF6quRUVvq8VKJM
	rTPTn9BRErNuE7avUhQqwD2lUjTLZ+W8nNU6
X-Google-Smtp-Source: ABdhPJzSEMf7xraBJbGFTmsUsx2RYDGrQ0ZLpoHEU/oeWk8L/LXrxVvZSpz13/G0BfC6UIPlzvQfwg==
X-Received: by 2002:a05:6e02:b2e:: with SMTP id e14mr2569267ilu.164.1614349507765;
        Fri, 26 Feb 2021 06:25:07 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.25.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:25:07 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/40] pseudo: Update for rename and faccessat fixes
Date: Fri, 26 Feb 2021 04:23:45 -1000
Message-Id: <8a21081add7b2a2698f8eafcc9df472188e9a9c2.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in:

  ports/rename/renameat: Avoid race when renaming files
  ports/unix: Add faccessat and faccessat2
  ports/access.c: Use EACCES, not EPERM

which includes a fix for rename race issues causing pseudo aborts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 330c232e4f756296331f9026e91ac26fd45f0315)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0072e0558b..4287cfcf93 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "f332f5633b5dd73fa2b6e5d605eb33e4a446d7ad"
+SRCREV = "d03de55845edf68908879db841834584d4724c43"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

