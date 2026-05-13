Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A48CD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 23:13:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.640.1778714004701797144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 16:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T7J7QKc3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48896199cbaso64184265e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 16:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778714002; x=1779318802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMZZKV020fCc1LE8kd9cgcMMIKdPl5f8XFpLKxCJlqw=;
        b=T7J7QKc32O39jJb5tynVOkQRq0BnqWwQGhL1GB2adlrPtddj5G0DyxZdnfDoEDvn60
         affBjO0Y4xoOptEe+zSS3XSLZDQN5SXzefqvmWcp0cZZftALY7ngNLoCH1o1GshSwI4Q
         Qf4A0vEcXZqxg9XtFlGXYE7qs+gd2xw2cI5nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778714002; x=1779318802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMZZKV020fCc1LE8kd9cgcMMIKdPl5f8XFpLKxCJlqw=;
        b=migbach2bNGqo9fR1azKjnn/HoamLIVnv2jUy9zQeIcvaOD2EXn3KFOMmlfAmfZ0Pl
         9hV24GQCbiFHzXboIJA0PAHQTNi7X1VxZzMKUEuY1fu0aL9r65tZEHqZN5Prf2ah97R6
         yWxkq3KzXsOWZGaZWaO97igooSLbT62fakrJQKV9J01juV386j56lwwjnmtr4G/AsByM
         YIW6hloUeRaE+c1u9ee7XUeMlypkmQJH/vP0x41GC48XEHa0ZVFGqkZuP7wimwUN8Grf
         RI6Pm6NUCEuE7UN0Hjl52bbv9bjxWJ8O26hWTel9XvCxC9BQWeNIyJn6FRz25J9USq91
         YzZw==
X-Gm-Message-State: AOJu0Ywcc4lukh+HZpSxZYQcdikyt8axaLexAHGlX7TL3jOexxuV3hpV
	XJxSWf36jm2FsGADdZ8VanercanGHZCLDbGZtpfT+YHFfPmzFAzNODTYiHVEqS/klL/QWo4NjML
	WlXLe
X-Gm-Gg: Acq92OHQ+nbZc4MsdCzBy030pZpyAoH3fm8iUvfJefpow/2L5xvPIgldi16grCyKDDE
	4Y2jeBhE1EoG7eicdpZYjhLmxcSq396wyzSZgsrHnRdZLUg4xi3jTqOwh/iu+K+1iowKUTajj4I
	6VWwscNl7xGzeKuMdz+X5tN9w+07Cw4dRsAirLzseMubdgklIS4V/KQLUdVtK6YcvoIL46mV18T
	vtVQKmZB1NqM6U9GRMMxTrWMNZADw+5lmrSDdoVeoLLp6mhHO6bz0WbbdbpFbpxYTBQCiCjBIWM
	ytRDlySsPkLvaUMu+7xrdf5f3XHgZtgIeAFzCsw2g218egWXaQvvoGFjcwP/pkcGiGPpwbMGpF6
	/GnAEwG3AGOq0t2L+ZaVRXF7esHml20b3MzAIzdXH/hAx/0Qn4p5So90c8GjtotBArcKauw56zk
	iDmkJqtbGpPjbwcTyqFiWmQMEpiLLQ/kTEkt3KiH1FEnDhHlAOQJ6k
X-Received: by 2002:a05:600c:3107:b0:48a:89d9:a419 with SMTP id 5b1f17b1804b1-48fc9a09fedmr78183225e9.11.1778714002472;
        Wed, 13 May 2026 16:13:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd29:d27b:c65f:5d27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd64da1fdsm18103785e9.13.2026.05.13.16.13.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:13:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] sstate: Improve confusing debug message
Date: Thu, 14 May 2026 00:13:18 +0100
Message-ID: <20260513231319.1600982-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 23:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237012

The entry being removed is a file, not a manifest, so improve the debug
message to reflect that and be slightly less confusing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 1dfcb5d0a3b..ce9baf58165 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -478,7 +478,7 @@ def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
         entry = entry.strip()
         if prefix and not entry.startswith("/"):
             entry = prefix + "/" + entry
-        bb.debug(2, "Removing manifest: %s" % entry)
+        bb.debug(2, "Removing file: %s" % entry)
         # We can race against another package populating directories as we're removing them
         # so we ignore errors here.
         try:

