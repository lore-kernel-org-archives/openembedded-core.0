Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291D8CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 23:13:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.642.1778714006596588978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 16:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M54AbiZH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so49643865e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 16:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778714004; x=1779318804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZelRZKNTV5JpjLzA1bu6HF4DjKd3bIcwywEqnKwIy8=;
        b=M54AbiZH1huL36lcV0AgWTD8+eXNr/eCknWBsnwHPrLgGRUos3Impaew2bXxcNjxY8
         AVhajvjEyH0qMEWDq8BYMTMIFDpWS/3vnvn4+na5o5QmytyAW0tF1D81oWBuQ9cKXTp8
         RJtxHFF2w2w6HtvrlUAmXt0lw0mOhTMJzotyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778714004; x=1779318804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZelRZKNTV5JpjLzA1bu6HF4DjKd3bIcwywEqnKwIy8=;
        b=sf7VVNiTrG8a6L/mmYMEBI0vMyemQqRkDbSmYnHBHMN3AzqPowLachwXA0MU/B+a7x
         qNmH6g4q8yJmBqTuXIJA1W2UYmGlmxR6KTCmUYFwhXeL3SqbWVPGxcuy6VjpHkUoiJ3f
         GdQoLr8b/x/AkwNCFe+C3kg9hpuweghKHncDb9L8fFAt+Z7gqLwWS6HjPUtn22RJzyti
         7AImBHqMvhZLHb1bUndd1FqE80t8znmt/P9dxOdsYyezovVuHh0I4mQhz/ghIf1uOtJJ
         fZumH+w2KcSLVbE3r+ekRmnSkJVt/HCVg+9gClh9DHgc5KQoTM99DaN0h0grq8O1Czyf
         2LdQ==
X-Gm-Message-State: AOJu0YxZb/RcK2TyJKZOfYgk8+HoCf4rqbBku0Iq9H583dqeRTlLTzRl
	09ShrzgCcWsaaavEccWQd43ivGcTkiILqtaTc7qj3f4DxwVLJYlBTXuO7qX/fsGJq2OJFQ6p/q9
	x2tlh
X-Gm-Gg: Acq92OEzpTGEmtuXdZCOsVMOVWy/dGTepBreFv1v4QpjIAEXDEMq62iquPmPJJtZLRl
	sjxd7ebFCvI77IhlG1RlbBjTKYiNYsWrsuN5jFwFvzsS6vrnxlLfKf086fcfvKhcYJZpo7T6bBn
	qTT7w8lwat5BgQF6FeA+D4I/Bbq9nCoERUs1WLj7h2pcl8wFKiguOZJ4NLl1QvlLBuaSLHBrSdo
	kl2+KIms9WVUZ/m5GyPFErmAsbnWbRGRxZcG77X66C1Xt4PcjAl6QBjMR6UOmUlrS/88cuctZk6
	uuIzohSX3f+LRvZWYeE7s3wSdpHcOASo3oIvJpxdC11U0L9XMbQfhEoTS632qbi0ojZQ/8x3xSM
	GVpdOctPd/kDrLYs65cCiryyVFFf8V2HxZk9L16J15HVS48SFyYAxOXPtLQt8W2wQoDv/oi3+WH
	21373YvTF8xa/eV5IoDvuteTy/wkzUjtdpEqYYPf4d8TqyJiLLOIZtaI9z5nRNJiM=
X-Received: by 2002:a05:600c:37c3:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48fd646b6e7mr17934295e9.13.1778714004411;
        Wed, 13 May 2026 16:13:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd29:d27b:c65f:5d27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd64da1fdsm18103785e9.13.2026.05.13.16.13.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:13:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sstate: Detect broken sstate paths containing tmpdir
Date: Thu, 14 May 2026 00:13:19 +0100
Message-ID: <20260513231319.1600982-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513231319.1600982-1-richard.purdie@linuxfoundation.org>
References: <20260513231319.1600982-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 23:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237013

sstate objects should not contain TMPDIR paths. Detect this and error
if found as the side effects are quite problematic.

[YOCTO #16281]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index ce9baf58165..90d80b6f282 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -654,10 +654,15 @@ def sstate_package(ss, d):
                     continue
                 bb.error("sstate found an absolute path symlink %s pointing at %s. Please replace this with a relative link." % (srcpath, link))
                 exit = True
+            for dir in dirs:
+                dir = os.path.join(walkroot, dir).removeprefix(state[1])
+                if tmpdir in dir:
+                    bb.error("sstate found a tmpdir path reference in installation directiory %s which must be removed." % dir)
+                    exit = True
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
         bb.utils.rename(state[1], sstatebuild + state[0])
     if exit:
-        bb.fatal("Failing task due to absolute path symlinks")
+        bb.fatal("Failing task due to absolute path symlinks or tmpdir path reference")
 
     workdir = d.getVar('WORKDIR')
     sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")

