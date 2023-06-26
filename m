Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6650EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 13:33:33 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.8058.1687786403565616400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 06:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=siY6iRa/;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-988b204ce5fso411055366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 06:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687786401; x=1690378401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkXaen2zEUyo3P8TK39/BICOVIeWsuOjYlViHyb2b3c=;
        b=siY6iRa/BnFRd0OyMUafPKoNev/lwLMe5iVUjQToJn8LfzvDQspgSpS+xxKnNJVVTK
         EBEYSwFA/uMfwTe4JvyRkuMLNtOgZw9rzOgoUXM9G7UQcmF98PgfkdItmILe078WIRAD
         JlJ5qg9+upjg0sFz5E/lJ19do1oMggIoyFHDuWWUvbrZqmeYNulXMmNhsZGPe5fDQmAf
         QxhR9JRfUqlxh+lxpMaKJ44zZsTOkRIekoWqA2UMuwXiykXFQNF/n1VsdUd32CbavfBf
         Clju9FBHqn0eKduHYAjDjCvkBSeARFlHeOW4pbgqQSinKLjXIXdEQSP6/PZd4tI6c7Qk
         /TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786401; x=1690378401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkXaen2zEUyo3P8TK39/BICOVIeWsuOjYlViHyb2b3c=;
        b=WZOKylhsqQm5VZu68/ugfAxfm7BLeNs+gYLLG3IxRLGmaaRgx1yRxo13LgOsD8jBt2
         VRlWs9rtwpT7Pei8BVhvEEapV4RTJsDyaMcG+cuvJK0Gt8U59lIS6O67SMxv+PopwXFn
         VZAqfHu/C4vWMpTr7luakYmRBUZK3DD3bj/QwusiBKslt25pnRlEgoCEa1LUhySiPzXe
         yN1cYapkqeDiJgyV2ag5mKlWFjyF3soEJom3bKVXMLpX8tjwKIf7IcnkoPchrjobF2T4
         zUQuVh79lrg+iMgZ5kaIR2hXmGnFYlyKZsx/0hbWKvwE2KDfVTaQd18MV7mhSFqJ+DPw
         z5YQ==
X-Gm-Message-State: AC+VfDx9oAHWCOyrspfWG09vXb1WrlhIIVVWQFELofG3uzOLHtnmpCsj
	nkJqbz7adcdYUE2i4IRcpkUlJeJZY/dG4A==
X-Google-Smtp-Source: ACHHUZ7dmNJkExvWpD0XxM8I2Dbca+imIWA8TcxuWAoYzfwmrg5dUmIbpH8MSfxilTDi+TA15JxErQ==
X-Received: by 2002:a17:907:d0f:b0:975:942e:81e7 with SMTP id gn15-20020a1709070d0f00b00975942e81e7mr28030196ejc.37.1687786401479;
        Mon, 26 Jun 2023 06:33:21 -0700 (PDT)
Received: from t14s-af.praguecc.cz ([193.85.242.128])
        by smtp.gmail.com with ESMTPSA id h13-20020a1709060f4d00b0097073f1ed84sm3301988ejj.4.2023.06.26.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:33:21 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/4] runqemu: drop uid parameter for ifdown
Date: Mon, 26 Jun 2023 15:29:27 +0200
Message-ID: <20230626133213.47920-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626133213.47920-1-adrian.freihofer@siemens.com>
References: <20230626133213.47920-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 13:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183417

---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6a3fbb2d6fe..5e6793d44e5 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1597,7 +1597,7 @@ to your build configuration.
             uptime_seconds = f.readline().split()[0]
         logger.info('Host uptime: %s\n' % uptime_seconds)
         if self.cleantap:
-            cmd = ('sudo', self.qemuifdown, self.tap, self.bindir_native)
+            cmd = ('sudo', self.qemuifdown, self.tap)
             logger.debug('Running %s' % str(cmd))
             subprocess.check_call(cmd)
         self.release_taplock()
-- 
2.41.0


