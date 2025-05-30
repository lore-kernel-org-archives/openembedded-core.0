Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB59C5B552
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 21:22:36 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.466.1748640154425252560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 14:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QuYVq7W4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23035b3edf1so25090985ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 14:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748640154; x=1749244954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggTZ5pKw9yVcc69M6bz2Lx73afs5kI+c4TeoRSWWGNM=;
        b=QuYVq7W4zAJRpIMad/HDaVQ0RZ+W29x/JPmW5RcHqEzFQfRQ3jRP9SxrBKRv27BNDz
         iPRwTwQHeruew1/VBo/Fae4ETgYGrSYJlOU7RY7Nu8n+Lov5YOR2gEn6grmfXqc+/Bzq
         lNHBT1Rh8UUj3FtJRpuZdtpW+S9a87oR5D7TimjlWTNLZzUHA71FJeBqsM/6CeR5zGCR
         oMDFXGpcfBAPwKFPh89GzDb1Ce1ipXr8eG1wN5wJqOsqVa8S9nRYDUZbts0CRs+7jWLg
         FGx9Z6cIDbGj05zO8VXkXwq3G+L0DPr8+wZJP09TfHo63pkNLaxwVxnPN0CTxO5gM3E7
         Xp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748640154; x=1749244954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggTZ5pKw9yVcc69M6bz2Lx73afs5kI+c4TeoRSWWGNM=;
        b=v59EWfnX+QBrUdidKJWTC0ihmhHuaxsqmI69csnCOqwwRC7Y0nf7+aS3q0CD78cWE7
         KIMriOG93P2h8HgmXiF95GwAE9nex+5l5XjnQdYFA1SjnGYjB57hHJCl9yTNA8Ai5kfB
         vYaAnFnRZtoknVOYP8U5vNT8B7+giKPtRun5rOWpIoaiKeQt66gKP0/b5WBaeiA2SWz9
         lJwakpHG4QeH1e5tmQOwv30m6a/NeZHKVCC1MqincFOxXwM+1pE5QK3/ja+44TH22CGU
         6iayjViBP3QDWFUvaW8fItl8Tj7Z/oCYzkpve6G1WbfbcSGKNgrF37RD+JysvoBQJCH9
         hHlg==
X-Gm-Message-State: AOJu0Yx8OfX1Hw8y4j+qzHHhK8rHQ/4DO4yHQ09h4NZRZ0OeV/TfNFL8
	MbhYXRwrZMl2IBND1ixxGHu2IsKl+utxsA+SLvxRZj6qbqfvr5FsATm0A1IXS49S7cGYuod4Bg9
	DeXpt
X-Gm-Gg: ASbGncvu8gkzkxM4c/5nCa2wFuCZF61RIEuXz9TY1WEWd4h+VSLiUcVBW87M/0/lSyO
	DNL1DdWLWAa1XuXUoAK7c0KrtLa8RV/RaDAB4l+I30UPnNJ1O8+SI1rLTw+eAw3C7q25SVZ3AEb
	dSkbDVqYrDyXmQryM6IpvWrXL4HhJwDTrgUyFdud3E+PPIoKFsEtIXwXEoWgIsXxBxrSiOugczt
	+4aANhjk/sHmyZz41Pajn0P2ceS1XjksYsj/SEmPSjMEf4hvfZL+WdikBtWSgJpk1/c1HlH9TT4
	I2dpwdNP5oVlyalveV43yWXs5bY2pGqRjvjSpm7kIyU=
X-Google-Smtp-Source: AGHT+IGKTe7f86HFF8AdKUYkjLz+UVMzu1wBsaLg6ZoybOS5h3jGbswq3+cToYvI1krccLFcOMocJA==
X-Received: by 2002:a17:902:ea0f:b0:234:b41e:37a2 with SMTP id d9443c01a7336-23528fedc2bmr74464405ad.11.1748640153710;
        Fri, 30 May 2025 14:22:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be2622sm32621815ad.102.2025.05.30.14.22.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:22:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/14] ghostscript: upgrade 10.05.0 -> 10.05.1
Date: Fri, 30 May 2025 14:22:02 -0700
Message-ID: <09bf4cd558665e1408ddaeaa9490c60592d2ac13.1748639952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748639952.git.steve@sakoman.com>
References: <cover.1748639952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 21:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217550

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc9ba7005fb155f4d5f2be9b23c12d14362a306b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{ghostscript_10.05.0.bb => ghostscript_10.05.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.05.0.bb => ghostscript_10.05.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index 1d05945c30..bd34058517 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "56e77833de683825c420d0af8cb90aa8ba7da71ea6fb5624290cbc1b53fe7942"
+SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.43.0


