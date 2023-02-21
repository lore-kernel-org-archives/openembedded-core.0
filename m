Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B047C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:37 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.43537.1676990486146524330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mURaCdvN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id a7so2794730pfx.10
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+eID7JVngK/NvNvETz2cvN9ZSI5cqHEeYxMtX4O0xI=;
        b=mURaCdvNOpDo3J6j8yXyAzjOh7ek1dTcPkwOj7f5s0uJnY/WlXsJ2OA765K9ZqHaZ6
         4IAHjPhVkVcG3Q+nWVDertcNuhkgYTJeaxFSvgmSmRhC4dDrdxTpGNLeZ+Jlj5I5qX6V
         JRuUL0XsI0B+CS9xXjp6/bOjH3iFcKhEz4np5iRxXSNo9Tq2DL1A5n8+2sjE06Go3bp7
         VycdgCmPitShDyEJbs1btDFVzATL9V5hI4s5IotSwn9BKZpiK3ehbPPt1qfw4D2k4OMn
         LjatZDhVUXyI5DqRaqKVoTKBBkMCDnmamsEywUca1CaegIQhPB9es1ss+2m+R6PhasMC
         FAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+eID7JVngK/NvNvETz2cvN9ZSI5cqHEeYxMtX4O0xI=;
        b=VGFRGQORgb4ySuA1BGUWgHlguFmdtiVDsQ8LUPa9tklHvHyAhlYc45vIEC38iWfgPb
         EL4QZroUCryBC4vGtSJvlIrfD/UWm+zdUUUXW3VKuhaoAIGr+ckA/wDGeWA3qXBv+rEj
         kkGgbnRGJyab6F5lKVs7fCuR0VsIkKZucKfvO4DDjaflCdXLEAYnKrntofkr0Gcl4I0c
         xoDKqvf9xrzoIJMGB2ZzWmO26Liuwz6DKLhlMhqE7tVxeHP6VFyk0/ceC1qflP2+klU7
         BYiFZptu2Z3lvZ+5d0hK5FENN8nJj8lZAtoeMOi19btsWNyDX+jf2kesrwp73f1WYtNN
         b03Q==
X-Gm-Message-State: AO0yUKUKH95J6cxCzBUSqKAB8hWbpOP35r3Kdpb0Gqo3XJmXzVnzhlbh
	G/ddhith8UJRf6jh2Y3dc/YLx9wSzkeySd+OGl8=
X-Google-Smtp-Source: AK7set/lhQLo29HQsXkweu4sQrAh24MAjqwDVvAT/SYCV77JRODGjvdAWdDlkuGGOKbrdWaw310wrg==
X-Received: by 2002:aa7:9985:0:b0:5a8:c3ec:e24e with SMTP id k5-20020aa79985000000b005a8c3ece24emr4351585pfh.4.1676990492553;
        Tue, 21 Feb 2023 06:41:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/23] sudo: upgrade 1.9.12p1 -> 1.9.12p2
Date: Tue, 21 Feb 2023 04:40:53 -1000
Message-Id: <fce9cdb15789778fe2525b99c968bbf9a84102ac.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177510

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes:

Fixed a compilation error on Linux/aarch64. GitHub issue #197.

Fixed a potential crash introduced in the fix GitHub issue #134. If a user’s sudoers entry did not have any RunAs user’s set, running sudo -U otheruser -l would dereference a NULL pointer.

Fixed a bug introduced in sudo 1.9.12 that could prevent sudo from creating a I/O files when the iolog_file sudoers setting contains six or more Xs.

Fixed a compilation issue on AIX with the native compiler. GitHub issue #231.

Fixed CVE-2023-22809, a flaw in sudo’s -e option (aka sudoedit) that could allow a malicious user with sudoedit privileges to edit arbitrary files

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5a3f5f4f607f5e06af772287109b68579154fb2f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit cd1b6167242003c79b39d8761ea0f36db41f0671)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sudo/{sudo_1.9.12p1.bb => sudo_1.9.12p2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.12p1.bb => sudo_1.9.12p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.12p1.bb b/meta/recipes-extended/sudo/sudo_1.9.12p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.12p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.12p2.bb
index 1495b67b8b..ae7207c081 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.12p2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8"
+SRC_URI[sha256sum] = "b9a0b1ae0f1ddd9be7f3eafe70be05ee81f572f6f536632c44cd4101bb2a8539"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


