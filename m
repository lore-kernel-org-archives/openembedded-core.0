Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web12.308.1585850918177601521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 11:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K3F7wjNL;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id i75so4509510ild.13
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=iPbnUHx8CaCKZ4ZwcTjxXfczgecOuAcn5RKhQ3TC3A0=;
        b=K3F7wjNLX51qyH+qTiEZnH5PtIg+1NXdQlmw3Gm759+CxNyAlVurrC8tQo3EE+BM+C
         LY6WzZo7cwwV7secsLxJc4WgWYD/0w9Y4kJaM6wNCnJiKXVfQowwKUkJAHbEXG9RdQ9E
         Zg50CtuxCdgxWdPQ4vNpCOVCgiCgxkqkwjzMxGrkvDowLc98Z/5Oibcfmx5iN9HTsnZv
         4ib/ezjUWX4A9f+WBqjdcaq+mMEjLXLWd/kj4TsoTq4HHSvWjMXaAziFYbQPJlIBPu3o
         FedT3k3Wv+CXceZ/ow0/4z0J9K9NiRaKDREG3qdSRyejvbim2/kigR1O6GCzDV9CfIRL
         XaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iPbnUHx8CaCKZ4ZwcTjxXfczgecOuAcn5RKhQ3TC3A0=;
        b=qnQNzdV+WJgQKKhfMJuTiUf8AQmt7+ZedO+jOuNUJRGsqSOj/nNVJ3ibyHauDCgCTb
         rk8/iZSqT2FVd+15+AjD7wMnq+N4MlQFlRRCMoIH+3Db6pMjGK2eK0Xs81pdMpRqwjBv
         VfJMuqYB32XDLwlhPkxU3D5GkndnVCcTwmbUK9AzkTUZ45keZCDaMmUMPeOqO6GEAOpQ
         CnWLnDK0PEUcS1CvghA6h21qNT8DwOpkfiVQxLiICyGG5vPstto9G1OtPqN0ry04hAOn
         JFRDcCagyXJXACWxo13/zGFkx7jEZcc7t9bbPDBYgBYWVlRY3DCw9hbGmkCsBAvZ20Xa
         /1zA==
X-Gm-Message-State: AGi0Pub7EVxBW7QTNWLUkRTyELnduo6MHW4a3s2Uiv02gxCUAcjbh95I
	glwx8IG152UYmMDErLMKcjSD0APxFBw=
X-Google-Smtp-Source: APiQypIOI9IAlG27N9TloPDaLZaRSEDHdgtrvC3OYRRBaZhdeLgRKyCdkXIf1SlUvdixGvyPZdvnSA==
X-Received: by 2002:a92:7eda:: with SMTP id q87mr4375969ill.179.1585850917249;
        Thu, 02 Apr 2020 11:08:37 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:b44c:69fe:8097:ef03])
        by smtp.gmail.com with ESMTPSA id c12sm1985635ila.31.2020.04.02.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 11:08:36 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/reproducible_build: Skip SDE for non-finalizing virtual recipes
Date: Thu,  2 Apr 2020 13:08:32 -0500
Message-Id: <20200402180832.12814-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

Don't capture the source date epoch for recipes that are not being
finalized. This prevents a virtual recipe (e.g. multilib) from
attempting to read the source date epoch file from the non-virtual
recipes workdir.

[YOCTO #13851]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/reproducible_build.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 8da40f656a..48ec9108a5 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -172,6 +172,20 @@ python create_source_date_epoch_stamp() {
 }
 
 def get_source_date_epoch_value(d):
+    onlyfinalize = d.getVar('__ONLYFINALISE')
+    virtual = "%s:%s" % (d.getVar("BBEXTENDCURR") or "", d.getVar("BBEXTENDVARIANT") or "")
+
+    if onlyfinalize == "default":
+        onlyfinalize = ":"
+
+    # Only capture the source date epoch if the current virtual recipe is the
+    # one being finalized. This prevents looking for the SDE file in another
+    # recipes ${WORKDIR}, where it may or may not exist
+    if onlyfinalize:
+        if onlyfinalize != virtual:
+            bb.debug(2, "Skipping SOURCE_DATE_EPOCH: virtual '%s' != finalize '%s'" % (virtual, onlyfinalize))
+            return 0
+
     cached = d.getVar('__CACHED_SOURCE_DATE_EPOCH')
     if cached:
         return cached
-- 
2.17.1

