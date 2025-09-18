Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4ED6CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 19:16:35 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.23858.1758222987834365092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 12:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=n2ntp1Q7;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8117aef2476so135827085a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 12:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758222985; x=1758827785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kOqmfURXxzf7+8bx6wHYSEw48pB3HR2E+Az78yB400E=;
        b=n2ntp1Q7J9c7k+Xm7AAhQIvnUaiVKDUHZIW4BHJYHLYQMq0dLSxwQ+diCq8N91aQRl
         lAoSTV9cdrcBjxtI4NCj9IrXzN8YGX99pMLe8hb6DWuZlQWJBMMGyRgQyaYOSwNOpegb
         39wXrwghfCawdh8TLtuzIEOQwbQ8/NNEXI9IVXN/W6xrw4ZqRAWttYmK3mflKIXLJwyv
         h4yasU9T2fUYkEdynSZ5IjXQlJj8FZrLbs1FUSiAkuvl2EvDypKnRnHIXOBhY7KYbEj3
         gpusgkn4TfR0C2og61pfLRLpqMnL9oVp5jtOsiwLTNOA+9ga4HRdo3ye4bMJIbuU8c99
         aLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758222985; x=1758827785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kOqmfURXxzf7+8bx6wHYSEw48pB3HR2E+Az78yB400E=;
        b=NRCJ9DN1Z0q3xLsAwdLmvExQ7CS3/qfuCo2+U1FX1ttGnWSCRmxasVB2Z51Lf4uLLx
         c3J9IliCOhG0rZCBysWWmUWya3ULOXHbj335aCnRLOYNL368bfsvjLnusSbUevYpB9Ok
         /tWgIpPVwFsIY6tg9L/57lKm7vXot9kD88aCoVAopgR/wI/n7/QR2Iip2/YnTNXouv9T
         g7hmXcDMIWkWTorFTQ1dNzuxVc3DpqL0uT81AUiskViLI3CJSi8uyvye1o+dmqIUTk22
         JADAs/B8Ln25QRTzy91eflir8+a5+8Yq4xxuJoATPXgY6lwNrNAme0kVOC0ei1bFESDM
         9B3g==
X-Gm-Message-State: AOJu0Yzp8IWJARis0wbovlMPIxtc1ec0EUghX6t1q+vPlEdeQHHnKv5L
	dLSBEaGQmckc4OkMydvhsCqV7r105aFJu/XV5fxha3+q5lYIsjsueDFTl2fIejftgzMWpmaAo3P
	dCvzPYDlzGA==
X-Gm-Gg: ASbGncuwarHM25/GMy1yRBMw3RgKPRCLO9npHXVb/2KkPZbsEfrbgUv0PVaTUqqmwJB
	STysyh2U5yEPVXjE4w5YVNHsL2/j2fMMOycrhAfEgk6eYGxl9JWJte0oHapkEQZ9EydLrdLMT05
	2Cq5A1hn1RmNVVAF/VrH3A1FGzhsQSrtgfP9XJiZgNwnu5sUGgFMRxYJc6jyTuaTfX4aZ9R+c0f
	zVIA3SxCH1fKUEj0CH1WuBvL7rjzwf53ddj7h4GedyYONLlUe7VLGB9dkdwzzWDhmKoyGaKFP9q
	Qmem5B0shNzgZIKGB12J1zmXeSG5TE3FbVuLgRpxn6y0LXDgk7e7BF3PXFkEHU5kaBhCgoXme7N
	d1rVy/MtQA8IjOFzRkoghg8OsMipTzb/9Qpy8MFTAhZmU8K9xsX0UvX6DBW+w7G7KP44NvjQbHM
	MD
X-Google-Smtp-Source: AGHT+IG4FlcGi/wOo69sC2Pm9CFSiAvBbYs3J5E8v+fSFIVDOSvV+u7bxUEp/X57L1pyzs7oc/+Fww==
X-Received: by 2002:a05:620a:3723:b0:823:e0a3:20c2 with SMTP id af79cd13be357-83ba2e800efmr99290085a.2.1758222985341;
        Thu, 18 Sep 2025 12:16:25 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83626595d3csm213983685a.6.2025.09.18.12.16.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 12:16:24 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] glib-2.0: double test runner timeout in run-ptest
Date: Thu, 18 Sep 2025 15:16:22 -0400
Message-ID: <20250918191622.3206760-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 19:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223657

The gnome-desktop-testing-runner has a default timeout of 300s. With
qemuriscv64, some tests in the glib-2.0 test suite (notably
codegen.py.test and gi-compile-repository.py.test) can take a long time
and exceed this timeout limit, resulting in intermittent test failures.
To avoid this problem, double the timeout by passing '-t 600' to
gnome-desktop-testing-runner.

Although not a perfect comparison (I have to use 'taskset --cpu-list 0'
to simulate loading in order to make the tests fail consistently on my
local machine), it's worth noting that the timeout increase does result
in a slightly longer test run. Here is an example of the duration when a
failure happens under 'taskset --cpu-list 0 runqemu nographic snapshot'::

|SUMMARY: total=298; passed=296; skipped=1; failed=1; user=606.7s; system=1388.3s; maxrss=170976
|FAIL: glib/codegen.py.test (Child process killed by signal 9)
|
|ERROR: Exit status is 2
|DURATION: 1368
|END: /usr/lib/glib-2.0/ptest
|2025-09-18T19:04
|STOP: ptest-runner
|TOTAL: 1 FAIL: 1

and a pass:

|SUMMARY: total=298; passed=297; skipped=1; failed=0; user=682.2s; system=1295.0s; maxrss=170476
|+ userdel glib2-test
|DURATION: 1402
|END: /usr/lib/glib-2.0/ptest
|2025-09-18T17:23
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

[YOCTO #15891]

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-core/glib-2.0/files/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/files/run-ptest b/meta/recipes-core/glib-2.0/files/run-ptest
index 831bc3b91f..8af5b09e85 100644
--- a/meta/recipes-core/glib-2.0/files/run-ptest
+++ b/meta/recipes-core/glib-2.0/files/run-ptest
@@ -6,5 +6,5 @@ if id -u glib2-test; then
 fi
 useradd glib2-test
 cd /tmp
-su glib2-test -c 'G_TEST_TMPDIR=`readlink -f /tmp` gnome-desktop-testing-runner glib'
+su glib2-test -c 'G_TEST_TMPDIR=`readlink -f /tmp` gnome-desktop-testing-runner -t 600 glib'
 userdel glib2-test
-- 
2.51.0


