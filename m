Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id A144E7748E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 05:53:18 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id x143so549456oix.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 21:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mESVmyP5jrT72xtoxNE3ilcfFt2SxerqHSRyy+FJcCI=;
	b=XwEZQ43/0j8AcW3TUiJJJcYrsWHXr+VhkoIrbNXyUjNqXt01aq2ppPu7QMgwF7b0B7
	tdkd6PdE3unQs5TYEwYWrzUzwNvUjcFGE2y7WY8Hmywg6DQeLtSS0atHUCGVQLhtKAjb
	Y6vKFwaON20sdu9keeJB2tmvTes9Gj+rCYi9XSVVpxxYNeCRifJ3wg8ux3nBJzkxzSER
	eZ2fD97URJNb9z7lLxmf5I5KaiWH8gxiywRHSjLpsjtePjtzUK46vIc0bUyeROkP+fbz
	c2UuV7LMuRictIHhsC4LSGALN0vS+VbL3EVSNQEnkyLENTZKXpNs5yWQ6FuVsr+jq0DF
	kEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mESVmyP5jrT72xtoxNE3ilcfFt2SxerqHSRyy+FJcCI=;
	b=XIWjBJpoEZVC5+qg02BFr0jFeMqAxzHVJ2RbaAvACcl2/vmSD8H6q44kC/v27SGUhE
	d0SiSbZgVLK5gAdH+jRrGp1ukpkK+Z5l4nspOWGerkHGl4qN2ab0MrxA+FmyEfFvK2UK
	mkcPUcslw3uG3acazJpn12agCd2Yg2bYPM/qTmSB8768pa3IqRUz5po0mgvtpYy/BHPu
	tqdTWOjxYJ8jn0t0OkpAFf3UwTNCVxQsdSJchbTIs25f/tPK1elSUmpCYp6VQQcbyE5H
	R+mVzfiQsIG5raQISrJzpMcG91CXr7iN0yo9E1sVbJq3gr2XuLCvwd++ond7wuHwyMll
	NIjA==
X-Gm-Message-State: AD7BkJI57XMA25jBjdleXgf1x8tQuqMDZAOmWTNVo0/9COoYe0vsvkM5l6K0q7zvFJNacA==
X-Received: by 10.202.77.11 with SMTP id a11mr3905773oib.23.1456552399467;
	Fri, 26 Feb 2016 21:53:19 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	cd5sm10867528oec.15.2016.02.26.21.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Feb 2016 21:53:18 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 21:53:05 -0800
Message-Id: <1456552387-10564-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456552387-10564-1-git-send-email-armccurdy@gmail.com>
References: <1456552387-10564-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/4] grub2.inc: avoid passing -isystem to native builds
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
X-List-Received-Date: Sat, 27 Feb 2016 05:53:18 -0000

grub2 creates its own set of -nostdinc / -isystem / -ffreestanding
CFLAGS and OE's default BUILD_CFLAGS (assigned to CFLAGS for native
builds) etc, conflict with that.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-bsp/grub/grub2.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 5a12563..0fdafd5 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -44,6 +44,15 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
 PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
 
+# grub2 creates its own set of -nostdinc / -isystem / -ffreestanding CFLAGS and
+# OE's default BUILD_CFLAGS (assigned to CFLAGS for native builds) etc, conflict
+# with that. Note that since BUILD_CFLAGS etc are not used by grub2 target
+# builds, it's safe to clear them unconditionally for both target and native.
+BUILD_CPPFLAGS = ""
+BUILD_CFLAGS = ""
+BUILD_CXXFLAGS = ""
+BUILD_LDFLAGS = ""
+
 do_configure_prepend() {
 	# The grub2 configure script uses variables such as TARGET_CFLAGS etc
 	# for its own purposes. Remove the OE versions from the environment to
-- 
1.9.1


