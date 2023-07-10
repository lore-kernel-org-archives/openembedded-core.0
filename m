Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FC7EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 09:24:29 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.35505.1688981059055862515
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 02:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cpRBtdl3;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-991fe70f21bso536084466b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688981057; x=1691573057;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8RHjDu6XqYHea07BW1f0kdiHwooTyyVzPbKhaaxD2fw=;
        b=cpRBtdl3Pp6q2uJJuQQGy18div5Lltp95FxIYkxueGiM+MfX1GSBS2YFsiWf0E4nQv
         GAYNRW2xjU+Ie6TxLmnNr741L3GKmznOzlzRFf+qdwRdnVZT/ZC19OwnFyGubbA/weII
         q5aF8AC04cXDnT62WXuagw1FLyIW3E6CzpEEHuS+TVPDU5Nh3pEjtAc25nEGD9EHpP1I
         VJw9QYQum/61UuayW6t/4lNV8kCN46VvleLAcAOxSXrFbwx/ll1gydXgET4trcBzbXbd
         faQ6skMaaPEuqSCAhIQ3e7GrQb3Rk+3AEk/RzcSH1hDVatB0Hmlrg2PE93pZer/S7UWz
         xFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688981057; x=1691573057;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RHjDu6XqYHea07BW1f0kdiHwooTyyVzPbKhaaxD2fw=;
        b=lEcOTREKaEBfQ6SW2dCOhRo+v+l1duywm8qtLdlGBazowZlm7Y5Nr3tO3a+oonTxJu
         A4ZrXfWHYx4x4uO7KzXc12hxwCVDBVm68Dk8rjt39pagqFVT3Ws0Z1v6/Yl2ioi6K4Wj
         Z2wGXygs3DXs5NaDONqMajKbBbr8zFtnh9gWK80t97m9SmW/aLWTPHlUH6chA93isAQh
         Sy4oiy0OIYAERKQblCkRpEvBQr8RgBlHXdP1DEMXI3Bsv1FLgF89drxwyEesElT77Tgb
         RYl+obvhEXo9Cmm1bceJ5ey5vhKJFyapO2QHNNwDsldZRkrd35uI6KKo7h7/SfuNLzVp
         g5DA==
X-Gm-Message-State: ABy/qLbmMBif3GW+lYTiLuZvKbJ0Igv5cfQdTBlIgNCBDIOFAd1Q2zE6
	21ctb63klC8+i3JNrtFkB7ql4WfA+Ug=
X-Google-Smtp-Source: APBJJlEn3Ve3cOQFpbLsVf8lWLrK4FDhSw+y88/DLD8IW9bFVoXiIYov/vksKLbzXbL6pjm+dnPm1g==
X-Received: by 2002:a17:906:259:b0:993:d5bd:a757 with SMTP id 25-20020a170906025900b00993d5bda757mr10979346ejl.19.1688981057240;
        Mon, 10 Jul 2023 02:24:17 -0700 (PDT)
Received: from NVC4181.nedap.local (smtp3.nedap.com. [87.249.123.12])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b009893b06e9e3sm5898044eju.225.2023.07.10.02.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:24:16 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] logrotate: Do not create logrotate.status file
Date: Mon, 10 Jul 2023 11:23:39 +0200
Message-ID: <20230710092339.808-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.41.0.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 09:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184061

From: Jermain Horsman <jermain.horsman@nedap.com>

The first time logrotate runs it reports an error:

  error: state file /var/lib/logrotate.status is
  world-readable and thus can be locked from other
  unprivileged users. Skipping lock acquisition...

This check was added with
https://github.com/logrotate/logrotate/commit/1f76a381e2caa0603ae3dbc51ed0f1aa0d6658b9

This error is only reported once as logrotate removes
the world-readable permissions if this happens.
Since logrotate creates this file if it does not exist,
there should be no need to install it in the first place.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8169cd2d18f1569e4357f082adbef492710e8c36)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/recipes-extended/logrotate/logrotate_3.20.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.20.1.bb b/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
index 35977535aa2..3df6ebd26d1 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
@@ -67,7 +67,6 @@ do_install(){
     install -p -m 644 ${S}/examples/logrotate.conf ${D}${sysconfdir}/logrotate.conf
     install -p -m 644 ${S}/examples/btmp ${D}${sysconfdir}/logrotate.d/btmp
     install -p -m 644 ${S}/examples/wtmp ${D}${sysconfdir}/logrotate.d/wtmp
-    touch ${D}${localstatedir}/lib/logrotate.status
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_system_unitdir}
-- 
2.41.0.windows.1


