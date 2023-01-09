Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E6DC54EBC
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 01:03:05 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.60276.1673226177814528534
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 17:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oWm2QEGd;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id x4so892608pfj.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 17:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zvMStP4HGYKLAGxtj8+2UKbY1i+gQAZ3BHY4+j0ASo=;
        b=oWm2QEGdpW/8lrm0o5S9Cx7LAc/njKWBcWMuqIRVKVeya5ST4xk6STB1esoZKxRJIp
         o5V8Yvi/pAyHDHl59uZEaTJkB27G8M4VCvOVeOels0y9CmFCpFjAkdCSAvl0zct/9+d6
         oV+Ds31Ph+WNGVQnGg2MJSeQjWpyCyD1AFArsTAt7KbZXxPUydo1iEb9TIR6H9XYEbA9
         gvtfoTbbcQmccDWYZUrLYQfDq9lNQnpg0eYMwkyumqeCqnZ9c8zUGmOltqH2jnVmdRfY
         lZQwHuk/ZgVSTXYcu1wVClqkPjyw+QP5Q8nyfTmH1A6RpZx9wuPO+u7ASk5lqXZF4fK9
         F19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zvMStP4HGYKLAGxtj8+2UKbY1i+gQAZ3BHY4+j0ASo=;
        b=hPD+MUenOfucjmS8yrSvSnXzvJglBGxf3bHAD+RExSOQCPabuR5C2KQ+Z+ViylVMsS
         91UQ8TeYqMjaE/wGjf+baXrF9Rk3nA9YMlZD3cDfugq7MT9yvZd0JL+OxchSwVEy2YY6
         qOWVkaBMgBV4MgNdqUOAIcjyjx8GaR2sEcQ8B92UcfhY2clekpWMuC7ehQJvdDoV27le
         SZkw3pZNYfH08PPNGfL5KasUtkSlJIoYkZ9PzNfYVYDLVdyYPEYQD3OWPB2HeAHHq31s
         QwYxGZP3Ql36j4TYUcDAu/RH0i4w1VTbPzN8JCUCsR/xi5sHiX2N1hoedtVLF/zPSIQV
         fnhw==
X-Gm-Message-State: AFqh2koY3XEhwk+32wSmY7c/d+kaw6ns4l2Oiy/hUNzvGSkr3+zBjZx2
	oxi51rApADfjBY+tnki1PiWwdnWhlhzWcA==
X-Google-Smtp-Source: AMrXdXvNyEPVCMAtlF3LZiNyO6WJawQlQ7VoAi50mZ5CYj/2//EsjSFrcBrmSsYfnnxdnoCj40EJIg==
X-Received: by 2002:aa7:9d0b:0:b0:588:a156:6a3d with SMTP id k11-20020aa79d0b000000b00588a1566a3dmr2097185pfp.26.1673226176936;
        Sun, 08 Jan 2023 17:02:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id o13-20020a63e34d000000b004a3510effa5sm4048752pgj.65.2023.01.08.17.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 17:02:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] site/powerpc32-linux: Do not cache statvfs64 across glibc and musl
Date: Sun,  8 Jan 2023 17:02:53 -0800
Message-Id: <20230109010253.3951746-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 01:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175656

Newer version of musl does not expose LFS64 interfaces, therefore
caching this is not right thing to do across both glibc and musl
moreover we will enable largefile support on glibc too therefore caching
it here is redundant.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/powerpc32-linux | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 501e5b605d..764e97e4c3 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -195,7 +195,6 @@ liberty_cv_uint64=${liberty_cv_uint64=uint64_t}
 
 #samba
 ac_cv_func_memcmp_working=${ac_cv_func_memcmp_working=yes}
-fu_cv_sys_stat_statvfs64=${fu_cv_sys_stat_statvfs64=yes}
 samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no}
 samba_cv_HAVE_BROKEN_GETGROUPS=${samba_cv_HAVE_BROKEN_GETGROUPS=no}
 samba_cv_HAVE_BROKEN_READDIR=${samba_cv_HAVE_BROKEN_READDIR=yes}
-- 
2.39.0


