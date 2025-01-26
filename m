Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F94C0218D
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:48:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.29136.1737895693610777616
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 04:48:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NpbEJfDA;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so37494515e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 04:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737895692; x=1738500492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZtIqVMFasQDdMWJGkT2E7XlcXSDJCN4lprsOhBxcho=;
        b=NpbEJfDAqofZvp862+84p4eHZ/JqNRn6F6TrBhexD1wSCYa2RHen0FHoH36cttB/HV
         lzwmYSpDRpdD4fB4yXgRs6t+P/NwNmoe7PPVExv1wHyQEfgzeQ6IE0fmVlsjXF6D5pBj
         I2pT1PY447BWtCUMguy541EW5iGFoaeepHgXpb1buHviEqJZhFC0RKcTXtDH3VKZuy0L
         uEReAGPGi/9pE1mhDQJNWXulVftso9DUNquKDKPyiKA12dnBGVDqptLkzDUlqxm1soAy
         I3tcgLhNiaQSI1HLFVldkJw+DiR63wmy7VSU6tOk48ejZuAqk1uvPoKbFo6sus3ehCej
         WozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737895692; x=1738500492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZtIqVMFasQDdMWJGkT2E7XlcXSDJCN4lprsOhBxcho=;
        b=h2K1io7mCePDQHD5nLWYzuxhEUHZTy7AlB9hhpk5y8uAz6UjIAPh42s8Eih3MFHsvp
         9/ZlE6H9TmmLPI5n8siZWdOal9dVKrWhuMD3hsDnYNjh2rdnpz7PsVJMn8nl+Z0gkQ0B
         XjA/pNlilAS/PtU9pJoP0GIp1mD57pxHInoftdT1Cm/UhPmkjk1K4OT2kMwjALy9fpgC
         3+AX0FzTGsjY61Kpepf8Jhvh053ZaWTV/Ons1ntrD0YzH1jmfidxEikdR6VoWfmzG5DY
         GIBnak1Cie6lSToVotAQH1qODN7hq5zeN5GdUvsjtQpbLsrfMV4LViJa1iDGzNkYRYYL
         lwdQ==
X-Gm-Message-State: AOJu0YwPowHrnzNYtdyAjD3SrVr7WyGqdSYjSoe23GPGp/+vh1nbzHcn
	laEVmoR5RG+hwOHATJxceHe0/8pv+mImfOmwi1VgBZoE/ydvrnhCx4fEnQ==
X-Gm-Gg: ASbGncvtYFveoHbNTSviJ41+PQOfH+MvJcG+RrAB2OGTWR/Jc0Ja0dkxE/cMWL8WMeD
	0sfdKmAsEFaS8VBgOU6O0kzn9zqoEVi1oIOxLz6+xjQwma3DKyeam6/40F3yA2NHNQo/D7YB9c5
	9bi16b1KYbTx2MwJ4e70de2CBQOUmJ1pFmC8sDwTCXQYJfrotJbb7iD9WSgTeKMIYTCy+roZSS7
	V3uvd890pj/WNCuS0wVymw4jtq6VM1qZNIg5evOKZx23gUOO3/hBZVkGTpeL63rumSowCbpaqN1
	mTH4LfnmglKTH3MC4ESjPgmUqio=
X-Google-Smtp-Source: AGHT+IFcrPI2n0xX91D1ovMdzSq3VUAYp5bdesynw+cMTBuBf5Ggk6GzdR1LAWZ1yib0pv+qK3VWOw==
X-Received: by 2002:a05:600c:4f84:b0:434:a90b:94fe with SMTP id 5b1f17b1804b1-438913ca9bamr359192105e9.10.1737895691691;
        Sun, 26 Jan 2025 04:48:11 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48a906sm95938295e9.18.2025.01.26.04.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:48:10 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap,styhead][PATCH 1/5] devtool: modify support debug-builds
Date: Sun, 26 Jan 2025 13:48:02 +0100
Message-ID: <20250126124806.1453644-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250126124806.1453644-1-adrian.freihofer@siemens.com>
References: <20250126124806.1453644-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 12:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210280

Add a new option --debug-builds to automatically add DEBUG_BUILD = “1”
to the bbappend file of this recipe. This is especially useful when
invoking devtool modify before invoking devtool ide-sdk to perform a
remote debugging session.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/standard.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 05161942b7..908869cc4f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1031,6 +1031,8 @@ def modify(args, config, basepath, workspace):
                     if branch == args.branch:
                         continue
                     f.write('# patches_%s: %s\n' % (branch, ','.join(branch_patches[branch])))
+            if args.debug_build:
+                f.write('\nDEBUG_BUILD = "1"\n')
 
         update_unlockedsigs(basepath, workspace, args.fixed_setup, [pn])
 
@@ -2396,6 +2398,7 @@ def register_commands(subparsers, context):
     parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (when not using -n/--no-extract) (default "%(default)s")')
     parser_modify.add_argument('--no-overrides', '-O', action="store_true", help='Do not create branches for other override configurations')
     parser_modify.add_argument('--keep-temp', help='Keep temporary directory (for debugging)', action="store_true")
+    parser_modify.add_argument('--debug-build', action="store_true", help='Add DEBUG_BUILD = "1" to the modified recipe')
     parser_modify.set_defaults(func=modify, fixed_setup=context.fixed_setup)
 
     parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
-- 
2.47.1


