Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66851C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 08:51:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.6780.1633337491966850484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 01:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g7hyFw+0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id r7so13929295wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F5E/K90MkCIivHNfSeLZDUHobmlu5JsMW2S9oyeirXQ=;
        b=g7hyFw+0NIOxi/PVxQltFgOEktSfdt2h01QdZLfOsD0ONjCjPlcjdn06IJ3ATaatUc
         S0rivqjAJywAJaeqXvJsA2Uhrs2ok2z1y9Mpe3qWP9b1Z0gXyg8sYQM92dg+AFMizGPS
         UJAqoqtGZ2Gb+7z6Ie+2N+DwDu4OSuazOsbwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F5E/K90MkCIivHNfSeLZDUHobmlu5JsMW2S9oyeirXQ=;
        b=q1g237Jw6sN4zNilOCInlEcPV9I/ptBXOkG3BOPhx1+h3J4ufVNmCHWzRux7qN6vsE
         sJXv0Uji2Ei+VRXVluLvL5uvX3JhFnEachARpzeHrOo+RHmKmHQ5k8ELY07IkFf93XqP
         SBfOcA2Sy9Qaviivl5c0oDm8h+K0k8f43uUVDazn6tz0NdrHk/vhsvuL6Wig1dTgQQhF
         g27xN6cZAARbwfXt2PZM4+0wVLIQ2TY3mMGdiWGPKj/1X+jfPLDA7nl32qLbKbb8aHgi
         yDoTm0MuSFVOpRE1d1Cch5wTLF1uAAb490e30eo7oRkp5gclmVwQmKwAcuR61hi2urXj
         phGg==
X-Gm-Message-State: AOAM533lfw3PAkA7NQQTxbQcsmjUC7U/h9nIewzky0k47Of7ZtiQ9CWz
	AYQq/5cOaSaAw4/5qsWKWVvXmrxHe9AqeWB2
X-Google-Smtp-Source: 
 ABdhPJxEsKxk9RFc0kQpkz0ZDi77rRppUb0ctUN6v4Wft+RbjunBbtCiLBTA4uH6SixGFKqeMdAjQg==
X-Received: by 2002:adf:a3d9:: with SMTP id m25mr12822233wrb.27.1633337490203;
        Mon, 04 Oct 2021 01:51:30 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:430c:546a:1bb6:a9bc])
        by smtp.gmail.com with ESMTPSA id
 y5sm10561664wma.5.2021.10.04.01.51.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 01:51:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Set vardepvalue for PARALLEL_MAKEINST
Date: Mon,  4 Oct 2021 09:51:29 +0100
Message-Id: <20211004085129.2320298-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 08:51:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156577

If you leave PARALLEL_MAKEINST at its default from PARALLEL_MAKE,
sstate checksums are fine and don't change as the number of cores do.
If you override it to a specific value, this does the cause the sstate
checksums to change. We don't want the checksums to change if the
value of this variable differs.

Therefore set a vardepvalue so a specific value is used for checksum
purposes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a207cbb33d2..1239206645d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -604,6 +604,7 @@ LINKER_HASH_STYLE:mipsarch:libc-musl = "sysv"
 # Pass parallel make options to the compile task
 EXTRA_OEMAKE:prepend:task-compile = "${PARALLEL_MAKE} "
 PARALLEL_MAKEINST ??= "${PARALLEL_MAKE}"
+PARALLEL_MAKEINST[vardepvalue] = "1"
 # Pass parallel make options to the install task
 EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 
-- 
2.32.0


