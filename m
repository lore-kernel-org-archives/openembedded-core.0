Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0823E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:11 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8196.1733295003996341775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:50:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ioooDIBb;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4349f160d62so52681485e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733295002; x=1733899802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0nYh0YwuyilWJ01WeC7tqHY8DNpK7ApAn5+fgtfS8Q=;
        b=ioooDIBbStPKs0vWTZ9ylTdCSLLPfKQPlGCQaNzKoFJGhG/t/ffD89+8zyoH1lOJyp
         roqKJEsrdgcPNqFoFrpMIzGEQ2zY3t3QKKnGyj+ut1kkgQG3oJJlNceevbL5ymjupf9T
         AZpTAGpHyiG2BQ4+21EDsBKgUW2bVW3S1+2mT3vW1xpchH84xwCGOq3dhgMbdRnQKpWs
         cYiV0YL2Ytds1dVIPZg+A9IA/uw1atAaTd710NKshPI3X+04pSQwRKSVXLAZ+4YBrAca
         7qQxRX3Xa8RBzevmJ1ynaenve3gQfwEZRgAwxlOMzfeaWyE8CRjThB7DwuHRB41PvzxT
         vlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733295002; x=1733899802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0nYh0YwuyilWJ01WeC7tqHY8DNpK7ApAn5+fgtfS8Q=;
        b=gHmgY5pICye/UgZ+RFBbOelJXqJX+FySVGSmwL2X8Lv89v4zgB/Z7AJ8jGQ9JOgNb8
         U7w1GfCNy2p2/ymDPyOB65isn7wziGwA48xY6tnDG7tNJEO6CQzVdTfa1IzSIkNui4lc
         oJVYDXGSgo3W3njbkLAGD+SVV2dee2Y3/o3Qea5BD+tju6uWh2KW4Xd369QUDnJyR7Ul
         synLxiIY1fuk/3p8By8b/JG0zH2zgU5r/9/4C+zP/UweuKSv0CAKZnmvjPO73GAjOn2c
         HA092/ElZEctAaBG5ENxKin5jYU8J22myfY8FJW/i8iLOif4fUIQ0Cx5ukcdxvwBmWdI
         Zj5g==
X-Gm-Message-State: AOJu0YyCAzZUjDOvPUD5rMtNJcpgK5bikjn4ONfWBCIMpQE7dA/tP6l3
	AzbWaP2Gz3DXi6PfM3Bk8gMbG3HQ2K+iP5SZCNLizmLaTk5cnt31k3jZhQ==
X-Gm-Gg: ASbGnctHS296qOnYKGObi4tr/006833RMxgYLQmMqIFnSqqvYfjZD5VunM78u2fN23V
	jIyNYBcUwxqu0oqKZuFwmkrJUL9jIRvQQxOaHqkVN4ueNkyoijkWr0gDOQu49lK4VuP96hW+P9w
	23+VU1RikriG5WxVYuRsaBzm4Vtt3TQwCvVvF9HAjtt6d95wZ3IM8wt2bRaaGCpjOCEiwA6XML6
	KnBLMYyAuwfP8n1mUxfduSIn7w+4s4tshoiu3KiPyGxgklwq8ZApx/TCCmi6hscIcXa0u9ySvuc
	MHFFk1PK3gA=
X-Google-Smtp-Source: AGHT+IHV4VfOK9RStkFdatXg/5lsNsg2hE0HUhsZDrXXyaya4NsGaHMgY0MA9LLAYpMgubNK5qRuqw==
X-Received: by 2002:a05:6000:1fae:b0:385:fa3d:19c6 with SMTP id ffacd0b85a97d-385fd419e15mr4577050f8f.38.1733295002315;
        Tue, 03 Dec 2024 22:50:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:50:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/37] cargo-c: convert to target recipe
Date: Wed,  4 Dec 2024 07:49:17 +0100
Message-Id: <20241204064920.817016-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208262

From: Alexander Kanavin <alex@linutronix.de>

This was prompted by sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs
where adwaita-icon-theme would fail due to new librsvg introducing
cargo-c-native into dependency path.

Rather than look into why is that, I simply converted the recipe
into the standard 'target + BBCLASSEXTEND' approach.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc                       | 2 +-
 ...e_0.10.5+cargo-0.83.0.bb => cargo-c_0.10.5+cargo-0.83.0.bb} | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/rust/{cargo-c-native_0.10.5+cargo-0.83.0.bb => cargo-c_0.10.5+cargo-0.83.0.bb} (86%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6d37b202b5c..737c1c32663 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -91,7 +91,7 @@ RECIPE_MAINTAINER:pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-ca-certificates = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cairo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-cargo = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-cargo-c-native = "Frederic Martinsons <frederic.martinsons@gmail.com>"
+RECIPE_MAINTAINER:pn-cargo-c = "Frederic Martinsons <frederic.martinsons@gmail.com>"
 RECIPE_MAINTAINER:pn-cantarell-fonts = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/rust/cargo-c-native_0.10.5+cargo-0.83.0.bb b/meta/recipes-devtools/rust/cargo-c_0.10.5+cargo-0.83.0.bb
similarity index 86%
rename from meta/recipes-devtools/rust/cargo-c-native_0.10.5+cargo-0.83.0.bb
rename to meta/recipes-devtools/rust/cargo-c_0.10.5+cargo-0.83.0.bb
index 728b8757a47..c6e88e6fadb 100644
--- a/meta/recipes-devtools/rust/cargo-c-native_0.10.5+cargo-0.83.0.bb
+++ b/meta/recipes-devtools/rust/cargo-c_0.10.5+cargo-0.83.0.bb
@@ -9,9 +9,10 @@ SRC_URI = "crate://crates.io/cargo-c/${PV};name=cargo-c"
 SRC_URI[cargo-c.sha256sum] = "5bfa9ba93806384d940e71dafbc185316e0a6a47561b33b7105fcf67f99df70a"
 S = "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
 
-inherit cargo cargo-update-recipe-crates pkgconfig native
+inherit cargo cargo-update-recipe-crates pkgconfig
 
 DEPENDS = "openssl curl"
 
 require ${BPN}-crates.inc
 
+BBCLASSEXTEND = "native"
-- 
2.39.5


