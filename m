Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E01D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 18:27:30 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1499.1764354440317409707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 10:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QDlcVsNm;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b72bf7e703fso386789766b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 10:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764354439; x=1764959239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajHuMIA273sxpxYTBTK4RAVh+NMbgOYXonye5jwUHng=;
        b=QDlcVsNm1jClPUG8aM6jNR95ZIaHqxRWs14prGpEhccNFB4oEGycppddGQTV4GE2o3
         s+puy2E73uuq1K3HjbpqWTQJ+m94aieCue5ZmoNWe/8SUNxbQ8EFU2MfSE0fDcbl0n6F
         X02XPYd2z5z4SB4Oduu7k1Aur9GIA5r5w4/HQPTYprXuMy04kJZWBPfVGaUbx8mJstAL
         s+FvF808pB2QM7xbhZDgVZjrmr6TvVCDvyoJuOCQfym6z1C9NK6pL9zkOTFX0Xk7eqkX
         uBfzwq+IEB3fYald1xd/0aaECqUeFdgf9LzEVWhGfsBkREv6ZU5SEOWFdQC6WBLtZy3Y
         A3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764354439; x=1764959239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajHuMIA273sxpxYTBTK4RAVh+NMbgOYXonye5jwUHng=;
        b=cB/xq+kK+/XMguGUEr8RoK8u94BRa6g21GZ5rnFpllV73080F1wtxEgukjDwLckmLX
         3I6I6k6IyxuOW3475eDdIWwGhe08Ptv3f+2xJpqWh82ml5lspoXSmrml4QTIT6b9cueg
         e2O0Zv4bMP1vFCpbWfdMVwA1JioyNA4V42fvm0ugA9rcAYSU0LNaTTJ822F18eZGptdW
         DsuTOumUbCZJLMz1jwF2PKGVN026+Xemqq1WnpX96zH1oNQRCAARv9fQkgzEcwJuzrfm
         JO10QPCXoXXxU2mPmFlZ5aNPWUHg4/V5UU0FFLRrhIQU+pZJM+DiSgshQpEabtos7tH0
         4pJA==
X-Gm-Message-State: AOJu0YwmbZeVXAvxfmrzd+pAtO2oH3XrUJN5x3z7Pq0At96BRu6By2es
	5pFrmqPyp1qwb2Y+r+9dQ+4TZwWNBq8NmIh/HRDGJ4kWgH1oQPBgt9hJ4Pe24w==
X-Gm-Gg: ASbGncsSEX3WLZSVaE4MIhu+uxberekpedgL6KM/Vkc7qfEj6aDj7MmBGnPNsc7fFSk
	r2JrbMlwQCL/dXE/u3ffNwDLWGTaAffSiIcK5ZlLRErjs7/IF7xk08elqYitoyGGnSb8n7qmIAZ
	J2WjSnooeAVZpJZ01u4Mc8fY2F8jhIeoubqc2u80E762fFp1vdCRo4zgDYaIZMXOfLbwlBpCNnI
	HB0x8zL4ITLWPFREh2FDjeDUX0wa5xMxAUG51Dyl3IXMyX+IcFEGYVdFwBZa5pNrT+Y1mgU05BA
	s/nYbPoH5DYKI9rH26zMwLOdHDmWmSjuMx0NExJqS7GRQapw9OpRNKTpexV1Db15ELker301XpN
	12XHKgPrJnB2EYzWoodz21kbBXhD9KlvWtNvffLQxN18oJRoU9NjfMbQLQRIWyUmank6gwa+OSQ
	4XvUqwd44hWYZm/R08OguXDHH/2AznNbLHDU0qb7m+IoLVZ74=
X-Google-Smtp-Source: AGHT+IFXu6ANGeg5M6rV9ss89xKCVJAX7kuKspnwyLzXPgr6qJP54aWUh/XylNyN5sOhZK3YUpE7GA==
X-Received: by 2002:a17:906:ef03:b0:b73:737e:2a21 with SMTP id a640c23a62f3a-b7671b12c6emr3219285866b.54.1764354438300;
        Fri, 28 Nov 2025 10:27:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162d49sm494594266b.14.2025.11.28.10.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 10:27:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] lib/configfragments: match fragment prefixes rather than full fragment names when disabling fragments
Date: Fri, 28 Nov 2025 19:27:13 +0100
Message-Id: <20251128182713.4148461-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 18:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226921

From: Alexander Kanavin <alex@linutronix.de>

This allows disabling classes of fragments without knowing their full names, e.g.
instead of

$ bitbake-config-build disable-fragment machine/qemuarm

one can issue

$ bitbake-config-build disable-fragment machine

to match and disable everything that starts with 'machine'.

Add an --exact option to preserve exact maching (e.g. when
theres some/feature and some/feature-with-foobar both enabled
and only the first needs to be disabled).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bbconfigbuild/configfragments.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index de521f0c149..f5b4dfe1ec2 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -161,16 +161,19 @@ class ConfigFragmentsPlugin(LayerPlugin):
         def disable_helper(varname, origvalue, op, newlines):
             enabled_fragments = origvalue.split()
             for f in args.fragmentname:
-                if f in enabled_fragments:
-                    enabled_fragments.remove(f)
-                else:
-                    print("Fragment {} not currently enabled in {}".format(f, args.confpath))
+                for e in enabled_fragments[:]:
+                    if (not args.exact and e.startswith(f)) or f==e:
+                        print("Removing fragment {} from {}".format(e, args.confpath))
+                        enabled_fragments.remove(e)
             return " ".join(enabled_fragments), None, 0, True
 
         self.create_conf(args.confpath)
         modified = bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGMENTS"], disable_helper)
-        if modified:
-            print("Fragment {} removed from {}.".format(", ".join(args.fragmentname), args.confpath))
+        if not modified:
+            if args.exact:
+                print("Fragment names {} matched nothing in {}.".format(", ".join(args.fragmentname), args.confpath))
+            else:
+                print("Fragment prefixes {} matched nothing in {}.".format(", ".join(args.fragmentname), args.confpath))
 
     def do_show_fragment(self, args):
         """ Show the content of a fragment """
@@ -210,7 +213,8 @@ class ConfigFragmentsPlugin(LayerPlugin):
 
         parser_disable_fragment = self.add_command(sp, 'disable-fragment', self.do_disable_fragment, parserecipes=False)
         parser_disable_fragment.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
-        parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment', nargs='+')
+        parser_disable_fragment.add_argument('--exact', action='store_true', help='Match fragment names exactly')
+        parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment, or a name prefix to match', nargs='+')
 
         parser_show_fragment = self.add_command(sp, 'show-fragment', self.do_show_fragment, parserecipes=False)
         parser_show_fragment.add_argument('fragmentname', help='The name of the fragment')
-- 
2.39.5


