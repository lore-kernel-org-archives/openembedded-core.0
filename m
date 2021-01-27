Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.16555.1611788024517587271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 14:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bl2hEuZ3;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id s7so590347wru.5
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 14:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=k6iexvJooOP2lY6gkho960sW+qsSLVkQN/UWUwA9xhs=;
        b=bl2hEuZ3l94lRdJt98b2wzh9T8/mqafW6zDKTej3I5atNaaX9TxM4EkAW0XtNPEmAA
         knrCvYJnOcorD2FoF2Q+/G7M/5h9yf+rOUPWD7Z3rav0Z64En5ES4C4/tRQ48LqXnyFb
         B22rZTN28draoJlyaYcb5gij9ryPmzk+6byMzsjemqTgrCHAr98Vd8dq1WMYTRzDFvf8
         67HNN0Au8LiPAQMsxK98hW1dMPEz073NgHoOJ5OHp6sKu8TreEMrej54wWWjYR0hij+d
         eefiTzmmNq8dzRP4nvnCndwVj7cq3i9hKAUWNDOKvaOPTiFTLdCPK/skKgmuOLP82qko
         5afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=k6iexvJooOP2lY6gkho960sW+qsSLVkQN/UWUwA9xhs=;
        b=ue+gFVSmL4w6/QjwZkUPF80qtBGCfz8iuZcSK2s7sNk3qFqYJfonBhBTGc20cth4sQ
         9UH4w7b1kRuWXu1FONOHsu8WKHxXi5J4jvFiZRmVda0U9ckOo2lUNKzW3Z/NyJW6CtHR
         9+xhsfNc18XbAZjJlxJ52Eu8f+F25ysFiYItKaXsxIiLax2sVoe6XNu70kJybi0nqoKK
         rOMinED1ggw6TyFYfH5gTpKvFVFGTTU/9HuGo0V/8quQW5icZ6cu6GSZwS/1M08rp7JG
         SdsI7X12QvbEEqcYm1x0WnlTdK0mrfG4gwZnjKapd7SUYv1yDonqyJyA4rOWuH8vI1Ad
         YuNA==
X-Gm-Message-State: AOAM533LTMSTsfDfB1daNBuefDdudYDlvE9lqzTv8Kwvv/DG5ygoOF59
	F0gQHrerCsei6iKBun5ZDHPczZmzhjmo4Q==
X-Google-Smtp-Source: ABdhPJwiC5w1XfJ3xjK416B+q1j2R8w0dMTJ1ZZRdan8iKdroepASZ7gFun4irBEWsiwgZRMAc3F9A==
X-Received: by 2002:adf:f04b:: with SMTP id t11mr13077106wro.347.1611788022769;
        Wed, 27 Jan 2021 14:53:42 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([105.112.37.32])
        by smtp.gmail.com with ESMTPSA id q2sm3880655wma.6.2021.01.27.14.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 14:53:42 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH] sanity.bbclass: check if PSEUDO_IGNORE_PATHS and ${S} overlap
Date: Wed, 27 Jan 2021 23:52:57 +0100
Message-Id: <20210127225257.29286-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

added a sanity check for when PSEUDO_IGNORE_PATHS and ${S} overlap to avoid random failures generated.

[YOCTO #14193]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/classes/sanity.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c6842ff549..34215ebfb2 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -710,6 +710,14 @@ def check_sanity_version_change(status, d):
         if i and workdir.startswith(i):
             status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
 
+    # Check if PSEUDO_IGNORE_PATHS and ${S} overlap
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    sourcefile = d.getVar('S')
+    for i in pseudoignorepaths:
+        if i and sourcefile:
+            if sourcefile.startswith(i) or i.startswith(sourcefile):
+                status.addresult("a path included in PSEUDO_IGNORE_PATHS " + str(i) + " and ${S} (source files) path " + str(sourcefile) + " are overlapping each other, please set ${S} in your recipe to point to a different directory. \n")
+
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat
     suid_check_bins = "chown chmod mknod".split()
-- 
2.17.1

