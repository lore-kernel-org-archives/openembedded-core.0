Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E110C02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.92662.1738600914631165354
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AsTd+5EQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43618283d48so34526165e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600912; x=1739205712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtJz5nuAWhl492DfEKtSy901hSonqudlpi/AgIZdHSk=;
        b=AsTd+5EQyfNKxzKSMySyvJWOTOATJjYWukhxVr8gyQk5m6u4UQHSiAjpVPIfDuUdi3
         idyV4KEhjAAHyrsnSQXfP0BWUtcrPpVX/fjPSInAOwxRWLxFwRQoAXnJGYm0W1IPwKz/
         2jOggzLli5NzRk1Q84uzqUOM1rz1mO2eU7Gww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600912; x=1739205712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtJz5nuAWhl492DfEKtSy901hSonqudlpi/AgIZdHSk=;
        b=JlJEPuGj7wyv/mccvCYl6UK/V6BPvIWGHLGwMCVXXKPjxNoG3K0CmNFVuC1Bk5O3Hs
         8/7MK5W33Uv90fBO16J7TJHPhOq0KndwsN8fu+OnoE/0E4sw/IBlLg1JoAZTwWWyp8gP
         yaVOH3JwLMS6w/X0EMJA0OeqrU7A0PJFaZ2QcNADb5g35zqxSWsOHeRbbWoYb44+3AhV
         AK2/qeeTa9B5e8ZB3MFb6p4/HTLeaegir4QnmlrU3a/HoEZTfAI1D9KHET2VNOYbsQad
         UGuF2kpN/9/bCPSwM6jkuAD42SIOVnPvAfKB7nlCvtZY19rwO19G3p4u+ajCpEL7bfKy
         kwIg==
X-Gm-Message-State: AOJu0YysqkafJdf4gandV7c8pWHAhIV9oms/VtB1X15nX6Yap7A9D6Ns
	epCxngDK6R87GdTanemPGYdsU+BFZe7ki+al1NxsxzEuvZuc86Svu+xYw4jABAknDAlOvwNynjn
	l
X-Gm-Gg: ASbGncvSlKERcXQ7xiJXbCP4WfTDtQYS+MQOmI4p1bYGNTJVqsq4pHyHCiRzOSm44+K
	XFLOjziVQ4Cg9OPecgTUfwdi+gIjKxPVtYrrlC7QyeMvRtYkFq8HwjP5/9nJqoPvqIUwUDS56Mq
	WVHQsx3TPNMMpCMMJMSyfq1xVhgqSQ7Ql7ZNgqWRBj3WBwJcArJT5A8LILsRgH7Z+1s3O+j0kgl
	H2By7NnWgoP2DJLcyl1ZGcnnN3OSpMRAcl1pCc339e6bRZ3CqLREcTvYRyH1TdBSoB6T4sNKksA
	XulaBiSyoMAEnGYF2kOCu11BskhOl/b/x1P/pAJKy6+5
X-Google-Smtp-Source: AGHT+IFc3S7CUdAbLJuolWUFSi4NfTk+plJT3R/asJyYY+1dYJim3vx/q5btco+8HoFkSm+YrHEr2Q==
X-Received: by 2002:a05:600c:5252:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-438dc3ca802mr197011765e9.13.1738600912489;
        Mon, 03 Feb 2025 08:41:52 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/46] lzlib: upgrade 1.14 -> 1.15
Date: Mon,  3 Feb 2025 16:41:05 +0000
Message-ID: <20250203164130.3403325-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210694

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/lzip/{lzlib_1.14.bb => lzlib_1.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzlib_1.14.bb => lzlib_1.15.bb} (93%)

diff --git a/meta/recipes-extended/lzip/lzlib_1.14.bb b/meta/recipes-extended/lzip/lzlib_1.15.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzlib_1.14.bb
rename to meta/recipes-extended/lzip/lzlib_1.15.bb
index a6010bbf27a..087b7818735 100644
--- a/meta/recipes-extended/lzip/lzlib_1.14.bb
+++ b/meta/recipes-extended/lzip/lzlib_1.15.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=04d943636aa1482e0a97d924d9f4f68f \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzlib/lzlib-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5acac8714ed4f306020bae660dddce706e5f8a795863679037da9fe6bf4dcf6f"
+SRC_URI[sha256sum] = "4afab907a46d5a7d14e927a1080c3f4d7e3ca5a0f9aea81747d8fed0292377ff"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"

