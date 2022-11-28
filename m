Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC6EC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 10:46:49 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.114795.1669632399490493699
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 02:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BFK038TK;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id s5so14788867edc.12
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 02:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP5rtKL9MTfoUY6ICGzRHu1UK8N7V2rEVsy9SYy4btU=;
        b=BFK038TKbfXy8NmBdF1bvTFUfCRV3O16vCoFQEBlZiHZSDh7QdfLxUl5LEPkwpYI3B
         SaI4sEBjvAdbv4aLxR9NAjV9u4UyY6b5cpj4Vey8pHvaF+dyCp5KxNpUg0/YUBUOMUF3
         jDEB3xLynjnnhGcCiTTotKuLI4AVx5SLkj6NHkGZKzk8LPF8YLsX8Hu/9T+oqxSlgGUi
         J8wdSpyZvXO+dJx+GTGg5oC9Ll6RMV8g1pQ0CqMXU0toxclPVZk4jFtlSWNTH0D9CCxr
         noSmz1qA0DEQPkjnsO33JwbLXdxRYR+fDfBfmvfCvRXmXeTKEvSpigb35wiymxwK+rk0
         Tvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iP5rtKL9MTfoUY6ICGzRHu1UK8N7V2rEVsy9SYy4btU=;
        b=UG64bd+mfXDQGRoSGDvvoGY4eYBJQv+Rz9QbEevqk//rBOq72SpfN/LmE9V1Uq5sz3
         9Xy3esp363/CnHItHqQC0xNPk9U62uXgNxBiEG8nDDgGp8XpXvtVRH40jGWLbLIDIAzk
         De5oyialfO8z1U5bxs6XXsAOzZlTxsWNRHbfofi5IqJ00FB2bp5xo3tiwlLvZv38FgTv
         xe0uTCRgkDNvcpozNdjvNVnZn1bz0y/kmBsmhmGh60thO5HrCOgB7hg/erT3VZBqpxIH
         NdbGoDFNTDbLbJsswYN/oltMuntRYYBsEI92nJbyHQQITY2ttjeE3BlXmYQg11j1b/Rn
         RuUw==
X-Gm-Message-State: ANoB5pnZEJw1rCWPeVAKFYj53aEuxa2QiO7B4GnGdq5HrMiSKtebk2by
	bVDfqdWcMZkdjOTOLG5+9jOTX00jwHE=
X-Google-Smtp-Source: AA0mqf6aIWdsNGH67+u/2/Mr1hyZr08EnlAxASm2z6UIpBekm2uWgAArdk+Hwt1eGnM6v/RMp2MAvQ==
X-Received: by 2002:aa7:d943:0:b0:469:cdb7:7fe4 with SMTP id l3-20020aa7d943000000b00469cdb77fe4mr31827856eds.261.1669632397784;
        Mon, 28 Nov 2022 02:46:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q8-20020a17090676c800b0078db18d7972sm4776707ejn.117.2022.11.28.02.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 02:46:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/3] runqemu: do not hardcode the ip address of the nfs server when using tap
Date: Mon, 28 Nov 2022 11:46:32 +0100
Message-Id: <20221128104633.52375-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128104633.52375-1-alex@linutronix.de>
References: <20221128104633.52375-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 10:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173903

Rather, set it similarly to the overall network config.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/runqemu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7bd9465593..04728673de 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -999,7 +999,7 @@ class BaseConfig(object):
             if self.slirp_enabled:
                 self.nfs_server = '10.0.2.2'
             else:
-                self.nfs_server = '192.168.7.1'
+                self.nfs_server = '192.168.7.@GATEWAY@'
 
         # Figure out a new nfs_instance to allow multiple qemus running.
         ps = subprocess.check_output(("ps", "auxww")).decode('utf-8')
@@ -1187,6 +1187,7 @@ class BaseConfig(object):
         netconf = " " + self.cmdline_ip_tap
         netconf = netconf.replace('@CLIENT@', str(client))
         netconf = netconf.replace('@GATEWAY@', str(gateway))
+        self.nfs_server = self.nfs_server.replace('@GATEWAY@', str(gateway))
         logger.info("Network configuration:%s", netconf)
         self.kernel_cmdline_script += netconf
         mac = "%s%02x" % (self.mac_tap, client)
-- 
2.30.2


