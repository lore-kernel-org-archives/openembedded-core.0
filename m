Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6E4C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 13:44:01 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.6384.1642599840106296368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 05:44:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SKZmmMxE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f51.google.com with SMTP id b13so12038291edn.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 05:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SxyUPB3+/5viCUEGpmfLrns5pFc53g5O5VS23MFmMAI=;
        b=SKZmmMxEYYtaoD29uSVBDoRYtpLY5y65XICyJCly4T3yhh3vfdkAF37G0W+Xwf9UgI
         J1A/YjU7WhR4JBTvgtUJG7/HO2DwxrQDNTkCgW/foHUtxNLE0cOefTy0y3Omwrfw6EsT
         eyFESBJspVDhi1gyMpb1NfhqVYcMMS61u2G4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SxyUPB3+/5viCUEGpmfLrns5pFc53g5O5VS23MFmMAI=;
        b=27MmX5x4+85Q87vwZiSVXJoWMm24uaeZpOuAZU15IljqoOy2X9fAaxaoo21iC4pdwW
         wSgeyQP1w/j4xeqtVQGahZnmB3oQ6WTzIjcpbzizu1qApgG9JMradk4hOjzDQo3onOtC
         zEf4uX7Ls2SJvq9HIN9/2QIv42jg5V0e/zt9SQtgPw7Rn7X/ay9gHvx0rvh3w5eze2D3
         5ee9l0N+ipp30yqhAL7mLGg06YpXECgJPEXH+0xCbKPSGh466GdCRw5yNngmYeGCLXfI
         E1QW10cMDLZDqi5FTtZc6fe6UjkT20+jir1f36AaJ/ei4fCJVv61u1WeHan2W3HwnO1q
         WaNQ==
X-Gm-Message-State: AOAM532+v4Zl/mfp0HmN36viZVtXf5P4PjDbVbQs3xFMMnMWn7IaI9d3
	C72Q4fZipghEMj9DJLqW/Dn+6lhhKrKc/w==
X-Google-Smtp-Source: 
 ABdhPJyNiDMtrw8iuzOUUpj+iEbP1yEmjDpndzDzvlJ3QhSKGRZy755ytQKYHEI0XJvqVpqHj6g41A==
X-Received: by 2002:a05:600c:2f90:: with SMTP id
 t16mr3606734wmn.69.1642599838386;
        Wed, 19 Jan 2022 05:43:58 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4e1a:65bf:4ced:cc2d])
        by smtp.gmail.com with ESMTPSA id
 z1sm4889658wma.20.2022.01.19.05.43.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 05:43:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Show better exception information for failures
Date: Wed, 19 Jan 2022 13:43:57 +0000
Message-Id: <20220119134357.1923637-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 13:44:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160735

Errors like

SState: cannot test file://universal/5f/10/sstate:m4-native:x86_64-linux:1.4.19:r0:x86_64:7:5f108b175274798b17950b5ee686bf61445e90fb204d7f795e5b879b5603e88b_deploy_source_date_epoch.tar.zst: 'GIT_SSL_CAINFO'

aren't useful, try and improve on this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8ee32dba2d5..49d54bc94a7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -994,9 +994,9 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 found.add(tid)
                 missed.remove(tid)
             except bb.fetch2.FetchError as e:
-                bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)" % (srcuri, e))
+                bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)" % (srcuri, repr(e)))
             except Exception as e:
-                bb.error("SState: cannot test %s: %s" % (srcuri, e))
+                bb.error("SState: cannot test %s: %s" % (srcuri, repr(e)))
 
             if progress:
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
-- 
2.32.0


