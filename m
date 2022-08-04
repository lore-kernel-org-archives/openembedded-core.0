Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C68CC19F2B
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 11:37:24 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.3684.1659613037503563747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 04:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JU9OBZHo;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: beniaminsandu@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id j8so11110815ejx.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 04:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lksGdaQXyYVJZ2VePXg4LwKOWltEY4tW/aDqT4DNvu8=;
        b=JU9OBZHox8wLW2/2Sa0IaKcQtIbyUNyJDKj+VrlFTGFqoVmiQxMrj5G4NSuJu0gwnH
         dbpEkN9GiCEuKwaUrwJ0iPm+h2kIlHk+XF2vA1HTxdWOC7uDYiIZIDmk4GzEL5j8w7fh
         2LgNuUJXDaceFvKXQPD4EuD2VaUb28RTkALRITmtKDvH4yOTuI6+wLxr1Snzkz8/Kfvd
         9gSSU1rvqBfIlmv2C7QUm+SzHaIifcQ4GsNH5KW7o+2TKMT4h2u0p0OmHamWEHrt8cTG
         7pRtXQZuEr3KNMd1VTk6C0ic53HrLXvfoenQXdeCNu18QxqFPXbLgmPRQC9aeeNYALh2
         odBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lksGdaQXyYVJZ2VePXg4LwKOWltEY4tW/aDqT4DNvu8=;
        b=S1H3W5j0lgr5PDv76+f9t1acUnPfamKWz+BCYtJfkcLKRZhzbcjRFbs6NCgrtzvOBL
         G7vClh9sjTVaUDBYyiFBXgBT9zuAqrj7GPtEgz6VwgEcX6eMFk/qYuFLeGOQg5RlW3R6
         geq056lbAHhm31I2bIIqdw7ufwhkUavQ8lf6PeP4VTs+l1UHoRiwBzY4ZnvfAb87f2UM
         QzzH9S06xbO+CiQb4RL5aMJdq+lzdaEHH27dT/M9tvVDbh/GEtEA5wyWuygNWu2HXbCw
         Fmq9PxdxhgwVXEhZ6HYbIezjrRDShAxwv9cE3rFxB/M+Lc0bifGQMVLklGz14eKqJRsb
         RtDg==
X-Gm-Message-State: ACgBeo3G4E0CBn3zB8UQ343ERUBv5gKlL7q0276kLAy148Wu3HLjcg0Z
	GjS6wxjrlM4WkKgiUNxjl1d/5ogdzDg=
X-Google-Smtp-Source: 
 AA6agR6HfZ1Syspt4afaNPFWnN/rXjz5wnqbNAnACi7MXRTTSa9ScT/Qo5R9l/k1yfX/X87KAV9NIg==
X-Received: by 2002:a17:906:cc5e:b0:730:cf6d:5451 with SMTP id
 mm30-20020a170906cc5e00b00730cf6d5451mr1074683ejb.725.1659613036083;
        Thu, 04 Aug 2022 04:37:16 -0700 (PDT)
Received: from localhost.localdomain (5-13-160-72.residential.rdsnet.ro.
 [5.13.160.72])
        by smtp.gmail.com with ESMTPSA id
 o15-20020a50fd8f000000b0043e32c73778sm542241edt.67.2022.08.04.04.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 04:37:15 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [PATCH] libpam: use /run instead of /var/run in systemd tmpfiles
Date: Thu,  4 Aug 2022 14:38:18 +0300
Message-Id: <20220804113818.31414-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 11:37:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168845

Update the deprecated path to remove the systemd warning:

/etc/tmpfiles.d/pam.conf:2: Line references path below
legacy directory /var/run/, updating /var/run/console
/run/console; please update the tmpfiles.d/

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 meta/recipes-extended/pam/libpam/99_pam | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam/99_pam b/meta/recipes-extended/pam/libpam/99_pam
index 97e990d10b..a88247be13 100644
--- a/meta/recipes-extended/pam/libpam/99_pam
+++ b/meta/recipes-extended/pam/libpam/99_pam
@@ -1 +1 @@
-d root root 0755 /var/run/sepermit none
+d root root 0755 /run/sepermit none
-- 
2.25.1


