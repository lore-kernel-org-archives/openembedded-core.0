Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA7BC46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 15:50:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.186687.1703951402037715215
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 07:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D06qELfZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d3c4bfe45so81030065e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 07:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703951399; x=1704556199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMQMz5RwObxPdaJCX+WLb89yxhUyvNqjK+9Z5RAobEc=;
        b=D06qELfZzIZHPWoh4/JBLphYNyStFMjkZXRmx6bitGhmGdkWfiZB8KVaxfv2ObDhDj
         dPfW4nBX8xgh1DAYMRkvv8blC3clV8QWjQ+oAxw0nySF7diDqNQbR9T/gLuD5euMH5G8
         OwQj0ugN72TF88lzhgJyJPJvXA8w6LOKYQG4QASoZPibNpLodedo15wjECLUBSH0hG2K
         k1M8Pk2v/FZuP15nlDX5YamMKEtUynZ3lEjOEVmaSLAP0ZpLpbjBsQwbhp1EB5s8KaQI
         WZIs1TRjvHcSX7oI9Zadfx8omV7xAHfa1mqswCp6/og0xmSGXwtt1znLO3FFfWzEQ8Rz
         BKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703951399; x=1704556199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMQMz5RwObxPdaJCX+WLb89yxhUyvNqjK+9Z5RAobEc=;
        b=sxd0VdXI+mt+PFUiQRfu54MaK6ejEkPtwMw3ttWID/umwvsrxcAbRqJ4FywYdvaW2K
         75CDwQ0zIPnsc4T1MAfN/aqhSRVcgFirK/u74hi7MF3MR5wBrzEE18dk0nwP/qUskcfM
         C80b8nsLlwZafUMX73kA1mu9Fv93i7oS9foFvdo7VtjRjBoIwZV2UG7Dd7oYJclaysuj
         4StW3dW1RCr9YTgXxSvNbtoHFSSKi3GdGhEvCy9mbaq7F4AE5MZ9BRny7UYyxoxFTEgs
         pDK+hqbpNOl5lf5hIt4MST3A4RMi62JFVPmDddw3UuvXAK9vstutpJJ17coaBjDGat8/
         7Ofw==
X-Gm-Message-State: AOJu0YxYxbuzFfR+jWcy70U2LpVP7TFKhVDEDnOPfV7Qxp8vqdNAb8ak
	xu7bb4/PfB8rvDZKE7L9AVdV7QeGisU=
X-Google-Smtp-Source: AGHT+IGZwH/8LMfdEmnuCos8zk7r7BzHXIaDVSmZf0OF4/6kE5IhRn8MqsOSya/lotWBagyAJDML9A==
X-Received: by 2002:a05:600c:3306:b0:40b:5f02:99ba with SMTP id q6-20020a05600c330600b0040b5f0299bamr3325392wmp.121.1703951399426;
        Sat, 30 Dec 2023 07:49:59 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id w5-20020a5d5445000000b0033660f75d08sm21777428wrv.116.2023.12.30.07.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 07:49:59 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 3/4] cargo: Move vendor directory to registry/src
Date: Sat, 30 Dec 2023 15:49:52 +0000
Message-Id: <20231230154953.8135-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231230154953.8135-1-alex.kiernan@gmail.com>
References: <20231230154953.8135-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 15:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193076

rust 1.75 has an assumption from 85c0ce24cc74 ("remap cargo dependencies
to /rust/deps") that unpacked crates (vendored or otherwise)
are found in .../registry/src (usually in ~/.cargo). Moving our vendor
directory to match is the easiest workaround to avoid the upstream
assumption causing issues.
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
This requires the concomitant change in bitbake to use
CARGO_VENDORING_DIRECTORY for unpacking crates into.

 meta/classes-recipe/cargo_common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index e932ada862bd..3cb21cfddcb6 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -31,7 +31,7 @@ export PKG_CONFIG_ALLOW_CROSS = "1"
 CARGO_DISABLE_BITBAKE_VENDORING ??= "0"
 
 # Used by libstd-rs to point to the vendor dir included in rustc src
-CARGO_VENDORING_DIRECTORY ??= "${CARGO_HOME}/bitbake"
+CARGO_VENDORING_DIRECTORY ??= "${CARGO_HOME}/registry/src"
 
 # The directory of the Cargo.toml relative to the root directory, per default
 # assume there's a Cargo.toml directly in the root directory
-- 
2.39.0


