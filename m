Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF8BC55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15083.1785846221317121942
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L6Y5zgZT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so32299625e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 05:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785846219; x=1786451019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eyroMbL0Gbd5zkxu7iOc0x5cFSQ6KekBpS5NHEKXu3M=;
        b=L6Y5zgZTfCZbI0rh55vtipisXIIvPvRz8RDujqsD4cHrsZg8tVZovF8BH9Y0ejQ+qZ
         ZgMM65/UaokJl2sYgjCDEQn0Z/jQXixMEDx27WfROzBswH2+cSygXX+HKuXjIxsbwEV1
         hL931kj1xZGGPi6NB5IlXlX7X1IPu7c7g0pDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846219; x=1786451019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eyroMbL0Gbd5zkxu7iOc0x5cFSQ6KekBpS5NHEKXu3M=;
        b=jtIDeCjAahGupAbPKv1vcoHmdHFKcfKJohPfjJT7LS8V8NNy4DygdQ1rJcZJFy3HN/
         1LHTX3W3LAPM0Y7Frl8elYLVKEYyPfsppaiZH3uI/SHD3dX4c3FIqYESC4fUg++1quHu
         wFb+ZCHpix4VZwg4brjCuRc+qOOdJ+roPRWZY0hogTMoO2PcYYZ/IL7R/wg65xdPxfuU
         N2AcqUFYHoJTI7znrv4artWtj20rEk71c6ehT+jIzO/SYZYU88XapL6yV/fjzJ1IBeuh
         /5dOJDoTbHiGQ0JWbkWupK6S7ExataEuI8vHLYGzVAKY7HJqIm3U7Uo5Ws268KhGDvXt
         /tQA==
X-Gm-Message-State: AOJu0YyylaUsborFLyPxUR/6qEA8Ul0jIjrDhuDCOnX2AQsOOuJ676w7
	rrhNWsbj6W0q51NfEZX9Asg3fsyCVfoxNghpknqTgcKaZhN8SsVPASuTWvniNHrMDEC6N6aq5ea
	GBb77vxc=
X-Gm-Gg: AR+sD13SG/6bKj5PVcsguuI/TGG4W0HPnVjr5414zp6cgq77rl16IkIbgu5G2o9enXD
	VstZvD5QpliHluUuzVbJq7XtxMlz/JeX2fRuJgPqsMjrmxdrlo8u7dNCXKmlp3MYcelqyCZowCw
	AZ3KalIOHQEOtzjZMXj92KI728BlyBK2/ddhUywMpumvo/b0zYFrn217w3XWbSBJwH5EpmWJEC2
	CRzKyX35d7lprVu3iuvNSdsWi0sPgJLzxWMKz64hIAFjk2240j1O6RMgLEi6gGZ0w63PSWM2T4N
	vYuAkRCj0fly9Q6Ca5AmkHOejdWoYpBG4RXw61CC0Wi/PkHZRu5KkerEUJGbkfYEInAZWG6qOLS
	lu7NxMs44vUFzmS+ovWB7WFvt9B++4v6vqr2h5f4f/C+slRtmS1sxciwSoDQqA9+lYJrFsrfbN0
	krOWTL/v3+9CYHei7rzFW0ey9m38Un5H5zQNxTIhiAs3JR9KAwRm+03PFSlNXrpZjHw60GddH7Q
	2RoTdP1s5HXiwVAQQ==
X-Received: by 2002:a05:600c:19cf:b0:495:7a04:b006 with SMTP id 5b1f17b1804b1-4980c66b572mr308598405e9.8.1785846219604;
        Tue, 04 Aug 2026 05:23:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm76247535e9.4.2026.08.04.05.23.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:23:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] xwininfo: Upgrade 1.1.6 -> 1.1.7
Date: Tue,  4 Aug 2026 13:23:29 +0100
Message-ID: <20260804122335.3094065-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242741

Changes:

- xwininfo 1.1.7
- meson: include headers when checking for functions
- meson: Add option to build with meson
- configure: remove local copy of config.rpath
- gitlab CI: drop the ci-fairy check-mr job
- Use stdbool.h
- Fix memory leak in Select_Window
- Fix memory leak in Display_Window_Id
- man page: fix warnings from `mandoc -T lint` and `groff -rCHECKSTYLE=10`
- Improve man page formatting
- Accept --help & --version as aliases to -help & -version
- -help should exit(0) not (1)
- Update xwininfo.man for #2

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-app/{xwininfo_1.1.6.bb => xwininfo_1.1.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.6.bb => xwininfo_1.1.7.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
rename to meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb
index d410f7d5196..6fc49e8729f 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb
@@ -12,4 +12,4 @@ DEPENDS += "libxext libxmu gettext-native"
 PE = "0"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "3518897c17448df9ba99ad6d9bb1ca0f17bc0ed7c0fd61281b34ceed29a9253f"
+SRC_URI[sha256sum] = "bee14d594cc86cc59aae1015c1b452a71bf60c304131e2716ca1cf0df733b4ac"

