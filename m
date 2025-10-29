Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75839CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 12:08:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.4738.1761739724314155196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 05:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gZX9OGCf;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4770c34ca8eso32759055e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 05:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761739722; x=1762344522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEg3PE6jtDl+n4qNEhWQ6xWSocu/sn4xk3ALrdqXs6M=;
        b=gZX9OGCfc1mJ46qgx78OB7sG6S64S6DV4hKRaiPiwrlT/X1dP6nLmbgRHUHv6osXDr
         1vi3kbpNCiknDizSAtw4TspLrQU8eORIANeFJ4gCOSb9EVArEkXaK/z8hsi6lrilfkla
         toSbF5Sta/QI93S//7wHUlE2uol3f9SMCwBcvwye8xqo9Rgh9CoLTry1Z8AE9mEUfDr3
         LwFSg1NiPG45p2VgjO9m5RlWj3L47YuspzU4lmnSnlhri3zDncuxYMr3tDSX4kqJ1tV9
         7AQhi9n47KQKwnAkrk3USzvlmO3YcjEiYqxSdGZcesT5sBpCt74vnoBFNuLyLPEaeYdm
         Oq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761739722; x=1762344522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEg3PE6jtDl+n4qNEhWQ6xWSocu/sn4xk3ALrdqXs6M=;
        b=iL6frVFwTI76z63BKyHXOaDtXdkItY/BseFq/dD4Ve4FObIzeRciqpobWnVydRUaJw
         BS2b1ta4PTcNnX9bXtKKfBPI5EV1wSGO3qwLnq0KAe27VW9l3YI36Au+V5AdxE7koJJn
         p3Z4ISiZuvcigPrvrwncqso+6ndSA/PoK9lGxzPOv+zuSgs1BiXv+6zC1d6h8m23jR1N
         Ps516D0jImK5JDXtZrPN9wtSQcBQFTfLp8usiCEdsZ6djt3/1T3j3JVEa47Ogim5Hz9I
         N2sn31Jn8CV8KGi3QGCB9AEMDwMKrBBCDNe5YHskndN+a8m04TPdpbNVBj4mOBmXzDbI
         9VuQ==
X-Gm-Message-State: AOJu0Ywc5AvAHYMeHwKnkrwNX2axU84QKi6nSxSntDVPQsrq7zRgVbeR
	IZ6m1fB+V3XKlsAYphRCwSjrw0QD+36a3nn7o0xzianPBIcEip/o9ed1Nniuww==
X-Gm-Gg: ASbGncsjEa+VOK8Ju/IxmwZCpcIWfTRsfz3aK1YycSnkBaI7USoEYxjIqAHggbUb4rB
	8DnvWb/VYpeAXjv4ycjBvHSzYJo72xJFySwi0nmZhr37XfBAieZse20OkGSLx92hhQh8uEHi0rk
	j8pdAOo643pQ6RyqUkHh/shIezziOvaBlBfKAsdArd5h1o6YI1t3RcoVx1JC9cvvvsphefgEfHh
	AhaL4BUYK6MonygdrdGmB7Lk+R/c+dXt45I/sWCkYLUAomUSlIoRE8/nOR2sFqRXQniszunKoI9
	7Dt30aLd1s0btFcFji6NT9/pOlVBgy72iXVRbEwSKaAk1q6FlSoEXG3F65k0jhdS7IwiegfGUgp
	fEMvc/NVPX7JQkg4cGoyyxRDB0HoFmsCTXNViQ8BMooCaRUjCT51kbb5u9dh56XRqU2mhI1Rsq0
	19mH19y9/DhT6qb4Lj66ZpldhSsDzd7FVPPneLJJrfOWaPIKQtqgOpspOm9xnzTQhniBQgMVdGn
	WM+T5cgstjydjmwThFsB/4TjSXYzImvWZTiOP4kTcOV4Um8RKDFCDNKyulz
X-Google-Smtp-Source: AGHT+IEtu5T6RD/QE99mYxLkNKCvGsJ5GcRHyHacv5JuCYNqZCdVJ+N8rFVa0qLTR1rUW9iZbdttiA==
X-Received: by 2002:a05:6000:3101:b0:427:cca6:5f41 with SMTP id ffacd0b85a97d-429aefd1f02mr1951964f8f.55.1761739722197;
        Wed, 29 Oct 2025 05:08:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b2dsm25685793f8f.2.2025.10.29.05.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:08:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/6] bbconfigbuild/configfragments.py: print fragment descriptions when enabling them
Date: Wed, 29 Oct 2025 13:08:32 +0100
Message-Id: <20251029120835.4075555-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251029120835.4075555-1-alex.kanavin@gmail.com>
References: <20251029120835.4075555-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 12:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225451

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


