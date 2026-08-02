Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30E5C55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:06 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21328.1785666542022393779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K/pKl/JJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954aff6088so9185715e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666540; x=1786271340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LW9mBwKzGnkYBkEKC81AbVZCNEmnrXPcOi5LhBRmvPg=;
        b=K/pKl/JJNb4eE4cROsJtIw/96sXA7ka9o+4tRwIJ5GWe7fEbUom5mF+DuveANlUHg+
         Hg8UAQdkkeo3u5HyWaa5ygfauGGhYhpjRw1cSrmhZYrtY7b7jprA4QSAf2oRjWBQyxvV
         bevm7uAKYLWirIH9IhrS7WC+EbJQjLDQtJ2O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666540; x=1786271340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LW9mBwKzGnkYBkEKC81AbVZCNEmnrXPcOi5LhBRmvPg=;
        b=jej3LfOCosvBrBAQxYKtbS1CaUpMSy3F+WnnV979wZiTIKnrgXq/qOKqNgwubPsL4S
         6Beo9OauNxcrwOC1IOMhbDZK+WPj0I2lMqP/OK5203iC0BUr0fLF0prjC60O5iFLcRBw
         IESIpOX3bGY/jC9QC3B+63P7JIm1HGQj3q4VtcOHVta3UzskZC+D4rZKdX2k1aG90WHV
         yVQMCRyn3jF6PXrF+jdykxVKg3ivPdKJ0OVVk027qjuIfgI3bRAdq8ZK5qnGGmKFGMMY
         1JZJ9JA8+5YerYZO4ogE69sKpjy+8hsSzuLvNdhRndYuotxnRSK+jFk2kqZJWK0nGaoi
         KFgA==
X-Gm-Message-State: AOJu0YwWscFYfnWZsK3h/QTf0lBgjCuFoyZ4URi16MqmMkfCRCNYWPmQ
	Nm5DkRV4t/qxSTbeN4VcZ62AgVDqWvIoecdBOy0KLuazBJP56wi48Ughit+Ax8O522Ke63J0+i8
	WHaHpMTo=
X-Gm-Gg: AR+sD136aUYsSKFv+DWBuYozYbzvlunTb9Ooef9s0OjDZJneeKCvY2YjTNQgSs9UERc
	79VYwpYcsuunmZB56pIiO7GOyIM4Y+81nM8NBMQ1VCivYu6OZMFHBCFuej721dz9ggSPMIw6hRW
	W7IUQkc8fdeKDVAwRpUJ+IEHyRh4V4git11ICxRSLqiWL9Y650Ldv5qDI/gE8ubDUzJI/80jDFP
	PcdZTVucqiVp1JXjY9FsuQ6cGFN2CrzDQB91CmdTyPgcIKmohA3m89i9u2FlVWIkVFMkX3pUZta
	pfhT22aT/f5SI3U1bmSOpPLchMNIebj516IphdPdyrwcR8rVWRWi8oN/bXY4DTvfpPD6xrtTkI/
	rRVg4yOR1WvLoXBypT7S8RrXtEHMaMf1ZUa2TkhRW1nQLWfZbEDiDS6ED6CCqGO8XxzMPTd6+2W
	AhsdXA7cSmSbmKCtzejPs/uSNwnu+JDDUaIOZCQmFpu+8M/Vm/2Bk+DAZt3Z9uC4dLESi3lPq3b
	IFWIcTMCl0cZsqzaA==
X-Received: by 2002:a05:600c:3b23:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-4980c679e43mr131749215e9.14.1785666540248;
        Sun, 02 Aug 2026 03:29:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.28.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:28:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/25] kernel-yocto: Simplify code for cleanliness and slight performance
Date: Sun,  2 Aug 2026 11:28:33 +0100
Message-ID: <20260802102854.3952760-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242529

Checking "in d" is really slow, using getVar for a specific lookup
is much much faster.

The externalsrc issue can be resolved more simply by adding an extra
constraint on the kernel_configme task.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-yocto.bbclass | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 78a4a7ade74..5464aa11158 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -513,7 +513,7 @@ do_kernel_configme() {
 	fi
 }
 
-addtask kernel_configme before do_configure after do_patch
+addtask kernel_configme before do_configure after do_patch do_unpack
 addtask config_analysis
 
 do_config_analysis[depends] = "virtual/kernel:do_configure"
@@ -770,14 +770,8 @@ KBUILD_OUTPUT = "${B}"
 
 python () {
     # If diffconfig is available, ensure it runs after kernel_configme
-    if 'do_diffconfig' in d:
+    if d.getVar('do_diffconfig', False):
         bb.build.addtask('do_diffconfig', None, 'do_kernel_configme', d)
-
-    externalsrc = d.getVar('EXTERNALSRC')
-    if externalsrc:
-        # If we deltask do_patch, do_kernel_configme is left without
-        # dependencies and runs too early
-        d.setVarFlag('do_kernel_configme', 'deps', (d.getVarFlag('do_kernel_configme', 'deps', False) or []) + ['do_unpack'])
 }
 
 # extra tasks

