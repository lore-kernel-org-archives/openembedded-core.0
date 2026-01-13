Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F1CD2D11B
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:43:23 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60297.1768315400927274747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 06:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=bPPFqpLb;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.48, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b7b08fc0eso757768a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 06:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768315399; x=1768920199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eT8KLyj8aBeK85Nv0/NPb72uftcbknaGlPN/NVWkcI=;
        b=bPPFqpLbUiEb6i6+9tmaqZZxbJqF4L9KSGWyKBCyzuJOXjnDChuZkwLMXYS1zGA/Fh
         blA8cWPOarFOBa45LC+10y/mfIXK4bxlHpZEjop4MMAq+reRPSAQxy4n0oW9jidZYL36
         KjzOKft/0+jauHzPZxt+XYZsFx5oxS7yxG+pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315399; x=1768920199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eT8KLyj8aBeK85Nv0/NPb72uftcbknaGlPN/NVWkcI=;
        b=GI7j/jO3rDnIZ4zdFUXlw/exohiSmoI94If09Q26cQNC6mDlKQ8liW5iBNYE6Zu98C
         T4FrzJt536K0jm9qjlR5y1of0xfj5N8CrfEIuja/lLGWVmjykK45R+CslNTKXdwbIXoA
         TDsgday5vAWxsjVL1c0GKUhp8TH0HyTfsJBftvW5jzp6iUdU03cmBsKwW+DfhT1KLU7L
         s1kes95T/fbQ6Vr66gWcdqDeiV5WRA3eS0u8zMhYSiMq4sftBjsvPrqAhEzfbkxUF2lC
         saas2/Mype2jsrHNQmyD5xz0tzJUSSgQK0PnD/d7XKBKOuBdRxD7qHOAiGV1asZsp2PL
         Tl/w==
X-Gm-Message-State: AOJu0Yyc63nPY3brr1Rppeq1//Tz+dhi9WucCWKnNa9SU0SMu+fdpp3O
	EuD6TbvONNlgo7A53zPQqLEIFxdgaWf8DbFEtjl/CjBdRqbmvAh+0fxuwjAy3KBc3Tc2yITNSqs
	I8JFD
X-Gm-Gg: AY/fxX6dXjXOFpHMRGRCH6cc/k84BOQ4YgAqCe+3kQvWyo7L7suHRgYWTI49u8CQF8O
	sdtOPmXjDxLLbNXUC834BxRNhVwkTlyfw4pEu0EuRbgYxwSwfjRxUlr3eg8w6o6Ye+W0nC5pfuj
	APj/P1+I12guVzEnNbqSzJP370Oepoo5cs8B73U09NpaumWdkce8Hve0IN060GGB/Vdzh8FG7Be
	mAE6VfclayWVYpZEfD8Klvf6pdvyTSopbm6G5Hji4tnCH6Kd1D4pEUBx9W/vUGk0SvrcHtQB0a4
	tVjvJJwPXFOeCpQBAmEx2hyD/U+o+uJ4ZVkeJfKpSGeBSnrXfnBoZGWzCCbdm293hvU7aNBnuJU
	eT5cw1dogfT6KaLFjWm6SDAc8GjNsDNlEQOjKKgI0ZuXCiXsBYty87ipg2kudwNCB4X5ZGzhErR
	tjI0d1rtLQzqme6T6R6Uk/GAnRIpHzSoqb7voOIZw9buiHRpyf+oDAjv1SviM/nls4nyZ9J4UXz
	JaCqnaFiCj92ege4otRr1ffkQcC/Ad+IPWTpcmK7r87QvN8BfSl
X-Google-Smtp-Source: AGHT+IE0PKJPV5OHUXkP6LGel7YlbOY3jsFMLFwfzL52L3f/3dF707d70zCNVbdWa2dfm+XUt69m7g==
X-Received: by 2002:a17:907:6e8f:b0:b87:17d1:a98f with SMTP id a640c23a62f3a-b8717d1aadbmr434278966b.3.1768315398982;
        Tue, 13 Jan 2026 06:43:18 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a23433asm2244955266b.3.2026.01.13.06.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:43:18 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 3/6] wic: extra-partition: Move extra var handling to a dedicated method
Date: Tue, 13 Jan 2026 15:43:10 +0100
Message-ID: <20260113144314.3563680-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 14:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229269

For organizational purposes, and to make the following patches
easier to follow, move the extra file parsing to a dedicated
method.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../lib/wic/plugins/source/extra_partition.py | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index 040b6d22ad..d41743ec40 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -36,6 +36,20 @@ class ExtraPartitionPlugin(SourcePlugin):
     name = 'extra_partition'
     image_extra_partition_files_var_name = 'IMAGE_EXTRA_PARTITION_FILES'
 
+    @classmethod
+    def _get_extra_vars(cls, part, var_name):
+        """Get extra partition directory or file variables"""
+        extra_vars = None
+        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), ("_part-name-%s", part.part_name), (None, None)):
+            var = ""
+            if fmt:
+                var = fmt % id
+            thing = var_name + var
+            extra_vars = get_bitbake_var(thing)
+            if extra_vars is not None:
+                break
+        return extra_vars
+
     @classmethod
     def _parse_extra_files(cls, part, kernel_dir):
         """
@@ -43,16 +57,7 @@ class ExtraPartitionPlugin(SourcePlugin):
         """
         deploy_files = []
 
-        extra_files = None
-        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), ("_part-name-%s", part.part_name), (None, None)):
-            if fmt:
-                var = fmt % id
-            else:
-                var = ""
-            extra_files = get_bitbake_var(cls.image_extra_partition_files_var_name + var)
-            if extra_files is not None:
-                break
-
+        extra_files = cls._get_extra_vars(part, cls.image_extra_partition_files_var_name)
         if extra_files is None:
             raise WicError('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
 
-- 
2.52.0


