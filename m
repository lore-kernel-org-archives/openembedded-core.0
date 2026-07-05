Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEA5C4450C
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:20 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140036.1783291390962925925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=c6CvUR7v;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-474303f3c72so1336073f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291389; x=1783896189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5mQgmKArLxQI4sDvoltMafcAkZrrF88mI4MmzB3lZM=;
        b=c6CvUR7vde9sZd1aOk1b4LVh7pvXKetCUolieyfCxhTZH1mQ6jJqKB/g9MZNO8n8KS
         sRZbSVSS4Z3Fx/JK9RxmuKhwKMWhgYbjKQZHIbu8CO/4+S2XREB+fhLKlq09qUE2VNr+
         ZVhbktdHVzKdYUlOvycEM5FlwbVoJHX5dOPWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291389; x=1783896189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l5mQgmKArLxQI4sDvoltMafcAkZrrF88mI4MmzB3lZM=;
        b=M81OFEXVidwldlnSQ+E3m9Ns/tECyMGqabmRDJB9GpOjPdqAqqSzeGwQtE73og2IHd
         tFU1EQsfKzIrII3DkWpHH/fL6Kj1FXooHo+FAuHiCxfNKUl9O3NwtJxYBMlnIqIecTb+
         rf8ZM15RN+ZZnkMqWfzsrMnEVCRfEaF6uf4ar72+ovhDQ5XT3p4kxqMQ90tX5VrgVxn+
         0p2CJo7Yyk0Kt+/owaM6oc54cYG2GQLCsCcEFTTPt/E3YUFJxcDzsMp9d8yUn42FtkQU
         pYntIzM6vjCujZvCIF7rPRh5jDc0yt6mEV/GUzdL39Pme18YTT+mgR0Ypm6fQVqbDEGE
         7tDQ==
X-Gm-Message-State: AOJu0YwAZ6mXCWKow/7J+qkxDP7bVZfoZlY8WZtA391fpZcqzelXiBZd
	ZVYQr36R40zav7E9tWPwdw1xeaMa5clIIWMfBR+KArboLL5zNihATM6BSvPmvdTooBa/3xrQ0bj
	aJOvsoXY=
X-Gm-Gg: AfdE7cl54O7DFgG7mrVDk5ccVY+sFvDsKvUaqFfixrxhxV1ZA9zFhzlAb/oj6JPz72V
	0aNrs2518m0AcZuu6tc+XG+M9xBJDm/VmeY5sHqf3DKIr5cv8WFKEMXPJ4+U1XD2gShwNFXbUsj
	oZn4QatcdgvzNZK+Eg6dIvfRDV+2ftgsHXqGUnPonBympW2V+2XUVsp140PD1Q/sD/ua3jes9PY
	LXdPwnFhG+5RyOBsH/sgzS9/leDFgE6L9L2n4mzCWoF4cMYXymwkE8A+4QuXpxTdANMaIQWC24+
	yRWc6mzL/0tw3beqsZcEiqQitiKIgHwdyxKdhM+TqVH0HkA9x/GubHIWb4o6T5iqcDZKV86ABJ8
	WhQ4FdyzKRY9gJWbr1PPk1HNALHBQMblPZMx0CoK3w+B3LguKmOztTVrrkwtUerjh4JXsWxljM4
	3RHF7jPbVZ+VVgIfAFs9ujUS+FHA==
X-Received: by 2002:a05:6000:41d4:b0:46f:ce0c:f1f3 with SMTP id ffacd0b85a97d-47aa92c05f0mr8831851f8f.6.1783291389146;
        Sun, 05 Jul 2026 15:43:09 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 44/55] sstate: Reduce native sysroot execution race potential
Date: Mon,  6 Jul 2026 00:41:34 +0200
Message-ID: <0be0c8ae6a2a70e777fb95eeef2dbcb9db0afef6.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240198

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Whilst this doesn't remove all possible issues, removing files in /bin/
directories, then removing support files (like shared libraries) does
reduce the potential for weird failures if the system calls things like
python3.

[YOCTO #16323]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d595615c6a027b80d6f7ea80ab25e85e97b2436f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/sstate.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 904a4148ddb..4ac63823351 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -474,6 +474,10 @@ def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
     with open(manifest) as mfile:
         entries = mfile.readlines()
 
+    # Remove binaries first, then all the other files, just in case somehow something
+    # is trying to execute something in a sysroot (e.g. python3 from PATH).
+    entries.sort(key=lambda d: '/bin/' not in d)
+
     for entry in entries:
         entry = entry.strip()
         if prefix and not entry.startswith("/"):

