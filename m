Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2A9C44525
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 08:33:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4617.1784536384726414823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 01:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MrtyUANd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f75f7172so76964545e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 01:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784536383; x=1785141183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFhyCqQHq4Ow78bKksA7uGFCRzTb3RCpBMTW9uPBDkY=;
        b=MrtyUANdbI7ZVSNpb49hnBP6DAfNV/feSYOaNwGLo9qSuZ6QNWGezPmQ2l6c4gFq5f
         gablb+gsfVW+Zw7gS0DZZAaYP9NxPAmajfffF9GvIJvVDdxBQmbJXfgxrjqj3LLn0Gwx
         E5gKFWoMCtLDU1GMNdox008b4vOTCbIscfQQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536383; x=1785141183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RFhyCqQHq4Ow78bKksA7uGFCRzTb3RCpBMTW9uPBDkY=;
        b=YyM3zEBDWSif1RgDq6Ogfd8gk+UU4iKr61/M8ywQlYJXfdZb4ZyJq9obIFXgoH3J3N
         n7zfvdI6ZtjHR8T53xZQyLo8vqPSIH/Pn0MidisYeBiwErRwx3I6tMeqZflvGh+mX48A
         aq3bL7ikXjiDoe8AAtfZgxDZMTBgE9P4NE4uqle36LJiTJDkwnrI7jy2f7J06r+tPLYy
         cNjg82PT24ItXaLdsW3YAoO3QbxEbqXzd23jL+VzCCsCQQshp1JA3zidLmK6qeVh5G7C
         AfpvNEN2dzUg2JHTqcIWQ6pZtS2Dm8heXL3CoGaTxoRjvoIKXOMV8McOu55MJUeSdux/
         qYzQ==
X-Gm-Message-State: AOJu0YwzPvyz6MubX7I/POM9kaqRwI2jgTc2kLHUOI6hW/9Duy+Fb4Ls
	+CxqDs6grpFyXDupN2cA18pDRrGRUpkxCvAteg0+LTSrTeYBwQmD4ik+ZFxxVSn6scZdwL3nFty
	tMbOK/MU=
X-Gm-Gg: AfdE7cmhLDOM983tl4aIhwG80RCgc9ZeW/vWDHzdQKd+Z1xB77Q1sG5/Zl1nv6RO1vi
	t8EZgZU5VB6VSbCsGOBeStIKPJmKNWnzQoBKuanqRJeBTk+jr0V9ezc+me+tQaii+nHFkCaSG3A
	9QzE1aNqwMabOU4MaBPx6eFUhigpJ9LFlRljtugtB40Q2WzIBo7y2SGFUiTK7N23XbHnPSUCkge
	KyYMqISJFxr8uSjqD4gJnQn1JBrX2JOlezsQH9vQRKY0UpZZtHK+1cOWcWtCoX/lHB2WnEOjPhR
	XGmXpud8baKmT6YAyFdNwTf49uivSzhb5yV6O/eOK4DtFkjntmzj0PKzbOIORUpwzQoY8L3Q2nv
	SPaBDPI29hAPfH4P0ayP8MdGJpyBxn+0t/oeU1W2HP8BYY973qaCpKYqdljqUmiNxOrUtYFV5ig
	4J2QWrH0WH5G9j6j3TO0tQQZfjt6B4lZc=
X-Received: by 2002:a05:600c:81b:b0:493:df1d:7488 with SMTP id 5b1f17b1804b1-4954a3f1611mr91482445e9.16.1784536382746;
        Mon, 20 Jul 2026 01:33:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f231:f082:3d95:2084])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2aa698sm241732125e9.4.2026.07.20.01.32.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:33:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] diffoscope: upgrade 324 -> 325
Date: Mon, 20 Jul 2026 09:32:54 +0100
Message-ID: <20260720083258.770582-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241341

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_324.bb => diffoscope_325.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_324.bb => diffoscope_325.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_324.bb b/meta/recipes-support/diffoscope/diffoscope_325.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_324.bb
rename to meta/recipes-support/diffoscope/diffoscope_325.bb
index 822446e9857..521b2b5b04d 100644
--- a/meta/recipes-support/diffoscope/diffoscope_324.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_325.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "daf539d33140ecd4c5dcf18c894bbc09aeab5307b44de28b12ca34434d47c5ba"
+SRC_URI[sha256sum] = "d74a2edb0555a9ee306d5362b921f80c144bb941c0a6d61794473d1540d729ad"
 
 RDEPENDS:${PN} += "\
         binutils \

