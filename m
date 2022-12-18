Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C678C3DA79
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:39 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.32486.1671380011180914411
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=K6TfWwe+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id 4so6880634plj.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UU5v1UsCvvSpH/wuq00fPN5OorxwYf6XtzoWzrqOrG4=;
        b=K6TfWwe+HQpmBOR9oW3/5Yo9QCODoka7mXfB98wCCd9X9G1S58erfZqQ+zUxjPmiEd
         j65CEt/cOO+WLKUgcL8Fd/RnKOu+r+CgZ3C/H2Zyk0xhqXd8XQ2qM2oN08pt2EzCCboM
         9sY7k4S2+fWfMCpgV3g+u90b6wbrreEetYZs9nLldtXwA5Cvm7sLIQkea6C+0R8nWjPR
         caZK8sRMP0cZLTjIaEgjjJ3onYkEw5uBafHzcN0KcQs/GGzNfZXKogk7TRJqsFhCzYzL
         8ZP2zktvnHOeFBDeCKSU4ltMDUk4egzUhN85AumWjqIxV9O4HbLHG3kn3VpejN8qWKGE
         P6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU5v1UsCvvSpH/wuq00fPN5OorxwYf6XtzoWzrqOrG4=;
        b=fROrzvLSYzJKZ79RyvTrU+6qls6AMIfqhlS0PI0knZN+R17VCETGUnMTcM044qSMBg
         wy711IbKtvllUvph8LOZawxTUwJf15NtGqEffufnSi7uQJ3xtFfEzzyGgoY8DXFpRY+g
         9y8EfrehDzplAhYr+PEZn4Kl9gkIFsm+snAPQCQOvQ+LbSpCxW4ebB98433gQ+3vEMHI
         eMj2J9t4ec/SEBIOIooWMRhvCGiZxMK98RqgPNGiXYKHsuDSw9wdlUVdmCFZERaEv4jz
         wC8ehocx6jn71y8H9K/E7IXr9GO/LLHM6ftDNNxxNz9u8Fcsv+v5X2TSgniyz8WqRp6Z
         MlAQ==
X-Gm-Message-State: ANoB5pnn9keax1L08e16MjDenNw9eeykSVf6wz/+8pe2bxA2iE6WUaXv
	QUhC3oghxvsjinOA7HgkZRgk6tRcuPecGm5Ax1o=
X-Google-Smtp-Source: AA0mqf6QbsYGmeuSFrlrpTpzqGnXQ1+PR5qJBBG13cWZbYBycWhBcLtUtzgMHpfiPjKTMvilNF2rYw==
X-Received: by 2002:a17:903:240d:b0:185:441f:70b1 with SMTP id e13-20020a170903240d00b00185441f70b1mr41122696plo.54.1671380010128;
        Sun, 18 Dec 2022 08:13:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/19] bc: extend to nativesdk
Date: Sun, 18 Dec 2022 06:12:52 -1000
Message-Id: <713ebd37cb740ebd1f3f57d14f4448ded8a5fe3c.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174795

From: Chen Qi <Qi.Chen@windriver.com>

bc is needed for compiling kernel modules, more specifially
whenr running `make scripts prepare'.

In linux-yocto.inc, we have bc-native in DEPENDS. But we will
need nativesdk-bc in case we compile a kernel module inside
SDK.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 95b5c89066baccb1e64bfba7d9a66feeeb086da9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bc/bc_1.07.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index 1bec76bb2a..5a03751304 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -32,4 +32,4 @@ do_compile:prepend() {
 ALTERNATIVE:${PN} = "bc dc"
 ALTERNATIVE_PRIORITY = "100"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


