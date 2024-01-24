Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2703C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:58 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.23145.1706104912402084020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yI+pxpBL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6dd6c9cb6a8so1506201b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104911; x=1706709711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYuCiA9yB4bS9/W8soKb9WvQPk/euuG2A7GY1f5mVqw=;
        b=yI+pxpBLDWpppQmQ0fNeOF1K5TihRI/TJRFEK0q5NJR7e5n3vYu8bDg+QtJB/FiLi6
         uwz4gyyqW/o3eMWWJdK8lpmuEwiMenKKHi3kAI26/Arg8ni87YZ8mS4pwo4SGzl7OD5o
         9qwNEyb3ARr6VN6U9p9vlZrG+a5rGcjVg66ODvH+p1BAtj9R0eLTNwD3SkNQVFRA/Hkx
         OwqmbJxhKDJyYWpR751hj6i/LBMhXUVzBdW7KZxhm/1fRuKwKm5uHLxKrlqLHWVhooDA
         LYbkG5q4pGEN9adhoVXf/bnUhFHh6HB23vCS6XwoQLyAAIx5qwFvvjyGp6Yl208TDzcG
         XDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104911; x=1706709711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYuCiA9yB4bS9/W8soKb9WvQPk/euuG2A7GY1f5mVqw=;
        b=s5RrCFSZmYusjawCuFO419x9a7FH+oRH3CC/v3iUo4c4UR8xahZmxsZKNaOFO+Xide
         nGp/UpUMISZRtn10H/VwbAUc1J/JrpZ5aFtZ+dnMRf6v0SeLcwSgQH93IyQ3vr5cClMY
         +QY/C5GierwZ5Vkqef4kRmnxGBYNXNUEVT6+tzuYknOBh4oWlwT9Gvt0N97lVk2aSllF
         Hcp6N1rU4xUJsx/Uf+ziKwTqcOTNzij2CeCRDkIpKYwpP6lQruZEnzPQxuRr7NEL6slB
         LzdKq1JdT5ByGCrvg7kZ/4eQ7IIjfh9AvI6Rdm+1gpII5HCdeXAwjKg59eh73tvWSM35
         7mXg==
X-Gm-Message-State: AOJu0YwgE6nY1T0caK7aEoVbPTn33WOHziGhGE7/WOPBxKchfdIleLD/
	L/ogjJILgn1E0+Kp3iAde9DATBp4gKG1Z4AKTrJeqx3CsNW+dGHfR85wPhAcKS/yjG5hdyqM3BW
	/UpU=
X-Google-Smtp-Source: AGHT+IEzQRYqbxofH+gAfL07zlWr5OJ2nG10ymIZqeMaxxTEwiTtRenAyrqthSyqt67pinFCY7qakQ==
X-Received: by 2002:a05:6a00:a1e:b0:6d9:b9af:41cb with SMTP id p30-20020a056a000a1e00b006d9b9af41cbmr6117804pfh.14.1706104909604;
        Wed, 24 Jan 2024 06:01:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 11/12] create-spdx-2.2: combine spdx can try to write before dir creation
Date: Wed, 24 Jan 2024 04:01:14 -1000
Message-Id: <1b90a9c9c8180c080f780c8dd428fad3f55e879d.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194287

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

On occasion a file is attmpeded to be opened prior to the
creation of the spdx_workdir. Create the directory before
the open, just in case.

File: '/build/layers/poky/meta/classes/create-spdx-2.2.bbclass', lineno: 1081, function: combine_spdx
     1077:        )
     1078:
     1079:    image_spdx_path = spdx_workdir / (rootfs_name + ".spdx.json")
     1080:
 *** 1081:    with image_spdx_path.open("wb") as f:
     1082:        doc.to_json(f, sort_keys=True, indent=get_json_indent(d))

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb9f2a9c0ff5dcdeaf1a0beb6a614d0d022a2481)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index b0aef80db1..486efadba9 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -1075,7 +1075,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
             "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXID),
             comment="Runtime dependencies for %s" % name
         )
-
+    bb.utils.mkdirhier(spdx_workdir)
     image_spdx_path = spdx_workdir / (rootfs_name + ".spdx.json")
 
     with image_spdx_path.open("wb") as f:
-- 
2.34.1


