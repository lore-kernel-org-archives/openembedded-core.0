Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCCDC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 14:15:08 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.11063.1651155307366165077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TC4eAVA5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d5so6989103wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FBuSWgdZNvSkYfMX9S8hAD/O/9FDJK+rn3hAi9oGj78=;
        b=TC4eAVA5k/C/MBqDWyvgL2JQ6RuSvxIqiA1qqrg/EpP7zhAW8ZCbERRpHCDPmfTwwO
         6JieSJfUh9uf4O5lYZl/GixI65T8pMHY/l4S0xwn/4DL1hSDAfuliVzpT8WzWofRYDA6
         mYW+yAL7DHn0HvSno8pJn3Krvc/VoS2VMiVTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FBuSWgdZNvSkYfMX9S8hAD/O/9FDJK+rn3hAi9oGj78=;
        b=f4j1+ARqH0IaCIfZbb8L4cQmzZ2DvYNHIaOhNdqk0w6Gox2BrjZHUra0QD1/79Zhmv
         lgJyQR2NIoriSiLz9vDBvi+Eargwus4GlVUPkrKFjJQT2SfnE3cHUIRTlJFsRYMbFFuq
         8G6HJQgGJK/Li7lv8TWzdQE6AqUzIb7hsnaeEH4DWQmuEpXclXM24DnFOYj5B41EEfDL
         ehObGuQsTgt2zsr3TeshSGYHvWTc1EoekrGJdafOGRk97yj7b8EigQbcXP/kTs1kQuRO
         UJFunUpVLQqvKr8HUm+p8Lc7lVtd90XI91jXIit0+41CCAPTr7gw1CDSIzZbb/gN21LI
         KVRw==
X-Gm-Message-State: AOAM531wZhIJYhfucYPK9YLsckaMqJ/ScCs25/SP7GSKRGMQ5Dvs2E7W
	b8fb6fmoF6ynrGJjsBSlbdjQ2szfJq54Tg==
X-Google-Smtp-Source: 
 ABdhPJw6kfPP8JHSJBUtXHnIdsaidxPOYVl4iilJzVOcnIYtRAqqvLMrnj1MRghhFwSk+ulVWoVEAw==
X-Received: by 2002:adf:f9d0:0:b0:207:bcca:7cc2 with SMTP id
 w16-20020adff9d0000000b00207bcca7cc2mr26435831wrr.697.1651155305620;
        Thu, 28 Apr 2022 07:15:05 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e3fc:fa86:a530:4b66])
        by smtp.gmail.com with ESMTPSA id
 r204-20020a1c44d5000000b003941901f2b0sm66866wma.41.2022.04.28.07.15.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 07:15:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/sstatesig: Fix find_siginfo to match sstate filename
 generation
Date: Thu, 28 Apr 2022 15:15:04 +0100
Message-Id: <20220428141504.2876756-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 14:15:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164967

sstate filename generation was changed a while ago and taskname has to be
passed into core functions for the correct filename to be generated. Update
find_siginfo to match those changes and pass in taskname via SSTATE_CURRTASK.

Thanks to Gregory Lumen <gregorylumen@microsoft.com> for spotting.

[YOCTO #14774]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 2cf858e201d..7150bd09290 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -382,13 +382,13 @@ def find_siginfo(pn, taskname, taskhashlist, d):
             localdata.setVar('PV', '*')
             localdata.setVar('PR', '*')
             localdata.setVar('BB_TASKHASH', hashval)
+            localdata.setVar('SSTATE_CURRTASK', taskname[3:])
             swspec = localdata.getVar('SSTATE_SWSPEC')
             if taskname in ['do_fetch', 'do_unpack', 'do_patch', 'do_populate_lic', 'do_preconfigure'] and swspec:
                 localdata.setVar('SSTATE_PKGSPEC', '${SSTATE_SWSPEC}')
             elif pn.endswith('-native') or "-cross-" in pn or "-crosssdk-" in pn:
                 localdata.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
-            sstatename = taskname[3:]
-            filespec = '%s_%s.*.siginfo' % (localdata.getVar('SSTATE_PKG'), sstatename)
+            filespec = '%s.siginfo' % localdata.getVar('SSTATE_PKG')
 
             matchedfiles = glob.glob(filespec)
             for fullpath in matchedfiles:
-- 
2.32.0


