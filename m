Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82A5CD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:24 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9409.1777739481797943337
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L57GuDE4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cf7683a28so1658535f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739480; x=1778344280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCCVpiDOANVwOjGpi2YrkEh9WO5tofJoHCWq5w+BT1c=;
        b=L57GuDE4pZzWSl0elwo4DXXJUh/QmEHumTu35knW1VWOGcwQEOpxkaMgjAtNiyvSA1
         DN4ntgSTKbztc2q0ZHklXDvg8SamlAouCTiCHp0AbzHpZg+eH9Q+j4aHogCcw33PjFIh
         yvH17oNQYEepIlOwjzxm11wGrC9AeczW2SbNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739480; x=1778344280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tCCVpiDOANVwOjGpi2YrkEh9WO5tofJoHCWq5w+BT1c=;
        b=X/E2Ap4VJKY1rJQgTGzuMahFvld4cnd78RULb4KCpstKgvbAaOjun+Cto9BKXp54hw
         RypvGnjvMPe9VDdonvk1pApOscGpQGV99xwanF8j12HhUfh2XepAIJhNbgKU1JCjC+ky
         aeYoXTSXDwbiKI2T8bNrbSWvxA49YL7LcIUDusIfAr2o22+I5EjIj/xSTt93dI91l7Hm
         ixQhFf1k5YWe8DoXg6in4NX+sV/lN/5h7x4QR5VdIzL3SGc6nIbanPS9J4Hh3cq+IrVB
         GvBsGDGueWjlaiSCS83MWIaPdYLyN35W7JcNFSZFxKRG1KmQb5/+/qG7pdU7aXruXFHt
         l8QQ==
X-Gm-Message-State: AOJu0Yy6s+ZfN1ICMGVTgVq4zs+efj0oB047r1kfP9LGgwK3tlgpmmbF
	FEXdIL3OB8JNSNSNYj+f46XvL0VH1B9Dea8o60xCvfQAd/oTG4LYLnTAJr3Lz20TZbSB1wcXzN/
	8waqH2LFsa5ZUy86O5LazHDip2oQznItxWqA9GKsrA7H7mBgVDwHmsLmspIck3CRpXQwA8IHv6O
	swDRzySRWnb3Fy99M=
X-Gm-Gg: AeBDievu7KceH3NOMEAO5fZklKiEjtmvBjlro4wmsGoxcJl1gGpVXbtEiTLtlbfTMop
	Y3kACy5aZ8CfP6KqjOkyi2uRrWBbS9M61EYLscRmPe/6MgCs6WhF84dlX36xvrbtUA3b8kBXsP+
	sDw0IBOkvvbAaAQe1MdajLbcihQtYU99pP5dQpCaGPihdkPk88dBKjQaRA5mIm/2mfngi8/wvj/
	UQebzhdOz1CCkfCNrmLVR63BamBqG6YtGA4PXVNwKFs0eFjlNDlq6DigJxe4FWHLFoE/zhKrcj7
	Vfu2mnzTyoSJ1TaOleYJP/NixuZQAJjZnP/up0h18eNDxHutgxbdITy4Zv4m5JYkTPax1MH0o4+
	Bv4eHWRqrKl7w0j0eIAeKnY0CiY1KQceNUVbeI3GeJJ6jb17VhD0pir33Wybt29I0+PPN3t+e06
	SpOyg8QctIH2aZGlOYAyf4LdaTFTG/8EX4OyaWML0dFfvKSROc2QCF7qpU2/DqoMU=
X-Received: by 2002:a05:6000:25c7:b0:44a:247e:67b4 with SMTP id ffacd0b85a97d-44bb434c2femr6004413f8f.18.1777739479769;
        Sat, 02 May 2026 09:31:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 53/62] rpm-sequoia-crypto-policy: upgrade to latest revision
Date: Sat,  2 May 2026 17:29:13 +0100
Message-ID: <20260502162929.1377831-53-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236362

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 97d91f8ee11..1c97938e08b 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "f3f5fa454345b03039ee3d904964fc14829637ce"
+SRCREV = "1abb8a404613f33a2f98eb83e827b046d0820048"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {

