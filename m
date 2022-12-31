Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13831C4332F
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 02:07:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.34044.1672452428055466855
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 18:07:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PeLvJRDZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id y19so4513006plb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/SHeRFBI16zN8gq6U9u9eVCXE7LVB/J+hyObVHMGq0=;
        b=PeLvJRDZYbt/pi51a66zsUgAuQGHG/aF/GaqOu/664m2GGd6gEosTiMFK3s0dvXrJw
         BWIWtLD4nmrPJ07bjbLoxCkkhWiJXrvFBLfJkLNvV230ZA9s1iUZWKdp1iLSBtWKbF7R
         t2YhO0CW7QeDX/r8isPkCT7LfEzjZBJa/lLoztSKC91cBHULKEC0wfzVbA4e9X9DY0oB
         pmWed4l/dYaqmzKMkBRjibRh9078YzwnK8Qr0JtFOLr+qKg2Th36UwoCR3qdVJ37K1Wv
         xHJYGn+5QSF1PeNoRTiuoeKCwX8giPhBOecJRB/fQQRCikUM66QZko0BgvKnFTTa8r/s
         dy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/SHeRFBI16zN8gq6U9u9eVCXE7LVB/J+hyObVHMGq0=;
        b=QpX9BiKiyM2uTkGhO9hpSFlVRRlYIOHEqgfrdKHkqNU0KcdHv/uqkVu4qvMV58Ndsf
         MR9RqoQ39cRIPgYTsVLpJxDsJdhUELjJhcaY43AfqPNlpsToyqpbQG7NLL+c/Ne2CrM7
         sxUnzhxekZCFnTNIBwGp6PF2ayVl+P4C9kVzjIjZnJIh3OwJquF8S1GEYHNaSOZcoUJp
         +geHGGwapgbCXTJUGDnMtJfDcUIDUWaMg0SdxFc601OB/cdO6c7t14uZgPeGvplZdIll
         6MQ0prawANMJKdC95cZjGYyJgvEVSie44Js4gNKrEdudNLfF9lrsp1W90yoHTB09Nn2A
         cGGA==
X-Gm-Message-State: AFqh2krV/hHevP9qHo7tmJSddvRd35xu+DVTsww3+d/OzBQQkWylVrpu
	23J9ZaWH5eMGVxZQEkPi0jlG6rPcQMI=
X-Google-Smtp-Source: AMrXdXu0bbUha6MxgytIx+OYFOwgGG1Oj7Ft4p0T83C7hermsG1tfTRmZiLyWkr0kvHDOsvaM518zA==
X-Received: by 2002:a17:902:efcb:b0:192:72f3:1d18 with SMTP id ja11-20020a170902efcb00b0019272f31d18mr21035030plb.47.1672452427247;
        Fri, 30 Dec 2022 18:07:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id jd4-20020a170903260400b001897e2fd65dsm11736021plb.9.2022.12.30.18.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 18:07:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] pulseaudio: Do not use 64bit time_t flags
Date: Fri, 30 Dec 2022 18:07:04 -0800
Message-Id: <20221231020704.3012409-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Dec 2022 02:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175180

It needs to be fixed to honor _FILE_OFFSET_BITS before we can enable
64bit time_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/time64.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 99eb06dc0f..c6a3b682c2 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -11,6 +11,9 @@ GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
 # both 32 and 64 bit file APIs.  But it does not handle the time side?
 # Needs further investigation
 GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
+# Pulseaudio override certain LFS64 functions e.g. open64 and intentionally
+# undefines _FILE_OFFSET_BITS, which wont work when _TIME_BITS=64 is set
+GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""
 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 
 INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib_libstd.so] = "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt ioctl lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
-- 
2.39.0


