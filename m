Return-Path: <wpage@polysync.io>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id E0DC57DE82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:37:18 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i18so51701848pgl.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 11:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=polysync-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+r6ammVNPvkYgIDytUK4v0t4nDoAB1gmnteOf3m5FlA=;
	b=hpg5C4BMBpDyYBDmBlalyEPHXkiP1jqmj+hVw3wDGazPkAeiv+uYcYUB7Ezu2yXhiC
	XEDhGHV2yblWIEdk2X9CPSthPtkEqebWFHfBFY4OpQqStPALz3YNDfSmV5x5tc+mQoU0
	m/XgMA+pze+lNCSk38yF+JOwiuCbHFJpJkRnJgmmRIuKzjEGP/PZqzJkQCOAzCWtuhc6
	U+C5u8ApQ5BBFlbYLM9DYAAfJdkQZbt7Hkg3rm7jSyquSbW39TUbhR50XErSbDfW1Fv4
	04aMUJVIx1a0aMTSi1VvD0Q8o3+uY+eyUpQxSl63QSOaDBq4t97OIHVr6YnUbHzN18Wl
	G/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+r6ammVNPvkYgIDytUK4v0t4nDoAB1gmnteOf3m5FlA=;
	b=gW1lEMCdXZKMbYOzestbqnUPzH9Jl9AcW9OV3wtj4EaEp3jR7EggUmufn6TAHAevg/
	eiPL96jjkTVwOy6FB1+v8qH834m2lfJ9knC0tQSnfZeXwcqPqUAvqsdbgRgQO65rnJTb
	5KbUoLjnfPxRA5ED20B+8UhDICzVUfef7ttfS/7ICzYYvUjgXCgrNZ7Z+ltvj1/URjQi
	kIAQt7+VGfvBSr/Ep3+qwEHVlJR08rL7+ajbEISYAbhMCHpV/qpR8oOz/jo+N/a/yQW2
	VxBwEA+CeOaMoBjtY4b+3NWHaakxHlylNqIf5MwvOUe2UQktG/bCphbjhPKF5SYOseUe
	s05g==
X-Gm-Message-State: APjAAAXjDh6/ZioFH/1s9nBbqWM/vw9jMDYqx+4t89dPuHAxx1WqlkPF
	m4XFCl9ToFpa6RLNN8gpE3avRoQvIJk=
X-Google-Smtp-Source: APXvYqyPMEKiTIQwhvdFn7+0H4wtTJQMXttnawk0GU07hXBJtD5TqpaFl3iU3riHxrGqxxbk9YWcPQ==
X-Received: by 2002:a62:6044:: with SMTP id u65mr41477744pfb.15.1565721439518; 
	Tue, 13 Aug 2019 11:37:19 -0700 (PDT)
Received: from vizzini.localdomain ([65.152.8.170])
	by smtp.googlemail.com with ESMTPSA id
	g1sm176945928pgg.27.2019.08.13.11.37.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 11:37:18 -0700 (PDT)
From: Will Page <wpage@polysync.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 11:37:15 -0700
Message-Id: <20190813183715.20125-1-wpage@polysync.io>
X-Mailer: git-send-email 2.17.1
Cc: Will Page <wpage@polysync.io>
Subject: [PATCH] uboot: fixes to uboot-extlinux-config attribute values
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
X-List-Received-Date: Tue, 13 Aug 2019 18:37:19 -0000

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
---
 meta/classes/uboot-extlinux-config.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index b5b1a81dfc..f4bf94be04 100644
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
2.17.1


