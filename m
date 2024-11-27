Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81106D5A6D8
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:12:17 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.64892.1732680734033597200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=13U5pGTv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-724f74d6457so3683164b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680733; x=1733285533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYPIUGXNHlKBtU0DlTzXV0RGuclt6W53R1WMtbTtnyk=;
        b=13U5pGTvln7PqQfQxZ27Uv5KvSGiXhS4/1NbPWuREoxzI2A2TgaXxLxid9y5cfASa2
         pAq8cSJhojpGAYvoQnSyybiIBNcacnY5h9ySOb+apdA+5tTz1VZsYAc86PzGKlKH6yNm
         UuWQshpiZ5S51JHdhV2q1tbirdyFRGl4BpXSK5Ld/B64GrorEAWwTG6oAyQSt/eswlsb
         BJpo9l1ckbcccO2RtsmqnjUYRU3DQ6ZTbA6G+BzS/pWTr/63Iio7AKhDV1hvG198GC5+
         yNRmqIs8owlZhLwnoy3YHaWx5/Ngqcd2bs1a4hjc+DW9TVqL0mT9+8a+X7tVx0gVRiNn
         Xuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680733; x=1733285533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYPIUGXNHlKBtU0DlTzXV0RGuclt6W53R1WMtbTtnyk=;
        b=XfHIAh60JUKXmzH1hkHlWfYwDSIq4iGgW2POKLHWkZoHbDEzGa+1XvNZkKuu44bU3q
         9r3k0qTQyrHx99WQFhwj/SWjiA8iLckcI3zQNvzUvojOaP2P5n2qlSKG7HuEMDQ6NMVX
         OnMqZDL3bg7arZA2gsVdiCQBWzX0DN+XhYki8mfU72/tZkYqWXV61zQEwiDWp+/ARX7l
         F9PsNFNH6RNgE5OpkhHrasb0NgNwlenZ+RWPZFTGIuSWSpQpZXtpM6QbkilEl+1Ds0Ow
         v9X+TvgdeCqOMiPcltf0nTrI2uqdxZgbCP7ZrxjyHYIaHtvAs1S6TFdSlBqi0T1Aqej8
         55cg==
X-Gm-Message-State: AOJu0YxGC4KlNZ12kJK8tCXFuOPJNj1zL308ptwyJdLDt6bM2wvcrucc
	zzy6Mvz33iM3KwHQbl4yULSXzThMOWReWy1te7heVshlPnddYwXE6cOuxYW0BBQQQlUuPC6ukwI
	Q
X-Gm-Gg: ASbGnctOjDyuvtwF8/xQexY1EPyHSBNm9FQZq7gJtcWHFUMjeHpD2kShCyFVhh0eYph
	iu2NiDbqJbWNxUARwxYfdC19zM/CWyOHv5HYBIOZJxK0YoeJb/1+ar1us8N0Ep7aWsdBhaUkln1
	Y1viXYbUIvwvYD7uB+If7S1Q5jf6slvRembNSKOGnCKMs6XXeg4BtMxTHW8CTN2Pob2wVYN8mvn
	BvG21iWmNQ8O9z4EoJX5kApGVP7VJ1UgMEZs08=
X-Google-Smtp-Source: AGHT+IFmzDqslajGgAftfh94yy9C1qNcCsWSrtj9fQUK2EVUznR6jHoqDtWCQmDvj25n+TZz/PrR3Q==
X-Received: by 2002:a05:6a00:1887:b0:724:591e:ea20 with SMTP id d2e1a72fcca58-7253009a6e0mr2204241b3a.14.1732680733235;
        Tue, 26 Nov 2024 20:12:13 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.12.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:12:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 14/18] selftest/sstatetests: run CDN mirror check only once
Date: Tue, 26 Nov 2024 20:11:34 -0800
Message-Id: <6ffde2643e6ee8a2a0eddca173a254dbdc4a79bb.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207908

From: Alexander Kanavin <alex@linutronix.de>

The first no-fail check was an attempt to work around the old
CDN's instability (and it didn't really help); it should not be necessary
with the new CDN, and only delays a-full completion.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7f75c42b7fcf60a9ca58d3ded9047df675d76dc2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index faaf7f6b0c..fa0172dd6d 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -978,12 +978,10 @@ MACHINE = "{}"
 
     def test_cdn_mirror_qemux86_64(self):
         exceptions = []
-        self.run_test("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions, ignore_errors = True)
         self.run_test("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
 
     def test_cdn_mirror_qemuarm64(self):
         exceptions = []
-        self.run_test("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions, ignore_errors = True)
         self.run_test("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
 
     def test_local_cache_qemux86_64(self):
-- 
2.34.1


