Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.48141.1622488321790722942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 12:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u02RqKWP;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id mq2-20020a17090b3802b0290162428291f5so458758pjb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 12:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KZGbGQD8mN1X99mAMpJN+uJ1vJHncj5mWC7cgWmdHEY=;
        b=u02RqKWPDOq/2RxK1727F/Cez2Ia1l2hQetIzYiqNcaUvdiHt7Hlm1bd/rolYD2GiO
         iizRnxyMzfxDnbpAR0xdSumPli4/GY+Bg7gfO5dk2/kORy/stDkUK6FBNkxHYAdjzSPp
         8yEy76+G7Wmh8gfNYVUnZYCaeEYqtRIIhajGZS4vs2H+cCzTTN7NDhkx7kovKhpRDFaL
         GODN8ECEEd2dJdCRAXdQbg7pvnojKSaLOPY42EOrCpUxcbng5zLcQdBz8sm6tudCM8yS
         FEzmTuV7JvulBus55V/8kQCsiXKuW5KJWscqQvSu0JGLR44Lfhh9662gVwmsqW77C+2T
         mPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KZGbGQD8mN1X99mAMpJN+uJ1vJHncj5mWC7cgWmdHEY=;
        b=E+INs29lJZsBxj2zgUC94FgufaLLIrc+nukLlCN3tGgTRGds4tBTd+FPMlyVeiHWOD
         gTTyPe8asPm9Lw8k2ji/+U3+ZXoDh8C17/cfRfbiL9tFXb/gvTuctD6LdwdniJPWvi5F
         rqlCstKSWjDTBVXOBEpk/YR4/Vx2UoXlyaTr5/7vmBqaMSUPe0sdT2oOmcK4bqLhY07y
         6HkuSmvQowHxekIsTcPcBFpt+Fy4RH7I7zB0G1Nm9btaa6+B4Gs2nYCwVz+1jcEKq41g
         EkeNRg2pFfyavm8+d4j8MpwXz/wzH4UvYgEdtwU8QQwW1OXe8FzD2VsdNjahdEDFKBWx
         FuhQ==
X-Gm-Message-State: AOAM532BL4tniAo6wTI+bZJQ/Iyfzu4/1ZpxngPpDNiIVdFCnU8nNtdS
	sqoFVo/Pjupl+I2dB9QDth88MAXxUxlIVA==
X-Google-Smtp-Source: ABdhPJxkfKjlZpxypmBcsAVW9+mlCohK6mT5qo+kJvt2T+2Lan7xmkN7ejcZHVsJafa9NAN7/kjsKg==
X-Received: by 2002:a17:902:aa04:b029:ec:f779:3a2b with SMTP id be4-20020a170902aa04b02900ecf7793a2bmr22102415plb.44.1622488321152;
        Mon, 31 May 2021 12:12:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from kona.dnls.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id j5sm10799327pfj.185.2021.05.31.12.12.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 12:12:00 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] systemctl: Stop tracebacks use formated error messages
Date: Mon, 31 May 2021 19:11:57 +0000
Message-Id: <20210531191158.964098-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210531191158.964098-1-akuster808@gmail.com>
References: <20210531191158.964098-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When systemctl fail it would throw an exception and
dump a traceback. Lets use a more controlled workflow.

[Yocto #14395]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../systemd/systemd-systemctl/systemctl       | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index de733e255b..e8c3d2d1ee 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -160,7 +160,9 @@ def add_link(path, target):
 
 
 class SystemdUnitNotFoundError(Exception):
-    pass
+    def __init__(self, path, unit):
+        self.path = path
+        self.unit = unit
 
 
 class SystemdUnit():
@@ -224,7 +226,10 @@ class SystemdUnit():
 
         try:
             for also in config.get('Install', 'Also'):
-                SystemdUnit(self.root, also).enable()
+                try:
+                    SystemdUnit(self.root, also).enable()
+                except SystemdUnitNotFoundError as e:
+                    sys.exit("Error: Systemctl also enable issue with  %s (%s)" % (service, e.unit))
 
         except KeyError:
             pass
@@ -265,7 +270,10 @@ def preset_all(root):
         state = presets.state(service)
 
         if state == "enable" or state is None:
-            SystemdUnit(root, service).enable()
+            try:
+                SystemdUnit(root, service).enable()
+            except SystemdUnitNotFoundError:
+                sys.exit("Error: Systemctl preset_all issue in %s" % service)
 
     # If we populate the systemd links we also create /etc/machine-id, which
     # allows systemd to boot with the filesystem read-only before generating
@@ -307,10 +315,16 @@ def main():
 
     if command == "mask":
         for service in args.service:
-            SystemdUnit(root, service).mask()
+            try:
+                SystemdUnit(root, service).mask()
+            except SystemdUnitNotFoundError as e:
+                sys.exit("Error: Systemctl main mask issue in %s (%s)" % (service, e.unit))
     elif command == "enable":
         for service in args.service:
-            SystemdUnit(root, service).enable()
+            try:
+                SystemdUnit(root, service).enable()
+            except SystemdUnitNotFoundError as e:
+                sys.exit("Error: Systemctl main enable issue in %s (%s)" % (service, e.unit))
     elif command == "preset-all":
         if len(args.service) != 0:
             sys.exit("Too many arguments.")
-- 
2.25.1

