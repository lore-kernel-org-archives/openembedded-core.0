Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44B9C3DA40
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.17599.1687961624964812080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ogd4bhAj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b7dd061e9aso27546285ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961624; x=1690553624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIV4/GYcjw1YIuJYOxPHBOSSVg486/u6cqcVxUjJlaU=;
        b=Ogd4bhAjPqimT0QoSHcGK6m5FCbw22r3OW6IbYgEiCdwhxpKSDNK7HvunjevzrTNX5
         +lblTBUSm/zOEBLHFMCVhXEhm4mBSXzZOsCIGLSqLjjnAhimoBrBgBsdWXOMgb0mFEmS
         Mu3jR7BkOQZPwi4y9n9d8PtRdMRu7yqXIgjKLFlk4AywAvwnBuwassP0FSk+Aml6eyAD
         mQ8pglu6bmAcG7FTyJk3U4U/+MdLM8EmiCNu4kpBlpWVXo5fminENcj8ZIjxzMQEgZAL
         Ad0lfeiIzYq1+YG/pCvFhs2yKeP6WNJNeEnI005fGcremuWWb18Pql11HlEKX4oGWQtM
         4oKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961624; x=1690553624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIV4/GYcjw1YIuJYOxPHBOSSVg486/u6cqcVxUjJlaU=;
        b=hn347OmmeJz4ZWwvyqxjhRFjMs9weBYceolmyG0PGKHFx2zAMDz5ewINnNBNjcgrZW
         KxrZtdXd3tdV9qhlfbDEQtuKLdCcMowFYMfoNT0S00M3cLZoiWpio4fndglX0V6IlXRb
         rj2rS/JfXedjKAygsWp9zqQ9JP93j7ZRGj/f8ak7hyffohlKjkX+kngPCecY3LJ/xtDU
         61ehXqJEEKq9n2LA+hjeuSDphdN6lAecUGpedH9m+v24DE3D8c377+YnbfZ2IxgCrrHA
         uK7JBvKSL1XLU0+MKuK01/iYtIVlsEOQUB5pj85+6zpPbp289JN3+UGsrgAfDTDR8TJI
         K/Ng==
X-Gm-Message-State: AC+VfDxuObY1WGU2nVXh8ur6fdKinCm4GFlGqFigafWVSwydkFyhFPMm
	4ROh11JAQdcz7wxlU4kU+vUziGROPK0gvDjKKNRXpw==
X-Google-Smtp-Source: ACHHUZ4JcqR691OwN6/Oz83qU4mBpZUBoQPyIMY8wbQkP7SumRL8+Oo2R2agzTTG/HSR2a29QryZqw==
X-Received: by 2002:a17:902:ea03:b0:1b2:1ee9:682 with SMTP id s3-20020a170902ea0300b001b21ee90682mr13285749plg.23.1687961624076;
        Wed, 28 Jun 2023 07:13:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/29] connman: fix warning by specifying runstatedir at configure time
Date: Wed, 28 Jun 2023 04:12:50 -1000
Message-Id: <52268f077af4fd21ac93623017160cb474bbef00.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183580

From: Marc Ferland <ferlandm@amotus.ca>

Without this patch, systemd complains on startup with messages similar
to:

systemd-tmpfiles[128]: /etc/tmpfiles.d/connman_resolvconf.conf:1: Line references path below legacy directory /var/run/, updating /var/run/connman → /run/connman; please update the tmpfiles.d/ drop-in file accordingly.
systemd-tmpfiles[172]: /etc/tmpfiles.d/connman_resolvconf.conf:1: Line references path below legacy directory /var/run/, updating /var/run/connman → /run/connman; please update the tmpfiles.d/ drop-in file accordingly.

By default, connman will use "/var/run/connman" for runstatedir
instead of the now recommended "/run/connman".

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d17776765a99a4ae327797206ef2a8a735ce87b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/connman/connman.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 5880ecd5d4..0c1dc7e5dd 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -27,6 +27,7 @@ EXTRA_OECONF += "\
     --enable-ethernet \
     --enable-tools \
     --disable-polkit \
+    --runstatedir=/run \
 "
 
 PACKAGECONFIG ??= "wispr iptables client\
-- 
2.34.1


