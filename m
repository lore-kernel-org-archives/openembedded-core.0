Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439C6D65540
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 18:07:24 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.52967.1732644436385440547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 10:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VDBmd3Ou;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-841a565f871so75124339f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732644435; x=1733249235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8Yl+q43QDokrMhOBIUdtiKZPjvJUe63+ai2keuAgmc=;
        b=VDBmd3OuXv32mFDH0PwQGDfO2r4WNNpp2LQSXSUzcBEJrU+DpcR3wk1ieAbTt0ictp
         kJ/XV/2GNkBwgj1kjcxxuLEN55k+rPE2Oy2tqF7aAKpAboYHS+x+c44l8qmi9V/Qo3f8
         9uwgMwZH8pV9bf10/knhukNDiMqm93dBMbMd8XW1m6h2ZgzvjhPa8q+YdrvSQcKmNkwr
         vzUPnMIIAGSBSWbmJTd7+GtTmwngrzFO9jR5U2cj2a1eMichpgShbTx0ACmeAfCiJpzd
         NENyevhF1iExrHXtDOyoGNxQpWCHJo1uwq2sSjsYWloZgtOaKniCo8nt6XY/qwkDVN8a
         IiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732644435; x=1733249235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8Yl+q43QDokrMhOBIUdtiKZPjvJUe63+ai2keuAgmc=;
        b=hB9WVT0pv3sSa54pEwVLxSyVyRkSB9u2Ai27ozrXeaYQR38ey/Fm24nViC/hMYGhIM
         YzD2J0gz3qAAqijXFOUokUIZYsox/WB5bdZG2y1dirjZM8Q/qbuRqLAStck61EUN6Lbi
         p9ijMnrg8UxJlK+SzFZLdhN0Mj9xP5b5inKEtHg2CUalHWtfqi3nlT8ZOfG7dzh4aGls
         BZaZVerS6XjrgNpAkUBAYaynvfW0FIrHigLIlLzCTZ/cazPwL7qwXv2X9ZQE7HuEcTuG
         Kk/+doBFKVjVlO3h24/oFBrOKfYBnzZ8ZpCuNX0M5MgU/gnihN+jHZLSO1INm/Kn3Hy5
         4AWQ==
X-Gm-Message-State: AOJu0YwCvmN5ohq5PJb5t/hZxBFjJ0WojRP/kQQr6JPIqDLQc19ZIxQC
	D0OIOcvsBZ7pAcfaMtWB0Lz/XCNvnJrIj1cofETBgOKx5lUcQ3HOTT4OeQ==
X-Gm-Gg: ASbGncs0hqp64o18bTTFmR9SPSSL15zZMKucWPkeVay/MYKJT5cas+jGsb/dFpmUewE
	YGWY1utSHYM5O0OxdvY3vj/gCHWbQvggxIGv2cTZBVCGLFi/W8TWlMpKIRjF8v43dkzCelQYTP9
	ytLT6CsmbBkxbvHvTtq49Bcu/JV51VX+IecqiOn0rKBN3QE8xn8vU6lWMsHyFktqHmgkxUR3nMn
	hybcldnRdTvzdBr8SBqsswp90Ark3O/ftEi4gBQl8c/dtA4gH/XKq/my4klH0aHQFiWy6pMmTPS
	8zMmuA==
X-Google-Smtp-Source: AGHT+IEVRmMRJ/XeMBiY36tr39uqJmnxtXgV+BJ8bAo3dQeznykmbaGaS/JuhEvCkRXsnlcmg+u4sQ==
X-Received: by 2002:a05:6602:160b:b0:843:e507:3e32 with SMTP id ca18e2360f4ac-843ed0bdd63mr45609039f.13.1732644435290;
        Tue, 26 Nov 2024 10:07:15 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e1de859f85sm2251899173.30.2024.11.26.10.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 10:07:14 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH v4 2/2] python3: package tkinter's shared objects
Date: Tue, 26 Nov 2024 12:06:42 -0600
Message-ID: <20241126180642.2022572-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241126180642.2022572-1-danismostlikely@gmail.com>
References: <CANNYZj98i-RU060Hjxx3PgX6guCvfkzY5-_mE78-yVwz4Ks5ug@mail.gmail.com>
 <20241126180642.2022572-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207880

From: Dan McGregor <dan.mcgregor@usask.ca>

Seems every time python is updated this gets removed. That's likely
because the tk option can't be enabled in python3-native without
creating a dependency loop.

Instead of manually editing the manifest every time, explicitly
add it in the recipe as suggested by Alexander Kanavin.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/python/python3_3.13.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipes-devtools/python/python3_3.13.0.bb
index fd926811a74..a393b5e4a07 100644
--- a/meta/recipes-devtools/python/python3_3.13.0.bb
+++ b/meta/recipes-devtools/python/python3_3.13.0.bb
@@ -427,6 +427,7 @@ RPROVIDES:${PN}-modules = "${PN}"
 
 FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
 FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
+FILES:${PN}-tkinter += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so"
 
 # provide python-pyvenv from python3-venv
 RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
-- 
2.47.0


