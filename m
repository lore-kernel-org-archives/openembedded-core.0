Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E98BC02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:32:31 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.65495.1738920740962843478
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 01:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JBnReXWV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38da72cc47bso1372084f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 01:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738920739; x=1739525539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zbw8Ag16IohKjQni3CVaVBmaphxy3H6UL6aPY8l1+m4=;
        b=JBnReXWVWH0c7wh1V9o+39HT0eoPqsiQD1XA+GVruEFYE3+hVR9QpC13LE8VQbmhOu
         +18IVMknXg69xr2qPZOiY12wEYcBDSTJEJ85Un4UhEp6RkrkmClkjO0ahz9TMix7WG9W
         g4plXP0pYJ6PvouwWp1s4hc/OFu8wydFsBAZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920739; x=1739525539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbw8Ag16IohKjQni3CVaVBmaphxy3H6UL6aPY8l1+m4=;
        b=CLzcHt/HwEMMQf0umnNASBArZ5AV6DxNYS8XFJLSw9S9ZsTO2XwA4M3POpU1XKbx0B
         DFkIqYOi5VILRIRCIYz3zbNfk2reQvlZLxQ9cV+R818tnO/pZyyvJTt/X/rJmuuJD2C7
         tvl7cH+iWRnbdvrNZoZo1BGaCc53YBffcsjwEZQ3LvrWTgIjltNoi/YvQmuPizQAo+iW
         L0Y5uZkqsVylByrqEmz+OWuglZv9cVbwaOqjtwBgOlxkNVLbEJqDPF5GKZjDf0bj2qHH
         fKCE2qsM6CZPGWLJc80saIyQApa+o83UQH49+VQGuUwu4vNzNGUXXktiAWGsLclYIogd
         8a+Q==
X-Gm-Message-State: AOJu0YxIZvleFEZCbuKj9IpVTOpy0NLu268C2MsaR9YfonbQYgPzMMJ3
	PxZ8wfVyBMeMmzttwuRakMkNJV6uigd1110scUNfKSaAmM1ztJtxeyd/olm4oNlsOXThtPXIUsX
	Q
X-Gm-Gg: ASbGncvWbhEhax1B9YtZFlEr1FAVNj29LytK8MIYVcPGLEIXdP1vyHVpJQxS3o4yUc1
	0O4wp9WRRs/8bYUez51p0luwc8z/qvUde1SF2iwchnvLfE7NsvppcXOgdefSX78j8p6/KtZddSM
	80y6HJMg0PVt5jvK5NyTuITI/gEKJVHSVzdJ7DFaSOWaqTHFAPsCA8LTO2z6WWqT5+Ha48i9xhT
	xIlNRcQo37bo4WDqPirmYv0+Hgpp+NkWM1o9k3h0Q2FQHl1XHrHkJk9X8t+HOhQSNlcCL/6p9UP
	Bumb2XwmZ7umVEPNKk9Ghgz10jC8N/QUGB8EjxmiqE7G
X-Google-Smtp-Source: AGHT+IGcU/qZKioClAYYeDNncw6xOSUACPUMhJ9UzBfaqZH86HuDv41xMco/QQyy2gCQaIe5nipjWA==
X-Received: by 2002:a5d:47c7:0:b0:38a:3732:444d with SMTP id ffacd0b85a97d-38dc90e6df2mr1563664f8f.23.1738920738936;
        Fri, 07 Feb 2025 01:32:18 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dcae:28d1:c97a:4196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffd8sm47453075e9.10.2025.02.07.01.32.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:32:18 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "selftest/sstatetests: run CDN mirror check only once"
Date: Fri,  7 Feb 2025 09:32:17 +0000
Message-ID: <20250207093217.3903605-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 09:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210976

This reverts commit 0d3901b768272abc2e27ba2ab807dad24917e0cf.

We've still having CDN issues so go back to the double attempt to
see if this improves things.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 51642445669..681a57f4db0 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -986,10 +986,12 @@ MACHINE = "{}"
 
     def test_cdn_mirror_qemux86_64(self):
         exceptions = []
+        self.run_test("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions, ignore_errors = True)
         self.run_test("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
 
     def test_cdn_mirror_qemuarm64(self):
         exceptions = []
+        self.run_test("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions, ignore_errors = True)
         self.run_test("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
 
     def test_local_cache_qemux86_64(self):

