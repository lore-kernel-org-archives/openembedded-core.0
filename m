Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EF2C83F0A
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 12:03:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.11722.1724933001609195845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 05:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N82CdwRy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428243f928cso5089855e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 05:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724933000; x=1725537800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvxWKOVM6lGgEhik82XUIE3oYvcGligOnrIfGEOk1yE=;
        b=N82CdwRyRkOq6m9YqBRgHC+NGp/J+9f+C1ae1cOjbMbYmOUxv+nM8piTGxbEa7E7b2
         Oce/11BTAz2cYfBtBBLZ6Is9L/MwPuaDqe4FkmoHuEdXB0fXnYMCFS1QT0DErSoVjhuy
         7CqgQbMOqrM5meIIZhhrVxhy9YgM+R4TlqIXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724933000; x=1725537800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvxWKOVM6lGgEhik82XUIE3oYvcGligOnrIfGEOk1yE=;
        b=ick4e9gTv581Hw26NUz7oM9RtjCEDMlkTSAtcg8hGt6fX+zqOEP/lIH1bu+AbIbpP/
         7IF/IxbIp0EhXUgsmKeFi/Dixe57Lyrw64dFg3srv+RS+HTb3E8QvijheSJsAzZiBno4
         lqpweF1u5kIk3b683VNR0VvZmbMX7lMiDeju7l+Kb2OCeqxRlbKCA3+HZNgk6YnrzCh1
         WKe2RV5fodPHhwKyPQJiCT8fdoZNB/rMB6HZbTx9suGP/yYG1LnuUj/MRWYqkquHAQMN
         rZZ7osddCzopP0zc4aoSkroY7zQckI5sMH7tuQqevxkwPWUEDVRDnp/kQvvLxeTRC4Hx
         xsHw==
X-Gm-Message-State: AOJu0YxKf0R9KEPpp9ya6qVkYYuovpUaFJyxj46s6zZdokY+ZwvbQlVW
	L7zzuZtuE+EGhL2msirkoHHsBmL4aG7HxRhqnr/PzPkrgD6H3kYa3GryMvRnoNxy3VaGTKlaK5e
	7
X-Google-Smtp-Source: AGHT+IEUaIpuesGOIK/k9Wp9T4D+XyDVlNu6k6M1LrAlScyYI1wKuTLwZS/gy8ZaePmxE0s8kz7Yzg==
X-Received: by 2002:adf:f58e:0:b0:371:a844:d32c with SMTP id ffacd0b85a97d-3749b57c4f1mr1866648f8f.39.1724932999567;
        Thu, 29 Aug 2024 05:03:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:19db:d42a:7902:cfcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42b9e7b7f87sm56988635e9.1.2024.08.29.05.03.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:03:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Drop SSTATEPOSTINSTFUNC support
Date: Thu, 29 Aug 2024 13:03:18 +0100
Message-ID: <20240829120318.4000981-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 12:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203917

This was deprecated with the introduction of postfunc support for tasks
in general and only used by buildhistory. Now that usage has been removed,
drop the code from sstate.bbclass. Any other users should be able to use
postfuncs too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index beb22f424e8..2a8a40ef570 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -103,7 +103,6 @@ SSTATECREATEFUNCS[vardeps] = "SSTATE_SCAN_FILES"
 SSTATEPOSTCREATEFUNCS = ""
 SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
-SSTATEPOSTINSTFUNCS = ""
 EXTRA_STAGING_FIXMES ?= "HOSTTOOLS_DIR"
 
 # Check whether sstate exists for tasks that support sstate and are in the
@@ -349,15 +348,10 @@ def sstate_install(ss, d):
         prepdir(dest)
         bb.utils.rename(src, dest)
 
-    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS') or '').split():
-        # All hooks should run in the SSTATE_INSTDIR
-        bb.build.exec_func(postinst, d, (sstateinst,))
-
     for lock in locks:
         bb.utils.unlockfile(lock)
 
 sstate_install[vardepsexclude] += "SSTATE_ALLOW_OVERLAP_FILES SSTATE_MANMACH SSTATE_MANFILEPREFIX"
-sstate_install[vardeps] += "${SSTATEPOSTINSTFUNCS}"
 
 def sstate_installpkg(ss, d):
     from oe.gpg_sign import get_signer

