Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEA2C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 21:49:16 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.267.1707947351800225605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 13:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fD/4PE3U;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: belouargamohamed@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-46d3d03bb35so50538137.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 13:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707947350; x=1708552150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7B34+y3Errw7/xtf9AjTRT4wYGzyjVro4oYyM46B4M=;
        b=fD/4PE3UTU3hqid9FKsuQKKhuYrtsU3bgvL97IzI5Df6GRrXNULpkbGqKa8wwZb9xO
         4FvGgT8psw/Zn7EJW0I8xkK+KNdS97HOw4/zfO0GPlbd+ziOqvgg/L2gcOEpSXNSQktN
         IGMgB1lwngW3c8FZtg9Xn5kEJ7YB28fshdrlGYZ466MenAKZzYs/Lk4dOjpeW/r1SbeI
         WbD7XeEWdlziuMS86CUM7iEemPd1BqL7+xaw9dGuw7lApo6QvfibH0NrlQoxmAUSn0fU
         fWTnADOPkQX8grZkCoU9c79pZ+0OEH90lgXau7PMPMsTZ0uLQ1SOhDUJ7A/GK28EQd/Y
         KXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707947350; x=1708552150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7B34+y3Errw7/xtf9AjTRT4wYGzyjVro4oYyM46B4M=;
        b=STp6gi1YvXcox38sRX8kbt/ekH9uo2g3fVMgiN0/dru+ytzguFqM7MLd8F9wyRozhO
         DHZIUhShRgEptgdTDtgx8odJiF3voq2AtRGVm9xHbP+sTFTikMTrYZX4NHaSseRAmKs6
         LNGt8yMLtOwxUYmNmrHblmlTiV9aIzhO7divTiOwM12EdNllHuXw6ZfYkuwyB5Lr0aFc
         NwaI5C3nFE6M5/RqaQRZZkN0xLRwwDTUn5qz1sgUEgU3yoZOeU2jotsxcQEnpD8c6euO
         Cqg2UdpoFrc3uyV3GG8cZVvkZOU2g0cI+QeOUN8H2USn4WJ8KCmOdHIaHT+QFbLIwiZL
         gfFA==
X-Gm-Message-State: AOJu0Yxn1pImAH6fkFsPgV743HRPwg2MepPrLiUF4HxjGjoOYm5Hx/mD
	+fyjXZ/stG8aMFDhAmyEU2KwZugc6JzSLM/pLckCipJZaIi/wCXQgpZ5vIc3CB0=
X-Google-Smtp-Source: AGHT+IHAqO9FfVGnQ75q1bEetjfbhO7IVwb4MCTTywz2GT199/adaGOhZUOTWlb6u19f2wrIF6VJvg==
X-Received: by 2002:a05:6102:3713:b0:46e:cb36:e0df with SMTP id s19-20020a056102371300b0046ecb36e0dfmr94760vst.28.1707947349966;
        Wed, 14 Feb 2024 13:49:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXCNBPkMvTyf/tcTDuAOfYita49i6ldKBi9ihRg+GfUfGwBh3VawYm/Zq+H+LiRret2jTOe7fscPlDojqE4SlNaktZPh0/H54KsRex9r76UQC94jqcR
Received: from localhost.localdomain ([2a02:842a:10:ba01:9163:853e:e30e:77c6])
        by smtp.gmail.com with ESMTPSA id 71-20020a9f22cd000000b007cea82bee1dsm1874392uan.1.2024.02.14.13.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:49:09 -0800 (PST)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [PATCH 1/2] create-spdx-2.2: Correct the default value of SPDX_NAMESPACE_PREFIX
Date: Wed, 14 Feb 2024 22:49:05 +0100
Message-Id: <20240214214905.149929-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 21:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195500

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

This patch corrects the default value of SPDX_NAMESPACE_PREFIX as the previous
value is not expected to exist.

[ YOCTO #15398 ]

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 486efadba9..dedaffc043 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -28,7 +28,7 @@ SPDX_ARCHIVE_SOURCES ??= "0"
 SPDX_ARCHIVE_PACKAGED ??= "0"
 
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
-SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
+SPDX_NAMESPACE_PREFIX ??= "https://spdx.org/spdxdocs"
 SPDX_PRETTY ??= "0"
 
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
-- 
2.25.1


