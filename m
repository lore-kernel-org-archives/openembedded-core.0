Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web09.830.1603814102569168059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 08:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CZIQDi1I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id h5so2483992wrv.7
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4egC8DvW2KjJOAAFg3fFGza6RUA+WQpvGzM3AQKVLM=;
        b=CZIQDi1I5D0oMIi2JsSga3A7xvLg7NHMtt3jOPFtqgBSnCrJYZzaDrOFUJW8q98HbY
         DpzlRUATpvYLvq86+jcwznrN5b3bBPH2Vt0LmTHOs+1eJx8OQxL2rcv2jIoURI74Xb8W
         B1WPxDZFPu/ACFBsUWtVM2DOtSKFD1K5lduIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4egC8DvW2KjJOAAFg3fFGza6RUA+WQpvGzM3AQKVLM=;
        b=KhzT35Ylew2CZrz7FOykqwdkDprHbI0XbfXOPekYNxU0GtFeY2mXp7Ui5Mvn2t0VWq
         wsDjJPLpKIylcWpi61iV60t3IJeCenxJfSTz2NGXviF5+qjy6gT5oel+SD9SdyogT9TS
         rJgCZ+FlruQLcq9af7AfcCm+7mjiEdmgiA5bCheeYenq9H27zZRxJXyw7ZSvFGBxCF0m
         aOXduPs+t/9b0X8SPQUrepbW4oj+wnAwF640wdyMJr3AHYZJTyyXQ6iQIS/BJCC0rXIK
         XcioC44mOePd5W6LuE6kLWZr+gfpnvQoLZOjivDE1ynVNuLuvl/OVV+7AyVxPlLNyMbR
         hmEg==
X-Gm-Message-State: AOAM532q+ZHGMa7GMVZMWSyL+NHFsmZUBOqli8ZoXekhjy5cmYNFRBmZ
	ove4ZtBj/BIk26COtDVF2w50xs2XvItIIg==
X-Google-Smtp-Source: ABdhPJwjf+QiCl+4l3dF+ObGUYqiicKmQJ4cNa4/9JJbJib6GybhJBUvCl2RsZDPRlpVi0avp1EV+g==
X-Received: by 2002:a5d:4144:: with SMTP id c4mr3537123wrq.311.1603814100786;
        Tue, 27 Oct 2020 08:55:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id c185sm2446634wma.44.2020.10.27.08.55.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 08:55:00 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstatesig: Log timestamps for hashequiv in reprodubile builds for do_package
Date: Tue, 27 Oct 2020 15:54:59 +0000
Message-Id: <20201027155459.138706-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a task generates the same output with different timestamps,
hasequiv won't detect it but reproducibile builds will fail tests due
to the different timestamps.

Add do_package timestamps to the hash when reproducibile builds are enabled
to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 4b8f264012c..84ec7f46f22 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -485,6 +485,7 @@ def OEOuthashBasic(path, sigfile, task, d):
     if "package_write_" in task or task == "package_qa":
         include_owners = False
     extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
+    include_timestamps = d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1'
 
     try:
         os.chdir(path)
@@ -558,6 +559,9 @@ def OEOuthashBasic(path, sigfile, task, d):
                         bb.warn("KeyError in %s" % path)
                         raise
 
+                if include_timestamps:
+                    update_hash(" %10d" % s.st_mtime)
+
                 update_hash(" ")
                 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
                     update_hash("%9s" % ("%d.%d" % (os.major(s.st_rdev), os.minor(s.st_rdev))))
-- 
2.25.1

