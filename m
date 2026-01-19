Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48F5CCF2F6
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 12:47:50 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34429.1768826860515262385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 04:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D1L/AiVM;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b876c0d5318so577378066b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 04:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768826859; x=1769431659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JR1Nup3uKXLbbYBFij4MgeeQ9KAKlkvr4vqFZmJ5Axs=;
        b=D1L/AiVMDPiKg7nKVUaEf/1hZxVykYRXGKw10uzFbS41UokwRQRLwulAIKb1wjN/zY
         4ZOOq5BMp7rIPlSLCucwpwZL7vNtD99zjbIrA0vRtIIw3XsVOMSjytrCUR2SFp6ejIYc
         3bAUVlCnJFlbQx57E/H/srz8hMOOZgQC5UCBm0VXii8TK+vQUC0rT5WPqcgyJryU7YNp
         KQRQLrhEHZkMOiZcwr3+hsK3SU3fEw63sFVA3Xojn9iawb+sr/jBbrIFrIqb/dLMJX9X
         ImRltyYb8KADcIgfB++644KRkO7tfNhyV683h/St72nh/7iwZGIzf0YnJSoXqlGJFlMr
         DRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826859; x=1769431659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JR1Nup3uKXLbbYBFij4MgeeQ9KAKlkvr4vqFZmJ5Axs=;
        b=GwiRFvNjBNSBSTw0LZotmpAm6j2eZBPYChOAVVFUEpiKXEsIy+uurP+6u4WGbSxyHc
         VJvq4uBIzZykz/Geo8ZKEWDPMP2v2zodenjLwxMuJKfvCnakMgVCpwWq1FXcACxcdb5B
         1HQpwr38qzLE2c/gcN8x8ffJQSt9vw9IHL2Mc3FMkb3ff+kYhigMzT/sej2iz/rQd/VV
         YvEAneQxB3RluB+21CBnC1bVqeTHFOYke3esG5wUZEQGGYd+8kNoDJPZR2/Ph4p6ZCzb
         S4Qvad0/yqQ7scTfae8OPJNrqAAF1FP9oJpKs5zjenjEoRFJ/h07RWeh4qVHyoTmLN9w
         US+A==
X-Gm-Message-State: AOJu0Yz1SCyIWgtBZZex9Ebx+EBREQOgqeb+RnshcWMhmthc5vL0qqmn
	KMqmcLzT3hRP4O7AkE4ljjXyqTjE9lXhw1YdB9F4+ceGJ1B7gRxijxwRFfAf2w==
X-Gm-Gg: AY/fxX65ETzUCTTSlmMQ4KPzuyh08et5RSDiPGaJrOOFFYU4E6Cz1BTqIkfmXE5cvwX
	MHtZwte1Wwt5RKmVjsbAAkSLWQd6/dIFGX+57AxEKD0ZBunrKwusToSEAb2vqTzGPzGFvEqzBXo
	8NG51JnI+n7GRg5WEhca/P6JXvG6iRlAHzgxrGjyPqk8maDdN2Hi0fk5rK89g9Y/4rPFh6B5ugT
	m5WVrmhOd/YOJGmhJqXx/guY2gj0Mtox0vIjGau/a4ymK9mWj9t55sr7Rm/MJuMO92ZwKfdlDTA
	qi1bCVytJ8nuuZoWOZIpBc2PtOOt+WnYspkYGQR+3bzJPiNtS0f8s5qaornpuT+oxatxzokxKMK
	5gTKrfmjzOmhMTZpnoZxsLRCF9tnL6a0aRpEFM8La31RAF8qjLRjz9WsaDWWXF7+pbS7Ycg5J/R
	Wk6C+QFujaulbTS51KbRXSTblnMHKy9qj9PUdbN2lLOMv9wiRJ9hqu5xmxVydRncJTN9P+gX/iW
	tYEMuxOtHn1XIWT
X-Received: by 2002:a17:907:74e:b0:b87:2579:b6cf with SMTP id a640c23a62f3a-b8792fc4376mr1022945466b.41.1768826858143;
        Mon, 19 Jan 2026 04:47:38 -0800 (PST)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1077854766b.52.2026.01.19.04.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:47:37 -0800 (PST)
From: max.oss.09@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v1] alsa-utils: fix install package alsa-utils
Date: Mon, 19 Jan 2026 13:47:22 +0100
Message-ID: <20260119124722.646039-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 12:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229614

From: Max Krummenacher <max.krummenacher@toradex.com>

The recent move to using dynamically split packages created a regression.

Some of the dynamically split packages are empty as the files
dynamically adding the package are packaged through explicit FILES_*
into some other package.
This then breaks the meta package alsa-utils which RDEPENDS on the
not existing empty packages.

Empty packages:
alsa-utils-alsabat-test, alsa-utils-aplaymidi, alsa-utils-aplaymidi2,
alsa-utils-arecordmidi, alsa-utils-arecordmidi2, alsa-utils-axfer

Change the RDEPENDS of alsa-utils to RRECOMMENDS to work around the issue.

Fixes do_rootfs when IMAGE_INSTALL contains alsa-utils:
  - nothing provides alsa-utils-aplaymidi needed by alsa-utils-1.2.15.1-r0.armv7at2hf-neon

Fixes: 26a28ee79350 ("alsa-utils: dynamically split the packages instead of doing it manually")
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
index 927f94afb654..1ed4d9c4b54a 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
@@ -70,7 +70,7 @@ python populate_packages:prepend() {
     pn = d.getVar("PN")
     packages = do_split_packages(d, d.getVar("bindir"), r"^([^.]+).*$", pn + "-%s", "alsa-utils tool %s", extra_depends="")
     packages += do_split_packages(d, d.getVar("sbindir"), r"^([^.]+).*$", pn + "-%s", "alsa-utils tool %s", extra_depends="")
-    d.setVar("RDEPENDS:" + pn, " ".join(packages))
+    d.setVar("RRECOMMENDS:" + pn, " ".join(packages))
 }
 
 PACKAGES_DYNAMIC = "^${PN}-.*"
-- 
2.42.0


