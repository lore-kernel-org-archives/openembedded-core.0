Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0672C3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 11:42:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.4991.1703331720921472662
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Dec 2023 03:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fSo32Lgv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d4ee4cbbcso5232015e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 03:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703331719; x=1703936519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GcUQ8NqvV1EVCQ765wFehLVt6wEWx3nZKIZwkOK75y8=;
        b=fSo32Lgvucy+1SR8VQGouIvidw0AOkNlCs6S+Xd++F3kAAASNuPwZsP7BaTMxRNsJp
         25/cgrcjQKfIYCTx52hGk3baiZ4VIHgwKtiS9BL2XTdqvfPw754m+QmevC+NgakPQr7u
         FmmgWDSdElxF/R7Hq88wswhJEGmsz0z400hG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703331719; x=1703936519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcUQ8NqvV1EVCQ765wFehLVt6wEWx3nZKIZwkOK75y8=;
        b=svIIGaxbe6HVs+MUMRG81fw+7YjqY+0837oeRyiF+emgb4aevZvsZNqsgT9zPS8iW5
         XLQIdgXxcRW30Fh7HbqKOH68LecX8465IxnQ+2br+itQKQKLSoDHuGkwXHgcJZ3tHX9e
         b2e+bZahr7wL7z/cpu5cjNZYBKksdBZjHZbeV9xElWMo4uERj0iurog4r7UQBpmVWY3v
         nqlODxazjRBBdzoZjNEvkV7yOdIm2PWenI1fmjgVhprrwiTYMZ5kS8bF15+yRVb2k5m8
         lSk/Wnkq8DXXe9bC6H5SeWZrtHo+nRD+d9kL2ioYF/wbMUe2F0IdlGcR+I4ujT3RWr3A
         wKtg==
X-Gm-Message-State: AOJu0Yxc62hPSCZemsGKTFLyEUlVFp3DolHcsXAN7kk7XJ9DQ3UMG3/e
	fWNHHnomJyDusaD/TW13+4NY/T0UCtx4VF2vD4RfbAinTiw=
X-Google-Smtp-Source: AGHT+IGw44SIbhXAtCkGv5OPHZDrhY5OABiSEFq1txTP5GxfHPZbJQtKv3C9GLcGWzn/6iVbdRSM9A==
X-Received: by 2002:a05:600c:22d2:b0:40d:22bb:27e9 with SMTP id 18-20020a05600c22d200b0040d22bb27e9mr1355514wmg.53.1703331718789;
        Sat, 23 Dec 2023 03:41:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9a58:406e:5261:92fb])
        by smtp.gmail.com with ESMTPSA id je17-20020a05600c1f9100b0040d1450ca7esm17962688wmb.7.2023.12.23.03.41.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 03:41:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/prservice: Improve lock handling robustness
Date: Sat, 23 Dec 2023 11:41:57 +0000
Message-Id: <20231223114157.4083370-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 11:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192882

It is possible we could crash holding a lock whilst parsing in this code.
Switch to use utils.fileslocked() in the with expression to avoid this.

This may be causing some of our strange intermittent failures in PRServ
tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/prservice.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 2f2a0c128af..c41242c878d 100644
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
2.39.2


