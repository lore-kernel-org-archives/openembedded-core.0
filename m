Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE8FC61DA4
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.3921.1676835067675857978
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OqGg66J+;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id b11so1581030wrw.5
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+hqGvL9iy1J1fvWa3P9LtSuogLDmow/ZVgGpgjv8sE=;
        b=OqGg66J+2+XsvWtZJ2LxA3RWkgO9qOfBi15k/tc3NSfXg0dlJUOU08wQ51Fdpb5yPp
         EqpZbGw0YcvgTLGaHrWNC4g1I7H8Ie5Vj4PqVfIx2/z33Xx8lyhC1CB6cTVl/ZtuYxQ8
         sgerJ8d4Q5T9loQW2Ence+YMcCb7tkN05ffDpxq4HHIka/VuM28iSJFvA+H6pjYPUmrN
         tkGoh96d32yJtaQ6hhgQEbfwLf+s5c7R2r01ghIqYW23X74aL6G6sX6XvH84W1Jj4IzQ
         VIzM56rgaqtoFVccmiHeIyLmbVH/UDHiSbgE8XL51RrAJ2ImK623BWzgJNfq8Wh+Uz90
         lpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+hqGvL9iy1J1fvWa3P9LtSuogLDmow/ZVgGpgjv8sE=;
        b=KBj7X2EG3ga9d3mFdSsTpsOpi76DQcIdEJWKrFDylOQYNE+yIs22vVCrRCfkON1Txx
         j3LSL/BZRT5yhMA6ziTmAt5fkyxD2hHoHSSG6uH9LECCeHVXDz0YdRqoyo45G+uIzmsN
         gf1VEpJ3gIoTor3ptUlagRw48MlrVtaZIbS/BpBgd2jOGcFZfs9gM53rwWZVPMcSKE4Y
         6QgtldbEqk1l7xIVP1plD+WL4qYzsgI5WHpOK8RkIw8WvBkzpePhACYYKi0C43tI4+jj
         yhsV1oaEa9XkPcZ3b9PVw0PyXFsHFSjpcHYETfgm9DV9XU1aKDKQfODV7+k3iRWzSynG
         YAQQ==
X-Gm-Message-State: AO0yUKUXemyjMcSUrryJoehXdVbsgaMeR25XNppoEbM1/Hnc8R7bhbv5
	/MW0AScCekembxW341HEgLuB/GbO9I4=
X-Google-Smtp-Source: AK7set9h/oh88RZVHxEwxGiB6u9pB6yxIq766lYpoKvcg6+7DLlN3MyWRFQv9vXc05Qo/flMBfgZPA==
X-Received: by 2002:a5d:5848:0:b0:2c3:f8ea:da26 with SMTP id i8-20020a5d5848000000b002c3f8eada26mr2906599wrf.32.1676835065949;
        Sun, 19 Feb 2023 11:31:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/39] gcr: enable vala .vapi generation only when gobject introspection is also enabled
Date: Sun, 19 Feb 2023 20:30:25 +0100
Message-Id: <20230219193101.338397-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177347

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/gcr/gcr_4.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
index 22edd386fc..b137968943 100644
--- a/meta/recipes-gnome/gcr/gcr_4.0.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
@@ -29,11 +29,13 @@ PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', 'vapi', '', d)} \
 "
 PACKAGECONFIG[gtk] = "-Dgtk4=true,-Dgtk4=false,gtk4"
 PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true,-Dssh_agent=false,libsecret,openssh"
 #'Use systemd socket activation for server programs'
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
+PACKAGECONFIG[vapi] = "-Dvapi=true,-Dvapi=false,"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.30.2


