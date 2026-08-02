Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D15C55175
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21326.1785666540007986726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B4D8hi0f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso6660925e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666538; x=1786271338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ro71Q/jpM+gmUSbHkEqkRXORIxLPSnnGSauvYAcXzvU=;
        b=B4D8hi0fqfwXjxM0J9FJy4mjqtmhM+nps7HzTlYjoYfPsWEFmrpm/0b1tXci44zWdg
         u4xyV0+Svx2HaFBnkuRXZ2he6+SpZxrJibsM7oJN7wNrxYs0jkIah+8RPGvluh0Q95BH
         g+OaNQh93mcnIt+r44T7h9QDkQulcnPeykyz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666538; x=1786271338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ro71Q/jpM+gmUSbHkEqkRXORIxLPSnnGSauvYAcXzvU=;
        b=GyzugCF+mFpTmjn/5uKW5SXTOvqegY3vwbn2CzQUyUuYpuiDy9/eeLD+WVphxTzAXy
         uO+brgUcz/wIjFVAWbc1n6qEVVrO39TN4n1OAr6NattsMktx8Q05YjfWCwMt+7KGQ9ow
         6k0Xx124vZRRioKdcYrmXx+e4mlDgtrHl3VnVd/bEEdfDFlFf7asW+eHRtdoAUvXLC5b
         NKWLI2lCaB5b9ikAgJyn0NhWcDP/ddmhYHFiYg+ERq6rPgeCrJKqkz4sVZ2ZJtaGCHfE
         HxxpPs/8gZn+zZIC6seDVCmxxlMkfJaEN7tbEizUL/PyTmQlaQBxAPeEdQGjdEmUb/TR
         352w==
X-Gm-Message-State: AOJu0YyM6uT6lMSeEfOsa+U7+ixeZH8lHOr6xISiYuogChb704VGxr/X
	07YY1JX8Fx/jECkp8azGUTSyi9rSDTpvin6KwvcOtqemMfKpBpH6BXeH7/+Q53cqKsbTMN8LrLc
	rLNtkti4=
X-Gm-Gg: AR+sD12fvNOR6fs567U2i4Ge3leiQkORj3U4zxDdHbqE2h77zMT6GVmvTvsgVDwA4XJ
	jQsF189XG8YP4PTDSZrfRpNqqJHvBxJgFtJUJgB28qpMJhUEqFLwQcQzDQYiAxaJUR/UfoazZDB
	mqKaBB4ti0dovKO+E7ZxUKTP+Sleoj805AkhAW4EvbabmkQZbT50TIG8O1hCuSz/y0qmZQM1hoJ
	IwUbzYJBwlCMK21tWjYxbTBBmo4X82CEQmXXzt6wJ8UiK53SkWF45VUhvK2dDunrwQ8+4plFlVE
	EQtIL1SvFcBYz8qdQ9EMGTWqlfYm4+jMdgomlf5ZG81rblHexrpUd9QMBpv9DFW9CWrOpk7bgQL
	E8yBBHiJz3SJ0fLf8BA4N7TVNsEcOFqRfN6wfHh9JhXsW88rs0T+UUgAgpcdMyTsUOgf+IS1Xbq
	l2lUKewGMBmilOLGqSycuiYxGKGYMAT+rDmLjtIWPjpQcgCfiZt+XXcwk6K4zTlnUVuECSQIg0R
	er0pB6fG3WSxpcznw==
X-Received: by 2002:a05:600c:548d:b0:495:6134:6d61 with SMTP id 5b1f17b1804b1-4980c674de0mr132175855e9.19.1785666538253;
        Sun, 02 Aug 2026 03:28:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.28.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:28:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/25] linux-kernel-base: Delete unused function
Date: Sun,  2 Aug 2026 11:28:31 +0100
Message-ID: <20260802102854.3952760-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242527

Drop a funciton which seems unused and a pointless comment.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/linux-kernel-base.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes-recipe/linux-kernel-base.bbclass b/meta/classes-recipe/linux-kernel-base.bbclass
index e2187a73f0e..76d8b4d4513 100644
--- a/meta/classes-recipe/linux-kernel-base.bbclass
+++ b/meta/classes-recipe/linux-kernel-base.bbclass
@@ -50,13 +50,7 @@ def get_kernellocalversion_file(p):
 
     return ""
 
-def linux_module_packages(s, d):
-    suffix = ""
-    return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
-
 export KBUILD_BUILD_VERSION = "1"
 export KBUILD_BUILD_USER ?= "oe-user"
 export KBUILD_BUILD_HOST ?= "oe-host"
 
-# that's all
-

