Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.325.1598393421192362211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 15:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hjsyjY87;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id x9so522221wmi.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 15:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MJ1PqN5TIfYZKN6BKyPrlU8h1UzkiJ/27ezo3zhMVAc=;
        b=hjsyjY87qqVjgCYmkAhYxuJlDfh01aDSWcD0kXOwqqxyTluYvv85ebSQHCLNcUQoOB
         GBSDEElmAFjIq5XNSFNFIvSIbZlaeRd5Qs8/ZOcyUxYdgL3U2gwetYC6LSskFCgC6MuI
         hv00XGEe89xwC3zkgrrhM+1mC8H40dWV4ZnbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MJ1PqN5TIfYZKN6BKyPrlU8h1UzkiJ/27ezo3zhMVAc=;
        b=mnR6xJxxb8usujP3VgDlTQAkiRLBMSGTeub6i0XEYvq5N+PXjOts1/miSFPIsY0MrS
         Ix/kFyxy28768BpgZXmYf7+fBgV36IeQQKOHJFCiB0pItSG70lrTv0kh8qbO448N92m+
         BDSKlU7LT9W/P7v/3B2aoOl+Y37BcfT0mTBtxrvM+r2TLsPICYIimFsreEub32aInTAr
         Msr8WFzxoLepoFqNltuayhh8XdvJlVFdsHL9uCeWex3c050BQ/0EyVfbbP6QZzI5mmYs
         R8dks4cB5hMoXvsiEKR2BbSyP6thZOcwDNXnqQCMtzQruEkBqnISQufZhm7TGByP0aEt
         nFqg==
X-Gm-Message-State: AOAM5316MslW6THdghIizwfAkG0qQ6ExV5RN5lgn/SzAg4kS9XN+s13Q
	yqtu5fZKax53K9xbJzS6pqDTuez9jyGzNZ5Z
X-Google-Smtp-Source: ABdhPJzkqT9GOLoIX+G/zBK4p2/RuzoMYZcBF53sna4MfcvN/Hrf2mtcL2RBhOLGUhhaLOWQ8IXslw==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr4136530wmf.83.1598393419273;
        Tue, 25 Aug 2020 15:10:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id a3sm129416wme.34.2020.08.25.15.10.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 15:10:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] local.conf.sample: Document memory resident bitbake
Date: Tue, 25 Aug 2020 23:10:18 +0100
Message-Id: <20200825221018.1445759-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an example of how to enable this to local.conf.sample

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 {meta => metay}/conf/local.conf.sample | 10 ++++++++++
 1 file changed, 10 insertions(+)
 rename {meta => metay}/conf/local.conf.sample (96%)

diff --git a/meta/conf/local.conf.sample b/metay/conf/local.conf.sample
similarity index 96%
rename from meta/conf/local.conf.sample
rename to metay/conf/local.conf.sample
index 783d2c4c16d..efb3100d9bd 100644
--- a/meta/conf/local.conf.sample
+++ b/metay/conf/local.conf.sample
@@ -226,6 +226,16 @@ PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
 #BB_HASHSERVE = "auto"
 #BB_SIGNATURE_HANDLER = "OEEquivHash"
 
+#
+# Memory Resident Bitbake
+#
+# Bitbake's server component can stay in memory after the UI for the current command
+# has completed. This means subsequent commands can run faster since there is no need
+# for bitbake to reload cache files and so on. Number is in seconds, after which the
+# server will shut down.
+#
+BB_SERVER_TIMEOUT = "60"
+
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
 # this doesn't mean anything to you.
-- 
2.25.1

