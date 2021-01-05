Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.5859.1609856755590106194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iQrHxL+u;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id c12so18431339pfo.10
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rkhdiOw+Ow6eWA5skDNUeL4GhoiRBV0fVKzRZ2K2OTg=;
        b=iQrHxL+uQqDezXexbVi17j+4cRkaD/BqA6osm+nrL9fSQOMIMVT7Y/xy6uTWus4YMM
         h4RnauvRZxwxCeBaAlzs3vX6MdFyEEHXi8KnXcxZuuswA+dMYjo854omyoOiIOPPJuKb
         ej+ZfeEzCYMoL/zg29gJ9PS1EbTNKI0obyVwvDD+382mMdXC3oiTRRZZ3MFDlFbQHJDG
         qyiVFRKaNav79AUV8pQI14UrGatOoovT3t+JBNZJsVyhgNyiV7XIH+vmEk2HOTe7/lL2
         7FR+44x1+nSOP5snremhIUFK+ExPL+uJBByvUFR7LUsdMmhEBYfUAVkH6hrlBPj2eGNJ
         nGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rkhdiOw+Ow6eWA5skDNUeL4GhoiRBV0fVKzRZ2K2OTg=;
        b=ivntXK7qJhgl5+Xz31b/1Zh3W75RsdVqhc1QOwJbCRi+4QBwKPdY5JXG87AwMFQ81L
         e2erK0EEzOl+UQL50gTmd9TM4vDPnep9uc0EM3iki2Jck//AgKu4PEU1Itr7IbgeqYl5
         N/97uldB2l+Zmp6MdKR5MdomkOAC263CmELcaCSE9SpjaZthaiT+uX1dmXozeF3lj9/V
         wS2yHpKxYqlqpUr4NwV/5Tdt3cs86HOwPE0+GzSfNBCTiVrgQBaS/2gFtbNfib5xuK/R
         DuVYKzeXKEQd/cz1Q7AVHem8sqkBtxDyK+bAl9W8myq10aGhRXua2HrIqnt3cLM2IKvI
         0n2w==
X-Gm-Message-State: AOAM530RTms+E+oGOgCkq5OB6Pa9coa08oK3qzW188wrrij+jiBK/eYq
	uSiaLJbvEEDBC9FsxFuJTmsJY2KQu4sz1u8sIH4=
X-Google-Smtp-Source: ABdhPJxLUaP0SwR/N3HFr5HYOr2p/hMjuwp1WeGIc/Qu3rfJxveaG883uIk+k3B86UzlJJOBiJI8pA==
X-Received: by 2002:aa7:9ac9:0:b029:19e:19b6:6e09 with SMTP id x9-20020aa79ac90000b029019e19b66e09mr69242873pfp.49.1609856754779;
        Tue, 05 Jan 2021 06:25:54 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.25.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:25:54 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/30] oeqa/commands: Ensure sync can be found regardless of PATH
Date: Tue,  5 Jan 2021 04:23:44 -1000
Message-Id: <e2814ca1105e6ed9b688f2e8e6a48dff0c7d402f.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid command not found errors shown in selftest logs due to changes to PATH
settings which also risks intermittent problems due to IO load.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40bcae01b0be2f293dea9ab42c6b7f8f47827cf5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/commands.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 8059cbce3e..8b3e12038d 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -188,7 +188,10 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=T
     # call sync around the tests to ensure the IO queue doesn't get too large, taking any IO
     # hit here rather than in bitbake shutdown.
     if sync:
+        p = os.environ['PATH']
+        os.environ['PATH'] = "/usr/bin:/bin:/usr/sbin:/sbin:" + p
         os.system("sync")
+        os.environ['PATH'] = p
 
     result.command = command
     result.status = cmd.status
-- 
2.17.1

