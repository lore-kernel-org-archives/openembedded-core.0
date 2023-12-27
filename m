Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACA4C47074
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 18:42:02 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.107845.1703702513327679215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 10:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iEz+G92k;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d3ae326f6so61489645e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 10:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703702511; x=1704307311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62AKEId2woukg8VCdNIMr6sxFEAFB84GqB/Z0iWvPPs=;
        b=iEz+G92kAu4KG29DmDjMiu3zga0z9XakrpG9+jUx5Lsqlrt8HV4BoT/6QrMqjxON0P
         7ImckO/XRtc+e2mT0DvdvKB5MM8yj8ylVeomK2U/5h5JNzngSW2/i41Bbl0t06saPTS4
         Y49k4NUAWgxCCQfRzIeA9QQZPavo2rZZ1R3ePVJZfgcFQXrLv2F8PPN3oE5CXjpv/daR
         qQbtKTK9oiNatfw2ifuQclpxMJ414FK9IgE5hOgTWgWClSRIQo2uj20QenqNrOxMPE5k
         rsIhRjfdjm+tYrk1LCrujGXU6N5obIE1uJTONtBQxseKWqXwEJDTWjDVwfiRamEjw6x4
         lR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703702511; x=1704307311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62AKEId2woukg8VCdNIMr6sxFEAFB84GqB/Z0iWvPPs=;
        b=UqwSlV737ysiKk2KDRahnICmFsInBS8DqMnM+Z00bsDrdd6Mwa/J5iITQeN3Nme85a
         D/YAkDNx5C+VLGYTGXoCz4paI4TAuGkF33xA6MIXJF0795WEvYXICItBggbxN3ZkALVb
         MiLVLGVRTBZQ1TxvpG9GP15jCG/XIeQHHQzspbtuKPxlqHkYgMiqlHYMc9IrizUh46k2
         zPNH2o9sQuUraLc0zZ+dg0EXqlwpkXhFFAR9vPihk+VVGrQit7JrOiQbGVKQQ7aR5zmt
         FMzxrQm4AviVnQ21JKAsSGIeXkIEKb5mqxFMHj+9duKQJt1kGbzRpQ6lxO7Wb3lyx6q3
         7EVA==
X-Gm-Message-State: AOJu0YyCbt+CJT4OJ+nwLwtECNrdgBwv6KstXwbVH1Gpnlu/v1fsj9mF
	Zs7ObfOZ4/2lR9J1MpeSVWEGLuIivrw=
X-Google-Smtp-Source: AGHT+IFPXnPERtL4SM7bNyZFw62DhEkmbZaGRzLw4N3tLxz3/5BabSvXIw8i6pkydbwIxGMRvoR2qw==
X-Received: by 2002:a05:600c:5198:b0:40d:59ee:d5da with SMTP id fa24-20020a05600c519800b0040d59eed5damr1595733wmb.8.1703702511079;
        Wed, 27 Dec 2023 10:41:51 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id je17-20020a05600c1f9100b0040d1450ca7esm32680977wmb.7.2023.12.27.10.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 10:41:50 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 1/8] devtool: selftest: Fix test_devtool_modify_git_crates_subpath inequality
Date: Wed, 27 Dec 2023 18:41:41 +0000
Message-Id: <20231227184148.4374-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231227184148.4374-1-alex.kiernan@gmail.com>
References: <20231227184148.4374-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 18:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192958

test_devtool_modify_git_crates_subpath expects 2 or more git URIs,
change the test from Greater to GreateEqual.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 47353dadff93..d733dd158106 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -940,7 +940,7 @@ class DevtoolModifyTests(DevtoolBase):
                       'This test expects the %s recipe to have a git uri with subpath' % testrecipe)
         self.assertTrue(any([uri.startswith('crate://') for uri in src_uri]),
                         'This test expects the %s recipe to have some crates in its src uris' % testrecipe)
-        self.assertGreater(sum(map(lambda x:x.startswith('git://'), src_uri)), 2,
+        self.assertGreaterEqual(sum(map(lambda x:x.startswith('git://'), src_uri)), 2,
                            'This test expects the %s recipe to have several git:// uris' % testrecipe)
         self.assertTrue(any([uri.startswith('file://') and '.patch' in uri for uri in src_uri]),
                         'This test expects the %s recipe to have a patch in its src uris' % testrecipe)
-- 
2.39.0


