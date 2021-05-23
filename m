Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.10892.1621781137468127477
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 07:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EBfN1Zz4;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id ep16-20020a17090ae650b029015d00f578a8so9694069pjb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 May 2021 07:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y83CKNP5cyTnPlyDwSfQFUTyIlJc59Nzpgcj5q5mJjw=;
        b=EBfN1Zz4scwKF80pcNBKjNBXdpynHFEZKivwzPmwyBHgXh53P3TvoGelGeYNjLWRFv
         GIk0mqnyZ3TJccJjaZtPVa2NTFkMAjhKSqKWObvDNEDuRJwm682ryzet6konbtcwsT9Q
         swvds6CKixiXIfZhS0up3hUIWkyKDBDeRcNWl/QYLBdJD+xnCYrNJTatkx9C3eg35PNG
         /tMYDZ8sFcuTglEi0y3aMsIjULEaIHBII5hdTJG1btXRPeDdSGwEB7SHMhki+KGVNb4V
         uU8/tnIe3OhxdaX8n2V013eK672xJQY6ghd0gT0nF7tK0jpH1ziqSHqmS214Tfrhnu4m
         GyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y83CKNP5cyTnPlyDwSfQFUTyIlJc59Nzpgcj5q5mJjw=;
        b=B8qE05/Z0ATNWIQq5vjFF4MRDM8ZUpx94qqmlOgmZi/l+yAi/D1qa38c7BVud3tUO8
         KHsr/h2dglyQChba0+UBHGGg8rDYHDaWH1QmwlPJvOUFJAqfqaJDq9AmTfBnrmZWDs8O
         7X+ZEKTry4Bi7G7ym0LyzkH3zEfvuAUx2MUnGw3q5seGtfSAQy9LEsj/Cm3dHFjdNSlN
         RxRZ31cFEs+tFvikApP/hlOgTHs0GbAfEVlfgOLIoqPSF4s+AaUZ2c2rqkkauWcq7Tw7
         GCJBGg0vxmRxqzdxvp2tbLhph/xN+6wIRmGzeUGlcp4fYPqFICG4HUk/AtIvW5ZhX0sa
         qp+g==
X-Gm-Message-State: AOAM531XYVLiACcsCLTvKsJOo//68qUzowk+AjgnQ2tZToKDjOPdtRUR
	Bi77y4ZNOFH4iiioIVrm3wnKlVo8diLfXA==
X-Google-Smtp-Source: ABdhPJyif1NlGVr9MdJrZGhMPq1sWo4EH62dr4EfncJ60du9JBkimsztqmhwyQoBNsoQ4+D44WZ3Lw==
X-Received: by 2002:a17:90a:c284:: with SMTP id f4mr20051767pjt.83.1621781136692;
        Sun, 23 May 2021 07:45:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::db30])
        by smtp.gmail.com with ESMTPSA id z1sm4477219pff.194.2021.05.23.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 07:45:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] glibc: Enable memory tagging for aarch64
Date: Sun, 23 May 2021 07:45:32 -0700
Message-Id: <20210523144532.325221-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Glibc on aarch64 has a memory tagging option that can be enabled
via GLIBC_TUNABLES="glibc.mem.tagging=$SOMETHING" when glibc
is built with memory tagging support and the kernel/HW supports
MTE. There should be no side effects unless the user turns it
on with approprate HW support

Linux 5.4 headers and binutils 2.33.1 or newer is needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 meta/recipes-core/glibc/glibc_2.33.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index 75a1f36d6b..c805755bb9 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -95,6 +95,7 @@ EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 EXTRA_OECONF_append_x86 = " --enable-cet"
 EXTRA_OECONF_append_x86-64 = " --enable-cet"
+EXTRA_OECONF_append_aarch64 = " --enable-memory-tagging"
 
 PACKAGECONFIG ??= "nscd"
 PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
-- 
2.31.1

