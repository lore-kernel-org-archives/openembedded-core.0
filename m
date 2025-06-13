Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C97C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 05:45:38 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.3368.1749793528364430154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 22:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RGqLvJ8x;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so1477707a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749793527; x=1750398327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXLMFDBmV/Hw7QROb7QwkAUCad2c7l0qgxZ1Ohiktbo=;
        b=RGqLvJ8xWHXmAKzgteXBLiMNAp37YT0J1+6S637Ufk2BzaaskcslfC81NUe65z5shQ
         iMuD1LpOloX3GDq5TabCjiLnD8ukqrMFnEo2RtcP5WJb14o0dpsGX5iffZo+3K+8p2Vm
         845U9//Btq03s+ygw4r+1SsbvCmBHQzHiQ0G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793527; x=1750398327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXLMFDBmV/Hw7QROb7QwkAUCad2c7l0qgxZ1Ohiktbo=;
        b=n8tj9xgNwqgp85AoTfigTCDt6hNF15bsoTJAjBHBHPrcxfmdHNLSwGcVoONUJnoQUc
         iUXAVYiw1j99CoQMAeYQipT6aNarAQSrzhuMDVPdwlpIyHCMxr7o+G1axFAL48jw5GL2
         wmgMD4lAxyHGZfR16DSPpTJ+D7QWOxooyipMURbSsjptfrj4ZkkeLZWky2fddAdE2SAx
         ohGOERpqUKcIJ0LBCc5i6azyryzC/WlmutbAtD0+i24d0ldJUKwtwyOP/sArZAP8WvOY
         ufxDS7kzItE2HR9wOrPGfEEcIiVtQjs1bO8LhnCRUVLHMN1LaCdKoyJGA7XkSgN1Kwrr
         yN0Q==
X-Gm-Message-State: AOJu0YxQmfo17wjE52GMRPG6X4CA1D2jnb42lh5JoROh+QUWD5+Rop7y
	U5TvwI5coYZr+roremvAi5mhIuEmQudjh+XEnHb3te0M9N2X2i17xEaysNa0tECJ0KF4ykEiChI
	/2cmM
X-Gm-Gg: ASbGncvSqFntorg619+GWdDPAK1EZDAkb2VlsqPhn/M37fGUaUgF4wL+RgWE9peY+TZ
	3YPvHGuON4UBUempsqLW1w1jKUkX6+RUvrbAlaDdY5UVQfEXKciGy2DkPIj+kO68sphXJKb6Bxx
	UD6Xgl2xggQFCM6/f6PS1Kdcdoomnqn2KKrAOUqHAo+EBzGhu5+saIs5V7F1TKuY2uqG2x4GGm8
	ntKQKxZZxWyqOZn+dt5JDusoakUp7BX6wSED73InqeO7huhiFrwErhSXRq4IGla+y2f/Ic12NJe
	VqU6F7wkeU5d25qPlXb6TxjIU7gyHyvUjlnsl/gOwAiOaKDopP57DPj27RtR60CfbuRLNZW1
X-Google-Smtp-Source: AGHT+IE835wBW7X/GegoDjPweVEemjLCGzHTXDSRBbTC2Akmrj23em+q7K8/YCMOCTfC7kFSOG7rHA==
X-Received: by 2002:a05:6a20:748c:b0:21f:a883:d1dd with SMTP id adf61e73a8af0-21facbdebf9mr2351259637.14.1749793527229;
        Thu, 12 Jun 2025 22:45:27 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.197.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ad24csm764910b3a.109.2025.06.12.22.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:45:26 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 6/9] libsoup: Fix CVE-2025-32052
Date: Fri, 13 Jun 2025 11:14:51 +0530
Message-Id: <20250613054454.112590-6-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250613054454.112590-1-vanusuri@mvista.com>
References: <20250613054454.112590-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218581

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup/CVE-2025-32052.patch      | 30 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32052.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32052.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32052.patch
new file mode 100644
index 0000000000..fca43e24ac
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32052.patch
@@ -0,0 +1,30 @@
+From f182429e5b1fc034050510da20c93256c4fa9652 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sat, 16 Nov 2024 12:07:30 -0600
+Subject: [PATCH] Fix heap buffer overflow in soup_content_sniffer_sniff
+
+Co-Author: Ar Jun <pkillarjun@protonmail.com>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652]
+CVE: CVE-2025-32052
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index de0985eac..b62e48889 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -524,7 +524,7 @@ sniff_unknown (SoupContentSniffer *sniffer, GBytes *buffer,
+ 			guint index_pattern = 0;
+ 			gboolean skip_row = FALSE;
+ 
+-			while ((index_stream < resource_length) &&
++			while ((index_stream < resource_length - 1) &&
+ 			       (index_pattern <= type_row->pattern_length)) {
+ 				/* Skip insignificant white space ("WS" in the spec) */
+ 				if (type_row->pattern[index_pattern] == ' ') {
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 27aab1468f..26fe52937b 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -33,6 +33,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784-1.patch \
            file://CVE-2025-2784-2.patch \
            file://CVE-2025-32050.patch \
+           file://CVE-2025-32052.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.25.1


