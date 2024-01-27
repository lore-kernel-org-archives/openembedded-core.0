Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F012BC4828A
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:19 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.8386.1706323098448766000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rIjlvZFP;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.181, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5ff7a8b5e61so10199747b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323097; x=1706927897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22FxcLr/gktQOFi7ykmYr0xZzc+DLzrxmPgSMk/gKgI=;
        b=rIjlvZFPG0AmqS/2XatpqjugRQrHgyrdFCjqfORm/Uk6VDgmBXVtaqyd3AIAdHCbCm
         7Wg6AtrALRJn5jiB/UEQbjPHg28I5mX0Ruy+o77R3fgf4b6kN6HJmsC/wRoJ7Lpez93k
         eTyDnYAZsdSCCSs3LHmvoXbJlxA97hog0DtjMdfHe9G+5FL9HLUpyBMbB+r62LMmN7t+
         h74Z5vBSP8LwHVWmxjpdRZzIPLPzG2uc8zfn4kdAnENFqmFzNqwDTh+LPDPT75d17+Q2
         IIm0GQ3dq+LwJyiTmodP/kxUxppxj0xh3wBo9BRjuINC9ZE/5nBl2+8DmrQHWNXZWaSG
         LuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323097; x=1706927897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22FxcLr/gktQOFi7ykmYr0xZzc+DLzrxmPgSMk/gKgI=;
        b=HeImfeqBMe7FFbaQPrJQaBHnmTGfw44BosKflvbOmHyf8I90icSGotj5/CDRVMkty1
         IvRryzLUk5VdcgMKrhzhphqu1EfUILtAugLzDNXZv3Mo6T8TUavp/b5ql4RJTZ0gpdW5
         mD5x5AB+51tb+aLFAMJ7UXSpgt3ohFjoE0mfjFceGuKpRY+EXuo+SD22mdzIWxT6oC4/
         4f6sMsI5bxtHSRqNUgJIR7QFbi2yodc66U3ZJClzPCWqWa857AVrLs4Za4+hUF69FEIB
         8LsuRO0NoqZSXYBM0Tz3V94Cv/wHuzQV1kH5m8g1fpm74ZluKRhM0pXXNiLIKUAph47m
         9gSw==
X-Gm-Message-State: AOJu0YxN0Kbyx5nRpHA6k8w+wNHNHL9gJKCSwOXD0tEvlzixVRL+/e+N
	pTS9epJIp/W9GLRgY0RcLNO1vxnyOldDpIKr68XnE+MfNM9lFdQ4byGkM4rbNsgyAl5k7fxL80s
	OxRZbxg==
X-Google-Smtp-Source: AGHT+IGFPvX5xIWcp8ReP0gyt37S03JbkfiQ5o3xJfoojuChlpOgJ6z2ZrZPRoTSJIagN17iRNplrA==
X-Received: by 2002:a81:6d41:0:b0:5fa:82bd:8642 with SMTP id i62-20020a816d41000000b005fa82bd8642mr795749ywc.29.1706323097355;
        Fri, 26 Jan 2024 18:38:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.38.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:38:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 21/23] lib/prservice: Improve lock handling robustness
Date: Fri, 26 Jan 2024 16:37:29 -1000
Message-Id: <4e3c9526c2389fd08d86d986014313e1d404f1fb.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194430

From: Richard Purdie <richard.purdie@linuxfoundation.org>

It is possible we could crash holding a lock whilst parsing in this code.
Switch to use utils.fileslocked() in the with expression to avoid this.

This may be causing some of our strange intermittent failures in PRServ
tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e59db15e5df2cc3d0ae042454812a2d54cef77b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/prservice.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 2f2a0c128a..c41242c878 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -78,8 +78,7 @@ def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
     bb.utils.mkdirhier(d.getVar('PRSERV_DUMPDIR'))
     df = d.getVar('PRSERV_DUMPFILE')
     #write data
-    lf = bb.utils.lockfile("%s.lock" % df)
-    with open(df, "a") as f:
+    with open(df, "a") as f, bb.utils.fileslocked(["%s.lock" % df]) as locks:
         if metainfo:
             #dump column info
             f.write("#PR_core_ver = \"%s\"\n\n" % metainfo['core_ver']);
@@ -113,7 +112,6 @@ def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
             if not nomax:
                 for i in idx:
                     f.write("PRAUTO_%s_%s = \"%s\"\n" % (str(datainfo[idx[i]]['version']),str(datainfo[idx[i]]['pkgarch']),str(datainfo[idx[i]]['value'])))
-    bb.utils.unlockfile(lf)
 
 def prserv_check_avail(d):
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
-- 
2.34.1


