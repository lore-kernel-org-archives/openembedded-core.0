Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844D1C0218C
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:29:04 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.18879.1737658097598939501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 10:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AGajOMRQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alexander.v.yurkov@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaef00ab172so208319266b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 10:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737658096; x=1738262896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RThDWMERWj2iHXmhbnyosIN96/jnZ45UckbOx4GEIEI=;
        b=AGajOMRQIpLd1+TsQgXSHU+uXzO1jB8vtqffY1s4viZviXdu98sUA1/ctDgpDcQ3qq
         qhFNfLbMFARvOEZ+IF41vwUljvPriWxwXsss8O4sqrsFkyfzSQ4eX4af6ZjkAbFGfewW
         oBbonmRyG1DE/Q70tGgWvuffMU1yFXWML40edAuuSAJR+iEw5YMLFUck0yQGz64DvtVy
         8fg3N4z44spq13qr/Oq8dGOQ5qX3X7nYGT/4+y/hws9Gj8vh07H5lCvG8k2v310B2hK8
         QdIjpg9IrqNwLQVGZMLDtFYS/OGfuzexhKeJgTD6EktBqkPwXuHYWSyqqABe0Qq//WSh
         8B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737658096; x=1738262896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RThDWMERWj2iHXmhbnyosIN96/jnZ45UckbOx4GEIEI=;
        b=wktTv9m88G5vPjhfyE9cJWHoaw2pINrbVO2JW8igR8Lwn8h3lNTq5NFC9+fra5E6Ix
         NzIINNWQbnZF1U0NDXr9VgAQO4AdloUnIJE/PapbT41CUk1otAYmwRcf415VzxYfpVYB
         fUdqEZXx3oEYJfT+bHGkZGBuRZ/rPcfk4bmnbgO3nDQWBtqMaFDbzmaowyazJscFSTb1
         zwR6YuiKl6IQNfyVY5utS8E7ZlweK8+5SS+acc2C/aebvrZkb3IifPRhs/ehlVBp/BKh
         O6IscXAJ4JPVgF2I2E9ZErLACyJQFmwpng7+0BlTDLT169g2+ctlBENvxrNFHhjy1eoq
         j8qw==
X-Gm-Message-State: AOJu0YwR7NhSBiuPucrnydP0zO9RiLMMC8+hYNQeHllnaG0AJskvxGjI
	W2KBunZPV2WABudH4FlcJTstt6zj4ij3Vc2dFBKTt2ovkSFqqcZGg9SzA6a+CJA=
X-Gm-Gg: ASbGncsrMMkN1eXLipIGJcxtG6jeVawZMbYCmAH4cAO9IzTPGe665dd0wrxeyoG+VTi
	0QTFJAOiesddlahmoJDl2j7XGVqnNWf6ldDb14E9MnUQYA6IrzHzdENDG+ZkqLxcT7X81ZKN0n3
	Mr5iNS5rbVL1txwublsQSS26GgrmYwIjozA8KwDxjC1JC8Lvfq+w5awzulQDsG4AY3cD8CldWOY
	KkcJkFfTEYqm0B5jvOkpRJVAMG7PkVF+jwf00a9etsnQpFxCDfDuQ77hVWU7AlOr5CZnLbbTpVj
	H25VGRcN+srWLvHSSOc5
X-Google-Smtp-Source: AGHT+IFbgLDEuC/bQHYkqa1zjNq+C8Ucfpek4nx7qVaCsxOMjMQwfPqEWaRe5pborto4SJyTVgk8Cg==
X-Received: by 2002:a05:6402:3595:b0:5db:f4fc:8a08 with SMTP id 4fb4d7f45d1cf-5dbf4fc8bf6mr19980520a12.6.1737658095510;
        Thu, 23 Jan 2025 10:48:15 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676117255sm2005066b.165.2025.01.23.10.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 10:48:15 -0800 (PST)
From: alexander.v.yurkov@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Alexander Yurkov <alexander.v.yurkov@gmail.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 2/2] classes: go-vendor: Change symlink creation.
Date: Thu, 23 Jan 2025 18:47:40 +0000
Message-Id: <20250123184740.1815534-2-alexander.v.yurkov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123184740.1815534-1-alexander.v.yurkov@gmail.com>
References: <20250123184740.1815534-1-alexander.v.yurkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210235

From: Alexander Yurkov <alexander.v.yurkov@gmail.com>

Create missing directories required to create the symlink.

Use relative symlinks to stay in the build directory scope (to avoid sstate issue with absolute paths).

Signed-off-by: Alexander Yurkov <alexander.v.yurkov@gmail.com>
Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/go-vendor.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index f3268c1125..6ec6178add 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -201,11 +201,15 @@ python do_go_vendor() {
     for vendored_name, replaced_path in replaced_paths.items():
         symlink_target = os.path.join(source_dir, *['src', go_import, replaced_path])
         symlink_name = os.path.join(vendor_dir, vendored_name)
+        relative_symlink_target = os.path.relpath(symlink_target, os.path.dirname(symlink_name))
         bb.debug(1, "vendored name %s, symlink name %s" % (vendored_name, symlink_name))
-        oe.path.relsymlink(symlink_target, symlink_name)
+
+        os.makedirs(os.path.dirname(symlink_name), exist_ok=True)
+        os.symlink(relative_symlink_target, symlink_name)
 
     # Create a symlink to the actual directory
-    oe.path.relsymlink(vendor_dir, linkname)
+    relative_vendor_dir = os.path.relpath(vendor_dir, os.path.dirname(linkname))
+    os.symlink(relative_vendor_dir, linkname)
 }
 
 addtask go_vendor before do_patch after do_unpack

