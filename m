Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8DF7F314
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:45 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id y5so4867256pfo.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2+mgz9G+NKjLJOCQBxTRaxTZxip+Nst6wRuxYelb/lY=;
	b=J8KwE5Pq5E06iQjBlf5zGPOsF+HyMO0IovPhSKErBmobyW6MzNQBaz/0zk4zLoLWqJ
	SjGkzi03kow+ymmsQ2SnM14D8TarxfCexTG+C4/j3v1k25xRwlGS7Meaei3v+CkwHlHF
	BfkNP/8c+zCqzpr+VFxacPcY/7FZLoz2OvXWP3n6mxp8BkfVmr3PuolANnkKpc5lFREs
	bauMJVhR7QcIWGfd6c2yzK4VtBqVUF6w1DQoE8OZHcPRoa1PNQOliqUY3fMx1UwKyJax
	X7lFHb17wjmWl6MXy8uoasjddZAFDWn288bDrMs7VCVKmj2g+OvrbPHYTag4B/vGFVlM
	/aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2+mgz9G+NKjLJOCQBxTRaxTZxip+Nst6wRuxYelb/lY=;
	b=nrl//dliWqGSTudYboEBSYdjuteYwHGqKMH2VLNS/yjd4+KP6UcMXsWOyKV/g0GXvq
	hRAOwovC0q+AsETrq18lfwQ6exmYn7nCPS3Tn5fZzZTDqkkUa9IqhNaBhEx0jws4FrEe
	gTEdK6CPwY7CumTMYKfU1mS9I43e4K+tRCXpFMbWv8i+4FacZ6iJwpPYUM+s4/XiVCq8
	NlGrINnzwnvurMwIvU62+OGdnmC722X3ta4booK5cA4KRxS7OnDWcjZOk3uwSlopykQ2
	vr4Y4S9TKoFfSFGFLXmiZQSPeTl8N0sijuWazfnF9wQn8smNBK9zUYhza9MChE+KTKMk
	52oA==
X-Gm-Message-State: APjAAAWqc5CG/5+7uF5fq/wM9suVWG04ayDPSCdi5SF0mpxIzmnLdrJe
	C2QzPQua93g6n8ddESL6u+6LoHrFoI8=
X-Google-Smtp-Source: APXvYqwYrrr188/tFlOaFyWl8/Peapr63OxvlPDhp+xT0n38YlGy/3FFTIQQDj/lF2Hhx73P/POiSQ==
X-Received: by 2002:a63:5946:: with SMTP id j6mr22289391pgm.66.1569818926972; 
	Sun, 29 Sep 2019 21:48:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:47 -0700
Message-Id: <933a85e45c3edd65cdcc00cb18e17524e0411a09.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 52/54] uboot: fixes to uboot-extlinux-config attribute values
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:46 -0000

From: Will Page <wpage@polysync.io>

The way this class uses overrides to support generation of multiple
sections is subject to two different issues: 1) labels that conflict
with existing override names causing the value for the conflicting label
to be set for all labels, and 2) reusing the override list through each
iteration, prepending each new label to the list of overrides makes
earlier labels' value take precedence over later labels, making later
labels virtually impossible to customize.

The first issue is resolved by removing all label names from overrides
before iterating over labels.  The second issue is resolved by
generating a fresh list of overrides with only the current label added.

The current label is also appended to the list of overrides instead of
prepended, which makes it the highest priority override.  This is
matches the behavior of devtool-source.bbclass, which similarly
monkey-patches overrides.

Closes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13469 .

Signed-off-by: Will Page <wpage@polysync.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/uboot-extlinux-config.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index b5b1a81..f4bf94b 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -104,13 +104,16 @@ python do_create_extlinux_config() {
                 if default:
                     cfgfile.write('DEFAULT %s\n' % (default))
 
-            for label in labels.split():
+            # Need to deconflict the labels with existing overrides
+            label_overrides = labels.split()
+            default_overrides = localdata.getVar('OVERRIDES').split(':')
+            # We're keeping all the existing overrides that aren't used as a label
+            # an override for that label will be added back in while we're processing that label
+            keep_overrides = list(filter(lambda x: x not in label_overrides, default_overrides))
 
-                overrides = localdata.getVar('OVERRIDES')
-                if not overrides:
-                    bb.fatal('OVERRIDES not defined')
+            for label in labels.split():
 
-                localdata.setVar('OVERRIDES', label + ':' + overrides)
+                localdata.setVar('OVERRIDES', ':'.join(keep_overrides + [label]))
 
                 extlinux_console = localdata.getVar('UBOOT_EXTLINUX_CONSOLE')
 
-- 
2.7.4


