Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED45C7EE2D
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:47 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.27600.1677860259281506072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=K7ZTcVVU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so6631944pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFNyNfSPeY8WWZjecDj289XDJ0qXHlG+XKohL0pe/nI=;
        b=K7ZTcVVU9ttC187kQciaxQPy6C/Nul+Eoa66mkSi57guRkp1KKErNRQTGCM9hKzYwi
         oQePTQHuGEeWA4tVlK0DVlro4F2akdXdWKML1nvjoHbrTUXKEYO++w38kz35EQBsyrQA
         Wnq+6CFGXNs7OuUcm4vT09/DE/H2353EBcqaQ/XOEobU47+wdZcxh9ZqEAY/+sa+OkTE
         Ymi1u7McF2+n/oHNAYDkZLbqnRHOd01+AGq6HX/RnxIrzrIsv2EU0TRX8B3ngHJW/u53
         Cj2dkQVbsE98MMVuvhCyDtll/IJvsdwzxZyeR98UkhU1+TBIs7ZbNrxfEZXRos2+ApVI
         FBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFNyNfSPeY8WWZjecDj289XDJ0qXHlG+XKohL0pe/nI=;
        b=rTkOaUfN9RuNjf87nGqsKKGxmPCDmdREjUWnEzbCyDmDaL5fWDmGPT/5FvR/z8yl9B
         LI0E7clggJ+LxP52Duk6TPLELLPrIr8FuZIJSYm0hZBJU7AVQPcZbb/ayCh6RmOzTtuh
         I6kn4rlem7YcSl5qV11Om46xoKhufskZ2Y4OOwakQM6AivEZQPXI2m6n6mz+IoAFMN5R
         QFuxbsOKs89CZYc51U9xr7+kDK7W/BEBMUPTIGdefb92UQwzPyR+QYO54XTnAWRcmTVF
         y4I3aJdGm/K9XlCxBuwYL/ZB6QBDxtGvW4ZASY/e0vGGRPMzwXWkIJWm7xj0XPgTimxx
         aLwg==
X-Gm-Message-State: AO0yUKXOixvHlE7Ddwz7aCUVhaS1wNNm06ZdfeekDzRo12Zykekmb4Sf
	iwqTC0w6VHxvnQmsPo7X3R0qL3PTerscGZE11EY=
X-Google-Smtp-Source: AK7set9F6m7oaZV9eL0CJ1GiZ3Af0GCqcOiKlgBAxV5Y+5GUlalrOXEwExd7Ufb5vqxaff1eOovqVw==
X-Received: by 2002:a17:903:2308:b0:19a:a673:4ee2 with SMTP id d8-20020a170903230800b0019aa6734ee2mr3062354plh.31.1677860258312;
        Fri, 03 Mar 2023 08:17:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/29] less: backport the fix for CVE-2022-46663
Date: Fri,  3 Mar 2023 06:17:02 -1000
Message-Id: <1c17fb5bcb996f95f91676c65c9debc123672ac3.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177993

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/gwsw/less/commit/a78e1351113cef564d790a730d657a321624d79c

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../less/less/CVE-2022-46663.patch            | 31 +++++++++++++++++++
 meta/recipes-extended/less/less_600.bb        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/less/less/CVE-2022-46663.patch

diff --git a/meta/recipes-extended/less/less/CVE-2022-46663.patch b/meta/recipes-extended/less/less/CVE-2022-46663.patch
new file mode 100644
index 0000000000..4d61a52fa6
--- /dev/null
+++ b/meta/recipes-extended/less/less/CVE-2022-46663.patch
@@ -0,0 +1,31 @@
+From a78e1351113cef564d790a730d657a321624d79c Mon Sep 17 00:00:00 2001
+From: Mark Nudelman <markn@greenwoodsoftware.com>
+Date: Fri, 7 Oct 2022 19:25:46 -0700
+Subject: [PATCH] End OSC8 hyperlink on invalid embedded escape sequence.
+
+
+CVE: CVE-2022-46663
+Upstream-Status: Backport [https://github.com/gwsw/less/commit/a78e1351113cef564d790a730d657a321624d79c]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ line.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/line.c b/line.c
+index 0ef9b07..9d49cf8 100644
+--- a/line.c
++++ b/line.c
+@@ -633,8 +633,8 @@ ansi_step(pansi, ch)
+ 		/* Hyperlink ends with \7 or ESC-backslash. */
+ 		if (ch == '\7')
+ 			return ANSI_END;
+-		if (pansi->prev_esc && ch == '\\')
+-			return ANSI_END;
++		if (pansi->prev_esc)
++            return (ch == '\\') ? ANSI_END : ANSI_ERR;
+ 		pansi->prev_esc = (ch == ESC);
+ 		return ANSI_MID;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/less/less_600.bb b/meta/recipes-extended/less/less_600.bb
index 9ebe39daab..f68281ac93 100644
--- a/meta/recipes-extended/less/less_600.bb
+++ b/meta/recipes-extended/less/less_600.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
+           file://CVE-2022-46663.patch \
 	  "
 
 SRC_URI[sha256sum] = "6633d6aa2b3cc717afb2c205778c7c42c4620f63b1d682f3d12c98af0be74d20"
-- 
2.34.1


