Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.84.1614617609095196416
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 08:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sXDJS6QI;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id b130so5558307qkc.10
        for <Openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 08:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ssVvOGTO2GKz/PQ+gNX0e+U0qC/pPmkW9/sDdKR97Qg=;
        b=sXDJS6QIezvsiL7iciS3fvsfV9cLMlgPrX9Z0pmdFRRzqamld+mhZjO4JAg+UNSQ6X
         v0cfy4OLKN96uR3GI+N9oj7J/IBb7crZhmf52+tuYNAsMJ0vlw3ZjX1XVEnoRZ4MTF87
         wk00HA/2wB697GE+LmIO5qc4NPsn66eKN/+5ItEM/gRgH63GnjR3Nt7jnC8SMcgFhHQq
         unVCl/AiOikpR+hRHHUydw4MHaFnhDkgyP1gLbeGKmDZdzSmQLvE8sZaU57VWTR6BEbs
         UlIEXfXqo5CbDrnsMhH0XTJkPNXAT0QXsBP3L4I6II8PZHnhZJRu4f9DleZR+9ykERdO
         hZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ssVvOGTO2GKz/PQ+gNX0e+U0qC/pPmkW9/sDdKR97Qg=;
        b=YTtNwWrfcsHATrY6inYid3jkngMhH3whjmBamD7/p2y3g+B6AyqqAq8zOLYMYwODA7
         zcHCSxNDjUQTqhuBWypiPvMg+Zwru8nimpTUoh7L1G6+CDFiwuUvRBkVF1ZfbO4fMKuB
         nKssS4iginYD1rdJhrlltumgVedqOklEea55nIq5dNPlgJOnmHOw7XDKfe2G+Btal9li
         cqBjpqxqIHHe7+crumDKKp0HXZ9upxNECHF1rzTG3Z6cGqHkVOLiRkmBzEFVqipxecRv
         ry0UD6o5YT1WwqPnlDAMUR9Gql4U4/uVJr/txCmAq2WBf0+v+HH/V+LzHDJSCUR/fmr4
         vvsg==
X-Gm-Message-State: AOAM5331F6ka6RZAuMPqK6mJJ3gcVv1pWs7obIx2xDH9NGWs1xsA+I+h
	CTfBOWd5yR7dCnLLLNWwDgvibMY/O/8=
X-Google-Smtp-Source: ABdhPJy7SYEMfV/jTCmtBizJBJajGcgp1pGCOKg9OOHcw4wU0jgZDd2bz/QSpJEt686+//3JlJCuTw==
X-Received: by 2002:a37:6c6:: with SMTP id 189mr2513746qkg.478.1614617608019;
        Mon, 01 Mar 2021 08:53:28 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id d31sm5885343qtc.92.2021.03.01.08.53.27
        for <Openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 08:53:27 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] systemd-container: recommends StartExecPre modules
Date: Mon,  1 Mar 2021 11:53:25 -0500
Message-Id: <20210301165325.3987311-3-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301165325.3987311-1-vdidelot@pbsc.com>
References: <20210301165325.3987311-1-vdidelot@pbsc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The systemd-nspawn@.service file uses the following line to try
loading the tun, loop and dm-mod kernel modules, in a non fatal way:

    ExecStartPre=-/sbin/modprobe -abq tun loop dm-mod

A non-zero return code from modprobe will not stop the service from
starting, but it would be convenient to inform the user about this
optional support, so add these modules to RRECOMMENDS.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 meta/recipes-core/systemd/systemd_247.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_247.3.bb b/meta/recipes-core/systemd/systemd_247.3.bb
index 3454085e5f..cd67e65abe 100644
--- a/meta/recipes-core/systemd/systemd_247.3.bb
+++ b/meta/recipes-core/systemd/systemd_247.3.bb
@@ -489,6 +489,9 @@ RRECOMMENDS_${PN}-container += "\
                          ${PN}-journal-gatewayd \
                          ${PN}-journal-remote \
                          ${PN}-journal-upload \
+                         kernel-module-dm-mod \
+                         kernel-module-loop \
+                         kernel-module-tun \
                          tar \
                         "
 
-- 
2.30.1

