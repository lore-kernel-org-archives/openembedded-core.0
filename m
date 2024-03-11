Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED5AC54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 14:37:21 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.64558.1710167831634236993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 07:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U5LEAYAz;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a462a1b7754so116604866b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 07:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710167829; x=1710772629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O70o9Xs97e1FUXLWiH0x5CdsA2YtTuUNNq3quQTToE4=;
        b=U5LEAYAzTZ2bjypu52W/YOAzVn/CgYY01rFliPCgJyMwLQfcHvqo9bGnjWZJr3xIsP
         HYSy81BnIv9XYI+TnOgjwnHGYZbSpaW9xSPOmUHTPBGAQ+aT8o8iSZTIhX4dhwzuX1Qv
         ZzvBb0XTP4CDQHTkNm+lpkSgQFKsxuIA1twm6AU4r3z0zEwbtg4TNOCe2CbTc2T6qA2L
         3sEFHlKLYqRFdSnqL0lSIxhyIxVS8eAGax3YvCHsbGdIE3kmk8tW/cOHpJvoTrudGzNd
         V4DP6MS8o9Wt5qnjwyvZamFiHfPZzia3LbRHyWn/P3oEu3Aya4rTH8ywwJiSD5nXLshi
         Qd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710167829; x=1710772629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O70o9Xs97e1FUXLWiH0x5CdsA2YtTuUNNq3quQTToE4=;
        b=cjvzOuuNsYxnSU4Fe+azuGg/l3O7u0vJVoSFR71LIwVouZWt2Fr8AVL63gYhBoWUsG
         TThZVCJH5zLjEnSFPahEz51AF422TnqdBQQz193ndIkrOXEbNTKfDoxnxZKFfFDqwHFQ
         YW9gRgSVm2v0y6u7UIImtbeEtC2kWo3p98G94wnNR8rOjy0oW0Dp83T4NY5PSRIMGsy8
         mWHCIuTAY6lgR1UmYdMwPfvkDq2jnryK06hgnUGVl6pCzUHpzv4ROV+YcBj92Z3JsRNo
         3o/gG0vxz9MluIiOUg0DEcKIyCK+dylbyDF1K5ZaVlih0CQCO5tLcFStbvf19/61msH5
         MxTw==
X-Gm-Message-State: AOJu0Yz6DKK+PXB1PCrKctoM/Lx8G+gWKpHPr6Wdkg5fIso2qDJZSFKM
	qnwmAzM+3vySs1XfxGqmwJu/G753cOK+LZACL0fM65H2132MYQx0yo+Rh6vI
X-Google-Smtp-Source: AGHT+IHmzHO6DU83kI5v0qQFqPwAUtOlGCdRxb3Bm4jB1GhjWM/38p6otXhbH4s1kB5JKYJcmrwL4A==
X-Received: by 2002:a17:906:b11:b0:a3e:e678:556 with SMTP id u17-20020a1709060b1100b00a3ee6780556mr4117928ejg.58.1710167829259;
        Mon, 11 Mar 2024 07:37:09 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id uz17-20020a170907119100b00a45cac9ae6bsm2893308ejb.162.2024.03.11.07.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 07:37:09 -0700 (PDT)
From: max.oss.09@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	max.krummenacher@toradex.com,
	max.oss.09@gmail.com,
	richard.purdie@linuxfoundation.org
Subject: [PATCH v1] git: git-replacement-native: depend on ca-certificate
Date: Mon, 11 Mar 2024 15:36:55 +0100
Message-ID: <20240311143655.1781388-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <CADkTA4N5KcudMaimcs46Ph_Uk6ZQaFM-OLqSqECyT5QYJ_z_tg@mail.gmail.com>
References: <CADkTA4N5KcudMaimcs46Ph_Uk6ZQaFM-OLqSqECyT5QYJ_z_tg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 14:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196943

From: Max Krummenacher <max.krummenacher@toradex.com>

git is delegating webacces for URLs using TLS to libcurl.
However our native libcurl build does not find a ca-certificate.crt
unless its curl-native work dir still exists and thus git will
fail.
If a recipe uses AUTOREV with a git repo using https as its protocol
parsing of that recipe will fail fetching the latest HEAD.

Fix that by depending on ca-certificate and give its location
to libcurl via git's envrironment variable GIT_SSL_CAINFO.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-devtools/git/git_2.44.0.bb | 3 +++
 1 file changed, 3 insertions(+)

See also the ML discussion:
https://lore.kernel.org/all/20240309175750.2621579-1-max.oss.09@gmail.com/

diff --git a/meta/recipes-devtools/git/git_2.44.0.bb b/meta/recipes-devtools/git/git_2.44.0.bb
index e6d1470873..90e555eba7 100644
--- a/meta/recipes-devtools/git/git_2.44.0.bb
+++ b/meta/recipes-devtools/git/git_2.44.0.bb
@@ -4,6 +4,7 @@ DESCRIPTION = "Git is a free and open source distributed version control system
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.0 & LGPL-2.1-or-later"
 DEPENDS = "openssl zlib"
+DEPENDS:class-native += "ca-certificates"
 
 PROVIDES:append:class-native = " git-replacement-native"
 
@@ -95,6 +96,7 @@ perl_native_fixup () {
 
 REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"
 REL_GIT_TEMPLATE_DIR = "${@os.path.relpath(datadir, bindir)}/git-core/templates"
+REL_GIT_SSL_CAINFO = "${@os.path.relpath(sysconfdir, bindir)}/ssl/certs/ca-certificates.crt"
 
 do_install:append:class-target () {
 	perl_native_fixup
@@ -103,6 +105,7 @@ do_install:append:class-target () {
 do_install:append:class-native() {
 	create_wrapper ${D}${bindir}/git \
 		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
+		GIT_SSL_CAINFO='`dirname $''realpath`'/${REL_GIT_SSL_CAINFO} \
 		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
 }
 
-- 
2.42.0


