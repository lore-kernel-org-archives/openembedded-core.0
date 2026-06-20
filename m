Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3155CDB471
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:15 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5949.1781960414254537679
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w2H/FT7X;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-460166910e6so1738808f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960412; x=1782565212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/Dfwc3DuePYDSHB1DQHzDXCa68Pix6PQjLfgw7Qd3w=;
        b=w2H/FT7XpR5+uHpmW8BbBV5HRC/6BQs5XCvveT1T2sKRQP8hXKStjXptWBD8zDQNiz
         XcDMh9gl5GVJzmifyqKfcw3LALtoZpejmQOdGvWNwiWLaQRTOHvMhdsGgNkNXevf6x5f
         FO4YxqDJTzhgxMTCTLWwZDALqAtLvcGq8YXhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960412; x=1782565212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+/Dfwc3DuePYDSHB1DQHzDXCa68Pix6PQjLfgw7Qd3w=;
        b=iQPL+KRbf91txxkNrKh8Q1TlrHeExWPedkRJZJg20K9VZnXQxeR+3jWG47PF8UKog6
         gtipVxTkL0ySChA2FEXRMhRrwmflKMfKTf2KfsQRaCHAAslJQ2WSOUj3rdNqwpf36ojr
         CMqgTBkR4U9kcu3djHVJ/Mk3KrgnKgQVUykoW68J7co8r+5Muuy2TZapjPbAvtP25z7g
         05WlRQ3tEivrep+McTOW1l+0oabWORK9biiU1SvwrO2HwgD7MDZosoXqZmWtEyr8upRY
         1WyvESjjbZgMvZTq2FcsvwEtU/dZ6okjFJV8ZorP1uU6qMU0R4bGo43BcXTqo6Lvfskg
         zm0A==
X-Gm-Message-State: AOJu0YyXmi5qsunn0vTV18x+VHBkWRgEIFOZCaA12QUBykoDBsyTv+Se
	zvhb8C78J93V/PFPVWD6lT07SH1InoNmLrBRSKmXv3r97qnO8zCSHauFoCdD/Q8CwSlvHBpHOfj
	MJ/Aj
X-Gm-Gg: AfdE7ckN4Dz53JO0Qo0ljCwxrbAht5i1NfRT/0F3uHsuPLn4kOPEMRjGaoG2agYQryX
	uSIlSn3c8A1PyFlJLYjEikHbWEB7ZieuoTlktOaJ0BJaOg3keYfhSCsLTPwsf5FaWhdzuRIx6Kt
	eh3Sui7Dn511K1o6hjaizHDMGrUWbVAwBKIT4Lmbcaz9Adk44jrM1irecG9CBwdgKTod6WGedA1
	kCW2vf4KMbA47+bCrsuVSIKXZanzam3IF8SzSNBwGvIw3gqSpWaK9bB71wktZjY3eOe7tmWu6nX
	zhT44FwzTYKlK+bDXYb/JPaRHCEbeRMlaw5TqNoJZ/rxOEAaaAKqN2pWCgGEyHuXkUq69v5TiI0
	YHtTjFqtq8i2apCedDEhdmS0s+ngJFZRRkpMmGx0PDEuhrk/i7mi8vsh9nyV3onnYN65eRezwLL
	H1LAtNk6vC4Cs4x9q0L+9PjuSMKkI+lUN/VPXJTyqrb+xgtY23G19TwGC29gP5MnNPnsuNj86vG
	8R+i8tXIh1686jG
X-Received: by 2002:a5d:4d92:0:b0:45e:6518:3299 with SMTP id ffacd0b85a97d-46500a02ca4mr10213456f8f.5.1781960412417;
        Sat, 20 Jun 2026 06:00:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/36] scripts/install-buildtools: Update to 6.0.1
Date: Sat, 20 Jun 2026 14:59:23 +0200
Message-ID: <ba119d2f7132ad2d9d48ecab306f1dba1af8793b.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239217

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 6.0.1 release of the 6.0 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index b9c008a2ecd..f925dfa6b5c 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.3.2'
-DEFAULT_INSTALLER_VERSION = '5.3.2'
+DEFAULT_RELEASE = 'yocto-6.0.1'
+DEFAULT_INSTALLER_VERSION = '6.0.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

