Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4528CC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 19:34:58 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.3331.1645472097855065016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vmxvhp+T;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id z15so3996017pfe.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PNvD3FPecZghsJUdooWGf4G8i167SF1/UI1+uNtUyRw=;
        b=vmxvhp+TkT5LCj5YvkDjCvqyUv7YJovczAEs7q4IpJHcf3oEc7x2Q+BsWspN2O6xkX
         0D2fgKk4USln6IKfTrbUQnCxOPt14SoAnbWFbu/vkP9KU1s2fw8fkKhz19RO2G8cz2nS
         TYcV5Fem0YlwNqj2LQbKwU5vL1LPSBgTN8vCG0QvspSDKP/cOUunRD1kWJ2Bjx2YRRxg
         +44FzKMzKJTOraZQG4UsG4N4dvtwl+EL7n6s7JUjoYaEwU6WelJDSYimw3LlXY6pDS+8
         NXnI01W5bvIG3WkMtFIc3gUjRGo7lEsjJxXXpSt+tDUyxxR7PyGst1x6f6s4T8ru1h0i
         /tnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PNvD3FPecZghsJUdooWGf4G8i167SF1/UI1+uNtUyRw=;
        b=yaP1XE3aFUX2bE81c5Vxb+rHlFlJb/75EEoHY2glyPgPjwEmRJ5DYAJMBe25Vz0Yl/
         dC7742Lo3OBtV1auhsnXoyEx3XObzmcLfwM651uYtu2tf1Wp9ZQJjejMHpPGMUWivXSw
         e8lbetcTHsROmeqz8oocgi/NIgnCLx8Z3+UPgtYw1TGlhPMpPBmzISS2SbcDUr05fS34
         omX3CKXJZ0jVSy7IXyByEPG7EVziwBP5lY6aDa0UyFmuKzmib3mwkI8ky0ufIdug4A2U
         iTRiUNpqmHfEVnMimIH4tJYdCFAuBUK6Pv9M3BHtk3bLwhqNpE3C7SoisoC9V/srvIzF
         YcXA==
X-Gm-Message-State: AOAM531zuRtZQEod2ncGOx3qW8+myokqskRCudEMDptHH+zM+371+r2g
	uF28Q4s0v2l4TW+obnI5Aff42DrMBBRsdU/3
X-Google-Smtp-Source: 
 ABdhPJz9Mpa6wIFpRKX1vwGc8kACzKyhocE0eIes4LkkAPslJif4M8GCVNT6XjdbLbIYkb+FnJxKgg==
X-Received: by 2002:a63:2354:0:b0:372:c945:bfd1 with SMTP id
 u20-20020a632354000000b00372c945bfd1mr16893549pgm.437.1645472096946;
        Mon, 21 Feb 2022 11:34:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s2sm14286657pfk.3.2022.02.21.11.34.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 11:34:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/8] vim: do not report upstream version check as
 broken
Date: Mon, 21 Feb 2022 09:34:25 -1000
Message-Id: 
 <3db417e002684b4f09c52997017bed139ad95f5f.1645465376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645465376.git.steve@sakoman.com>
References: <cover.1645465376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 19:34:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162071

From: Alexander Kanavin <alex.kanavin@gmail.com>

As upstream tags point releases with every commit and
the version check still reports 8.2, it should not be considered
broken (e.g. current version newer than latest version)
until 8.3 is released.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 11d8ee09b1bdec4824203dc0169093b2ae9d101a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 39c0fda76f..1c7256c97c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -23,6 +23,9 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
 PV .= ".3752"
 SRCREV = "8603be338ac810446f23c092f21bc6082f787519"
 
+# Remove when 8.3 is out
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 
-- 
2.25.1


