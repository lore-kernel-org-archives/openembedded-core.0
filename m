Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.20229.1613325584841044918
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 09:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pgJeBKhB;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id f8so874677plg.5
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 09:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EP536ZNKfgKJ5Snyp97m0OFkmK++ZqsTo341wgRYvfc=;
        b=pgJeBKhBx2+3BwMWE0HmDAqtf01kh7aPJ+pFqT4+plMZt3iypDOxxKk3aFq5d2jCpU
         AgVsAxtRDU/SgjFBDTmskCMpdgycmrrkM//trC6QQoOuM9s8scz4oyfuZVo78plJ80lE
         EQqWgpsxJn5chvr3TE0QV3Ui7Cbk+D3n+/uYsC0xmmkVxE6yuK0M7MbVZLz504lddBZJ
         gxY12fhMi63+q6K5z2fDYPNoI9L35YGJqM0OwCC3nHcMSN1WL/MQIM2Szf8gOvsh7O5K
         cBO6Ee1/avdXJ1iOaZvV2zeBixOyQNW0LptMz8fE5GH4a1QI7v4O1bOeHEDxzvfhIAbH
         QBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EP536ZNKfgKJ5Snyp97m0OFkmK++ZqsTo341wgRYvfc=;
        b=Nc+cfJYH36k6nnYLcGPfqKkESYeDR34dUpFVra1VcKCB5b1qfK+ZkLALqQlzz3hbcZ
         +jMT4mpkeWjnRw4Nm0B/eAeglpb+ut2g4NQEsSlybazPRW6uyW0e7E+8zHeflkJLrUP5
         nHFYN8K8A22d29rXRNap8Ff//6x0LPqyuns/zRJ1Ap/Wz06anw8ZRrMJvZaFr5EUurnk
         yzDNT5BgcVSkDXLAjezdc1rrdK1VC4psaqnt5ZPlse1wwu44RcqLM8gTAfHZjksTvAxM
         bnp2zyZC1PIVWCfMPxV7V5JjZZPy9zfviLqaDKmzybDuHhoKNBC4E+sPkStqxABTJhzA
         vXiA==
X-Gm-Message-State: AOAM53279JtFEvIoTb2rxIk4uMyN8JFnKKiM+v2+ZNj8d4hjfsDx5jWV
	O7h5iJDausgIgzhwadiCOofokzt6N4Q=
X-Google-Smtp-Source: ABdhPJyEmjcpoJnmFyOEEqQq/f4n1QMRE90FUE7FkcM9WcBWBTD1F9Hc2FF9RWQQArcdhsrwI6JXwg==
X-Received: by 2002:a17:90a:470b:: with SMTP id h11mr12156530pjg.186.1613325583971;
        Sun, 14 Feb 2021 09:59:43 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id a24sm16283047pff.18.2021.02.14.09.59.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 09:59:43 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildhistory.bbclass: add ${PN}/cve.log
Date: Sun, 14 Feb 2021 17:59:42 +0000
Message-Id: <20210214175942.1981711-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let archive package cve.logs too

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/buildhistory.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8ed420174e9..a119981d9b7 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -1067,3 +1067,27 @@ def write_latest_ptest_result(d, histdir):
                     bb.error('Failed to run %s!' % cmd)
         finally:
             bb.utils.unlockfile(lock)
+
+do_cve_check[postfuncs] += "write_cve_result"
+do_cve_check[vardepsexclude] += "write_cve_result"
+
+python write_cve_result() {
+    write_latest_cve_result(d, d.getVar('BUILDHISTORY_DIR'))
+}
+
+def write_latest_cve_result(d, histdir):
+    import shutil
+
+    input_file = d.getVar("CVE_CHECK_LOG")
+    pkg = d.getVar("PN")
+
+    output_cve = os.path.join(histdir, 'cve', pkg)
+    if os.path.isfile(input_file):
+        try:
+            # Lock it avoid race issue
+            lock = bb.utils.lockfile(histdir + "/cve.lock")
+            bb.utils.mkdirhier(output_cve)
+            shutil.copyfile(input_file, output_cve+"/cve.log")
+
+        finally:
+            bb.utils.unlockfile(lock)
-- 
2.25.1

