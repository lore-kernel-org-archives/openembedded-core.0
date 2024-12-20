Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7434E7718B
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 20:42:02 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.4128.1734727312847997055
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 12:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KcW7sztb;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3eb9bbcc936so1216700b6e.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 12:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734727311; x=1735332111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PNNxYWCsZf5GuJYn34sLgvqUKT/O2E7PGd+Bl76vA+0=;
        b=KcW7sztbIrOIoqgJO/JRtmYWuNE3aM7+uB7K2HHNiutYJvHgkDgovJc/MgesFlPvgD
         OaDzEqS33SV/QKlQJydwlKHZYyM0A0qn5aPcL5ke/TW+hM1t9Fx2tCqP7j95wUpdjOpe
         GHZb2I8zFHR41pw2csCiZGse9eDDx3Iv4pgv+RvymjWQVd+jUV7RM2tT0ggiGbFAcjB+
         Ut5Akp0vyyRGRLI3A86pWI70sIBx5e9nni1MPtCtO1zXs0Ux6mGzMj/uJ7MC3UXQ8D8s
         vx0dGNk7Y5POLmK/oLiDbr17sqHc6k8cn7Cntn7BBdmPM4uKyKPyRAkLvOgmxvTPAbh4
         0fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734727311; x=1735332111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNNxYWCsZf5GuJYn34sLgvqUKT/O2E7PGd+Bl76vA+0=;
        b=edY78cLDEmQMzm+FGM8zRAJfvYf5fUVOtDVJjBkPXbdumpAprA8qssDzjuPLmtlFyM
         FJihVs1YeHvJMqZIeWarhqPU27AvmwG64lL7zW386hlEMPn/O028x2dqKN8t9xo4+VVb
         AKoOArnC7Gsy1B3vtFE86ofWXEDkE8dvOqivehLvCOuDzmcUnYP4ylypG8YX9p/AmosD
         64GYKpeEPMY9PxWh7bzYHlfRGnvp4v4b5jjAej8bcsX6bTQKvnxlqRDRLQHqh3PGwomp
         3O5qMOtM4ZpFw7zMVdrwbk87CgIuLazBDCH0nArl9VafTlZp9JMIdWWZYwZLKGdbCRqS
         O30A==
X-Gm-Message-State: AOJu0YxrQ1SbO54VhK5Vrd8TOxo5VOm7lVe7uireR58PmM8lv1g3RPqw
	h3841zwquiMJc4WLV/gGGuUoPua/Bchyle07whxTkIJ2LdftmBhtVCPx+A==
X-Gm-Gg: ASbGncvbTJ3zGF0TAe8bOfXzwc6T/0RYrQA72cNrsfPW8YUSHTSCXQvX/F6J3YiLsYI
	/bBl8v05oCQEPhTreHcN6ImW4tYV7LvgyDpqgrjhZsZ0cG/fd97YyIWyeV71lFPydpGlFhKUqCF
	Ez89NQ1fP+cMtepmOGPtUoKN49q/shH2FpCfn/a8N5Qjiw4NYrsB7u/snhfadHIZEK+B9GAeX9A
	6tKLZKdOZXXnAUHYO2AUFt2j4sW4CAghSbxsVUxThucMppqpezEh7U=
X-Google-Smtp-Source: AGHT+IE0qzrBOak9/31bm1uTVpgmu3b0HFs/wLUMNdCFzynhdtdHvJrVrEEw5PLqGQJt48dJjoq62A==
X-Received: by 2002:a05:6808:14c8:b0:3e6:580e:f12c with SMTP id 5614622812f47-3ed88f42295mr2257042b6e.10.1734727310891;
        Fri, 20 Dec 2024 12:41:50 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ece26db9dasm975106b6e.48.2024.12.20.12.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 12:41:50 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/2] lib: configfragments: Restrict fragment file checking
Date: Fri, 20 Dec 2024 13:41:44 -0700
Message-ID: <20241220204145.2636370-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 20:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208988

The current implementation of the config fragments is too aggressive in
checking files; any file in the fragment directory is checked, including
hidden files or files with weird extensions. In particular, if an editor
is creating temporary backup files when editing, these will be checked
and will almost assuredly fail, which prevents the tool from running.

Add a filter so that only non-hidden files that end with .conf are
checked.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/bbconfigbuild/configfragments.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index 30cc5ece07..a0c3883399 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -43,6 +43,8 @@ class ConfigFragmentsPlugin(LayerPlugin):
              for topdir, dirs, files in os.walk(os.path.join(layerdir, fragments_path_prefix)):
                  fragmentdir = os.path.relpath(topdir, os.path.join(layerdir, fragments_path_prefix))
                  for fragmentfile in sorted(files):
+                     if fragmentfile.startswith(".") or not fragmentfile.endswith(".conf"):
+                         continue
                      fragmentname = os.path.normpath("/".join((layername, fragmentdir, fragmentfile.split('.')[0])))
                      fragmentpath = os.path.join(topdir, fragmentfile)
                      fragmentsummary, fragmentdesc = self.get_fragment_info(fragmentpath, fragmentname)
-- 
2.47.1


