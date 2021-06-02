Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web09.7764.1622601415429627081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 19:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AgOnwigp;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 67-20020a4a01460000b0290245b81f6261so243715oor.6
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 19:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IsbDCw+woZQ+xzerTWO1q+eZgFyRQAGupqnsvy/w1fM=;
        b=AgOnwigpLNjADW6Rq9tFAk/lrZdnYnyBDecygHFDvTPsTw0lefI9jA21nOmfrrH3wx
         FYlDB0WDMOKuOpaJCVHB0mNQg2rv7iE55tZu1YO0n+ZO3vkEfoH8/KK7WA7Z87bqRSRG
         rB7uUuB9Uk4kMX+hKffsN7fSNivoO9S26+S01ugayqEC3fRu15/fdA0QH3hjjqW9DCuL
         F2zjlc7xTUC0mV9VUSn1KgePTSKyfpA3VAt0gHtrKyAyyfpvy4KJijbNCH9s/tFMFavu
         TnIOaXeUroUJnWSMcSP5t8DGZaOV7XluAU+RBbQ948GaTFilStDo6MD9Da/pG0cIwLqj
         6RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IsbDCw+woZQ+xzerTWO1q+eZgFyRQAGupqnsvy/w1fM=;
        b=SrNMi4UOCQ7txySvbHrSmGyjLPkpvNx5P0j1wfEgHbL8NRxTKddRlVdNWlVkbVe3dJ
         XqAEx0f/vilyo6OCHT8Ek7JP0dy4A2aqde0CGiV2K+S9Rb7QWECq/cZt/TJpGA17FrIf
         qvuqxpuMdEmB7vnixGygnV7sZwdiDeK8+MOPD7V99+lonazXP7BpUDcXNqBEdPWxfHJk
         VQl34feDTXme7hZEzSkwc45aAiaulJKe8XZ5kht9nktU5SEEJpmNEEtkIo3MMINgagPA
         nmeLFBtlXPuzh7XXjovFdVmoezuiy+L+vclo4wOOrKczHNRZkquQ4SbTq1orJhcF/+YD
         27Iw==
X-Gm-Message-State: AOAM532zhBqqoPRCb7PeeKXsnoDg+oldVj0HyNhOBq+nFkCmf8hHeKkT
	HLVwIPJmxr0FjAY+fk+KIi5aAEVG81s=
X-Google-Smtp-Source: ABdhPJwaS+svPK+1A+zTCC5X8Z/5QcjQQbgHVVyDwEBmJq1WFNUiEH9gpOUjJE6bWb9aeCqj+aDqbw==
X-Received: by 2002:a4a:3f53:: with SMTP id x19mr23196042ooe.88.1622601414498;
        Tue, 01 Jun 2021 19:36:54 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id s17sm3852830oog.31.2021.06.01.19.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 19:36:54 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/reproducible_build: Use atomic rename for SDE file
Date: Tue,  1 Jun 2021 21:36:48 -0500
Message-Id: <20210602023648.6887-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an existing source date epoch file was found during do_unpack, it was
deleted and a new one would be written in its place. This causes a race
with check-before-use code in get_source_date_epoch_value. Resolve the
problem by making do_unpack write the new source date epoch to a
temporary file, then do an atomic rename to ensure it's always present,
and change the check-before-use code to use a EAFP exception instead of
checking for file existence.

[YOCTO #14384]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/reproducible_build.bbclass | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index ea643f2860..278eeedc74 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -80,17 +80,16 @@ python create_source_date_epoch_stamp() {
     import oe.reproducible
 
     epochfile = d.getVar('SDE_FILE')
-    # If it exists we need to regenerate as the sources may have changed
-    if os.path.isfile(epochfile):
-        bb.debug(1, "Deleting existing SOURCE_DATE_EPOCH from: %s" % epochfile)
-        os.remove(epochfile)
+    tmp_file = "%s.new" % epochfile
 
     source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
 
     bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
-    with open(epochfile, 'w') as f:
+    with open(tmp_file, 'w') as f:
         f.write(str(source_date_epoch))
+
+    os.rename(tmp_file, epochfile)
 }
 
 def get_source_date_epoch_value(d):
@@ -100,7 +99,7 @@ def get_source_date_epoch_value(d):
 
     epochfile = d.getVar('SDE_FILE')
     source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
-    if os.path.isfile(epochfile):
+    try:
         with open(epochfile, 'r') as f:
             s = f.read()
             try:
@@ -113,7 +112,7 @@ def get_source_date_epoch_value(d):
                 bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK" % s)
                 source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
         bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
-    else:
+    except FileNotFoundError:
         bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
 
     d.setVar('__CACHED_SOURCE_DATE_EPOCH', str(source_date_epoch))
-- 
2.31.1

