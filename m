Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC90C04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:47 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.21304.1691683537350419710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Zh2dqC1W;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-686b879f605so798856b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683536; x=1692288336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMi55jbZHlVcxUolxWiHwNPNmvk7e2fKwZAuDUSsfl4=;
        b=Zh2dqC1WSPB5Xnq3Qw0hkMmrq+AWaW5lXD6DJ43UNyCSHe8WbjK4/vqLrecm8hwaqr
         KNw6B+8taScqn8+h4L5Nwluc1RcGm/cbMbxZZvvli+a1PnepuRCpSA6nCAbvH4PWyyV3
         CMZo7SfMj4vkdzL8OueXP2bYWuyJ+GObrEOirlUjmXiyKOLIpgJE+0Y/C3uUOhRKM6yl
         bYi8TZqeppEfaLoRAfgWYaL3NhpK80681yjho6qAzoBV5jURxWsLf+nAIs0IaLSEXKFV
         9MFArse7k/B4pWRE4cTOxt9J0z2bA2BtWIhFKaWu8PL+w/CeVag338XH9ePsKyRkHnhv
         t/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683536; x=1692288336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMi55jbZHlVcxUolxWiHwNPNmvk7e2fKwZAuDUSsfl4=;
        b=GhNB+r1/LwxFsFNZvok602qveyEhM9+WOsH0IQrMdTCmD+6ZBmRYpz++6e9zUuCtUz
         RkQxvMkjsPirNlikzHHfiKDJR7MEM3KpER1e5jzniZkOZgp9vKFkfY4c6X+JWyfeVWFk
         tvEid5BPLAoAQocbk/4ljsGe0Drkoi+1ZswSL+1kBHChmbwZvZGNI5KH0W1Tl6zktvop
         imBxoikr1vd+TFrbSQpKInnWsfVFkaAgJyk80gevyaO2MNi3yxzZCcs0O64kcVV6S7Nk
         osXNNsq9sDPc9Nbt0uRAxaD4eNLSCIjMD/yGwKiNiRh5vI4y5Vr4DzNarVEO0KkVlB6U
         c3TA==
X-Gm-Message-State: AOJu0YzgMR97plCpAtrKJJ/BslLlv6VXw/Qck9KXBkCSL2s37qtzZ1CY
	XdBUk5HIUdISCvTCb3nz568nWnISZZk290mito4=
X-Google-Smtp-Source: AGHT+IEdTdvByZAArfWcuyl3L0uhxLljgBQrLy2R1hUctKoJAObTeUQJlJaxHr8NAIqVk5zQ2PrQrA==
X-Received: by 2002:a05:6a20:2583:b0:12c:b10d:693d with SMTP id k3-20020a056a20258300b0012cb10d693dmr3220612pzd.6.1691683536437;
        Thu, 10 Aug 2023 09:05:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 24/37] kernel: Fix path comparison in kernel staging dir symlinking
Date: Thu, 10 Aug 2023 06:04:23 -1000
Message-Id: <76ca96ebde8c318e32d4bf65714a6241965b0b8f.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185786

From: Staffan Rydén <staffan.ryden@axis.com>

Due to an oversight in the do_symlink_kernsrc function, the path
comparison between "S" and "STAGING_KERNEL_DIR" is broken. The code
obtains both variables, but modifies the local copy of "S" before
comparing them, causing the comparison to always return false.

This can cause the build to fail when the EXTERNALSRC flag is enabled,
since the code will try to create a symlink even if one already exists.

This patch resolves the issue by comparing the variables before they are
modified.

Signed-off-by: Staffan Rydén <staffan.ryden@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit afd2038ef8a66a5e6433be31a14e1eb0d9f9a1d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 3190feddf4..759f72d571 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -181,13 +181,14 @@ do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILD
 do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 python do_symlink_kernsrc () {
     s = d.getVar("S")
-    if s[-1] == '/':
-        # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
-        s=s[:-1]
     kernsrc = d.getVar("STAGING_KERNEL_DIR")
     if s != kernsrc:
         bb.utils.mkdirhier(kernsrc)
         bb.utils.remove(kernsrc, recurse=True)
+        if s[-1] == '/':
+            # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as
+            # directory name and fail
+            s = s[:-1]
         if d.getVar("EXTERNALSRC"):
             # With EXTERNALSRC S will not be wiped so we can symlink to it
             os.symlink(s, kernsrc)
-- 
2.34.1


