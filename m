Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450A410854CB
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 02:12:34 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5381.1773799952791741570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 19:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ct8yoEWR;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0d36f3888so2354208eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 19:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773799952; x=1774404752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeZItdSLhwkiyHTKvJOOpOzefBuN2zKBfI3By9m1Sco=;
        b=ct8yoEWRSTQiarCQVt9/+gMz42UVhJ41McVsCVxMCojBpTYm4boWHNHyEY2qv9pQdZ
         H15nG/F7C5VPLqRZKzwDHcdYF2L1/LDyZQAvj5KjYhbeGwdyGpD1qWHafj8bSWQfjka9
         GK1+upEbLEd3Dn/3Z60sfe5tO+h5C7MKgNJx4HOcesRFpQu3GfNyC1Lp2oSWoZ22O5h6
         K9IXV3m5OiRgvUT19/9sPM7ny2cQM21WYulZ4ufucYMMUbR9xc6zl2YJbmSdgLqVUokx
         C3iK1stczGPN5nZDVpcszoKzRCCanUTYo2oXU9Jb74vPL7n6vNJomBg9KlrVFHmc2Aae
         /47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773799952; x=1774404752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HeZItdSLhwkiyHTKvJOOpOzefBuN2zKBfI3By9m1Sco=;
        b=Dv0wKDLStcpgGNwz/r9MZZFomHBmYCOyGbOW47gqTXA84asvDvb4/In5aShm7bEUpK
         p1OovhZoqCj3fVB244K/D3MlqDujFOMI6tXoCZhPtTdIe/KHM3pTGKqtTfTD/IbvDGDG
         W3F2Qx6xxrhMeXonMvIdouaOwHCbHjRMVFL0aQXJdXlTHsjzayk165TzvIguAl4B4fC7
         8a6xgNk/i6iplShi677vJal8rfCtwZD8VVn9mXqqUy2oAjE9hafK6xn796Z97QBpsGlt
         b9A1WcyKpRNt5tr9I19g/0309EU1GYyIWOIddHHoVeyJPGDfEewoj45D4wxgf2rPKmyg
         y/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCW9ELlIVh7cIlrKWGz5zdR0vge7GWF9yAbqAsPhmCiUQeXfQA6FWtfO75SsItShBzbqqG2xTCZukm39X5fzHimnTQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxA+mK81EiNVRjW6hhG+6KImn5jsmKCz9E6hurptTfo/Eh92EKj
	VU8pFF3Uv/wNOqwi64T1VUR2V3LfeTmgGIJVe3t5+L5+TL4TzY1TZq1m
X-Gm-Gg: ATEYQzyX/QYSRCJdOnAS6Qgv5b80be8thhjqBvUHyvBbWsJt1cLFjvYLNzxTrMYb4W/
	VFYXUaqqV8uYeBQuudgF6OATCVwRTpK9fQY2e5/cBjxEMZ7xY1xUxl59sbBHdQYHbBRfEfadW2W
	Et/qRgfY54ihB6zU8ksv5KXreCLT05FZCtKdELmYozDbDQKXgi0I2RsUHct23e+Fxsip15gK5eb
	gpwMaqFKFFNxDzbuWo260BG9EqukeHAZaFNB+d/Li7vQLTxZIaZWWxHQBi6EI/QCWgL5ShzP2eK
	ReEY7QIdVIodtmas/onm/X4+nwX/vZIVBwnXacVz1189+fp7yuxs35Swd9UpE//KJ5M46Bvefvm
	Iwu8sjEeia1wLsoA61p3YzIu/+G82H0Df4HHWv9YV/7asbk+PjDGTHbdCWQxWPxak/6bQzBzwld
	TgRL/Ny6tLarUAMSmjJKRcdOPzyAKf84mQ8bjYADbgEBdK71drHvmiG1a2r7/BKjER02I22tY2D
	MsI3nhUTNPY7VYZeFOJ1H4z0GIUtfZKZunZZqPp32YFkYjitk4=
X-Received: by 2002:a05:7300:caa:b0:2ba:6aef:6959 with SMTP id 5a478bee46e88-2c0e51bea7fmr845616eec.27.1773799952010;
        Tue, 17 Mar 2026 19:12:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5368a96sm2012934eec.4.2026.03.17.19.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 19:12:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: changqing.li@windriver.com
Cc: alex.kanavin@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] mesa-tools-native: fix do_compile failure
Date: Tue, 17 Mar 2026 19:12:29 -0700
Message-ID: <20260318021229.1684835-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <165ebb9c-7b39-4c96-b180-cb2e131312fc@windriver.com>
References: <165ebb9c-7b39-4c96-b180-cb2e131312fc@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 02:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233355

This patch is breaking builds for eglfs backend ( one without X11 or wayland )
Ideally, this should be added by checking DISTRO_FEATURES_NATIVE for opengl maybe, but the
said patch is fine as well.

Please cherry-pick this patch for master

Thanks
-Khem

