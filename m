Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F3FCD5BB9
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.964.1779233439618944028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2EG4EuNe;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso22955545e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233438; x=1779838238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1GXrRW342AwGA2SuNA1VeBk7ja6+XtkxSDW1/dFPa8=;
        b=2EG4EuNe+rNB2p7PyF/pKr3AVZWNJXZ4bxikKHv9HfV6YCOMg9/EvPJ/0fq6/ViJBM
         qTuh3OHgyHm/1e/j+e6nnjg6WXsRK14At9zSiwhvPsURnyxNh2bFPuOhW9L/a1lIavZz
         q2kV7w7oq9Wt7mMcj5j5mZrJiyusO/ppAGx1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233438; x=1779838238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B1GXrRW342AwGA2SuNA1VeBk7ja6+XtkxSDW1/dFPa8=;
        b=IVLATuOBUM7dEmFH2N+wFfOUf/2JbZDqUpi+s0to12haU0IfFrVghnjCC7AD8HCQDJ
         uv/7CgGqST2sArGEDb5wWVPz+0rAJK1kuNoijPxqnUCnWIOUPBPqqBV0oQoj27d/WfDl
         B9HWBiKr+vOJ5qCDzSgGJBiGJC0Ve2rNJqEP2LSNcOvztvMQ9KG67Mn2ZAHzFZHrbFUy
         eBWvNLP7Rjnki8KFpm766AMGUHmr+NvTQp7B6yOTFq7kGm/glkUHdbP+9lZ1eYXJNuTO
         6OzhC0BVylVbOkyj731fIdm2fmkgRA/w8YpRztipWBKsojvRaSB1nD3q51JIXuvSOr0o
         dgSw==
X-Gm-Message-State: AOJu0YzeHGNkF/c+Nai1krFOVBNxGosKAuRpfyVi1H4jDIlu0919AzRB
	5dpBzcc0NlbjSbBzt7K3mXPXkziX67ggrPzPpm5VCIvgDjdQPFXGjznOd9UyxG8ttlvbgRcO53g
	idC+c
X-Gm-Gg: Acq92OETBxqG1ulnd2OEqedt+YlbOowxC8wa871W6Cd68ZDRxoBvcxStpVpA53aPHkJ
	gWt0ghL2BWZr8hdGzzB1cwWJ8r41OyT9NPJbIDheo0vUxq3g0i/k8N3xy46JNAu3qWzh0GFvChm
	RVAVvdzXvlrxWSVjtill7C4B4BhkBVA+e499rrq4iBJpsQcaT8TYbsQTDMu/a8NTYvp71VebdHO
	+sUtdo+Q7s7bDa7n4wsArbIFuvpQaG/q3+KhpOodP1yWBu/puwW2R9UIT3Y/LS+2TWln+QDjinf
	OdmIcTDVSSct7ezTPf90CZ9U0FaJ6tig6CntWVkq0Rd3lRvwG8AXaNU16km1aVzzzgi6OVGuAt2
	Au+Lei00iRO3Lcd0RRe2mo2l19sLsBF32mVNKHYw/JHAuZXL2m0oGOKbFTBNhuJ8LL5nIDxFZfx
	8Cr/s5b7mYLkXORDmPsLmDSrHHw1ud6w1Q59eMvEruAfYW3osC2aDytEger/pYfb9uzTiXVTjmP
	nkEzXxKJFbojbMANiScRBav9F8=
X-Received: by 2002:a05:600c:a406:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-48fe59b06acmr279774245e9.0.1779233437783;
        Tue, 19 May 2026 16:30:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/28] shadow-native: Change upstream status of disable_syslog.patch
Date: Wed, 20 May 2026 01:29:57 +0200
Message-ID: <e450f77c506d688d0fee8dc277d6f416fdbb0eb5.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237367

From: Dmitry Sakhonchik <frezidok1@gmail.com>

Upstream has accepted configure option and merged it into their master branch.

https://github.com/shadow-maint/shadow/pull/1618

After they release v4.20 we can remove the patch and rewrite recipe with the configure option.

Fixes [YOCTO #15785]

Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0ce3150e43cb6fb0d726cf86725715b8fd06147)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/shadow/files/disable_syslog.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta/recipes-extended/shadow/files/disable_syslog.patch
index 7299a8e61cd..9f8ffcd379d 100644
--- a/meta/recipes-extended/shadow/files/disable_syslog.patch
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -2,8 +2,9 @@ When building images using shadow-native, we shouldn't be spamming the host's
 log with lots of syslog messages which aren't relavent. Disable syslog use
 in the native case.
 
-Upstream-Status: Inappropriate [Would upstream accept a configure option?]
+Upstream-Status: Inappropriate [upstream has accepted a better patch at https://github.com/shadow-maint/shadow/pull/1618]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
 
 Index: shadow-4.17.2/lib/defines.h
 ===================================================================

