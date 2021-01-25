Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.4034.1611614916747289779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 14:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pETMmta6;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id m2so891519wmm.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 14:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6U89P80cZHOdTsR/5wbYAmAppHGgBHPwc1UZlTCSHhw=;
        b=pETMmta6om6/yFoJlFA//xweDAFNH5EvNBCbQk7FlYsbzfsdIjPhIJlrFzZ1UJEFgX
         3ezrUTQQYMUXCPMjMzf1UlP16uyHpzrdnGxzcGi7q0CQm4HAVsKMqxYzetKA9ZtEetCk
         xyB4GmtQinC4K0tKSBN/8IX94rN4iQ8mBeaiyVp2chKNhos/x8VzKVZY1in4oH3ypikE
         C6+sXsNcoY/BsDZDXjAtvupXXJwGdgyKtuZ3xBmEKekVnqSq8yubdKsFy065sF/5HZQn
         Xaq1oUKq66MNMdOPGF9VtjlqXC7eyEXv/1b/96kYkdonibaCTi3za5csBX8AIMoKi/ko
         YhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6U89P80cZHOdTsR/5wbYAmAppHGgBHPwc1UZlTCSHhw=;
        b=RQEA+FAn6TFovB9WOLEvHfr4QruhcsA8yyxqywqQMhhcQrwzwS4rEqbkfoNYPplbKj
         DsselspvOPLtLuhKfGiimTK0GD4qadisLiIAhe52jWNnDQi4fwm+fEwXZNvrU/arB6c5
         uNjH3M9dbUDAtpEilhslERzbrmXFG6HqC+cMjwiDTy+F2mBwl44RwImyn+tlNbhEQznb
         20RVdfUG/Qx4WXQlxr0T9kDOT3RIEOSiGPWhJgDW5/zUD08+HmegfJWPQnSn++4y5QCZ
         CIa3g/eyY95awMynfxa58E4kgGBQyOzQrTEnUC4rfKLXBWnfyDEow7kSfXF+rUurUSMa
         MobQ==
X-Gm-Message-State: AOAM532oHejkvK0UyweCnJbbMlXtj9XfhRhlAUZwysDXFnuzDDBpS9Wx
	pfZfiEByyV0gZMCbGfp14yhyuksOzSsrQw==
X-Google-Smtp-Source: ABdhPJxFPaqaFfVclnSmyzPYubvP3/W/20Nvp4+5E/OmFsPw/RBcNP12cskfkbr3qgiVq1WhT2GvyQ==
X-Received: by 2002:a05:600c:4e92:: with SMTP id f18mr2016439wmq.126.1611614915025;
        Mon, 25 Jan 2021 14:48:35 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([105.112.148.180])
        by smtp.gmail.com with ESMTPSA id v6sm23131118wrx.32.2021.01.25.14.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 14:48:34 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
Date: Mon, 25 Jan 2021 23:48:08 +0100
Message-Id: <20210125224808.20434-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

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

