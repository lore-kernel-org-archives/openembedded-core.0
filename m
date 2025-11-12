Return-Path: <andreas.stergiopoulos@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D73DCD13DD
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 15:58:00 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.669.1762963073292412309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 07:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ML+lV89r;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: andreas.stergiopoulos@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b31507ed8so836864f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 07:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762963071; x=1763567871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWcB6+voaW2FE5+Oj4RFqVEONxt4cSbkFe61+ErOulM=;
        b=ML+lV89r1mFRQBL3BXJncwHFQgAAediQynipQTKI01zyXQiekU3nY2tXHuW3WJpqrA
         xnaCaoT0clEkUg+vqTVatW380H/7XkgOqMVx9vKgWqLJTzuQyHIZT86+z3MuWhZV7gs+
         28IEgYighOaFoSyCRzpkKit90dxsNhC5Kn87w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762963071; x=1763567871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWcB6+voaW2FE5+Oj4RFqVEONxt4cSbkFe61+ErOulM=;
        b=p5uo9pTLqPO5H+YXyeNxdBTPcDk78Cgz6l+wqvYaG2xFtqFdlA1/F9uc7O3D0115ag
         Bi/B4FC1Uo5cWWXOuPKJNbjNScY2PwMBvnhIb7FSz1G6P1tUoK2E7O2gRWRD8m/7fUNT
         UFLdWGsW+QsDU75jInvMHkgDW6X5wY8AA8helcxIz2VgnsQ2RPP0SIVsdDTGLn6j39UD
         aJ6DI6mFnm753AC7ij08gZ6+zWSCgVgM4LJI8ugE8N9NAh0rV1e6O53fm2xWUs+tG8v6
         MpXP9tEOPYmMWYe5iNReFlKoXyl8b+t5XDueHlFZMknEYk+HyW7r2FMOCu0rM5CdfVpx
         sxmg==
X-Gm-Message-State: AOJu0Yzor86KwLWfaTStnpfuDPVwMSXBmbr+LftV9paKGym+fMmIT5qv
	ZQ8IME3huZnTVbDaVcpQTHLYkw8wqQV6mgEcgGbLCkrFLBgvEUBsmBZgm1Ng/lavgaXZ7Nm0rLH
	5Hiac
X-Gm-Gg: ASbGncuEJcs6/3rKwQVJHqO98xeaEFpRok4CDh34rBNNqDk/rs25esrLiRJCcBOzPu6
	GQuanC657iY5Hy6u4iUEfqEby+JDwDsR4xYImM9EZCZ7D7B56Us+bn5TpN50X2+ldnxhAElH4Ta
	c+d45YP584ExDrfgz6sX/sJqd0U4AKTf73sZAlPKeY8MJj+4VC9mPwZYLUDx3b47ajaF+DSJaZj
	LKWMHazkpnildM0XCHbVTTUdN+MxuJq0RETF1sL1Z4zV/l0wZzOxUeVL3MeGVHyLW6PYDIgJApC
	xlSZH/VxBMOPtkRUwoJKFQTjaD2Pjt4aCEcExl2tKKjheNzZbQKg1HDOWLoUc0+BPpcub9rGv7U
	Fag1FuG++SEZc8wArk/7YmAQGhOiptARgiaIdB7z+vmGegRiN5qKFa5+TMqyLX0Wy+8tEViRPOC
	oQ8TcwKE6F60pTmdmSkRP/DnUjn7ycWG+r8q+733WEb7SxcLOWsSG7klFC27WSbHqskTKozNf6V
	JBlgu5srbCfScpnBsLE
X-Google-Smtp-Source: AGHT+IGQO4PYqKUSNCQFMcGgcUDgkF1kb5bMtbZVuAPqS6iqj1cs4amtmlVeBRz61l5vrIWNJp96hQ==
X-Received: by 2002:a05:6000:1883:b0:429:c851:69bc with SMTP id ffacd0b85a97d-42b4bb8ed47mr2325697f8f.8.1762963071395;
        Wed, 12 Nov 2025 07:57:51 -0800 (PST)
Received: from FRSMI25-PILS.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b23csm33976612f8f.10.2025.11.12.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:57:51 -0800 (PST)
From: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
Subject: [PATCH 1/3] ptest-cargo.bbclass: Collect only test binaries and not executables
Date: Wed, 12 Nov 2025 16:57:28 +0100
Message-ID: <20251112155730.646159-2-andreas.stergiopoulos@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112155730.646159-1-andreas.stergiopoulos@smile.fr>
References: <20251112155730.646159-1-andreas.stergiopoulos@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 15:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226207

This commit changes the files that are collected during compilation of tests. Till now, all the
produced binaries were collected. This commit changes the conditions inside the loop so that only
the binary and integration tests are collected. To do this, the variable "test" of the object
"profile" is examined. Tests are all compiled with the "test" profile, whereas the binaries are
compiled with the "dev" profile.

Signed-off-by: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
---
 meta/classes-recipe/ptest-cargo.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index 30463e117b..004abb40f7 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -55,7 +55,8 @@ python do_compile_ptest_cargo() {
                 current_manifest_path = os.path.normpath(data['manifest_path'])
                 common_path = os.path.commonpath([current_manifest_path, project_manifest_path])
                 if common_path in [manifest_dir, current_manifest_path]:
-                    if (data['target']['test'] or data['target']['doctest']) and data['executable']:
+                    # Collect tests (integration and unit) and nothing but tests
+                    if (data['target']['test'] or data['target']['doctest']) and data['executable'] and data['profile']['test']:
                         test_bins.append(data['executable'])
             except (KeyError, ValueError) as e:
                 # skip lines that do not meet the requirements

