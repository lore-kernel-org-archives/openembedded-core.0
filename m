Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44063D79756
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5100.1769846218364480780
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=c8sWv+EM;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso25660595e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846216; x=1770451016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+BzhpS/sSwy4fvSNjCvJN3XhrgXofjWG4LRJNMT3B8=;
        b=c8sWv+EMmHAXnZYUtDgV9yGOb+O13ugVd8h3vC00S4p+dSAtwjReQJziqf5khoE6Kc
         6MrOpz4L0wJlfPV75Da+S6sv/hLFMJNVPBrVoVH8NALHPJwzvMs2KP3soLdzAwH4iD0Y
         xGMFBuhWzJnd3c/XlIufpnGwmkuol5UDUFqBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846216; x=1770451016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d+BzhpS/sSwy4fvSNjCvJN3XhrgXofjWG4LRJNMT3B8=;
        b=eg2v1IZ82v76Fo/T4muoufzBkvNadZxlxZhGCKTdhTRlr7AMR4TQmx0rB2Smt0vYvk
         P+5798ZSjPw+9grvdwemdz6qtG9VFjggeVT67XGXhcWXzQs3ZlKyYz+mxdN3OlZ51Yi0
         ijBZzgCtZRN49BiItzus0peIR4+bTZvQXUm5qNhUiNi0Efq51UDiKXzw7T/hJsmbUG55
         OpoNX5b2W1bjzUqC0Cjx16glcJDRgmV1Xth46b77Wql18TmW/ILslCjvPT+xQKYs4Iyp
         0xswI8UIDwD9MGm4X9ldzD/ZQKWAIhsuEgzml7oAwVwbO9JJ+8qyKx4Q6MjMKWi66PHJ
         /3FA==
X-Gm-Message-State: AOJu0YzyCq793WTxFEgwR+UBP6BIHNFf0kfdjdp7W2kJVJMWasAhhpo0
	eNCC32WO1/KEFTtFjd+kFc3JzsjpLmT9gfiAicJM4P1X+Qtj1xrRfHWM9+hIDfyK82Xv5FBfGFt
	EIXbiSiI=
X-Gm-Gg: AZuq6aKK3seE0ivn+Ri3Q02euoDwAeHrRyBP/x0nkSm2LMJOQHci83RK6/eibHZCzbu
	DQsorm0p1rL27c03XTwzGc32TqL77Qkw7i6lDZ8BkKDwBNAXLthRmP3AIph4b897f+C9XqCAfbS
	uaJMYtAdyA15NwStK25hVXOGb3zGA6x0QNXPU47uEmdvn2baOB1poesW4G8zHwv+xU3cmUIJ6ma
	QGg2dJOr2WXKUoHYdhW0n/hD8ZcxBITcHcVj9VDZ2ZrX0N6iIFpC6rwekypNjtk7pFyPPMRThdz
	JjAU2hKXz8amkVmhZA6C05Jh0Elp8PRoGaeyOmKgfo+gSWFxVPoO4CRyDdXYofM8xrOZp1WfCa1
	EbzTONlJLwNT5uPFbHEDnn20CkTSYgWQuxWyq3UMR12h9253Tq87/EYcv1z3+It+6bsQcQ9UXvk
	SAOeH1hNSEANUm1yoqEOKK6VLri3ipnys0MOa8D38eHm1okOpFea/PV/tvoVdoItBJTCEsKK5xb
	ykpaPcbhoQ1aLa3
X-Received: by 2002:a05:600c:6206:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-482db44d215mr65769265e9.3.1769846216466;
        Fri, 30 Jan 2026 23:56:56 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.56.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:56:55 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 03/22] scripts/oe-git-archive: Ensure new push parameter is specified
Date: Sat, 31 Jan 2026 08:56:14 +0100
Message-ID: <ff3f70212c4ddf2892663d831fd53097247f87c7.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230208

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fixes a regresion in "oeqa/gitarchive: Fix git push URL parameter" due to a missing parameter.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 983cb2171e53564bc9dd188136439f3e2ad9e188)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/oe-git-archive | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index 9305ed0b0f9..9484fc53c7d 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -106,7 +106,7 @@ def main(argv=None):
         gitarchive.gitarchive(args.data_dir, args.git_dir, args.no_create, args.bare,
                               args.commit_msg_subject.strip(), args.commit_msg_body, args.branch_name,
                               args.no_tag, args.tag_name, args.tag_msg_subject, args.tag_msg_body,
-                              args.exclude, args.notes, args.push, keywords, log)
+                              args.exclude, args.notes, bool(args.push), args.push, keywords, log)
 
     except gitarchive.ArchiveError as err:
         log.error(str(err))

