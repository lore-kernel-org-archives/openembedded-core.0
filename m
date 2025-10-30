Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDC0CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 09:23:05 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.22493.1761816178777502208
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 02:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XUOxicOK;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so154065966b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761816177; x=1762420977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEg3PE6jtDl+n4qNEhWQ6xWSocu/sn4xk3ALrdqXs6M=;
        b=XUOxicOK9/gkrnF5enX+1PWefCNRO8XDXahZFTaQZFsW1v5G1JAJHKiQ0ABvWWrZ3Q
         tSd8yyWlQsMiOGLv4YhZP/FdwZTIo3WBxfF1aNuOdTlpbH3uVk0rGLLs2um5yXN+hlF9
         G85tMQMFsnqGW9iYfZ6VlSqcTQAmgcnNl2MPxvOuZZ5cwdzw+qZV4lp0FM80H+OtZqTU
         NXcNZcVDg9xAXt6HM2a/pOAQM5LV5THHwhfMwAzFsGZFrPXjUaaiG13ZD/P2fEK/A0Vs
         2Xrlbh21YKnz/x/VfjK9XH+lWzPzamfWOdGqcDi9EpLl9PZbiMNfNnOgBG5aWqgZzzMI
         g3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816177; x=1762420977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEg3PE6jtDl+n4qNEhWQ6xWSocu/sn4xk3ALrdqXs6M=;
        b=pEru969ZIyC1KYBjjicYMr+w47ENPKWWjJUQ4fIkVfbheB/YBVmwUEs88sH+OPwKdt
         NanSwx9D5HcV3Qrf2NOcrDc9WQZ/9sgA3uK7rFPXNManb1vVjZTPXlQbgrfQELmeN/B+
         RY5vcaZhzyMknuoLc7jZ+xE2bAmeMpQPQ7cymOgpJid09Hd5BL6xIzqpM1J+zUiglgAq
         Zv+eqJGEI6Ynm33qoycrD8ddEUaZaxViXxlmH2kD9mhzST/pko4ruNu20sqHsqdgXifu
         pX1su6rQJ7/WFsJ3fFGbBZbamYFnZD/iLV/juGU/GhA8Xbk6s04oWC2XLB3I0tC0xKJv
         8G4A==
X-Gm-Message-State: AOJu0YzlTTgqVe/EdyvlIv8GPFY6mKmP8N8TGKsAIYDw32Wx1bbK+Hb0
	NHQi+RVaSiDD10I2BFHBPm8GDLq42oAncH3Zn/va6o6dnFHht53lBi19wGccjw==
X-Gm-Gg: ASbGncvObe56WecMrkhYP3G/V9b166BlOpt+EVWcSfyAEtmWvtVn6UYJJex9nA4TrRc
	I2DCaIpFbBSk93NldVlNkifCtA0svkJBhzCtkZS7Ah3t57W0Ned40Cp1ySgEwYu3r5EDoRhC7jh
	lfPByFfhA0Ufw3a+nEB7I5MPSwJmv2BMury9Wwj8fgtVrRZFvpN3p1mqJa8VQMp79knu2Z7OqoG
	QowP4ZqMPlgWWMkqTN+l1OEHiFfBeW1kPxmplnJV1R3DR9uxCkl6k1BBOBqkALa8LI+QfWo8I6Z
	trWSZrd3b6m6Fp5ehSakROQrAbJwHxO6pJJb5PHqMtBqLkuBhN7IDKo6YTv62ZSV6dztsn1w/eZ
	KoWk5c1rAvkmlya/81iyQ7eHj4W35HArCFQCUN/Rm4sOZXxA5AzxjbBBDipJ3KguNkC485TU1Cq
	lc0dfS5ynMd6BB7LUWxJjVgft34ka7a2JgO2n1RB9lhOE5VIlrteSr4c+r505J2xGZ6NTK5tjG3
	ITJZzZfB7ImsAwG9/cnFm731yCiTwRLRc4pC5OLSLPdIvQt9A==
X-Google-Smtp-Source: AGHT+IEMhTCW5UVjjoUaBu0bK9uefJ4C25Or1QrFq2o+KyLPGNbDlJMJMEHVnGuDJcWFzbyxcLeCsQ==
X-Received: by 2002:a17:907:702:b0:b5f:d46c:4b7 with SMTP id a640c23a62f3a-b703d5dff64mr602612866b.55.1761816177038;
        Thu, 30 Oct 2025 02:22:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308c6csm1742469566b.1.2025.10.30.02.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:22:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 3/6] bbconfigbuild/configfragments.py: print fragment descriptions when enabling them
Date: Thu, 30 Oct 2025 10:22:45 +0100
Message-Id: <20251030092248.723968-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251030092248.723968-1-alex.kanavin@gmail.com>
References: <20251030092248.723968-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 09:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225481

From: Alexander Kanavin <alex@linutronix.de>

Such descriptions can contain useful or important information, and users may
not see that otherwise at all. To reduce clutter in CI outputs or similar
scenarios, -q option suppresses that printing.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bbconfigbuild/configfragments.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index 59e760f2909..6fdac33a5da 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -144,7 +144,11 @@ class ConfigFragmentsPlugin(LayerPlugin):
         self.create_conf(args.confpath)
         modified = bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGMENTS"], enable_helper)
         if modified:
-            print("Fragment {} added to {}.".format(", ".join(args.fragmentname), args.confpath))
+            for f in args.fragmentname:
+                print("Fragment {} added to {}.".format(f, args.confpath))
+                f_info = self.get_fragment(f, fragments)
+                if f_info and not args.quiet:
+                    print('\nFragment summary: {}\n\nFragment description:\n{}\n'.format(f_info['summary'],f_info['description']))
 
     def do_disable_fragment(self, args):
         """ Disable a fragment in the local build configuration """
@@ -193,6 +197,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
 
         parser_enable_fragment = self.add_command(sp, 'enable-fragment', self.do_enable_fragment, parserecipes=False)
         parser_enable_fragment.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
+        parser_list_fragments.add_argument('--quiet', '-q', action='store_true', help='Do not print descriptions of the newly enabled fragments')
         parser_enable_fragment.add_argument('fragmentname', help='The name of the fragment (use list-fragments to see them)', nargs='+')
 
         parser_disable_fragment = self.add_command(sp, 'disable-fragment', self.do_disable_fragment, parserecipes=False)
-- 
2.39.5


