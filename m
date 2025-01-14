Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B89C02184
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 11:12:34 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.41852.1736853151508016994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 03:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c8dKrMPi;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso945018366b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 03:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736853150; x=1737457950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0jF46tPTKPuabEG0SXnVCqIfXzFlgzlIPup+8k5pvw=;
        b=c8dKrMPi36mNJXDDkMKhOPrMfptoBkbJq/kHfmM97NaCUGk3obg1yvUCQQ+I7Zi184
         SeBEF60jnp6oowbep5qdwtdKjWJLeF3uudFtkz4FA4YGmw3UsgSA7AybEIEiZdb2xLoU
         7VUOQtvYgP4VJfblMfsdng7W4R9UKLJ2f/NWLp8SFJPEZsm7+b4BwT+9tuGJi094j6Hd
         7wcEXGcQ1x1f9tD9bFovXiV+B98ZtZHqtHHbJCoav6TVy2lxCmiIRyu3+2Hgw2DugFDo
         kYhUCXMPtr1yPAOTBwp8kQWChX/4kFuLG9NPwnhF9LzTm3ENX6stPzCBayEXoSWoDBJs
         vTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853150; x=1737457950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0jF46tPTKPuabEG0SXnVCqIfXzFlgzlIPup+8k5pvw=;
        b=NtKkmcr/RsEhGkn/gNKk47GpQXqk6wtjEbz3WEu6RoHGs0wyXuc/3KywQwC1uO9Hz4
         PAuLgKsRRmZaPrZCia8NhY8abjCslPwy/Ld1E6QhnugZqb+7PaF6BQ7ICr5RbH+Porg+
         wuKfSn4rocW3dUi9pXieNiq8HGdZRp14HeIFoKKcuC7Tig5Xe/1atZPVJzYLhPew81g1
         i4dQjr/XmCMxRAK1y/31TGK8oiDXAQElUqt23SfAR2C06IW8wkZwYSKF6CaMqbj1lf8b
         snkhijxTvDYXeBuDsqVm1mUSvQB5l+NG5L9VVCaWGldgZzOpO5cwtTjfFTUCQwJgGIm3
         POrg==
X-Gm-Message-State: AOJu0YzBvsW/mhkqPsd9XPkpaIOHwc1gQv9huo6iKaz8Cxk3NVP4+Ck7
	s62z1u/OFMxu42fdLO61IV2Y1iCGTuW1wWl6bc/bX4i5By0qtI8d/8tTbw==
X-Gm-Gg: ASbGncuhI46P6t0HV26WXuiHLUo1/pqotuqK0yPBCz4U3h7qN7n0qoAIAp5GRTHfNPB
	ObLM3pV5FRTgsAzyCkNNvO9DG39az8yq8o9UeShbiMNgQKrUwN5CwNS4+kshYLUToeefEk3Mivf
	xQacmUY267AmpsQKDjbtoesXyHHER2PKH/5Ms5mRev6k6ri3A2DBsUUE8nXosrpAtaFEkQlfKX3
	xK5ZifIvUodM9ohYktmiNcMKf2hwNrI/UQMU1COnlU6yocU/i/bUMwu
X-Google-Smtp-Source: AGHT+IExPsjeDl5Xmk4CLS6K+6YCGQePQ/SgtdT8WlaYxoBEdV7Za2vhe5vw/af9+8wk+20RRGZZ5A==
X-Received: by 2002:a17:906:dc8d:b0:aaf:4008:5e2c with SMTP id a640c23a62f3a-ab2ab66fea4mr1942368266b.2.1736853149427;
        Tue, 14 Jan 2025 03:12:29 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:600:25f4:7e14:2af5:7625:b631])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4400sm6091068a12.52.2025.01.14.03.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:12:29 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH] scripts/install-buildtools: Update to 5.0.6
Date: Tue, 14 Jan 2025 12:12:24 +0100
Message-ID: <20250114111224.22466-2-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114111224.22466-1-an010@live.com>
References: <20250114111224.22466-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 11:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209789

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.6 release of the 5.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index ee6bfb89eb..972671d50f 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.5'
-DEFAULT_INSTALLER_VERSION = '5.0.5'
+DEFAULT_RELEASE = 'yocto-5.0.6'
+DEFAULT_INSTALLER_VERSION = '5.0.6'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


