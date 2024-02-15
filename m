Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AADC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:58 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.17948.1708013930688345776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=le6pfBt8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d95d67ff45so8112135ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013930; x=1708618730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlRDkwEfao+zHfAAkg8Pr/uGOuDVJAnm+AjZ4eJu1iM=;
        b=le6pfBt8LtmYnL2+pLFxgdLzy/pZhqqsWIML1jZz0QFad8vaAhopRtLAZEgly6FT+T
         O6XVrmpPI+AA17432HnzHNd5Mxx0kw8wHzT1ealTIORF1hvrfDmVy85LlUben8RObxV3
         xlGQ1xAtmVa1XtnXVM9zfrRJHACHchtTnQlqEOd6PUqQsA5V5JTU8LyTFFJWFvWgv9UP
         T8QSAuz4Qmx5ViZPiWpAuwtgJvrW0TRSCcw1qdEmHYhmUkI7j2XItQ1EfBC6FSZ+dmkM
         0VTmDONyE9W66yk6bn0WluPZOogLfBF41SnTTMVeJ5ONOyJfVxrqNXklnFSyKaWYZDaZ
         ZnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013930; x=1708618730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlRDkwEfao+zHfAAkg8Pr/uGOuDVJAnm+AjZ4eJu1iM=;
        b=H/y/IUwHLvzDeiW+4QNuAej0LbFb05f7vVGdGxApVSlB5Hp3mbLlj8u8zW8L1LEtjM
         DHV9XKF6gFi/DLdPDWOJzdc6+419kOtIZkUm59HMrQqYrrNFCBCx7iRX33jEQKyJ6VQx
         cyRVI12oAXUPBBzhqqhfUzQVzRCcFZDLROxWU6na+/np52tcwguTI6StDvWSV0mp1Pvr
         qwuOmbMg8fvw8izhFMgjMBCwFWYByBqpaZdO+Sm1draeMuTfncTxIDRYumOZa8huTndM
         2mG4cCNKubncEy+kymDgIhDa72E2Mbj0kMoKEXA3FIYjAwP1exjhO3dCRHpjmZVni4zX
         9qHA==
X-Gm-Message-State: AOJu0YyLaz7jbarz1A89eBt93jJXAaOnHN9XO1tRDkDxlXAK2bmeeIIp
	oDM6cpMS5Q4/Ob4ZM65lYpPGNxR60LtErRD+ogeOASDDcQgCGmRAmjj3Pnd1SEC1Gkjo6y909gf
	W/g4=
X-Google-Smtp-Source: AGHT+IGNY33yz5ySKCE/M5HKE9AtcbhF87Ldj0jGKKRmNydbG1C/VUVmQMQMrUvpdreL0+nEmFkDVg==
X-Received: by 2002:a17:902:e551:b0:1d9:5ef2:abdd with SMTP id n17-20020a170902e55100b001d95ef2abddmr2916127plf.0.1708013929980;
        Thu, 15 Feb 2024 08:18:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 21/21] multilib_global.bbclass: fix parsing error with no kernel module split
Date: Thu, 15 Feb 2024 06:18:04 -1000
Message-Id: <82dd61aade02456621cd2958b2fbb56236062789.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195541

From: Chen Qi <Qi.Chen@windriver.com>

The problem could be reproduced with the following settings:
MACHINE = "qemux86-64"
KERNEL_SPLIT_MODULES = "0"
require conf/multilib.conf
MULTILIBS ?= "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"

The error message is as below:
  bb.data_smart.ExpansionError: Failure expanding variable KERNEL_VERSION_PKG_NAME, expression was ${@legitimize_package_name(d.getVar('KERNEL_VERSION'))} which triggered exception TypeError: expected string or bytes-like object
  The variable dependency chain for the failure is: KERNEL_VERSION_PKG_NAME -> RPROVIDES:kernel-modules

This is because multilib_virtclass_handler_global function in
multilib_global.bbclass deletes KERNEL_VERSION. So we need to handle
such situation. We'll also need to delete KERNEL_VERSION_PKG_NAME
to avoid this parsing error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43dd497bc161ac44faecfdff052db03679dbb4f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/multilib_global.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index dcd89b2f63..6095d278dd 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -195,6 +195,7 @@ python multilib_virtclass_handler_global () {
             # from a copy of the datastore
             localdata = bb.data.createCopy(d)
             localdata.delVar("KERNEL_VERSION")
+            localdata.delVar("KERNEL_VERSION_PKG_NAME")
 
             variants = (e.data.getVar("MULTILIB_VARIANTS") or "").split()
 
-- 
2.34.1


