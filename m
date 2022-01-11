Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CAEC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:03:01 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.12449.1641927780789793728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:03:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kYbLUncJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id pj2so541199pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dCnWo/MMYODQV+sYCAvzqYDUC0DfeZoP2rqCXsxr8z4=;
        b=kYbLUncJ4yDAAQHTotw0vaan7PU/MzftSttbEnP0dGFSGCvlYFfUZawvnabFoc8UaI
         H8Pk4yiRSzqrwR0giPf0c05dFmQ4eV+tMeBAxBAm8v8w9RfLS0PCneWsOHQp1yKItXSO
         6wZB1M81TdFN13LFnVpjbVYH/6Qiu9v4KXvx2XlPGlJwXUq6MFmlRPR//9GsmAhlpcNh
         uEtzT/kBS0NEc3oQWecUi08dmEWWbW2cT2pRnPcAMizu8g0JoRM45s8sokCq93ey23Da
         i/UlukTdBMqrumVjXgl8B1vpOPJvDd6Ea3By5w95TDrm6IS8m1UFtc5WV7p8rKV9fg8J
         HMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dCnWo/MMYODQV+sYCAvzqYDUC0DfeZoP2rqCXsxr8z4=;
        b=yJC32kvj93L1p9N7fal/S/E7r66Liz0Y1ipooOwN0uPxjzBdFFVUw6fhxSN845vgpb
         naWKO3a/xj7E9dq7QZB133lS+n3s9BHE0zjC4Rlq0ObyZZHQASdDDHsWPOVFI2RRj+AM
         48ecu2f2anhiUMRDITcAjF1ayDKvGKpneWUPjoU3zXewMaYTSiRlbLjD8fNOS5pyA05l
         SG4+kIARx2AAlolHTR0GWfQoqALUlk0e9Pu5ruebHGyDNFdJuSaDHy1DfsWbaC47QyYb
         E7GKID/nEFRR/4SXrY85xtAk/vNZvTC0ydXNcKnCE6oQa+yN3UV4EyjHVxjDbmTaFfPb
         2xOw==
X-Gm-Message-State: AOAM532KOTp3VHeq2bqlsZ9kiETcwRjryZk6UQRotgZGAFpv/4qmx3yd
	gCuWjqB3MeuDMp+DdPMylaLcnA2nIMI=
X-Google-Smtp-Source: 
 ABdhPJwMHupbhJ3oBRnGFCyzkJzoEpuSAQuGFOnFc/KqfGcJLDKiWRtmnXPRa9XEfRlulziNI783QA==
X-Received: by 2002:a65:5547:: with SMTP id t7mr5300155pgr.510.1641927780129;
        Tue, 11 Jan 2022 11:03:00 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:59 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 19/22] waf.bbclass: drop usage of distutils
Date: Tue, 11 Jan 2022 11:01:28 -0800
Message-Id: 
 <3e30c1feaf6d008628b998c1703d50fa3b21c0a2.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:03:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160455

Refactor to use bb.utils.vercmp_string_op() instead of StrictVersion
from distutils

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/waf.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index df0ab8d73ff..bc594d3c6b1 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -43,14 +43,13 @@ BB_HASHBASE_WHITELIST += "WAFLOCK"
 
 python waf_preconfigure() {
     import subprocess
-    from distutils.version import StrictVersion
     subsrcdir = d.getVar('S')
     python = d.getVar('WAF_PYTHON')
     wafbin = os.path.join(subsrcdir, 'waf')
     try:
         result = subprocess.check_output([python, wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
         version = result.decode('utf-8').split()[1]
-        if StrictVersion(version) >= StrictVersion("1.8.7"):
+        if bb.utils.vercmp_string_op(version, "1.8.7", ">="):
             d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
     except subprocess.CalledProcessError as e:
         bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % e.returncode)
-- 
2.30.2


