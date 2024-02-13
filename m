Return-Path: <padalkards17082001@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADE5C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 07:40:33 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.6559.1707810028914392507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 23:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TU7WFe+P;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: padalkards17082001@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e1270e8cd3so1661533a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 23:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707810027; x=1708414827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tentSwumwkCzofmx7tz+JAT1E8boTTnYXM/mOoh3B0Y=;
        b=TU7WFe+Ph1rP75x8OUgvWXbRk5di5XdoaTc3g1Qb3kgDfjbEVGNtFztVxJ6yaj13mR
         sdMB5Zw4nFIRLhOmSA2zt3TvSbh7zgEVaWfgdl6cSKi2dA19bhdOopNwGfJgbUbWOe13
         /HqKDpyFU6yPRV6JmBnGq6hES7jg60udsensPlF5q9NLuZJYv5Enuin08kVXoIQsOEYh
         SQX5Z0nidzRdMKorQOwl99BK09foG41xDldjw+wEALF/ZmklG4tijtjkiinHdZ6OkHUe
         82qv/0mQDCLTbZtIVXS7oz27Q404QgqK9+VbKl6MQAra3WySwvY9U9gBkPQvIOC3maV5
         iMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707810027; x=1708414827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tentSwumwkCzofmx7tz+JAT1E8boTTnYXM/mOoh3B0Y=;
        b=SXSn1W8Ebf5ZmH7JEWDg9WWwkFvXn4chEopnh8OktlC0zQK+B1LwpQlENAxVThxvQd
         0SypTZhphEhdJs4LDjARteI4bjmfFrdd23UrMEZFhVgIr5AgDx0WeUVCX0rwmsBX43A9
         S0ftTurR9nFcv1/kJKxRt+4f0miDzVak76GHGsxdHyYwBstfOgW32F35cGhOA8u77+I4
         UuGWFf/mabo8HOUXUOPEhHBPEXuuUfKOgzIjORYo/3dJKcTPJmjUbf1/H58HLycR7mi9
         +P+oUvzSfpciVb8AoEcKYfLYx4TFuSbjm/+S+a8MDtIRea2Ab8n9U2dLhDGqKppxUwut
         I6xQ==
X-Gm-Message-State: AOJu0Ywk4jaGVSCc43E+MWD0NSJDkrEGN0NsBn6iD6GtRCg7A0t1d9IM
	+wUzL1nQ2MgAZQVVXEooXA1pymt5S9kTc4AfA9DayjDyYmMAKZck3Q23QSQ6vSJ9knxn
X-Google-Smtp-Source: AGHT+IExsXkVBCfOYRAU8oLnsFfFxWvcnj6GE2JMWyTdh4aANdRBWpVsYQGLYKxxz25ErNfTdZj8Zg==
X-Received: by 2002:a9d:5e1a:0:b0:6dd:dd28:c711 with SMTP id d26-20020a9d5e1a000000b006dddd28c711mr9065881oti.36.1707810027700;
        Mon, 12 Feb 2024 23:40:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUon9F9Elu/hp2fkC4QnalvVwqRFlJAFAriRSeqzHUvxaHbPehtlC/QCFKIDM1fn1qS3/Zv9PxcKHqbVjhG/AgWeYE+b1M4VTBbpvJH1UGsidxJmbMAEy2HcsRu+2Ec8aHFn5qVWt5a20fHfeQ3wM1nG7AUg9Av9LM=
Received: from localhost.localdomain ([2409:40c2:1026:2ce5:725:15ad:283a:e537])
        by smtp.gmail.com with ESMTPSA id e15-20020a63544f000000b005dc884e9f5bsm465137pgm.38.2024.02.12.23.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 23:40:27 -0800 (PST)
From: dnyandev <padalkards17082001@gmail.com>
To: openembedded-core@lists.openembedded.org,
	padalkards17082001@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Peter Marko <peter.marko@siemens.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [OE-core][dunfell][PATCH] gcc-shared-source: whitelist CVE-2023-4039
Date: Tue, 13 Feb 2024 13:08:09 +0530
Message-Id: <20240213073809.628744-1-padalkards17082001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 07:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195369

From: Peter Marko <peter.marko@siemens.com>

Concept of gcc-source prevents cve-check to detect existing
CVE patch file.
So whitelist this CVE in all recipes using gcc-source via this
include file.

(From OE-Core rev: 04511734c6dc8c7dda3a943b385cd273d012d8c7)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit d803ca653139aa2d6acb4f99469c76a9d232b307)
Signed-off-by: Dnyandev Padalkar <padalkards17082001@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index aac4b49313..4baf7874d2 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -9,3 +9,6 @@ SRC_URI = ""
 
 do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
 do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
+
+# patch is available via gcc-source recipe
+CVE_CHECK_WHITELIST += "CVE-2023-4039"
-- 
2.25.1


