Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DDEC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 18:17:47 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.30610.1704478659808520051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 10:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UiUFbxq8;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d99980b2e0so1349871b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 10:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704478659; x=1705083459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KeE7Lac6P2wLS0apxNqfLy3CEmFpgGDjSPbK2HExIYQ=;
        b=UiUFbxq8Eg3ziUKLDIe0VEXhDY92Oedn/XXf7NbbikHoF85kptX32GGR2hkxZbr+Fx
         Dly7ouxNw2qAH9SV3oqVeW2zRphAXHvrX7fWE6Uy8j202PkLHLB0SbJAnJi78U0gMKus
         sueUuEfjKB6MtTLXxdaMDBD9yWb2ACaGiMLpchKPGho+rquBaBqnWLYwKvWPBSZilqx8
         /YmNCXBc8OpXGGfou+uVrl5eTVERWzYFxP7FIE7lGjsFB3M32PN4BUkq87n4Soa3tvMv
         Kb67V/zl3qkd5H3mur30+3iIG4Rv04dPqk8DeMvDcFPpWj41wzjCC3CxnFpGdRj1pUmb
         i/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704478659; x=1705083459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KeE7Lac6P2wLS0apxNqfLy3CEmFpgGDjSPbK2HExIYQ=;
        b=G5bfeX7jXoIEBm7vZ8t/M37uqrPpkhZsFikTS2Rrrrc2PbySkxq7i7AXvN9kUa9RJL
         xE6PWIpeHfxV8X3SZX2AjWFa6D/1u5WnuvDWBHrDq8ZrYPhTTULeGgsELrClYMukR8nG
         ENqU/nt/KZS08AG4efo39kDOy8XFuhQf12bxat+NF800h9TSKvrDtelsuYfcT7gzCFLi
         /VTY9SlwzjVsHhUdzFH853SD5EoqzmsxpzyzNIxn40ogXbMWsYVK7XWrz4cH36xGHjvl
         K9Y3g3C/8kZFh7K2KbCXOSarEEhuusLoGTYegXDsaE7J7qCXscgBh4F4zwrOZPMVWaZA
         vi+A==
X-Gm-Message-State: AOJu0YynhQX1yspgmRUx7z2R58xmGOL53SAetBtTp1UFvdgXbvVDMm6z
	lLCFB7rENOiE0pfZ/lyY2Epu1v4YgYM=
X-Google-Smtp-Source: AGHT+IE8Ouq4W+WayGNpRIov8PmowAmlUNmvHKiyMP3z1kvm37QWuUAfXdGYUFN4toH4S5yqBKaBRw==
X-Received: by 2002:aa7:9846:0:b0:6d9:a1d0:180a with SMTP id n6-20020aa79846000000b006d9a1d0180amr2395258pfq.58.1704478658880;
        Fri, 05 Jan 2024 10:17:38 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:1ef8:e4e3:e071:1cf1])
        by smtp.gmail.com with ESMTPSA id o128-20020a62cd86000000b006da3b35bef3sm1752318pfg.54.2024.01.05.10.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 10:17:38 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] python3-attrs: upgrade 23.1.0 -> 23.2.0
Date: Fri,  5 Jan 2024 10:14:53 -0800
Message-Id: <20240105181452.1488396-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 18:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193377

https://www.attrs.org/en/stable/changelog.html

23.2.0 - 2023-12-31

Changes
* The type annotation for attrs.resolve_types() is now correct. #1141
* Type stubs now use typing.dataclass_transform to decorate dataclass-like
  decorators, instead of the non-standard __dataclass_transform__ special
  form, which is only supported by Pyright. #1158
* Fixed serialization of namedtuple fields using attrs.asdict/astuple() with
  retain_collection_types=True. #1165
* attrs.AttrsInstance is now a typing.Protocol in both type hints and code.
  This allows you to subclass it along with another Protocol. #1172
* If attrs detects that __attrs_pre_init__ accepts more than just self, it
  will call it with the same arguments as __init__ was called. This allows
  you to, for example, pass arguments to super().__init__(). #1187
* Slotted classes now transform functools.cached_property decorated methods
  to support equivalent semantics. #1200
* Added class_body argument to attrs.make_class() to provide additional
  attributes for newly created classes. It is, for example, now possible to
  attach methods. #1203

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Requires python3-hatch-fancy-pypi-readme upgrade beyond 23.1.0
https://patchwork.yoctoproject.org/project/oe-core/patch/1704180223-8624-1-git-send-email-wangmy@fujitsu.com/

 .../python/{python3-attrs_23.1.0.bb => python3-attrs_23.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_23.1.0.bb => python3-attrs_23.2.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-attrs_23.1.0.bb
rename to meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index 314053de081..e00e1520156 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "6279836d581513a26f1bf235f9acd333bc9115683f14f7e8fae46c98fc50e015"
+SRC_URI[sha256sum] = "935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


