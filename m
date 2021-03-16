Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web09.5670.1615884561690260117
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZupdtvOe;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: idadelm@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id u10so8025978lju.7
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ah7yJ8ovBDLj3mCDNhz1FkuH7/AbiqGYNxXbRDa8nmU=;
        b=ZupdtvOe4aXzzIy+ybFl2t56glIGjLeiOlp8kUxIy63nJWd3ISwH1hHrzmSD/7XInm
         M7ZmiRsdMERobLujJpSF1QPJU30sXe1yQ8bXTQl19yxX/acPsFpZapIIhoVMQe00soOg
         0ZNpbofK4c+ZfnFRYcHL10PLoyC8dOHLYELn7nc80zc/juTnVsWP3L5Kla591b2aEtfX
         mVO5Pm73nCk0DcAP06Iz1iMmFwZfhD9qItdjhHYGKrkUOZFn5DIroThcQL8IH+00CxR7
         GLRa4NNgUX0zmveRfpL2zYkEDEt5/cBOzj3TsxrbmwE08650U43wSHgW6y4rrZLfTTgY
         xUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ah7yJ8ovBDLj3mCDNhz1FkuH7/AbiqGYNxXbRDa8nmU=;
        b=UCQyu56ICoqg279HoLz82rdbUJGe25CFXvof3Eltuun+N07fgOPUYKRTZMcysuW9R7
         qlzKS5HX8f2FTYg0ODVyz6yuaXd5RolvpRAf9bHau1doGuzLBi+kyHUMQEZLFQVezYvs
         fnNIqDSDa8Oi5JqF5WRuznCvuicCW6QjywF/5crdLG7E2mrsl88hv/zqCVxfAO0jvdSc
         ZE5s2Jq8aA4bkDzE/KmO8c2V2Tf1+qTJi/OgrIbaIHtME2rRZY/KyoKqoFmtJpy7Z0l1
         y+zDthOuYMUPiWkWCyWeJFqTllmvcf93mfI69lFT4Gjj2CuMjXFAj2xHsYJjIquDMpY4
         yadA==
X-Gm-Message-State: AOAM532bLfT74S5/J1nhzSiKcoDARQ3ThL00c44p8Rh5ulTcXHOm+/mr
	fRQSc1gakXY9nBB1+R8epjPERgt+HSiOtA==
X-Google-Smtp-Source: ABdhPJzaTV846g/SPARdR292A3NI/BCkKhoMaom72jykxK+xEm8O8aAwTIlmahvKeT//V94HeaPdPQ==
X-Received: by 2002:a2e:8590:: with SMTP id b16mr2022588lji.53.1615884559428;
        Tue, 16 Mar 2021 01:49:19 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([129.0.78.220])
        by smtp.gmail.com with ESMTPSA id j22sm2942780lfr.37.2021.03.16.01.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 01:49:19 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky-contrib][PATCH v2 1/6] package: Generate srclist and filelics json files
Date: Tue, 16 Mar 2021 09:48:40 +0100
Message-Id: <20210316084845.379201-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Change do_package to:

a) Save the debug object -> source file mapping information
   (in TEMPDBGSRCMAPPING)

b) Save a .srclist file continaing that information (in json format)

c) Perform a grep of all the sources in the build of this recipe
   looking for SPDX license headers

d) Save out a file listing the SPDX headers found for each file

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 247bdc7bbf..42bd38f948 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1232,6 +1232,9 @@ python split_and_strip_files () {
                 for file in staticlibs:
                     results.append( (file,source_info(file, d)) )
 
+        # Stash this for emit_pkgdata
+        d.setVar('TEMPDBGSRCMAPPING', results)
+
         sources = set()
         for r in results:
             sources.update(r[1])
@@ -1544,6 +1547,7 @@ PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS
 python emit_pkgdata() {
     from glob import glob
     import json
+    import subprocess
 
     def process_postinst_on_target(pkg, mlprefix):
         pkgval = d.getVar('PKG_%s' % pkg)
@@ -1695,6 +1699,33 @@ fi
         and not bb.data.inherits_class('packagegroup', d):
         write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
 
+    sourceresult = d.getVar('TEMPDBGSRCMAPPING', False)
+    sources = {}
+    if sourceresult:
+        for r in sourceresult:
+            sources[r[0]] = r[1]
+        with open(data_file + ".srclist", 'w') as f:
+            f.write(json.dumps(sources, sort_keys=True))
+
+        filelics = {}
+        for dirent in [d.getVar('PKGD'), d.getVar('STAGING_DIR_TARGET')]:
+            p = subprocess.Popen(["grep", 'SPDX-License-Identifier:', '-R', '-I'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=dirent)
+            out, err = p.communicate()
+            if p.returncode == 0:
+                for l in out.decode("utf-8").split("\n"):
+                    l = l.strip()
+                    if not l:
+                        continue
+                    l = l.split(":")
+                    if len(l) < 3:
+                        bb.warn(str(l))
+                        continue
+                    fn = "/" + l[0]
+                    lic = l[2]
+                    filelics[fn] = lic
+        with open(data_file + ".filelics", 'w') as f:
+            f.write(json.dumps(filelics, sort_keys=True))
+
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
-- 
2.25.1

