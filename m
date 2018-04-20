Return-Path: <tom.rini@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1300C744EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 17:55:29 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id z16-v6so3294165ybk.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 10:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7loRaKedF/ewfqYA+CCEENa3gly2p6WCNnWGGpnGL+Y=;
	b=hN2ILpa+uDiU9xYpk3rxhsCT/oxlNIAQQMJ6yab8OB8T7IZk9UUL5sPOYOSdPMsbRl
	EaJQwEiUbZs3ExO7js3XlUqj2wvnqiPVqkHj66zfQv1Ud1yH3D6mIheOV4+tQo4G0jhF
	UN2Ltt7rkfXcy+Wk541JteNFcO06sSH5XbLD859vVDp4aLJiO2md1rkUdqJDOnWGhiVf
	oHj8ujiAMocg5uTyWLunZGR7KCtNFJrR4Ci8r/kRGsScNOhJnoNeST3BLQbR9wHe388u
	dB8HuP3cLk7cbNSw8w/je6eycP6xgZykUuprXsjkae9ELB4yEDqSSUstV3niAH/ZOIcx
	lxbQ==
X-Gm-Message-State: ALQs6tDGeSfqEoSp7ItwhXiVa7oyhYUpMrssR+1urzsvsjGWOM+ajLqi
	kUr4yetMYqa0qVdLlXM3jWlL
X-Google-Smtp-Source: AIpwx4+qSDGWzclU6mzz9mTl9qq0sbZc19oc0JOPWJNYOZ1qIT3aMV9JF1RY/8EnfBoM5xlNhYPTZQ==
X-Received: by 2002:a5b:8c3:: with SMTP id w3-v6mr6688027ybq.386.1524246930546;
	Fri, 20 Apr 2018 10:55:30 -0700 (PDT)
Received: from bill-the-cat.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	v68-v6sm2691045ywf.103.2018.04.20.10.55.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Apr 2018 10:55:29 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 13:55:23 -0400
Message-Id: <1524246923-30852-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] glibc: Check /etc/ld.so.conf.d/*.conf by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Apr 2018 17:55:30 -0000

The expected modern behavior for dealing with adding ld.so.conf entries
is to add a file to /etc/ld.so.conf.d/.  In order to do this, ld.so.conf
needs to explicitly include that /etc/ld.so.conf.d/*.conf.  Make it so.

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
There's at least one example in meta-oe today that I suspect doesn't
work correctly today as we're missing this glob.  I'll also admit that
it's possible that we should create this file in do_install instead, in
the case where ldconfig is in DISTRO_FEATURES so that we use
${sysconfdir} rather than 'etc' directly.

My motivation here is to make it cleaner to deal with the nvidia drivers
as they drop stuff into /usr/lib/arm-linux-gnueabi/tegra and today
people have initscripts to whack /etc/ld.so.conf directly.
---
 meta/recipes-core/glibc/glibc/etc/ld.so.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc/etc/ld.so.conf b/meta/recipes-core/glibc/glibc/etc/ld.so.conf
index e69de29bb2d1..83327c01bf52 100644
--- a/meta/recipes-core/glibc/glibc/etc/ld.so.conf
+++ b/meta/recipes-core/glibc/glibc/etc/ld.so.conf
@@ -0,0 +1 @@
+include /etc/ld.so.conf.d/*.conf
-- 
2.7.4


