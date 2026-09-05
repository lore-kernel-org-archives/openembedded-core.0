Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE45C624DB
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:22 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2473.1788641112568369788
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZD0O7RtC;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843e397f74so2721185f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641111; x=1789245911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vUaCmmByHnFYhHmZLBeKleEkc/heRtml1oAtp3CtyhU=;
        b=ZD0O7RtCP5DI/pRaqM634EpAdQvGr4KVjoWDc90GdMz8NkyvcbrGSxn1orCt2YTG0o
         FHWsu+EdDVfSl8kN0AjnjJbIKACCxNqRRnp0KBennHYpfX+DfHui8iev7lxcI2KeQk5x
         b6E1+8m85Kk+IzFn1tym/F5cGTP2fVNRJ+sm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641111; x=1789245911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vUaCmmByHnFYhHmZLBeKleEkc/heRtml1oAtp3CtyhU=;
        b=LO+FBxOi8MeRjBNIHgiSADaLpLCFXqkcxVPgg4eTuLpRAHce+I3ZajgZueDaMsPExU
         GXQCHAGDZD5caKbh0sQO0UGTCpZH/VCE/6QTnBWUMCUJA3ua96Tf/H6pX370Lflyv2EN
         PzBpCwdOOpDRCw6JmmuAAtalDs52sN054v8oNC4mLjziLFeUxmTUBwxHpa/YFKqEMzyA
         lIEhKrUAoGeApMZvGA9eD06MeHjmoXSg8NKA9vOKywm/kUUB6YQuvDozCVUqXHYYgleG
         726tr0pRcSU0PCWSYIp7SZO5Xxzqv6QDyupZmbj+jh4ljLMzm5jH6PxKqA72o9GRtFqU
         H5kA==
X-Gm-Message-State: AFuF++l28i93Pmo1VYjCysFwQiZvcf8OCwR1y064H6nGEj64RLwUnEGX
	J3o1xyfQElV4/11PhOoXa8zhQiMbccDlN9CnEQ3HaztFDeuo0MWZRO/g2jqwnBqNQT4Z5YkrM30
	nYqzTT5w=
X-Gm-Gg: AYBFou3fBlNCJDlTPYeqsKCoA135IgvWhNuRc90r0nbMuSL2xoV4s66/Be0DT99jK2L
	hz20/N4N7ywkGAdBj7yFwXUyQhtOZ3rrKfrX46IhwpBVl2tePG78aepDUYbr+2hYc8hPxQZAlKj
	ZtlnD+x0j2BBV98hPXc1LRAdb5h46zbh7KTKbZFs4CzLc96GEPX+/MDDyVZ+nxpJRzyyRfK+vgf
	RcwU/vgmKhNak3ZP1k6BRZA7ODkrDnMdUikPDbVs8S7BtVm0oKDNLPLC7NjtHJUXxaPUMH0/8ng
	ZSe1kKx93fkf2OIs7uQxBKkPfOMqsy70vRJ/oWQN1X71+TVOPu76K5QHimy4SMA0mG4zjOuAwcY
	Iti0PK3dzbn0UlmJbaVt4p9j7cnW8HWVkxV2C6qHnNkdrcmUFnDyNUhhdCaV3Pr8M8Yg5qLVTO4
	zK1SMosheqAtQLOotee3RABEIXHFpK+9eIKVsnMiUkr7O5NU9TqIzwed5gjTM5tGqyu3bMSjsRu
	57hh3fty4KZHgqnXM9TMWf2zP9rwKdIPnwoVDOsG2bmQAzd/X3SlHcove/sGvxyHw==
X-Received: by 2002:a5d:64eb:0:b0:485:7d6d:e0e0 with SMTP id ffacd0b85a97d-485891dcff4mr14703018f8f.3.1788641110750;
        Sat, 05 Sep 2026 13:45:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/40] apt: mark CVE-2011-3374 as fixed-version
Date: Sat,  5 Sep 2026 22:44:02 +0200
Message-ID: <47af4352de3c92197afb57207be2b1bdfd8e5b33.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245153

From: Devansh Patel <devanshp@cisco.com>

CVE-2011-3374 affects the legacy apt-key net-update command [1].

Upstream removed apt-key in apt 2.9.19 [2]. OE-Core uses apt 3.0.3,
so the vulnerable code is no longer present and cannot be restored by
configuration.

Mark the CVE as fixed-version.

[1] https://security-tracker.debian.org/tracker/CVE-2011-3374
[2] https://salsa.debian.org/apt-team/apt/-/commit/a00fbbdb2

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5126e4792ddd8e6c721c47733d287633c234f2a9)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/apt/apt_3.0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 08b6bac2e4f..7c72f489a3f 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -34,6 +34,9 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
 
+# apt-key, including the vulnerable net-update path, was removed in 2.9.19.
+CVE_STATUS[CVE-2011-3374] = "fixed-version: apt-key was removed in 2.9.19"
+
 inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without

