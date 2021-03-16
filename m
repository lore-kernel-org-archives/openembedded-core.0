Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.5697.1615884563232570056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YlKc54aC;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id m22so61138287lfg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W+3L8yd4lMEM6lnTGPUVXYhrOLzzaUrd6GfT6c/LICY=;
        b=YlKc54aCMegdLoNNAd9zhykcWtEJUzFr8lpyG1kyFJoJRqBTcozcHyc9tqREBOTRil
         WQPpsWaT7hakY//YUvG5dlYFj7/EfS86PEgJE9YQt9OTDQzYq6sSAhigvTs6sth46rJA
         he/hpG4QJgjyApIYvOyj67FC+OxlOXTiAq2+ZkF5epMoGZTrXjwMWtXIdY/nQJ7M3kkm
         svLDBNMdY2NGFzb2XFEYxCgtx/81Sj7vLEYHppf3frRUMFBrFZNvJO/L1CyEN1dEFfRj
         qCR5KgH39Deef6AA0pWGCe5soz+G4vrZR/vd8zqKdfN1eAk81Dx6lojCa5dIRu4dA5kt
         iFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W+3L8yd4lMEM6lnTGPUVXYhrOLzzaUrd6GfT6c/LICY=;
        b=dGDVDVVWghEzne6LTdAaJu4RiYPHOmVEaOClDgu1OUetiNf//8QPnFRiIjtZd3vxC9
         SlkPtD0rkXGYjMSKrvzU90vRs82gyjzW4mXtag1PE98TtZI2R1zSyF0tUjZ9O0LK9+RY
         1humJF+m1KMsFwBpP6f3mxhrQ9pjuPF44AEGeN0ycxc+ci6Bs5h+YnufbLsGd7gMz0jR
         zdJkRq1Y0mhTZZOBWuqmAPgS++ScvhdTE+RsHPwa+Qq9Ttamgv7zsCwU7nGcAQDa1o5N
         vU76akBnV33KOT/e/aZJUArU0QD7WyAFJhXoTE4iRCSqopAGBzpqXm5YGpbPvGYIdwkW
         wYPQ==
X-Gm-Message-State: AOAM533fsV6Sl8885/EClk2vk2/nsrGKHGOGnbvrXzXEi5sA9IhHYMe3
	f8X5OdsozN0g0hQjY1sHCKQDA3GPvNwToQ==
X-Google-Smtp-Source: ABdhPJxRlQ6NdUdmbLXNmR7+kd/gk7W9PjbGqDumexb/20/+dnVBF/mnTfhqPtLmkZvOvCNWa2q8Yg==
X-Received: by 2002:a19:3f58:: with SMTP id m85mr10327053lfa.617.1615884560961;
        Tue, 16 Mar 2021 01:49:20 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([129.0.78.220])
        by smtp.gmail.com with ESMTPSA id j22sm2942780lfr.37.2021.03.16.01.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 01:49:20 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky-contrib][PATCH v2 2/6] package: Add license computation experiment
Date: Tue, 16 Mar 2021 09:48:41 +0100
Message-Id: <20210316084845.379201-2-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316084845.379201-1-idadelm@gmail.com>
References: <20210316084845.379201-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This code creates a list of SPDX headers found for the sources that make up a
given set of binaries that make up an individual package.

This is then compared with the license field of the gven package containing
those binaries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 39 +++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 42bd38f948..ab96f141ae 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1633,6 +1633,8 @@ fi
 
     workdir = d.getVar('WORKDIR')
 
+    filemap = {}
+
     for pkg in packages.split():
         pkgval = d.getVar('PKG_%s' % pkg)
         if pkgval is None:
@@ -1645,6 +1647,9 @@ fi
         seen = set()
         for f in pkgfiles[pkg]:
             relpth = os.path.relpath(f, pkgdestpkg)
+            if not pkg in filemap:
+                filemap[pkg] = []
+            filemap[pkg].append(os.sep + relpth)
             fstat = os.lstat(f)
             files[os.sep + relpth] = fstat.st_size
             if fstat.st_ino not in seen:
@@ -1721,11 +1726,43 @@ fi
                         bb.warn(str(l))
                         continue
                     fn = "/" + l[0]
-                    lic = l[2]
+                    lic = l[2].strip()
+                    if lic.endswith("*/"):
+                        lic = lic[:-2]
+                    lic = lic.strip()
                     filelics[fn] = lic
         with open(data_file + ".filelics", 'w') as f:
             f.write(json.dumps(filelics, sort_keys=True))
 
+        computedlics = {}
+        computedpkglics = {}
+        for r in sourceresult:
+            for subf in r[1]:
+                if subf in filelics:
+                    if r[0] not in computedlics:
+                        computedlics[r[0]] = set()
+                    computedlics[r[0]].add(filelics[subf])
+        #if computedlics:
+        #    bb.warn(str(computedlics))
+        dvar = d.getVar('PKGD')
+        for f in computedlics:
+            shortf = f.replace(dvar, "")
+            found = False
+            for pkg in filemap:
+                if shortf in filemap[pkg]:
+                    found = True
+                    if pkg not in computedpkglics:
+                        computedpkglics[pkg] = set()
+                    computedpkglics[pkg].update(computedlics[f])
+            if not found:
+                bb.warn("%s not in %s" % (f, str(filemap)))
+        #if computedpkglics:
+        #    bb.warn(str(computedpkglics))
+        for pkg in computedpkglics:
+            lic = d.getVar('LICENSE_%s' % (pkg))
+            if not lic:
+                lic = d.getVar('LICENSE')
+            bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglics[pkg], lic))
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
-- 
2.25.1

