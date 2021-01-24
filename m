Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.21170.1611496635088908560
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 05:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ChJfmvc6;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id c124so8300601wma.5
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 05:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6U89P80cZHOdTsR/5wbYAmAppHGgBHPwc1UZlTCSHhw=;
        b=ChJfmvc6I3iCZhufKnBi2/D0TAugy4eYi7vAyVpHDlVOJ7N5VraTsbsRfOjg27Y3zz
         x0Yk3NEDSlbpzAP9PtXuP9QQAcamrGZdjROkjhDFfDtnblVZD3doHBFU+KR94l5Uaoq+
         gedQegLSzrmoGyK/5/62vV2Ex0I58nnCMMc3GgTZiRMA+LCIFxtfD4wm3XVWEJ7WwVJx
         oZMQMCrFllnn4Zjf397L5oFdbe/gVUbFJUV+OD18AZo2fQCuVoNz3s+TTiv3IS/gAaXU
         r7BVlb3QRM7E8vZfwQi1hLrD60Wl3TlcqzlCw0yFZ0Xw5KX7k/noGRDua17ANU2GddXC
         4E9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6U89P80cZHOdTsR/5wbYAmAppHGgBHPwc1UZlTCSHhw=;
        b=Cmyo3+uNEC4Tp8Fx769IV+FV272VACQn5hkW4D4GB4fY8poIR5JnAX3Q3CvJb1aHIb
         AKzRAl3Lf1WPt3lhncMuU+DO4MeYrB6y3WvfDRGKh5q7gAtJP+UCp6FgtS5+L/Bwz51E
         XjTls7vISs8zbKxqPsUAlMz3j8q276Bff72+pFKzyQTA1zA8uqvzoTcUWcbf7tiQ6a6w
         Mxq+IeaOo3x7deFbSNgyBIkR5gTrLXtO70ZdRrsKuNnRHTzbRc/k8BKNeA4920TC4p4W
         aS5MaYYhJchWHtBr+7cvFZlt3UssZUuGDtssJpOBl8HjeqjKa4VMCFfUi5YnUp4we3sR
         Ne3w==
X-Gm-Message-State: AOAM533fSUO9svz0MY2v7ahvvIrfMBFo7kBEq1hR4803A6mmscxPIq7z
	bijXBiTiFg+2W4CHa3XzBnA7CmlzNnroiw==
X-Google-Smtp-Source: ABdhPJyn9eS281TsTVtEcrH3Q6a7sC3C2M+G6lHAMuN9CADzYvyHZEgC5aj37JQxR6WD0e6x0hvUrg==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr3088697wmh.85.1611496633551;
        Sun, 24 Jan 2021 05:57:13 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([197.210.64.211])
        by smtp.gmail.com with ESMTPSA id x11sm17650186wmi.4.2021.01.24.05.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 05:57:13 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 5/5] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
Date: Sun, 24 Jan 2021 14:55:59 +0100
Message-Id: <20210124135559.21894-5-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124135559.21894-1-dorindabassey@gmail.com>
References: <20210124135559.21894-1-dorindabassey@gmail.com>

added a check to ensure that a user isn't building in PSEUDO_IGNORE_PATHS

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/classes/sanity.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2040b48595..78c0343f0d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
     if (tmpdirmode & stat.S_ISUID):
         status.addresult("TMPDIR is setuid, please don't build in a setuid directory")
 
+    # Check that user isn't building in PSEUDO_IGNORE_PATHS
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    workdir = d.getVar('WORKDIR', expand=True)
+    for i in pseudoignorepaths:
+        if workdir.startswith(i):
+            status.addresult("you are building in a path under PSEUDO_IGNORE_PATHS, please remove this" + str(i) + "directory in \nParsed WORKDIR: " + str(workdir) + "\n")
+
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat
     suid_check_bins = "chown chmod mknod".split()
-- 
2.17.1

