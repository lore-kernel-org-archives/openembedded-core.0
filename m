Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CA1C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 13:40:13 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.11810.1633614012830406669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 06:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FOm3Z52/;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id np13so4882273pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 06:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7EzWhLlJtptg3bjPtwIlr8NwKzHBUqkpUvJaJ+7EWTk=;
        b=FOm3Z52/uBWirpIPM5hf0KhwTHuZ7dac7cn1XRg0a6sqr6BbjevAzpxZcGx24TaZJf
         T2u7nD1jUC09WwGU+/Rh311FJIPyqEZczb9/XeHYEALo24WbmMf7gsSiObkO7pduI05s
         Ht1M/x3PGiKqJTx1GMSVbmTjM2ovVWmdGwXi46LjcqpQGrjdEJivdyrxsI077NXvOVOo
         qpEzygylux/ZUPxa5S5tNUMjWCo9PvM3alMxjv5A3MyvcfA3eY6AyxkAdNSleTJ+jWdW
         9ZFzejINzweAVUrHrQ8kx39ZZc+B15Zw02n9b3xkAveFZbXG7ae8rBFpuWrKb5N13gkA
         aWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7EzWhLlJtptg3bjPtwIlr8NwKzHBUqkpUvJaJ+7EWTk=;
        b=11HJlTK3ehWj/uBbv/nHukS861J2v+dOdPJlGUv5POVAvdNUB4zqVDBIGk3APNIjxk
         YsM/8uCO6Di4f6xqodUdhMmmrCygICVDRHc6/RNrOX0NwttR+Lb0Lkyu/p3+RRZfoa2v
         CjuziOW39tiRWPYxVvT+0rtjlZ72dcWX/NUPk0NthqdUUHeLW94l2bPH06Xhmruyu/xt
         fboNhweHGKwRnEC/QnqYteFTDMeAKAqKleSqBdvoc+OWx0BW1t+rq31AYhAsCsBpRcDk
         27bUg3+t/0/gCAm8W7wS2yWSLq17v1wRPe7E7ydiCxT40RVGFriTgN4+ic9Z4pVrbjyK
         2Mvw==
X-Gm-Message-State: AOAM533nY24VAVphD0Rq/GwnhwcQxMWGJfMriV+JfB32kLuxWWUAfJ6I
	l4Z8ybJzv0T4gPuby7y7SmdO/3jNUig=
X-Google-Smtp-Source: 
 ABdhPJyiGYX254Acyyvuf6l3HPDpwsANudjjHMZrcQwogwLLAzJagtJWoBaTfO5V3JRwgk+wXRb6XQ==
X-Received: by 2002:a17:90a:a386:: with SMTP id
 x6mr4911263pjp.56.1633614012041;
        Thu, 07 Oct 2021 06:40:12 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:502d:3224:84af:26a8:4c79:8890])
        by smtp.gmail.com with ESMTPSA id
 r7sm24087062pff.112.2021.10.07.06.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:40:11 -0700 (PDT)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [meta-oe][dunfell][PATCH 2/3] dovecot: Fix CVE-2020-12673
Date: Thu,  7 Oct 2021 19:09:20 +0530
Message-Id: <20211007133921.3753-2-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211007133921.3753-1-sanakazisk19@gmail.com>
References: <20211007133921.3753-1-sanakazisk19@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 13:40:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156723

Added patch for CVE-2020-12673

Link: http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 ...tlm-Check-buffer-length-on-responses.patch | 37 +++++++++++++++++++
 .../dovecot/dovecot_2.2.36.4.bb               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0002-lib-ntlm-Check-buffer-length-on-responses.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0002-lib-ntlm-Check-buffer-length-on-responses.patch b/meta-networking/recipes-support/dovecot/dovecot/0002-lib-ntlm-Check-buffer-length-on-responses.patch
new file mode 100644
index 000000000..81aead8aa
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0002-lib-ntlm-Check-buffer-length-on-responses.patch
@@ -0,0 +1,37 @@
+Backport of:
+
+From 1c6405d3026e5ceae3d214d63945bba85251af4c Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Mon, 18 May 2020 12:33:39 +0300
+Subject: [PATCH 2/3] lib-ntlm: Check buffer length on responses
+
+Add missing check for buffer length.
+
+If this is not checked, it is possible to send message which
+causes read past buffer bug.
+
+Broken in c7480644202e5451fbed448508ea29a25cffc99c
+---
+ src/lib-ntlm/ntlm-message.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12673
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+--- a/src/lib-ntlm/ntlm-message.c
++++ b/src/lib-ntlm/ntlm-message.c
+@@ -184,6 +184,11 @@ static int ntlmssp_check_buffer(const st
+ 	if (length == 0 && space == 0)
+ 		return 1;
+ 
++	if (length > data_size) {
++		*error = "buffer length out of bounds";
++		return 0;
++	}
++
+ 	if (offset >= data_size) {
+ 		*error = "buffer offset out of bounds";
+ 		return 0;
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
index 407604c81..e36e51c28 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch \
            file://0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch \
            file://buffer_free_fix.patch \
+           file://0002-lib-ntlm-Check-buffer-length-on-responses.patch \
            "
 
 SRC_URI[md5sum] = "66c4d71858b214afee5b390ee602dee2"
-- 
2.17.1


