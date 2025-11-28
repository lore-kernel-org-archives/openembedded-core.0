Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3F2D116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:37:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16133.1764337043087594399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 05:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TUPCA2N5;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so12475355e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 05:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764337041; x=1764941841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=besa97OqOKI1OsCFQGbXHg7Tg0B9xGS0mvVM9XoHrGc=;
        b=TUPCA2N5Mw0mAgrZdUmHBL/nXFcWwbxAlfHIMdtUlApmRwshmdgeRJLAYnwA3Ahzrc
         vTekLRUxoaSZbXFSvGAvlFFCVZaByu/2nbMxJS7/fEPbZQVVhWA24D/sMfYEhqDnXLX4
         tQci85UiB4qMeVDIFrf41k169DpztAbEIb+ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764337041; x=1764941841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=besa97OqOKI1OsCFQGbXHg7Tg0B9xGS0mvVM9XoHrGc=;
        b=n5nDduTk2YYOHkBQ9EkpWb6DN/ezNsQ3RidI0b/VwzXTKcuE+ihskytjmUwrGK575i
         4vdBSRMWadoKtdc/9/6lfewdoYKKjjrHxqxFqZnjWmJGVagu9zMjYmCHu1WWy9+EeRJT
         HVXn92DP74sr2PDFMbsBDNVh0phVj4d7EoB1ZdSK5qNXumHiiHqc0lvI0bPz6k0tT9K5
         9bFoWKPG47IpN+x86+6moriOSAnUXfYZ+P5XrNfu57hyUE0yoduEeiOblTNglDcd4iGA
         pomJILgW7Y251gcIxdVk8Ph4OpesRzO2Ag2gvhj4GiEbE8yy7yMIxi9uSiyMHtL499j+
         N8oA==
X-Gm-Message-State: AOJu0YzDEePD3RtzqfTk0bTxvDol1xScBOInCXSlkeVMJZCZeMgV8hDm
	qpmPpjpIlt9vz4cG+t3SKb4SijZYByYwyyLl7dPcBOAUxE9L/tt98KIpNTEZjz8TSdd2C8MUH3f
	rzZqm
X-Gm-Gg: ASbGncud7FGwYF28MPfjtDTYeoDPp/eMOlqnBu0cAqzTb3xyr5AMaV/JL3KIDT4mqVd
	vnYVbnouoAIu4NukaOOujYBOyJKnBxfsLralUnHHFIvYreZxynXQYV5s2Lvr4GTqQh0Fdr7WH7r
	h5c43XVw7JzuKQqbmKjwyOsJfgNzlEXul+3T9B88mrCbcrXgXEggsMKOnP2VlOztbLVMK0mg+ft
	sFh8riSZ7jGPN4z1A74gZHDjJ1RWwP8JjkLMHCztcV3L8ZnRgetJCMFFkmmsigSTZUsGeUvAVSt
	x5u/mdWnLlI4971ZVZrob9yoTlspQ7BQwclHYO8Xd7U4n72WLNaS5eEvRKHsuMykINyvzXOvGBI
	QMh7c1lwgbTZKpqW9TCsQ/xogLe+irbkCcWXV2oc1awXn5NS3P9qGIIvFdgfZFvzYxUG2v/UH7F
	4+z/i6DxpazUTOmNyJ5BmcbU1AG5ttTdfvMu8=
X-Google-Smtp-Source: AGHT+IE/eS+nKWzLwomK26DHaWNYXG/1cbVcjDYX3Lm5pB/pGLiy7qNWmq3AAVtlhXfkdLzWa744lA==
X-Received: by 2002:a05:600c:3b1a:b0:477:55ce:f3bc with SMTP id 5b1f17b1804b1-47904b12f1dmr155560435e9.19.1764337041159;
        Fri, 28 Nov 2025 05:37:21 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791116c3c0sm86999805e9.8.2025.11.28.05.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 05:37:20 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 2/2] gobject-introspection: Upgrade 1.84.0 -> 1.86.0
Date: Fri, 28 Nov 2025 15:37:16 +0200
Message-ID: <20251128133716.3635989-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251128133716.3635989-1-leon.anavi@konsulko.com>
References: <20251128133716.3635989-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 13:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226910

Upgrade to release 1.86.0:

- giscanner: Added ability to add wrapper script arguments
- g-ir-tools: Support reading @rspfiles for arguments
- Update gobject-introspection-tests
- giscanner: support alignof expressions
- dumper: Fix introspection binaries missing rpaths for uninstalled
  ELF shlibs
- meson: Fix fs.copyfile semantics breaking GIR build with Ninja 1.12+
- giscanner: Deduplicate arguments and use response files for MSVC
- scanner: Prefer some getters over others
- girepository: Initialize the async functions parameters

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-introspection_1.84.0.bb => gobject-introspection_1.86.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.84.0.bb => gobject-introspection_1.86.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
index dfdb1eaa03..f8eab2797f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
                     file://girepository/giregisteredtypeinfo.c;endline=21;md5=661847611ae6979465415f31a759ba27 \
                     "
 
-SRC_URI[archive.sha256sum] = "945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794a84779"
+SRC_URI[archive.sha256sum] = "920d1a3fcedeadc32acff95c2e203b319039dd4b4a08dd1a2dfd283d19c0b9ae"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.47.3


