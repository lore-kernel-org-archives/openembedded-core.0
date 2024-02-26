Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E304DC54E51
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 22:35:06 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web11.7234.1708986905280221758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 14:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m1tF7m4Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4cca43a118bso520855e0c.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708986904; x=1709591704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yW6b7vHWzc23cTrhhuOfq3gPLjukYQrXOHfFAODHzUU=;
        b=m1tF7m4ZOlF+OUQOOXT3Hr0O+etsDUYF2TcHOhGpBjhNyG37Rfnb75aWLa1RR9D/JN
         duq+wpsjJG5epKduQmtdctgUYuppZ1K/Z1c56GHzoSQgCHD2H7MxqVGLthhve63odJzm
         OhoLkCV3jToo9ZBFyujt4UEMydMOOitqNM0/iVt/iXKcDYepv3eqn2dRiTKjA89ycasH
         VeCYIh/vZX2odEHwO6zPLBEHiXf9MUIugoW0gvjXeEWnCmlpbdf/aNRkEuZNf0xETdN5
         NqfnPubQMZ7QfblVsVppd29jTSVbyFsJhHMqnBpGmxmwi/X/Jofnq3k8RjbWUmbfPoV0
         KHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708986904; x=1709591704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yW6b7vHWzc23cTrhhuOfq3gPLjukYQrXOHfFAODHzUU=;
        b=VJxuDvF+WY3gJxv7BInwefgOQzYMrUPPWXWwde/e2aCV96dgRgXNTPlu4b+rHJmsLp
         YULyEkVW+EkDvMeUEql8xKjfSgSsPp66HgiX13f1xoMVka4a3RYYjgO0qtP/zk82ups6
         eCsBT1BjaYfR7FXK6y8GMgaRg/jnn2z8djmM3j9gGqSbgTxP1ZHABgegzfiNc2UZJQBT
         c6VhbLZaYyNsu2p7x/BUQgZJN4wBn986eptZ8tCy6dP+iB4jYqKw40HkEZ3Ikm5wAQb2
         tsZD5vu0S0ZK0vQ67aibjzUY8Lzv2JyutY19UH+s5xar+JAQXdsnfTLVi309QB51yxh4
         9EQA==
X-Gm-Message-State: AOJu0YwI80EZTEzC1NQ5gx5RNwp+C6NXWh+nEACBTBbScvPeydskkeV/
	pdrKJYK9n9Ey3X87M4tIsti2rXhmRm+LuMWPET3s5t0TvUJ95FKx
X-Google-Smtp-Source: AGHT+IGbaV/6J14f7ypvOsDV6YPGhwZepMuH+vs8Zq2lOPlb3BJw7NABrrUWWAUneczPXGGM4Rb2Zg==
X-Received: by 2002:a1f:62c4:0:b0:4c9:d0ee:bd65 with SMTP id w187-20020a1f62c4000000b004c9d0eebd65mr5138863vkb.9.1708986904203;
        Mon, 26 Feb 2024 14:35:04 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id qj24-20020a056214321800b0068f9fd1d688sm3422091qvb.21.2024.02.26.14.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 14:35:00 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] kern-tools: depend on git-replacement-native
Date: Mon, 26 Feb 2024 17:34:50 -0500
Message-Id: <a4d11f7bde220ab8e1330754e2661c8d5025c39a.1708986570.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708986570.git.bruce.ashfield@gmail.com>
References: <cover.1708986570.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 22:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196227

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Konstantin Aladyshev <aladyshev22@gmail.com> reported that the
kern-tools require git functionality that was introduced in
git versions greater than the minimum project requirements.

In particular:

   commit 923a9de418b3ca8592c3 [kgit-s2q: don't run verication hooks]

uses the --no-verify flag to prevent local git hooks from
running and breaking patching or introducing security
issues from the host configuration.

To ensure that we have a new enough git available for the tools,
we update our DEPENDS to git-native-replacement, and the version
available in oe-core will be built and used instead of the
host provided version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 941160ea9c..8eff00821a 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
 	file://Kconfiglib/LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c \
 "
 
-DEPENDS = "git-native"
+DEPENDS += "git-replacement-native"
 
 SRCREV = "7160ebe8b865dd6028aef278efa219433db93f7e"
 PV = "0.3+git"
-- 
2.39.2


