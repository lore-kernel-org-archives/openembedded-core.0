Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9452F588E1
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 14:32:23 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20756.1776695542577062200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 07:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oXqAs6VW;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso2835464f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776695541; x=1777300341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFo4vPrg34HZxdyLMMvyhc+j2AxpmbdtgtHxhtCnVAc=;
        b=oXqAs6VWYwVu6TOtpYbmRjkmZ+ZCjxkZBij0qlnMAxM+EAtqXebNnbJpKQQWtqSQRQ
         L7Bh/wsNZt7zPa2j5PP9oreLRVm+17kKar+RHg8793w6PvN/nOJbsFTEdOkY7FiB7b65
         TD3zpWo91rzq3k47HBhp0bXU22ReNeNGNpcPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776695541; x=1777300341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFo4vPrg34HZxdyLMMvyhc+j2AxpmbdtgtHxhtCnVAc=;
        b=RsYoB3Dm700X5U9RcmtwtVFRV/TuNvKorcLUVtZ6ZD9FXAOKPrNfL8QVw2PpP/FQYb
         hbW9mlZysZ56C7bcwoMZQgERVODPhNoYeyf2qg1dOwFnfHqHCE+upIxosTAdhmvVzk+m
         A1cLFFR7A2Iw6FuOk+rQJatUEP0+rLujIn4Cr5feG5ZjqNxtO5xIEPElc5+uM+aEKmLb
         rNuAWXJxyYqIsPaXXx4ITbtxNOnKIXJgX/J+Q59r/gNy38nJcqgmh/o0Er5Y8MruZvCA
         UCiv0fd456Vx5n251yVE5iaFNpniO+pU04efDz3Q8XjLAse3mUYLLTZJXlExk46RU1F0
         JOBA==
X-Gm-Message-State: AOJu0YzCxuKUaJ9a90gpC3j/2fQSR4rM1subL0LfQ5pCL8Eh8rNzq1RO
	+/jvSJlj1M7GX4UiqYGcsBFoNz09/Gm1/mAKaDRxG+kYwoFnKIsQ1O7sLlGvINvxjg8mZU4uuVG
	N2IzUN50=
X-Gm-Gg: AeBDiesDOIayCPGUD7h5FfbFgtw+uKEkeYCrt/6jkhjcnqs5Qs+o+lTFB/NKZkZQFqe
	f9W+70VKg+JXZsKyuB1HsUKiLcZRydTNUHV+ompJFAfE+Q3JW8lGT8KS+4A/6vSOvY3zS4Eh1O6
	HGV3k1KKmBycJvNfZTkqgpcF36neF5MOiTR/oGpG32SKeTdSgc/VlBW0wbxX4QzL0vWLJ3n3dBc
	75d8tEkZaZ3mUs4u0q6xXcNvHk74l+tqWOPi5psx+6NC3L+CWTZ3clKG4ouerFgUVZ9szkYRuKA
	wqzW3jKQsMVTnNLZ6odVqnzCqRSZAcunVRJT0mHdkJj8ACxOiZ+ee1IDOQF39hoJPLoQd2ax9YY
	C/RqE3zzV6lRwm/hOiwqLHYUCev8csL9r9Rk816vchIXHT9I2ddGCDBXXWa78crKi9F3vDXnBsL
	7R0oBO9BmT6GEFDUosKrLIm/6Hy9JVs1XbRMi24zwRs9/LkAwJQOt0yNYJht/v0jasoABxVOgwS
	52nM6ga6WOfHnUfsaETvbAn/TShQ/TAcEXK6OONpYU=
X-Received: by 2002:a05:6000:200c:b0:43d:77f4:7145 with SMTP id ffacd0b85a97d-43fe3dd407dmr21091784f8f.19.1776695540856;
        Mon, 20 Apr 2026 07:32:20 -0700 (PDT)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4411c9f4f03sm660671f8f.1.2026.04.20.07.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:32:20 -0700 (PDT)
From: corentin.guillevic@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v3] sanity: add check for own-mirrors/SOURCE_MIRROR_URL
Date: Mon, 20 Apr 2026 16:31:55 +0200
Message-ID: <20260420143154.452247-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 14:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235569

From: Corentin Guillevic <corentin.guillevic@smile.fr>

The SOURCE_MIRROR_URL variable belongs to the own-mirrors class. However, the
user may forget to define it. This will cause the class to inject incorrect
content into PREMIRRORS, resulting in the following error:

ERROR: gettext-minimal-native-1.0-r0 do_fetch: Bitbake Fetcher Error: MalformedUrl('${SOURCE_MIRROR_URL}')
ERROR: Logfile of failure stored in: /path/to/tmp/work/x86_64-linux/gettext-minimal-native/1.0/temp/log.do_fetch.258066
ERROR: Task (/path/to/layers/poky/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_fetch) failed with exit code '1'

Add a check to the sanity class, to detect this case and raise an error.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---

Notes:
    Changes in v3:
    - Unused variable removed.

 meta/classes-global/sanity.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 1a490f8d61..3142ff61f2 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -984,6 +984,10 @@ def check_sanity_everybuild(status, d):
             "Please set TMPDIR to a clean path with no trailing slash or "
             "consecutive slashes (e.g. %s).\n" % (tmpdir, os.path.normpath(tmpdir)))
 
+    # Check whether the SOURCE_MIRROR_URL variable, belonging to the 'own-mirrors' class, is defined
+    if oe.utils.inherits(d, 'own-mirrors') and not d.getVar('SOURCE_MIRROR_URL'):
+        status.addresult("own-mirrors is enabled, but SOURCE_MIRROR_URL is not defined")
+
     # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
     import re
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
-- 
2.51.0


