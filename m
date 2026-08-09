Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D93C5AD4E
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 20:29:53 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15690.1786307385473427166
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 13:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VEfOsm5n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f904e80eeso918678f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 13:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786307384; x=1786912184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IWVjUwjs6mrNtnTlKjzqAqrRfaIqfKHXYVx3kMEYYJA=;
        b=VEfOsm5ndnwrpDYvnvDG9BFaHlBOUDTZCGd4LIX31kMi7ZfcD0OlQ06zKTOO9j80cA
         m5YcA6k6SCMxmuVVc5qJQfELgfstAylOra02M/uXzCUfGtrpyma+dAFANEIQ0PIPlnHs
         qRpF7+oybeTDSIUPaOUFq0lKNPSxcuKvYUrLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307384; x=1786912184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IWVjUwjs6mrNtnTlKjzqAqrRfaIqfKHXYVx3kMEYYJA=;
        b=d/vBmLBL3MJjvv6IABNhOTFXqlNaQibJnM1wi3fx+eRmNIUozcZGlexxIxH4vsUzni
         8I/CNjccmgnPb27OxB+HRewlNjwrJ1TTwXu5xOp+yzWxmXLhhYqG6lKmdq1FUl5CiiqL
         aBTqPibL4SpllG3Vo4C0Ia62RcwulAOeThtTET/BYI0kzHTBhqx4E0S6OmiOKB2Rg6xE
         /pvFPaxV0KNA9BHZm0yOmltIbxBWQKpwYIRn0MoUcfXuK5upAXBBBtayFF9FGimmlB85
         kiyV2HCs/Meo8Z7epB0re8iU0eq0DW5IOXXpJRp59Dlnymr5DXOLhwMvr7Z+SCFEanup
         3VZw==
X-Gm-Message-State: AOJu0YwM8/8TXSJjXeEYEgayGCBS0I4PHYebwx6lCB5XIqrHvC9iToDY
	MQoHVSh6c0DGE8SsdwBddkAIAfqCfNAi1mS+NGuVEHPiUSo//byp+PN/wy6ldC7ylQVgKiptWfU
	QgeaJhgg=
X-Gm-Gg: AR+sD1261X1vujXnp3soPGvpzqxDyhq6xNii0m161gKZMrDKLsXslqPmB6yr8V2ZAu+
	g4bczE7424ZEq2mfopyqv3KbijXMQNurWWO9zcVMyDnVDFQabIVGjGRAXH9BKrwNkU/HK28sl+4
	7SD1usBw3pkEqBJTZ9bRWYVduXd3fGmy68xqGi66owxRlBi7o2GLmJlce9vl0mpPzV11JG+wmGA
	V7dWQUW4hxzr+9HWTJft5uWlkEq8Aj9t0jxN/QWUcsdsg4erUaJh7fYtaqtAsFLfE3ViGRBoLwZ
	jNZV7MN7qKOXpZpwRuUL5wa0ADbGTW4Zix2TK2NWHNZQibFJhcOWetzcx3kwZdetE74YdPYRUQK
	MOR3VGjqbbhEUo55kg+yCNpEI/0NLjB7dtKDOnO7/5ASPwQuRwOnPBSAShaS0tXQjuRroenSIx+
	A9mIBm5OtZNDqk3bNnw9SO9dCCKxjZy2u5rsWkLTh3n+guPZfxppoEO2eqg/5/dcDFzKlyP1wxJ
	tn+Pm/URmJSBlEjzg==
X-Received: by 2002:a05:6000:29d6:b0:47f:f3fe:1ebf with SMTP id ffacd0b85a97d-47ff3fe1f3dmr33753102f8f.20.1786307383782;
        Sun, 09 Aug 2026 13:29:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:50cd:e139:7482:bd41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8b9bsm31267873f8f.25.2026.08.09.13.29.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:29:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] rpm-sequoia-crypto-policy: upgrade to latest revision
Date: Sun,  9 Aug 2026 21:29:35 +0100
Message-ID: <20260809202935.1904858-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809202935.1904858-1-richard.purdie@linuxfoundation.org>
References: <20260809202935.1904858-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 20:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243078

c42da77 Add support for SLH-DSA variants standardized in OpenPGP
b952499 openssh: add mldsa44-ed25519 signature algorithm
6ce654c .gitlab-ci.yml: stop installing oqsprovider
e26630f java: use CHACHA20_POLY1305 cipher name...
275d084 java: fix MD5withECDSA concatenating with RIPEMD160withRSA
742b3ad policies/modules/NO-HMAC-SHA1: introduce
fb779fc java: use SHA3-### names with a dash

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 1c97938e08b..c094f3b2059 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "1abb8a404613f33a2f98eb83e827b046d0820048"
+SRCREV = "c42da772d5fcedc55aee8f2a3348e7d718551910"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {

