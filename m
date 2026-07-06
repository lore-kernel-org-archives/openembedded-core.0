Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB16BC44501
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 14:06:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150849.1783346771222656904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 07:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QJvYFz9W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so16518785e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 07:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783346769; x=1783951569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oh/bC3N5FYQzTlKU40SbG61eqU/lIBRSv+nPSiQlxvc=;
        b=QJvYFz9WzEldaXYa0xibhYG7NbbhgBUOe3h6zD9HYJihyOFFjuQ8bos5JERxaW1BvF
         0LNvV42Z5eX4F22A/m3GHYN6QlNqmrjWqzpIPg4WK+na9Me+PhbUraOAsif5tJ0wD9w2
         kvdXHppdDaCPLpjXVav+NpVtUTRQ4ThGefo4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346769; x=1783951569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oh/bC3N5FYQzTlKU40SbG61eqU/lIBRSv+nPSiQlxvc=;
        b=ILitjIJeUe9JVkBUBY/CEgg0uoUX5vRby60PprnQUUjNYlwnUXs1pd++nqlfyAJfPA
         F5rB+glYxBWunRZi2ThkqobKt82Di4Hxkpzj6XO5qxFyoytgMN95I7Y/goeE75fBANIk
         bAOqQvT9kl7LmQ60dW1OCdh/V5tdFqRVPBzyIcRkZffpRfNs9ojcRG2gaj4RWO1p2lyr
         ncucaLG0vCmHrPptH24mA7jDiaTKrHg8zJyX72dtfvf2prN3lzyalosvXaIBdier0Duc
         9wgDaljNENd7ZTyTffGnHs+Cx2muFH9pB6my3c5otgzf/IJO0AngH6A+XDfgMkoThrcT
         mkOA==
X-Gm-Message-State: AOJu0YxSsrcQQuu/Ua8UHTrpl6+4wkXtNIS55vQcZfzJG15SVlThAwyv
	Yhx3EiLsXCt4MFmp7UdeAJEu+1B2Al7I/2qPCkEnaUOEa7zQHItpRwzLrx3AnGCOXFZWr2lbWnr
	uU2+BuIM=
X-Gm-Gg: AfdE7ck55hTmyUH01e16z3HVmqTwl7E4yi2zFWbSELb8U7rnox3OeoL83+zZXOJ84y4
	Dg7CYp+EbVgTghUQHeUWBrUR385vH1K8WFzTWLifA1Tei+QMB3n1fjE7909H1/GykmHiPvwGTT/
	YFHNtAemQeNYR59dkdQtEguPweRJOuWSIYBnJLAGfUaXYXUNtf+NOVoAHFbnxc0c7T0Fp6EFUPl
	naX9zQvDvvnzZglLSdlnuvxg9AbbbZmUx+Sp6mv5ThLcj733M8Qw4g9xmJXfFe4qOX1MSvNE26U
	wm1eu68Zl48FfG2U16N0lIV4TdpqiImi+VMAhglZdpHB/LlgHUkpPJtmF/vYVg9MfHb2Ij9EcNq
	hYToLduZ/H7ZlbEedx4w2CsBR4oBcSqr47p/ySFkGyPvx5LCntR9n361StPthmdLyxWofBV5hr9
	gCmIRfN5eybR9R3yV2K/v1rZAdsGytAot4JW1lloJutA==
X-Received: by 2002:a05:600c:c167:b0:493:c98f:12e3 with SMTP id 5b1f17b1804b1-493df08f73cmr7561985e9.20.1783346769411;
        Mon, 06 Jul 2026 07:06:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3cdb:498e:44d8:3112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm426975175e9.15.2026.07.06.07.06.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:06:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] package_pkgdata: Drop unneeded vardepsexlude
Date: Mon,  6 Jul 2026 15:06:06 +0100
Message-ID: <20260706140606.1021674-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706140606.1021674-1-richard.purdie@linuxfoundation.org>
References: <20260706140606.1021674-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 14:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240274

These vardepsexclude entries don't make sense as the function no longer
references them, they can be dropped.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package_pkgdata.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_pkgdata.bbclass b/meta/classes-global/package_pkgdata.bbclass
index b2f4e7594cc..d2eb8249370 100644
--- a/meta/classes-global/package_pkgdata.bbclass
+++ b/meta/classes-global/package_pkgdata.bbclass
@@ -170,6 +170,6 @@ python package_prepare_pkgdata() {
 
 }
 package_prepare_pkgdata[cleandirs] = "${WORKDIR_PKGDATA}"
-package_prepare_pkgdata[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA SSTATETASKS"
+package_prepare_pkgdata[vardepsexclude] += "BB_TASKDEPDATA SSTATETASKS"
 
 

