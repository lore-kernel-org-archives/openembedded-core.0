Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C496AC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 17:09:51 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.21386.1714496990698069546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 10:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bu+43ElR;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ec41d82b8bso8997045ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714496990; x=1715101790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=to9v3f+Wg7kFbUkswynopS271GoB2oVBNS5+K7+vv1U=;
        b=bu+43ElR+aDxE6vHstY8qpvvBhSiD7seU/2+zrKShmu/dS11heIUBd5GuunsNJElIi
         lxU5RDVrOgbHexFBIlO2+svgkqBMm4nUwb/NlSiWP1mmE5h4hPAvj/YQmQttnPILjYHS
         xxPcBXb+FgsZWkUEoRI9SFMKQx2bZ2oO47GDeESeEjUBSEIT4bP9i1fe2Yv9esoeXHM5
         5B3hML3Pl+TeNpgsmuWwI9U5nZislXyVfB5IBQgIAAtc8/5RVqk7br6VTnxt0WzzTG7I
         cbIZwy3t9OcKw/HvvoJl0UpNKByrVmq+P636GnvLC4Pw7i7Af2hNSi9TXVzzAeTE9k+O
         Jw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714496990; x=1715101790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=to9v3f+Wg7kFbUkswynopS271GoB2oVBNS5+K7+vv1U=;
        b=dJZkg1NDbhh6NZawiRaw8mt+UgVlSBdBBT+s15CYtAK0i+u+iiMNFLNHIWNP7WSPVW
         jfe+whkTF2VXIjZyRj24vXruuAYeaKuKHl0DnlKjGEnmDNvXaSo1qcram+s5LKzwY7Hv
         g3SkUJoZQSwQSBoKHYMh+AKXKABJ0f1Xb6QkyYsMnWf5pbfKh4bEgZ6i8j2Khne4zqWV
         HerWPmCavJ/HOqljcjEr5/Lm8hTU2H8GcNumdT5APkMn4/xAz2cn+s/00eeuMqm0Ug4l
         Dqd7NhUsLgl3Q4T8JXa81ZymbFi46qR6/rtBYxSVz5uIFrEpUgL2H++u/AB6gO/zpBCO
         aOkQ==
X-Gm-Message-State: AOJu0YxmnZZmQdCMW/aTaEKPSnjQM6xj+gm/Lgn1NMU9adm3IAaSn7NC
	hjy44ZsOOEd1kk0BD5VVP4DAMttTql0Qu+ahQg3py/5K2vKZQLMbzsoSZFtI
X-Google-Smtp-Source: AGHT+IHKh0VFCnXRHQJZOOnQG4HAxP98u4ZbSknamPPVPpwxBvrSJaDq4EgASBRqzsgdzPdg/vVrUw==
X-Received: by 2002:a17:902:efcf:b0:1e5:c06b:3330 with SMTP id ja15-20020a170902efcf00b001e5c06b3330mr26044plb.24.1714496989563;
        Tue, 30 Apr 2024 10:09:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5c8b])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902c40900b001e3f54f90ecsm22632225plk.300.2024.04.30.10.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 10:09:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] strace: Upgrade to 6.8
Date: Tue, 30 Apr 2024 10:09:46 -0700
Message-ID: <20240430170946.2759376-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 17:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198762

Noteworthy changes in strace 6.8 (2024-03-20)

Improvements
Renamed --stack-traces to --stack-trace for consistency.
Old option is retained for backwards compatibility.
Implemented --stack-trace-frame-limit=N option for configuring the limit of the number of printed backtrace frames.
Implemented decoding of statmount, listmount, lsm_get_self_attr,lsm_set_self_attr, and lsm_list_modules syscalls.
Implemented decoding of setsockopt(TCP_AO_ADD_KEY).
Updated decoding of landlock_create_ruleset and landlock_add_rule syscalls.
Updated decoding of SMC_DIAG_DMBINFO netlink attribute.
Updated decoding of UBI_IOCATT ioctl command.
Enhanced decoding of mount attributes of fsmount and mount_setattr syscalls.
Updated lists of BPF_*, KEXEC_*, KVM_*, PERF_*, SOL_*, STATX_*, UFFD_*, and V4L2_* constants.
Updated lists of ioctl commands from Linux 6.8.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/strace/{strace_6.7.bb => strace_6.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_6.7.bb => strace_6.8.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace_6.7.bb b/meta/recipes-devtools/strace/strace_6.8.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.7.bb
rename to meta/recipes-devtools/strace/strace_6.8.bb
index f365477ccd8..b22c57b45d0 100644
--- a/meta/recipes-devtools/strace/strace_6.7.bb
+++ b/meta/recipes-devtools/strace/strace_6.8.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "2090201e1a3ff32846f4fe421c1163b15f440bb38e31355d09f82d3949922af7"
+SRC_URI[sha256sum] = "ba6950a96824cdf93a584fa04f0a733896d2a6bc5f0ad9ffe505d9b41e970149"
 
 inherit autotools ptest
 
-- 
2.45.0


