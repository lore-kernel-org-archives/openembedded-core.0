Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8575C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 23:22:28 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.11659.1683847339335454106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 16:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ms5gJEWT;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so16328109a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 16:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683847337; x=1686439337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2WsTA583fzrBARrI3rRtRCEDjlThqmJE2E4DJIP+pI=;
        b=Ms5gJEWT8uM50hhs6t2qt+dxmKcJpZbWaQ4r1yebZHznajbytRnSHBnclxjeyHP4Uf
         WpFZdZGvjlJCR6Hlsze6jbR4iLwjRkDUsb04IEDxQrj3k0aZigs1YWMHbPfAx25ScscG
         XxSryvoMh/MaMjegms+u4EBCdxZiTH/fbt7dPUJ9EerzU7gbhZuhjcz2S+kzh945TCK/
         V3/crtVCdiZ4F7+jr5RdPic4QI7nPDAJXEJOTXrpqKV6iXudPnhKA7fWB65wayvq4mXL
         Nvklal3613O32XRqhlGz/eLEPjvTEZqqREAxeyptfajA9fk3tQi+hIOnhd0IR8vzOmRH
         8DXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683847337; x=1686439337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2WsTA583fzrBARrI3rRtRCEDjlThqmJE2E4DJIP+pI=;
        b=cdpHFrVR4gpMHZ/Fw6Fszn4GWGhOtgaQQ3MgIOFBlX98GdDzpy63HOXQ3hQEfvoxDa
         ghDnRdOEQenCJ5g3hviAJPoML/ugi/dt5qw0+bQGj+YAKdxQ1RgdJLQks2WJBsdFuoNi
         CrSj0Z7XkXhCSzHcHeJkv8HeXOA0eF01cW1TKSmf6bqZ8GhUaoVDIDYWPrxYz2spQPJH
         p7aBcyPjnmFjbv2FlYDpoFXsYiBeSIKuGc6VaQa4Ag1ERaVRw8fWOtGotxlFbO+LaRix
         sREPwmI31L7cxPsMO28RGdm2jPYpvaQsLxrlKBGuR7nhrJrelzBxozPvyZIpkvn4hJr7
         nsfA==
X-Gm-Message-State: AC+VfDzQt7uKMJfSUGUCdDayx13loH71WBFqevxgCOaslXfAXraBII+v
	kVYd+vZPgdCvkFs3mNX5J4Ivc+ZemqU=
X-Google-Smtp-Source: ACHHUZ7+GaIMl4cIJKpyOaM0ky1GCHtWBZF332Xj+SOCFq6X4hhqFnCloenUK+Muftng+4I+U1Uh/g==
X-Received: by 2002:aa7:d8cb:0:b0:50b:d76a:7904 with SMTP id k11-20020aa7d8cb000000b0050bd76a7904mr16580902eds.28.1683847337646;
        Thu, 11 May 2023 16:22:17 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id n25-20020a056402061900b0050a276e7ba8sm3480162edv.36.2023.05.11.16.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 16:22:17 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	alexandre.belloni@bootlin.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v4 2/4] libtraceevent: fix qa issue reference to tmpdir
Date: Fri, 12 May 2023 01:22:12 +0200
Message-Id: <20230511232214.993328-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230511232214.993328-1-max.oss.09@gmail.com>
References: <20230511232214.993328-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 23:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181169

From: Max Krummenacher <max.krummenacher@toradex.com>

Make sure that the OE provided CFLAGS are passed to the compiler so
that the -fdebug-prefix-map and -fmacro-prefix-map options are
actually active.

Fixes:
| WARNING: libtraceevent-1.7.2-r0 do_package_qa: QA Issue: File /usr/lib/libtraceevent.a in package libtraceevent-staticdev contains reference to TMPDIR [buildpaths]
| WARNING: libtraceevent-1.7.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libtraceevent.so.1.7.2 in package libtraceevent-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
index 089b6814c7..b5c0834d89 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=$
 
 S = "${WORKDIR}/git"
 
+export EXTRA_CFLAGS = "${CFLAGS}"
+
 inherit pkgconfig
 
 do_install() {
-- 
2.35.3


