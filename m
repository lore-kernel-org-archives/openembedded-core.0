Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1331AC25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 14:53:04 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.12295.1716389581184717643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 07:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=KLU/LvPO;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.167.52, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-523b017a5c6so9845214e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1716389579; x=1716994379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZJvzluZMvPOobAXDfjyfyZ1OedKomp9bXe5TMX+DWH0=;
        b=KLU/LvPOgAdG1/2U+mlyq90a4xD6IMMadXxEbGNT4zfvLvHnYb7Gif/dXM4Y1mg+Dj
         FvAtXtvCrA3xHXwcVpJFpKznTzd0NkBgxZ1kbMbzVYmZWLapyjWLkJGGPVUpsMuV7wK5
         PDpWUBTqSofF8IZwV5gK1bjGHtvalmGxuuzsOXrU7S+0yqAON3PQt6GkV/vW6JxDcSve
         aolGd+bQas1yOLr/HdMI+iRCN/BwWGNgNpdqgx+ADTjZUUeEyzvhIzi9TwHblxEPytGm
         WppUSRdWKiMWz/azKqEt94j+X1ZTidrITdZf/6wZHW0EIDp/OGluoLdtSijQEYRikHch
         U2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716389579; x=1716994379;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJvzluZMvPOobAXDfjyfyZ1OedKomp9bXe5TMX+DWH0=;
        b=hVMahnUTKSegpPydyWOgxQ8iCC08WGPSl7HDl/fN41KN7plLoytDvyX25QnVHzdJ6z
         zKTviOKIsC7TPvUjtxT0jBz823eMs+J57ZWNtCj09dvvipnkqUFZqc5tu2peAxocIeJt
         mOU535ccgnjsQSzAT3RQnVmg2Qkkj0qU0qiA6BUPT8Co/svV2Q6aJmmOelE4Ej2p8egY
         Kcq41+0uaI00SdH6v0EwaBDB4Xu2uTRZ7lvMssiyztwRuFxDNdhjfvz/9QHf7CETOiq2
         eoex+cSxycTax5EPf7n3/nRFsrELPUC3Hdb+LctTt/4duw2gL3nB+IWK7ZfcodLZMom3
         OxAA==
X-Gm-Message-State: AOJu0YwjlcDo2fRwKmUxTNRqLVsQL2rdkExtipB76pu1BHW/oiLJ/sEp
	uf/5jg4OB4B2XkniueNKqAr/PhiY5dzAkNnxO5xD7+Sp/f70cqbXUrpcfaF4We4E4zcM8UcSMjG
	661g=
X-Google-Smtp-Source: AGHT+IE3KkMofq1/yMXDU/24+9bUtutegYoaiXP394/Lug/TAAGYVuW/D8N9n47enJ1YALKWBnoFmQ==
X-Received: by 2002:ac2:5961:0:b0:525:32aa:443e with SMTP id 2adb3069b0e04-526bf07e524mr2002830e87.17.1716389579108;
        Wed, 22 May 2024 07:52:59 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aeba4.dynamic.kabel-deutschland.de. [95.90.235.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17f0dsm1786072566b.211.2024.05.22.07.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 07:52:58 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] oe-build-perf-report: Update tooltip to include commit link
Date: Wed, 22 May 2024 16:52:51 +0200
Message-ID: <20240522145252.58663-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <dc7f3dc71d643c5491172b9fa9c761400b9d0499.camel@linuxfoundation.org>
References: <dc7f3dc71d643c5491172b9fa9c761400b9d0499.camel@linuxfoundation.org>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 14:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199760

Update tooltip to include the commit hash link to the poky repository

Ninette Adhikari (1):
  oe-build-perf-report: Add commit hash link to chart tooltip"

 .../build_perf/html/measurement_chart.html    | 26 +++++++++----------
 scripts/oe-build-perf-report                  |  2 ++
 2 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.44.0


