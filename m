Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79DBD149E7
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:29:52 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.2617.1729880986783876889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qOP5klbZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.44, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5ebc1af9137so1282354eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729880986; x=1730485786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwK2XXsicaxTY6vptF8BB6/I0DgC3YmgtXRheo9ANrY=;
        b=qOP5klbZ1F6X5A14aK4S4j1r+9cTtJ2jhXqrzyUuC5NOB5xee7UeglGGzqmg3khM8j
         czFhnhulGH9ci1ijqEwoU1aJaRuY7eALS/paAr3xHpCNMlXymsNQaeWH4X7jm84U0ktP
         heIN+FjxxaytwwOmX8E0CFeQAHUQge8FGjVw7dNY85X3zTdX8sZySlwHJFl9G/3KXGiT
         5CsVTJB4rPnGRE+uZ8o1PnaaBs0kwmUjJm0gL/bM1swEhJGOqsrYxZYRJfoZzbXRKJH3
         yxCnanmrz5jV9J25Nb2slUfyCsV5wYhrYcXdaLS46m4lvpj7lPEXmzQjVmuF5BSEBGwq
         IQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880986; x=1730485786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwK2XXsicaxTY6vptF8BB6/I0DgC3YmgtXRheo9ANrY=;
        b=PLYawehTw1NJv1H0e8wcVBuhxPfpd3xCb9jI223STiCuQybwqPD3ncj46oxc4sWNQs
         sLoTwKvLRJSm3p743A6uuc1Sxh6FE6943Gt+ULHzLxmmu+KhVkytqArFlBv3PSl0wnbT
         UYoiJ7cFvVWfN/jwnOLGXANtWJpn3Q/fkflsG1CjPGPHgndK/bx33MG9ZdocBErkUfIR
         8otrscNuanKVx1dmhbKM6LjPiQ5xdQQX+nKjIeaal6N+a/Q8WoB23Mf6iTJ2YvhUnzoI
         l/Nim6zJbboevYXpdfFlDNsdQfl4FAGdo6BcnPaH7MX+PIs7TbCkBsq+CAkw91E4VtF3
         59eg==
X-Gm-Message-State: AOJu0YxqTom7QMJTme9+ebnt8RMPu/2zb94vMuWoNYjJKYfSj+jMKxyW
	eeg0oEdFfg9/9xdggCIaSorxG/fbOg3b+3yv4o2KuJ7Ale3fJEwCETvXv9C3h7MjYqL/t4OSI0l
	i
X-Google-Smtp-Source: AGHT+IHgeJtmG80E2odUx2hVUaGZE9JZiJMbPn8TYdSybM5WqPAkvaM81a4W5A/Rm43pO9YKdtm6zQ==
X-Received: by 2002:a05:6870:5587:b0:277:bf1c:da4a with SMTP id 586e51a60fabf-29051e546f7mr411826fac.45.1729880984382;
        Fri, 25 Oct 2024 11:29:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7a51:eecd:55a5:9cd2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a4780esm1394972a12.86.2024.10.25.11.29.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:29:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/11] vim: Upgrade 9.1.0698 -> 9.1.0764
Date: Fri, 25 Oct 2024 11:29:23 -0700
Message-Id: <7dc4956d4eeb1ffe7fe5df1ed55197c0b5a1bc79.1729880682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729880682.git.steve@sakoman.com>
References: <cover.1729880682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206365

From: Rohini Sangam <rsangam@mvista.com>

This includes CVE-fix for CVE-2024-45306 and CVE-2024-47814

Changes between 9.1.0698 -> 9.1.0764
====================================
https://github.com/vim/vim/compare/v9.1.0698...v9.1.0764

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f0e5e63399e544063c79b0b1f9555c820b0604c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 11daa900d2..582eddcb9d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0698"
-SRCREV = "d56c451e1c05310562c5282352d7bb287c16323c"
+PV .= ".0764"
+SRCREV = "51b62387be93c65fa56bbabe1c3c1ea5df187641"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


