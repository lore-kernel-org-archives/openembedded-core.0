Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201C8E6917F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:23:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.28643.1732292631390321560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g/CDgpuS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4319399a411so21114115e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732292629; x=1732897429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUsf0yt975GZ44SKSHbVVmSBL6YiPCrxYApycCyKdQU=;
        b=g/CDgpuS/rjnsBfwcR8TaSXT/SspYAQMdWYjbfaDqj3RWFctvp/JLsEwCi8s/IIuCL
         y+p2nCJf8EIfZcQTVnJtQnQLSYHgpRMZ19Nl/elTjBlpYLHIErSehe1B85ouQGGmPfI2
         ajr3oAwe8ExDIoSu3RHw0Xj6dXdYu6wQ/C8G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292629; x=1732897429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUsf0yt975GZ44SKSHbVVmSBL6YiPCrxYApycCyKdQU=;
        b=t0wJ8xq+72Ox6+huVW0Fl8sOUwCrlEF0hqXbUQEpUw0U7W/AZU8XQ5jBgWdqmeHhmN
         HHjqcBW5MrBZ+ZYvIZbSSf/QvMd+Wli+bqvnze47elw1Q4LqtBdCrr3cz10RKoKGwiB1
         uSUlQLF08RK68Enf+wJ3BSpgAWZhcSbQFRcHA0x3OE2aI2sumt76v6aBVleMXmylnYXA
         10+6tqFeXwUCXxkPqGQGyR1ShFpTzDcQbk/R5gtDB0N5XKYTIubJo+G3GDLHaI7Rb3BM
         JnNHgFXdiVGUwrYZWgsQNpFHU1oU6etD3cfeWBnVCjLEwZAhkanxBM3C3nhKV+Z3G5Sm
         YfFg==
X-Gm-Message-State: AOJu0YyCbg68sZl20DFUe0DSW2AFhzi5ZvjkrACwRrqho8p69hYl/Dhd
	WQ+YYLg6pCxRNnG6U2mh+KaDv9nrL8kMFvBOcurMYK+fVGOoaIT94s+J7bKC4wjVwijfrBH6j/W
	x
X-Gm-Gg: ASbGncsG7NuDy3k8TvGoyyPbaIq0Hn6qs3hnDuHVwmyCfDURgoISz/QER31II2B1jow
	GLSG8TD73VtYQ7Q+ndPcvvQ75t2dFSx6uLkxXnSxWTnSlGq3NKzZppHjXBt6zJcG+AKCMZ9S/KM
	PdOVx0fh0LKA2KoTY0bLvV9aoU9Cze6ZC24LxyZ9GmL1BxFyzAHo++oOV9CHDq0tCpKcq+coscd
	uivtlywj+fyKwvd0QoeCWM4v4mlnfayocJgWn64kRt6+a9jx42bB5SPRj8v+GZYnarLd6UKroFC
	Av8=
X-Google-Smtp-Source: AGHT+IHjs3oJPURqv7s180e3cTrs8acLDcM3/f9vmRitrY/wXuBuE4amCa95F0LBgiAcyv7jEY1SSQ==
X-Received: by 2002:a05:600c:1908:b0:426:6455:f124 with SMTP id 5b1f17b1804b1-433ce3983c6mr32615425e9.0.1732292629361;
        Fri, 22 Nov 2024 08:23:49 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4dd6sm100686595e9.24.2024.11.22.08.23.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:23:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] resulttool: Trim the precision of duration information
Date: Fri, 22 Nov 2024 16:23:39 +0000
Message-ID: <20241122162340.2770780-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
References: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207635

The duration values have pointless amounts of precision. Removing some of the
least significant digits reduces result size and makes the results easier to read.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/resultutils.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 9cba8639a39..760e426de0c 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -131,6 +131,22 @@ def strip_logs(results):
                     del newresults[res]['result']['ptestresult.sections'][i]['log']
     return newresults
 
+# For timing numbers, crazy amounts of precision don't make sense and just confuse
+# the logs. For numbers over 1, trim to 3 decimal places, for numbers less than 1,
+# trim to 4 significant digits
+def trim_durations(results):
+    for res in results:
+        if 'result' not in results[res]:
+            continue
+        for entry in results[res]['result']:
+            if 'duration' in results[res]['result'][entry]:
+                duration = results[res]['result'][entry]['duration']
+                if duration > 1:
+                    results[res]['result'][entry]['duration'] = float("%.3f" % duration)
+                elif duration < 1:
+                    results[res]['result'][entry]['duration'] = float("%.4g" % duration)
+    return results
+
 def handle_cleanups(results):
     # Remove pointless path duplication from old format reproducibility results
     for res2 in results:
@@ -194,6 +210,7 @@ def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, p
         resultsout = results[res]
         if not ptestjson:
             resultsout = strip_logs(results[res])
+        trim_durations(resultsout)
         handle_cleanups(resultsout)
         with open(dst, 'w') as f:
             f.write(json.dumps(resultsout, sort_keys=True, indent=1))

