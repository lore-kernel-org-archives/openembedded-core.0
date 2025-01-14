Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50858C0218A
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:50:45 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.43510.1736858059313844004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 04:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XyjB7VRu;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: arturkow2000@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso49862061fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858057; x=1737462857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPIvf1yRFfIf+36z2kyn1Vm43EA/pFfujYK/oivpVMs=;
        b=XyjB7VRuHPMti6x/mf1lKni1tLXQGebJRsmATol3OTZPsuyry4Oxl9N22X9WvUWSAv
         +oeq9koIC0ozlmJsLlO36GhZJF0xp0wCXKiUuNsNIflcj9rP1gq39UHU2mnueZqi/6Dw
         gotXTTbdEWh5GghEJiLcxRGPaaaLC4qquKRnas29YAJEvoM2+PFfnR89vw0hLUznkYfR
         ZaWsZ5RldQTGkJRTo6/0gdGaN7BYPdLD9JRLUb941Ulm1MlMbed6QJeXJ5azGKFlhBO5
         5/bWd0sfVDOOkXgNGJ24es2Ej1RkYaDRktoXRl2C9o7GRw81SaA9yVOePv0W3XKlZ1Za
         cv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858057; x=1737462857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPIvf1yRFfIf+36z2kyn1Vm43EA/pFfujYK/oivpVMs=;
        b=bLQTx2vfOmRv8PiWzy/o62BjsQAMyS6DZ5ibQqSfG6TqVwUBcqtk5sXXXR6Lu/U3Rb
         vTy4se1o4IGfuJ5/ZGvtgWRE4zR5PRZosOAgVK4xpMMBYH5Y03nqwvn4kXPU8jWxKlM9
         sMKv7mUDzqw5g4pKJs1vmRwDGY/VC2mdO/uDBeKPKRnRlyJ2jCSlM8//szeW27emBI8/
         llHu37vBFm4iBg0Yb60BI6e8u0aV+u/0yD7nPmFUolES94YvqB1l1pRd+ulx1mwxmfsq
         WJhgVQARElnjdHHEVJC1BQslctNSgTm//q4twS/iKqy8bRBEK/RqI97E0vgfIPHFLQ2Y
         Y8pw==
X-Gm-Message-State: AOJu0YwxP6wd6K50cqSbYyx9i+2Zltu81qqD2yz82yf5vsNuXAPxAKrc
	RaHBnwL+4wmHjGU8TDy0GciTQsjFFEZbIzcbvSpoXob9azP4SL+/OV/JVw==
X-Gm-Gg: ASbGncvfrOM2w7vNOeT8IhAiSQwyXIhXvfY3EvsZPkbP1Goft7NNQhaQAui0/lPHO4w
	2mO5xiKBezFsyLRh229oghZ50OpU1+/h1zXQAEzdB8SPkE9MC6bltSe0vHoMHfl0+kLwRE6bs8U
	Ond+Xl2ZiVMUfBulYd9G/emzzYvsaSTV/l0nxpzy1vU9Zh16S6vjut2+58ClTqNj6+YzqDAhRVi
	0bQa8VCsEv2UcX70EwkA9z0NkumM25tNp/kOv0ws1JgH/TCYls4sn+XMfcy4vVG
X-Google-Smtp-Source: AGHT+IHTqVTTiFCQgZdkd+oP3ke4M4tyQf2gaZmT9zmbY8gRlgqIgecuIbIlop6ncuHHbxcTHvgKcg==
X-Received: by 2002:a05:651c:210b:b0:306:10d6:28ab with SMTP id 38308e7fff4ca-30610d62b3emr35731151fa.5.1736858056589;
        Tue, 14 Jan 2025 04:34:16 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:86d6:2e13:1a85:5192])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec4d6sm17230521fa.111.2025.01.14.04.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:34:16 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v2 2/8] systemd.bbclass: add ${sysconfdir}/systemd/user to search path
Date: Tue, 14 Jan 2025 13:26:10 +0100
Message-ID: <20250114122613.3046925-6-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250114122613.3046925-4-arturkow2000@gmail.com>
References: <20250114122613.3046925-4-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209794

We already search for system units ${sysconfdir}/systemd/system but we
don't search for user units in corresponding directory under ${sysconfdir}.
Keep the behaviour consistent so that both unit types are searched in
${systemd_{system,user}_unitdir} and ${sysconfdir}/systemd/{system,user}.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 4b4470b7b3..c167689d2a 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -147,7 +147,10 @@ python systemd_populate_packages() {
 
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-        searchpaths = [oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),]
+        searchpaths = [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
+        ]
         searchpaths.append(d.getVar("systemd_system_unitdir"))
         searchpaths.append(d.getVar("systemd_user_unitdir"))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES')
-- 
2.47.0


