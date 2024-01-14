Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B97C47DA6
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 22:14:51 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.52018.1705270487277294657
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 14:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XMFmQTyN;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40e586a62f7so56960525e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 14:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705270485; x=1705875285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sz9hf9rJQjPVy4Q9SbgvcNjWvjydRtS609XVC+jICFg=;
        b=XMFmQTyNVWYw2hlkd59BKqC+X9lFn4HVcw0dnWdqaQ7gywohl/P3NVmxvkF3jlk8/E
         e95U6LeEDDERDrqhU7Qm7hX4mKA03wGISnSMdjg6U4QqxBbiT74cKcrhyNpVdesmD9oA
         3zZT8M31Sy5rgWj8GlpuWj6JR4FSlRXjUAAw5lLeiHhhA/5PYAwP9yDthFe7fyKOwhEb
         4Q/6b0YzGpOuUb/tLNheTbJxAIiglweM4FI9I3hWCK7IAID+XBYnYgoVPDxGZm4eCcbV
         7WUXdKuxIsb58C2mAU2sEGn9Mk52EEa/IEpN9hoGRF4zVyMasm7RyYT8KaXgb77+Mk9T
         ThkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705270485; x=1705875285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sz9hf9rJQjPVy4Q9SbgvcNjWvjydRtS609XVC+jICFg=;
        b=Y/gsD1Dd8/jVkBomTRXJTovXQIRSPUYMLliAUN5kxIjna4VJV2PZTfOQDF7HX8AK6B
         6nBC5OFD4huUIDIP/MLGzsZAZWIK/VHx4pyW0HYc7B8eZ2v7Nm/7/Xci+SQmEXZalOKE
         Ha2UG4yQze5vgLmotfGmc6mbPHBi6aqtNMQJJU3Rhr9QJgBQo/Tvsw+M2n89Hq+1cBAg
         5j/2QxGcjXVFrWaC8A5WwAYNFzBD+Y2akfCMxM8J1l4Zohy3Yy+zTL0ZVONwhC76DXC9
         1lZC/Rcxy9KOOId4V+ofdtCNnOp0fp3y9+C85R5zeDHDvIoYS+IMSHShlqt2U28ELawQ
         hexg==
X-Gm-Message-State: AOJu0YyBuXvXPXeSwJ14Cu/and6RcTN4kvJRIbeWw52kBrHHctyrX2wX
	nt/OzAwgYVS2DW9Y9NIK5Od2H2yuYwY=
X-Google-Smtp-Source: AGHT+IEMb5913epyxmJmzqikEZL1nzuytZdfI0NOGMY0dzpw328dtsBtEcUwj38ceqF69FFDiFHMrA==
X-Received: by 2002:a05:600c:2e05:b0:40e:6ea4:bf57 with SMTP id o5-20020a05600c2e0500b0040e6ea4bf57mr1312316wmf.126.1705270485581;
        Sun, 14 Jan 2024 14:14:45 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id t21-20020a05600c451500b0040e3ac9f4c8sm17451943wmo.28.2024.01.14.14.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 14:14:44 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v9 5/9] devtool: refactor exec_fakeroot
Date: Sun, 14 Jan 2024 23:14:17 +0100
Message-ID: <20240114221437.1255866-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
References: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193623

Provide a function exec_fakeroot_no_d which does the same like
exec_fakeroot does, but is usable independenlty from bitbake. This
allows to use the fanction from scripts where the d variable is not
available.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index b4f998a5bc4..c7fc3cfc410 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -78,12 +78,15 @@ def exec_fakeroot(d, cmd, **kwargs):
     """Run a command under fakeroot (pseudo, in fact) so that it picks up the appropriate file permissions"""
     # Grab the command and check it actually exists
     fakerootcmd = d.getVar('FAKEROOTCMD')
+    fakerootenv = d.getVar('FAKEROOTENV')
+    exec_fakeroot_no_d(fakerootcmd, fakerootenv, cmd, kwargs)
+
+def exec_fakeroot_no_d(fakerootcmd, fakerootenv, cmd, **kwargs):
     if not os.path.exists(fakerootcmd):
         logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
         return 2
     # Set up the appropriate environment
     newenv = dict(os.environ)
-    fakerootenv = d.getVar('FAKEROOTENV')
     for varvalue in fakerootenv.split():
         if '=' in varvalue:
             splitval = varvalue.split('=', 1)
-- 
2.43.0


