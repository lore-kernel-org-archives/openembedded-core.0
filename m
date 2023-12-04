Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DF5C10F07
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:59:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.73100.1701705585550210147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=qFxLOUTd;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40838915cecso47118765e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701705583; x=1702310383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/f9cm/lL6ltdCUfGCbC8zquWoEImJOxxnBFdz4FribU=;
        b=qFxLOUTdse4t+ThtTg1scap5d3LuiEW27QNhezzJRdxfmcwGQIcN6bSyLT4ijfSpMy
         mjWQktV+cY1Ee0HgwYgJa7M0MpqvzBf9MZ6GvrqQ4qKHc/6hGXH+RMr6eN9EBvbtBVWi
         Nq0ght4m4E8lz9JW1/uyncyO3ucqywWPd4x/DJKTca6V9f571IJElfuevNvCod1KCMO0
         Wc84biK91epAN/ipwRG+91iz2KyEz815PSBrrlufk4vGRmKGVIcDZDu4TisVIRNvkMrj
         wmpvCnT+hQa75ri15E8ZaKul6wCvYqLmgH/lptBXH7h5ALO8+z/AneJ9xCUFNzAREnr9
         Txlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705583; x=1702310383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/f9cm/lL6ltdCUfGCbC8zquWoEImJOxxnBFdz4FribU=;
        b=Wl6us9PX6jxOviioAJ0UClvt7SpLr4juwtpXDZA20W4O2nwPqG01h1F1ER2SWTJgz6
         ZNmrK87uMmrhCO3TpyR/TlIIJMQwkGWonmtYu0SthZ5bv1bK9kDDw/I/lQ8Aalv5+Qn9
         Fiz8kquCpPLTtp54954ROukCNMWph1Pj9/A2H/Qlz2oAvT2HNGZtfaO1tq6YkxuqEtPX
         s8obSgqzpaD0dsvtVNdR1tq6SJxpwOF7nnYG5EbfGqPGQopQMdA0dBkYbCz+AcYwxQqQ
         VUEnCfdPISMVPTAb8+oOwolvL2701aLLyLB4otXrjAdz0QZbC9eqTJf6FolWcOyqdBQ7
         AKxw==
X-Gm-Message-State: AOJu0YwyQJKk0VEQPh6LNhcM2o9EJcV8/BzutqehiV2/zAqdvEARpyCS
	nsojzEvgMIwzwJ6DKQpoOIa87HWdHV2nJA2wtIjqpg==
X-Google-Smtp-Source: AGHT+IF4qI41TphjhYzqszwpkZd4gpH5hUa5k9KezyCfZjI8ITnQKVnI/IeTaM4vz5ObKsUR/RWGHQ==
X-Received: by 2002:a7b:cd0e:0:b0:40c:ec3:fbd0 with SMTP id f14-20020a7bcd0e000000b0040c0ec3fbd0mr405050wmj.85.1701705583436;
        Mon, 04 Dec 2023 07:59:43 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c4ed000b0040b47c53610sm15479595wmq.14.2023.12.04.07.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:59:43 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND][PATCH 3/7] recipetool: create: add trailing newlines
Date: Mon,  4 Dec 2023 16:59:30 +0100
Message-ID: <20231204155934.836992-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204155934.836992-1-jstephan@baylibre.com>
References: <20231204155934.836992-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191757

create_recipe() function relies on oe.recipeutils.patch_recipe_lines()
which relies on bb.utils.edit_metadata(). edit_metada expect lines to
have trailing newlines, so add it to each lines before calling
patch_recipe_lines, otherwise edit_metadata will not be able to squash
blank line if there are two consecutive blanks after a removal

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/create.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 293198d1c88..f5d541eb6c1 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -873,8 +873,10 @@ def create_recipe(args):
         outlines.append('')
     outlines.extend(lines_after)
 
+    outlines = [ line.rstrip('\n') +"\n" for line in outlines]
+
     if extravalues:
-        _, outlines = oe.recipeutils.patch_recipe_lines(outlines, extravalues, trailing_newline=False)
+        _, outlines = oe.recipeutils.patch_recipe_lines(outlines, extravalues, trailing_newline=True)
 
     if args.extract_to:
         scriptutils.git_convert_standalone_clone(srctree)
@@ -890,7 +892,7 @@ def create_recipe(args):
         log_info_cond('Source extracted to %s' % args.extract_to, args.devtool)
 
     if outfile == '-':
-        sys.stdout.write('\n'.join(outlines) + '\n')
+        sys.stdout.write(''.join(outlines) + '\n')
     else:
         with open(outfile, 'w') as f:
             lastline = None
@@ -898,7 +900,7 @@ def create_recipe(args):
                 if not lastline and not line:
                     # Skip extra blank lines
                     continue
-                f.write('%s\n' % line)
+                f.write('%s' % line)
                 lastline = line
         log_info_cond('Recipe %s has been created; further editing may be required to make it fully functional' % outfile, args.devtool)
         tinfoil.modified_files()
-- 
2.42.0


