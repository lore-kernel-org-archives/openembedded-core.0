Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C34E7BDBC
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 13:34:22 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19553.1771248854414619402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 05:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMjuJamb;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso4057455e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771248853; x=1771853653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnBRM9i6jCowhwqwrm2As4pFlhqz3l+YLt8P6rzk/Xw=;
        b=nMjuJambU/ELaYPvNATMhqtk5CFdQjKA4yQW/bVIg2IXBCI1Ud3tQxwgM1m8EP01FP
         YZyxlKIbzmX1hBv5cGWEo6i944OJ1Ea1/No+Cbm9v0lCshf7gi8aT04g7DtbpXvd/L52
         ZoK0OWa8S4oxBhZcscZdHK631D7hRCr7buyUExgbG/GW4TGs0CEtrR7nTxWNbTg6fC0V
         qTfSJ92LuEo++TTctO30SQXJ1Tq9WEpAsbn31FPIJhC83zksR8dcpR6l1GkW49Sr3K+x
         UWlOfjDFJ3KXIQ2VWBlgfzJlF0klwshxn9Sod6llN5FBwx7w0B+D6vpfgiv5pqOBJLHU
         pnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771248853; x=1771853653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WnBRM9i6jCowhwqwrm2As4pFlhqz3l+YLt8P6rzk/Xw=;
        b=XPrcgFnaDf9efEogZD0oLr/mUsEqID5XL3ipxi4F/ZjfWyIpmh5tLFmAmrgF+lJsEw
         Q0HW75n/AHKxzEkAs2w+piWv6pMPn0N7B7BYOK4JhFDVGx56RYpgQgsiOX6O2DjmQ44s
         jd8rcIOMLdcaWi3Pz9K14Nl4BmW1uYulG/IvibgryB4a0BmtSIC0QKbWHnhq1KpnGEP6
         x/HNzt8YwC/Sofi2eR29PyTRkSlm+M3PJbcTIScml7p4IKPHVzI9hpwnEWWkKv+e0lxf
         V6K6woLBsAZce13tXaSjF1C9QBsNbcNHgC50Q+KSoZz8PWgMmt+gpry5LC1JIt9JW3jL
         J+RQ==
X-Gm-Message-State: AOJu0YwS+B+KjhBH8Q0OksKKGTShB6Dl+rKhr0xTxXESdZGp/1CxXDuE
	6K3RA40h3GQZ69rRmboLm2Brz9olc3klo0Mh+aht7THDTvVrlkTAo83laRmUVg==
X-Gm-Gg: AZuq6aJa4GLVlnHZoth4E+6CqKLllwSIFO2vIEAKYxBS4kOY/3eU0LSjEaXfsEz6Xz/
	v47L4QF9ZjoM2Q8XRKOt0obdqxcX/P2ZUqtxQHXHVRFUd0QRNGGBjlPVSnid1o80ShRFjjMW8D1
	QeTksOmQRUq+IFF9XEktjmBnpaen4llqoDB1z2rXw8c00j6oHbhGXaYDoV89VBCd3E+OyDq79W7
	gAnVnO1RaIs+R8zf1yRbgbyyeDGkPDwbnmueUD4O/pl9ljEEqIVcJTstwmRlhk20fP8k0Plp1o+
	AkXho7BHqCE2iZ5M7JYYx1F/KRIPR0BvzLyTWHawyvSpbxX2eMIZpRooLFxDL5/JDZM8FtEECFQ
	A/jXROec8H7cWO3wC2vTNk9WwtG1LN50e+v5w/vpN+dVVCRkRRBeqmdEHJ9uQz3+/bhq1cvJ6At
	MU8V2Gh6oLwvZuUUrmXlObgJFNCxn5WVApWxj4FdZ3BdInP/tPjRhslEndB0G0NM8fPMk3bA==
X-Received: by 2002:a05:600c:c3dc:20b0:483:7631:befa with SMTP id 5b1f17b1804b1-4837631c7c9mr135937605e9.5.1771248852655;
        Mon, 16 Feb 2026 05:34:12 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm340037485e9.4.2026.02.16.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:34:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/5] time64.inc: add links to "Y2038 in Yocto" slides and video
Date: Mon, 16 Feb 2026 14:33:51 +0100
Message-ID: <20260216133351.1034740-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216133351.1034740-1-alex.kanavin@gmail.com>
References: <20260216133351.1034740-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 13:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231202

From: Alexander Kanavin <alex@linutronix.de>

I'm not sure if placing conference slides and video links
here is okay, but I believe this is the best starting point
for anyone dealing with the Y2038 problem. It will help and
provide important context and action points for those needing
to support 32 bit products beyond Y2038.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/time64.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 5a2a3fbe81..19177b1f3c 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -1,3 +1,8 @@
+# An overview of Y2038 issues, and how to prepare a yocto-based
+# product for that date is available at
+# https://www.youtube.com/watch?v=eaOHJHFMobw
+# https://osseu2024.sched.com/event/1ej4C/
+#
 # To simulate Y2038 occurring in qemu, add to your build configuration:
 # QB_OPT_APPEND:append = " -rtc base=2040-02-02"
 #
-- 
2.47.3


