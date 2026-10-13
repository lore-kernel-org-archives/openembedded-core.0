Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1724ACC6B0F
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:50:00 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4138.1791888593430647341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VwCdGmUP;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1af482519so3040025e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888592; x=1792493392; darn=lists.openembedded.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AK/uWSjjtGdavCBo8VsVKJZZtIeP0KmAsZabSknCgBs=;
        b=VwCdGmUPrYIMoF9E5VTsEfBe0lFon0Ib0swSEBOP3Cqd8nFS9EMB+jnh2jynWjkVQ5
         zO9dgMavlEbsnj0++vh8gxlRs3FH18a+zRMqGQNMtzSKjK2CloeROLs456M/TweXgCcw
         fdCekAzGSeMvgeHvgJ1wh9CPqQ/Jo+IOITPlesd+wfdDjsqsRa7sFeKCL6ky5QEYG36O
         VpytwZgNxehVntSdl8rPeljkALPNcuR4EOdZ73HfCD/ULnZJrZ83po9gwyxPtoEyF2a/
         Cas/CrGJJ78laxJCM954j0ev/h08EvBrnZxKFvWyTmTEC+w3xniLYi0an5GLuDjGFig+
         b7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888592; x=1792493392;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AK/uWSjjtGdavCBo8VsVKJZZtIeP0KmAsZabSknCgBs=;
        b=hblVUTTFXkLTvFjtJLBSLyH8qeg0myilFfuDSwgG0TnpRb8+awJlPnsKztTWBpjhMF
         59U0kPZ217fzz04FIe+s0RDZW6kJzKbwH8bwCHRNvoN/i/wp6pIgatdElhxzCQzcbdkX
         n3e2sSJakJZ9PdVhcWMEFQrJ4HdUf7zNaA8hC/uBoCt/xdey5v4TW8GREJHdEAnkDGRX
         Hg8XrKdL6rP1oQCCBJ4zkRsL3iEDsZy8gZ77PEXXV9LJ0GbMHmY5KdgNVZt5g43lhjp5
         Otl6C+KK5XDCeHEVoVVgiIPgwrNU1BlFDk4RJy27arEKVMZo8QS1WOgCvvMpD4zsZHWN
         w95g==
X-Gm-Message-State: AFq9FYKJJNmz5Eki/lUKLnKk9NfYdmAouLEuEV8aR4SuDRre16zbO1Nn
	IUAMDqVBICmkPWMkOKN9ezwNQS3VxaI95NCTaL3/mgAp6Ajq7vGaampYWqbq3w==
X-Gm-Gg: AYBFou1M4cwIPh9kjfZzq73jI3ISG3tbhxfqxmbEHhipfBqcPrVECmhGRPAoniDzIOZ
	qzn1GiYHI9HN2IWj7znOFrp+TsADU69xfA9aQwKvY+Uj5W/knSzvFAnLFNNKvDUUkBur2gymM8p
	9SX7oulpdrJvuId1Tp1mnKHtzzGWYFMajSvPrZOjL+c1FBwgrfswazO64c/sSPKKtzgn8gAdkjR
	8ia9HuLoV7knINXgDw9QzCo822fg1pcW8cnkLjiL/4zXlbbch3yc7EfTt0ocOB/Hva8v325o8Me
	+yIIcPOSp6YZQTCi3S/jwmwY6v18tCgW9+CFKvVvEqKgvETkUHHdjix9HyZ85WJQ0FVF60UlL+2
	IFJk0AonqxcvB66kiAkwAkhELEJNwi82vnTDHElrHLlSc+nyYrkyfX9RXRrI1TajRkKZjrrRT5E
	4Ayju5s1hmV6Zmnbj+8Go1GPGyhYllnzHoOLsUwj6oP70mZ+sjrqU8lJAMYqP/9DDeP9JXqK70v
	I0OWzyR5UXOEmOf1gOOix0dv+6UlBVBuGdieNE1ubWL8gv5lg==
X-Received: by 2002:a05:600c:8b78:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a18e4837f2mr226002105e9.5.1791888591536;
        Tue, 13 Oct 2026 03:49:51 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19303d4a9sm31623155e9.2.2026.10.13.03.49.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:49:49 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 13 Oct 2026 11:49:35 +0100
Subject: [PATCH 1/4] package_manager: pass REPRODUCIBLE_TIMESTAMP_ROOTFS to
 intercepts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-fontcache-reproducible-mtime-v1-1-950f07b80f0f@gmail.com>
References: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
In-Reply-To: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 10:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247717

do_rootfs marks REPRODUCIBLE_TIMESTAMP_ROOTFS for export, but that only
reaches the shell functions it emits afterwards. The task's environment
is fixed when it starts, so the postinst intercepts, which run from it,
never see the timestamp every file in the image will end up with. Set it
alongside D and STAGING_DIR_NATIVE.

AI-Generated: Claude Opus 5.5 (Claude Code)
---
 meta/lib/oe/package_manager/__init__.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 88bc5ab19520..76289c911b0b 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -223,6 +223,12 @@ class PackageManager(object, metaclass=ABCMeta):
         bb.note("Running intercept scripts:")
         os.environ['D'] = self.target_rootfs
         os.environ['STAGING_DIR_NATIVE'] = self.d.getVar('STAGING_DIR_NATIVE')
+        # The mtime every file in the image will end with; intercepts that
+        # record an mtime need it, and do_rootfs only exports it to shell
+        # functions it emits, not to the environment they run in.
+        timestamp = self.d.getVar('REPRODUCIBLE_TIMESTAMP_ROOTFS')
+        if timestamp:
+            os.environ['REPRODUCIBLE_TIMESTAMP_ROOTFS'] = timestamp
         for script in os.listdir(intercepts_dir):
             script_full = os.path.join(intercepts_dir, script)
 

-- 
2.43.0


