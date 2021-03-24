Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.187.1616596785560012410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SIu2WXem;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so1266348pjq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/pX/wrdglajQXbXUCBoNvk0S0sZRJ1zGUt3jQPeZLLQ=;
        b=SIu2WXemnB0NOdcePoXr/ZBhd7k13g2Bf1Fan9XV2OPSiZXNDIOoLZHjBoJGqOOk5h
         JbgvHN25N07ryIjfkbxi1GGKAD5oDgrZmezXnzHGecKTElwboUsSSUvUIWtGRvF/+/R1
         f568GhmKNwYePVqS3myFFQEbPAq4y2dEgROMPY6R9Etw1qxXQC19tpXIAcUuXEFWCQP3
         Q0lKCO60jAQRz0gWj7wCEcHzz1gflowZTPxz9B1mh7R7p+++IvanRS3XDjBESAmXoYV+
         zfaKx/pPFzu569/AP+DHyElUGZzWNPo5puweS+WFJTC5kNh4JnWYlh+CsUU7QjjbvNP7
         a8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/pX/wrdglajQXbXUCBoNvk0S0sZRJ1zGUt3jQPeZLLQ=;
        b=MjGDxI9eaW6hB0JDQhc0gD/O96lE3cqgShxQ3LEQPkCBM/r2I1AWGVt1GQSYEFAxxg
         OhiwJKYxerdQwkHteyXhV6ajvVWs1OIjEnKpecpmxxu2UPimmQijaTT99D8S94j3Do1C
         Idjdkl8BYfwMMQCuN1CMGelBoSgvcNOwAEh8d1u7PY3jiA1VcGJMU46KJnfOol1Ic+iU
         ZySfVvVEH3YqPY8hsk/iTLM4g11sD4dKFGWC7YHC6J+TFXM35jJZB94PGsifsl+WTnRZ
         G3pSAdJLtYbKGP8fk1RMYhV2ul7cvNGDEmefDUmpEHD6G4hCus7Y/b3XtfAS8n/sKgal
         DA7A==
X-Gm-Message-State: AOAM533jFX0w8dd7lO8RQSP2v7YWAdFHORm5bx6zIhryU63y0BIH+QUm
	2wC0Jc5GrXRNXEPuEl8LVz6uycyyTvdxPTkZ
X-Google-Smtp-Source: ABdhPJyKB9ldAoUUfFP+oz3fkE1khv88ZooUNEmg9EPN66MC8HoSRwbmMF+MCS6z8Rg0Q+Rp+G5d+Q==
X-Received: by 2002:a17:90b:3716:: with SMTP id mg22mr3775476pjb.157.1616596784651;
        Wed, 24 Mar 2021 07:39:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.39.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:39:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/21] populate_sdk_ext: record METADATA_REVISION
Date: Wed, 24 Mar 2021 04:38:59 -1000
Message-Id: <c6793c5c9af2c7d2547e1dc3ef7ab05f6bb41563.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

As we delete the .git/ directory, it's impossible to get METADATA_REVISION
inside eSDK. Because of this, we meet the following warning when installing eSDK.

  WARNING: The base-files:do_install sig is computed to be 16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
  but the sig is locked to 6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in SIGGEN_LOCKEDSIGS_t-qemux86-64

So we record METADATA_REVISION in eSDK generation time to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ff2ad51b801fd62e2abbc573ba2c9ee8fdc7e012)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_ext.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 71686bc993..d63abf4f30 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -360,6 +360,9 @@ python copy_buildsystem () {
             # Hide the config information from bitbake output (since it's fixed within the SDK)
             f.write('BUILDCFG_HEADER = ""\n\n')
 
+            # Write METADATA_REVISION
+            f.write('METADATA_REVISION = "%s"\n\n' % d.getVar('METADATA_REVISION'))
+
             f.write('# Provide a flag to indicate we are in the EXT_SDK Context\n')
             f.write('WITHIN_EXT_SDK = "1"\n\n')
 
-- 
2.25.1

