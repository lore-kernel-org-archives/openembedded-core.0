Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A3EC77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 18:58:58 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.2683.1685473134367310160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: marc.ferland@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-75b14216386so285360685a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 11:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685473133; x=1688065133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEndj2EzbVGYyUD1qKPswdIcsnS3cWD7h6xQs1b4gPk=;
        b=avphItgw3xFL9PsY19b1sxMYd0DpmI+dJxP9wOlYDeSb4Yd4iOYqYuUC8I9JGlCWDV
         a1b/mNFU4RrmYC5XVx+sSh1F4uJR+nDiPJ+vFa05Hwu6ESpKF0i0Ff0fY87JIp2CKD6C
         kNjDtyV6elbD/cH+YVFQkOu3Pjp2KVWtYGdacF1uT/jXYf5oii+Vcx3MyyKD9Ah2KgmF
         nPNnh4qlX5rRNfPjv46Y0ti3rtpsdFmVxUevHIvZk2b/8X3PQr3ob+KL71LgIwl+Mz6D
         7MUhXSQjp0UkynDnfUurR4Tmb5LocQykkT+NISCNbidXzuOPx/EJLPUDGKsgJpy4JvQg
         TFQA==
X-Gm-Message-State: AC+VfDzEFFYUpdbMIupTWABW+iiyHoS7vktIzjZfw7WHIAPUW6+pO/j6
	7n8cX2Kq8ykSvu0amVe5A/OTETrfUGk=
X-Google-Smtp-Source: ACHHUZ61Cny5xZAIPePs0qsd/DPNoEKBGs8QT0dmIguEajkzD/fgWU79lOXfogjtcNJZF8LAgHECRw==
X-Received: by 2002:a05:6214:1c48:b0:5f7:8b31:4522 with SMTP id if8-20020a0562141c4800b005f78b314522mr3511612qvb.5.1685473132861;
        Tue, 30 May 2023 11:58:52 -0700 (PDT)
Received: from mfe-desktop.dimonoffinc.intra (ipagstaticip-ad9375f2-382c-b511-8ac1-9541f69fe50f.sdsl.bell.ca. [142.116.33.166])
        by smtp.googlemail.com with ESMTPSA id f16-20020a05621400d000b006262d158ab9sm1349729qvs.124.2023.05.30.11.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 11:58:52 -0700 (PDT)
From: ferlandm@amotus.ca
To: openembedded-core@lists.openembedded.org
Cc: Marc Ferland <ferlandm@amotus.ca>
Subject: [PATCH] connman: fix warning by specifying runstatedir at configure time
Date: Tue, 30 May 2023 14:58:48 -0400
Message-Id: <20230530185848.1944634-1-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 18:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181942

From: Marc Ferland <ferlandm@amotus.ca>

Without this patch, systemd complains on startup with messages similar
to:

systemd-tmpfiles[128]: /etc/tmpfiles.d/connman_resolvconf.conf:1: Line references path below legacy directory /var/run/, updating /var/run/connman → /run/connman; please update the tmpfiles.d/ drop-in file accordingly.
systemd-tmpfiles[172]: /etc/tmpfiles.d/connman_resolvconf.conf:1: Line references path below legacy directory /var/run/, updating /var/run/connman → /run/connman; please update the tmpfiles.d/ drop-in file accordingly.

By default, connman will use "/var/run/connman" for runstatedir
instead of the now recommended "/run/connman".

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/connman/connman.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index d7af94f792..7487ca0d0c 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -27,6 +27,7 @@ EXTRA_OECONF += "\
     --enable-ethernet \
     --enable-tools \
     --disable-polkit \
+    --runstatedir=/run \
 "
 # For smooth operation it would be best to start only one wireless daemon at a time.
 # If wpa-supplicant is running, connman will use it preferentially.
-- 
2.34.1


