Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7456FC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 12:43:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.10296.1661344972407004727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 05:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KsVYU+rp;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id b5so16339714wrr.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/8r3jBImqz0D/Aowb+SP4i1qF+5cbC7qZlarbbO0z+Y=;
        b=KsVYU+rpYGvEz4ouw3rpzgn0hPJ/umK3R64wl64BSVcixwvMcAGJjUmMJRUOnv78BG
         ErCJy1L60VC66VKC0eEaSYXWw9ZSFP24qEbdJwQ4BMRdNIPn3QEqt9sl0hUmW/Gv0cvG
         Hvgm9t4zhRvuSVhOslArr0cODI1/L93m68JZRfs+47I25ZeVCqfjvfxzIq40xriQZx//
         KgyXRHzf5d699qEUAqg6abvl6qKkGDTy/ZXHwbfr9zuRtc/lZyPeJLXb0I9j5W4P1KHF
         npvsJtDdWqev2xt/QOhLd9KbsTo9WGrbqcYWhrg2wIDMWNt7MKQO+OwTMyl7w0KDIf0e
         hzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/8r3jBImqz0D/Aowb+SP4i1qF+5cbC7qZlarbbO0z+Y=;
        b=Dwu1jdCgEUw1WpXoLGj3YFSX3iXyCls3pVBhwJAnwIh6nkaZiS76Shm0X1PUzsYiJo
         poom15ZKQS/aCErzb9vo6ZjqPUpIkTcO9I4ueRG5DC5n5XQ/qJyM+YzYR2p+oST73mMb
         h2YT66kgltKKvvaS8FbVeFY68I9Pf6e4A+AirWnHOv6QPMTLpZwoCbms9W1IBugWtkdl
         Xx4t4FO/Tbv4A+BGmHhEN293r5LgFIUG/XIanA32H0r4Z1yhS0qSRkNaBYqizOkPyRh+
         usnHn92nz3G+Bj9hIzqtxhtT+yP7X2I5Ku+mzoOTAXQkiQiyNOWeA1n8wnqd7lT1kxn2
         YMhA==
X-Gm-Message-State: ACgBeo1wf1BITzF5KI7wB+nI2uyR8a6IG5xHl3Ra8iLmMJ0XGKzZs8Tc
	uPH7PoLoSSnjqtYqKh0hK0L2e4cTC6U=
X-Google-Smtp-Source: 
 AA6agR4d7SIqoB7LwlzDiuS/JBm+vV5jT4Js67XlZ8A95NmVIjTTBXkaRRkebEgWaBnLvKbCilTfzA==
X-Received: by 2002:adf:df84:0:b0:225:5687:1f56 with SMTP id
 z4-20020adfdf84000000b0022556871f56mr8625908wrl.96.1661344970826;
        Wed, 24 Aug 2022 05:42:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003a32297598csm1778628wml.43.2022.08.24.05.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 05:42:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] scripts/oe-setup-builddir: add a check that TEMPLATECONF
 is valid
Date: Wed, 24 Aug 2022 14:42:34 +0200
Message-Id: <20220824124234.3549247-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220824124234.3549247-1-alex@linutronix.de>
References: <20220824124234.3549247-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 12:43:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169811

specifically that ../../layer.conf exists, and that second-from-last
component in the path is 'templates'.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 975619789a..db26e3b138 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -61,6 +61,11 @@ if [ -n "$TEMPLATECONF" ]; then
             echo >&2 "Error: TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
             exit 1
         fi
+        templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
+        if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir != "templates" ]; then
+            echo >&2 "Error: TEMPLATECONF value must point to meta-some-layer/conf/templates/template-name"
+            exit 1
+        fi
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
-- 
2.30.2


