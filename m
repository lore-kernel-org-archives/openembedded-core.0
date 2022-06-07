Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696AACCA47C
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 20:53:06 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.2684.1654635168297555608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 13:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pdf8rdrW;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id n10so37618500ejk.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 13:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lJG1/Vl0zqcVEpwyoWhH2SN0yXogMcZ48lFyGE3/AEc=;
        b=Pdf8rdrW4dIxnNIFGrBZu11orht0ZoDFxHaXAW9SJ6OKZ8r9cEpPqecfnfVrNt0N8r
         Lc9XI7VwEBIWUycLYrZuwAP3qHO/QXSRtg4x/wnmxXZe6uo96j3+wuTh0THYFazdnBqK
         41iaM9RA8tdCrGiqcAVaj2wHgXri0Bwn6XMPubAKPEiJZ6l4nxMoScJdC9kmIpZDtCi6
         Bo5PdXrLDW9+XJ7xkY279IKE/jpxXvv09OGUfaPCVEk5Y9Vb5wXaE2AVVdU22K8BvoDY
         wlgLL8YCUwPPRgge4dj+Il7ok1plja4CHdalZkY0c2f1QjEJrTT1pJ75rRNVhIFHjkWH
         7ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lJG1/Vl0zqcVEpwyoWhH2SN0yXogMcZ48lFyGE3/AEc=;
        b=ga50XjnuaOnwTUAFS7wkCfskSolmxjz2oDwPiQ+2qM/Hl5PPFcepw+1lpykLHro5fI
         axfCw26EYknX/5St/tadQT+IDDHBGzSpXlnSW3hHoCc7QqamRZwT5oafQHYbUPxdKC/O
         k57gA190RKBijP56TxrLC683s9/2WmBW7QFOCQmC0DUFzT46AezZXeeQ0WVa42ius6Um
         E38tU3VuwE8GQVuLDRVFDrtikMqT008aOumYX8hIx1dw/4axEHnRMiF5+GraqhVKCEWC
         ckl2Tk8UUCXl60f+Sy+Nae/KVpTPMJTx494H57AjiA4MJIBY+qRav6GVhN96ZtNVLC8N
         Kq3w==
X-Gm-Message-State: AOAM531KktfgxYYGO38vaFet5CEu8qJrWGN+kSvnBjjozNZuzUopehpb
	1ozbubfNiXRPTGDD9py3a2gVAM8rS1c=
X-Google-Smtp-Source: 
 ABdhPJyQiTyogfr/dBTY9p6/tXoDxvgX+fiYw4spP3a8XgXLiO/FVsA6uf/MSHuFI2AxiVDjv2g0sw==
X-Received: by 2002:a17:906:1f07:b0:710:2911:378c with SMTP id
 w7-20020a1709061f0700b007102911378cmr20409346ejj.8.1654635166748;
        Tue, 07 Jun 2022 13:52:46 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 qu19-20020a170907111300b006fe960c5c5asm8206592ejb.126.2022.06.07.13.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 13:52:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] buildhistory.bbclass: fix shell syntax when using dash
Date: Tue,  7 Jun 2022 22:52:41 +0200
Message-Id: <20220607205242.1773119-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 20:53:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166686

* fix:
  run.buildhistory_get_image_installed.791888: 198: [: unexpected operator

  introduced in:
  commit 82e6172c1df378dff4e503aa878501c08937b5bb
  Author: Andres Beltran <abeltran@linux.microsoft.com>
  Date:   Tue Oct 5 00:34:15 2021 +0000

    buildhistory: Fix package output files for SDKs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index e0853f1abe..0cb81e80c4 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -508,7 +508,7 @@ buildhistory_get_installed() {
 
 	# Set correct pkgdatadir
 	pkgdatadir=${PKGDATA_DIR}
-	if [ "$2" == "sdk" ] && [ "$3" == "host" ]; then
+	if [ "$2" = "sdk" ] && [ "$3" = "host" ] ; then
 		pkgdatadir="${PKGDATA_DIR_SDK}"
 	fi
 
-- 
2.35.1


