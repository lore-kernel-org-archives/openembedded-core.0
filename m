Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED077C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.2255.1743577888478320068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DGZ9mofN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso29593185e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577886; x=1744182686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2M+oeTRyveXHRRKxDSV68s8Y1L0guLr/7rEoMLK42A=;
        b=DGZ9mofNzPA+xcKBsI0KPhhmdg/oP+EiZ64UM5WnDCOsaSYajhVNf3kEKXqLgGmPl1
         8JT3usJeyuVPtylmcbbG64jCY81BxIXAuHh3ahNNFk9FZ0M/O29C4c40LHVBo52x/RyC
         34Zloo7WhEq94LZvQHwm6vbU5QN7nB9/R5H04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577886; x=1744182686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2M+oeTRyveXHRRKxDSV68s8Y1L0guLr/7rEoMLK42A=;
        b=CglmJsv5NVbifvOVhZtvdtfweaRiLh8byQC2bcElbqgjQbcg6vcGWS3owLzt5qaqSn
         Rtg9UA6t8aHV+i6n8sNPY7etAyBcTpD8zk5H4KF8GDvTdOb0NiA111KLCSGHrgdmREid
         7dDKrq2Qmj1IBvkM+iVKJlpPbndTDU/ro5JJ507Bal7kaMxU078fhKSBl8+YYtM315wI
         srzftRBX0+RS87b14VvWUF2NTEl6gUIbHjkH4FCFbFNo8EeAPx707Pb5pezye9sB59XZ
         /n3DTWUftbXpQIMNNKjWqKvtGQWLyzrxmX7bhSew3T4IjjSG9yqQBSdJDm9GM1PPRMjM
         mSRg==
X-Gm-Message-State: AOJu0Yypp+Uq8lJKOUMB0CnpntJEqyUkr8KOec3SAaPVekxpTXH2MBmG
	QYOZVRqq02F1i+glSgWVOxJWLHlbleS54EQtFJ07r3UUPpfwLn7BtQHoOlPhaV+9Y5+D/F/+Aa6
	1
X-Gm-Gg: ASbGncsvNs94ryRqIEak5pgSWPYraNETqvk6YY2eBtZloSOYYfgXuM8lt1yq2U0RVht
	cEUHZrIHXbFbLtE6wZBUX7is6ik1Z8z2amyNuk3r/hX3JG+3yUxZcBw173ZZSn5gyyKcIa1UdiI
	HZ+VyalvehTF9qhZPePsyb6Cg2k2fQm2B65v6APMdGreI89yx/Zqd4Yl965w/GOpSpCKpJKHaqv
	dwU8chd7K6w9ZzBImPKNqPwsuMxoHtMMYUbcVvSZRBah6fjDG1qODmhlnFe4L0+X/zJ6WSGp1kZ
	6OOy7y1Ppj5tD/1P7aHPVMyosZItAnqA3un+uBFQ2RiTujgYnqcdIuKzsPbHXo+kTlaMzUFZ+qG
	O/OXCw73t
X-Google-Smtp-Source: AGHT+IELumCYFDIESC8zssGsmHEtjQuNNmIWyaHNeG+s9yYna1m5jcNkSCIF6TEa487CFQAOnEPvSQ==
X-Received: by 2002:a05:600c:1c9a:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-43db85268f9mr138530715e9.31.1743577886063;
        Wed, 02 Apr 2025 00:11:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/48] pango: upgrade 1.56.2 -> 1.56.3
Date: Wed,  2 Apr 2025 08:09:55 +0100
Message-ID: <20250402071017.2157620-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214199

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-graphics/pango/{pango_1.56.2.bb => pango_1.56.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.56.2.bb => pango_1.56.3.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.56.2.bb b/meta/recipes-graphics/pango/pango_1.56.3.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.56.2.bb
rename to meta/recipes-graphics/pango/pango_1.56.3.bb
index 36f3deb48ff..479327dfdef 100644
--- a/meta/recipes-graphics/pango/pango_1.56.2.bb
+++ b/meta/recipes-graphics/pango/pango_1.56.3.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "03b7afd7ed730bef651155cbfb5320556b8ef92b0dc04abbb9784dcd4057afe7"
+SRC_URI[archive.sha256sum] = "2606252bc25cd8d24e1b7f7e92c3a272b37acd6734347b73b47a482834ba2491"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 DEPENDS += "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"

