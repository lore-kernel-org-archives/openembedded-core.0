Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.4464.1599043319905384940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 03:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=b2+dM/V6;
 spf=pass (domain: burtonini.com, ip: 209.85.221.67, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f67.google.com with SMTP id t10so3853018wrv.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IDNZqDny/cp2ihjJSIm1jxn2oHE6ZhQHgxPTsSeU+Go=;
        b=b2+dM/V64PTgGy0aBBNRr2clRENVR8QrNtkj14//Khn5lmsV3j0BXsZnpDLFq7+D1q
         nzVmu7m1EWMyto3TToIi4nxUPIqf9VajIkLwvEtFOAStO242u/ahgjA0qG18+9ZX5WOE
         zNumlAdVR3Z1LHWBq6TzjGNrLqVKaTdMzXh1PdQz7tqJxvHkDCawvIuCfbqQCtVIGD9p
         PypeW+WPdstp9oCSDKR4RHg+0x4uQwhfNcptt2oeCySOKMBRLShti6VZZu7gvmGZe3Ge
         EFSyJg5JbB3f9Gz1clEcrl6rvNOYQQWtxA9CyitmaBQyTxR9k83lsj+bwcownsE1DUmf
         RAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IDNZqDny/cp2ihjJSIm1jxn2oHE6ZhQHgxPTsSeU+Go=;
        b=JwybpySvkpfXnje7zJBsGzFakN+xBlvj70TBWjodPvrbcqtfs4uJZvds3+hfLZE/xT
         8D/dcnjawRjWMlQRzRNOhUPYXeQEdLgcwPdSL9+SrGTNe+veac7ovJIf7nJHnh0mJdwV
         Dp5ZF3y2EtYM2nGNoI45SRZlNLCbj/ybeTI5tkPFRyQk4XP4xmFOO6g7rWQdTQV8+qK1
         f+hxKdmAEQc/52pmnUpywzWNYbGwecJt/+318Lkgw7PhZOxmx6sAcAslAUN3Uv0YN/ZJ
         TTXHhMDeg6Ppby9rkzsoSBv5C3I5FhGN9tAE7+G3cAA/sldpyh7kEtE/VCnukgRZsEVf
         3lOg==
X-Gm-Message-State: AOAM530fhTxs8Bgrhb0TpjmxN3etxrncZyD7zceyPaZ+MP2DUeNRGXjN
	YkeHi03tafRCNAYDVPaRcCJ/5YhO4Vrlph+fLMw=
X-Google-Smtp-Source: ABdhPJzCjSRUYhbykEJENKSprtqYrmjck6kSJq9m67hemyLAPRrPPMlNmkqHhlWLgkVY1NTKqercQQ==
X-Received: by 2002:a5d:4811:: with SMTP id l17mr6759268wrq.252.1599043317867;
        Wed, 02 Sep 2020 03:41:57 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id y1sm6680499wru.87.2020.09.02.03.41.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 03:41:57 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
X-Google-Original-From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] insane: improve gnu-hash-style warning
Date: Wed,  2 Sep 2020 11:41:53 +0100
Message-Id: <20200902104154.3408-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of showing a filename under packages-split, show the package
name and filename inside the package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c32bf25124..d7f8f919c3 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -443,7 +443,8 @@ def package_qa_hash_style(path, name, d, elf, messages):
         if ("[mips32]" in line or "[mips64]" in line) and d.getVar('TCLIBC') == "musl":
             sane = True
     if has_syms and not sane:
-        package_qa_add_message(messages, "ldflags", "No GNU_HASH in the ELF binary %s, didn't pass LDFLAGS?" % path)
+        path = package_qa_clean_path(path, d, name)
+        package_qa_add_message(messages, "ldflags", "File %s in package %s doesn't have GNU_HASH (didn't pass LDFLAGS?)" % (path, name))
 
 
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
-- 
2.25.1

