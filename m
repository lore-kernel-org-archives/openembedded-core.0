Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A67C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 15:56:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.29049.1754495778278607614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 08:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=P98ocD7h;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b7961cf660so5673661f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1754495776; x=1755100576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TYIraSn5e4mf6MQm4i3i9cwUo1jZnYx+sr6EwrRTA0=;
        b=P98ocD7hvLGlDxZ3JlkfO/sXAs/cuPDYZNhK/DdFltskYafh7nquL8IUnVBSEmgfFC
         0tGMBje7ljDmthVuQhkK+f9+Q9z8MpygJzbQAbwh1hGw1FW1h8KRNYcCpc8Z0x0Jn9um
         xa/rH08GrHKoQvgBZ3wt/VcIU58IIVa217gzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754495776; x=1755100576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TYIraSn5e4mf6MQm4i3i9cwUo1jZnYx+sr6EwrRTA0=;
        b=XtpZFqXj6mg9dFGEvTvHCmMlkO8CuY26cFDF9FXFuJ+SSlVGL/oLjzNmadRUsUneKC
         bpOC00I68OR7FDvHumQnMneJ3D3kHr8E7MPYjcBP4XIMFLjbg2/QG39LC1NXCfrzCEUI
         dHyZt44e0L9Oag6ukkvXny/uSn7HUmeSa+IjQx+9BrBcmG08BAf6V1+wNySUJsPvX0kk
         HnwD/MVxIFU14GLBoHBAZ5dtDF5707blRa2U9SuRJofv7EiEC1iI6+Q1/V8pPXbTC4yk
         EnOedGsREE/lt+MKaZWlssmZ6p8lLHd1ABTB+1/FpYp3u35Ox1F9y0oFeBUdmeScIj6W
         MynQ==
X-Gm-Message-State: AOJu0Yxa26u/lMBz06/7hiPA89BDZmn8M6dDr1rKBtWDyI97OHUcI/WX
	RkJVkWItsxQjxtYbPlSHtiYDq8dUI5OeVGHpjpISaAxq4lVwrS1c9HggoScPx71yylyTFJoH7Fz
	vEv/K67EGTw==
X-Gm-Gg: ASbGncuBE9Bd8sg6ZotCX/fos1G05S7K3YvBcmAaq7t3I71Y0eQ/WkvkEUS2zCNVgyB
	AL6yZk+V7tcw6qlTHEEb/rJGkE/gVzjIQ1a53q92howi4wKW/M0JAXSI+6sngIT4ZWfgzlzSyld
	MCJXYDKKeuw4MhPb4P7LP6+j2WkC1VLMJROyhp0YxKZqvsd4LNM52UHLAXhxPo/tHrEajlsSqG7
	BNA77xom/dtMZuhQ/7EV2P2FzrD0lWaDi80hYV/sg5/m+kWUcA6iQngzY9FJdv3cnN+lRFlYbYu
	EH5U06SZ/AIlrSlFUJLnXGfkuYNJDTvwmE2VrovjmeIZU1dIkatGINe6nzfB4ITp62DFMY4zEZZ
	rkY5Ov3+leiY7c0AHh2cN+lpSSO26y6rbRg9nokJcQSs=
X-Google-Smtp-Source: AGHT+IHXTVWhc/vKdHB7lkxfSzh4qtcsgE4v1lZLSk4iTzwDgp5zCm4yCIIgl13RNaPOiKIpMiC0FA==
X-Received: by 2002:a05:6000:2389:b0:3b8:d30c:885f with SMTP id ffacd0b85a97d-3b8f49434aamr2953434f8f.53.1754495776330;
        Wed, 06 Aug 2025 08:56:16 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([2a01:e0a:c98:1830:6f9b:f71f:aebe:8ae2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bc12csm24010476f8f.28.2025.08.06.08.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 08:56:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [master-next][PATCH 2/2] runqemu: refactor a duplicated cleanup statement
Date: Wed,  6 Aug 2025 17:55:49 +0200
Message-Id: <20250806155549.3395012-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250806155549.3395012-1-yoann.congal@smile.fr>
References: <20250806155549.3395012-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 15:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221547

From: Yoann Congal <yoann.congal@smile.fr>

Refactor using a "finally:" instead of a duplicated statement inside and
outside of the try/except block.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/runqemu | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 4fb85177e3..3a339acc2a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -450,11 +450,10 @@ class BaseConfig(object):
             try:
                 subprocess.check_call(['zstd', '-d', image_path, '-o', uncompressed_path])
             except subprocess.CalledProcessError as e:
-                self.cleanup_files.append(uncompressed_path)
                 raise RunQemuError(f"Failed to decompress {self.rootfs}: {e}")
-    
-            # Mark for deletion at the end
-            self.cleanup_files.append(uncompressed_path)
+            finally:
+                # Mark temporary file for deletion
+                self.cleanup_files.append(uncompressed_path)
     
         # Use the decompressed image as the rootfs
         self.rootfs = uncompressed_path

