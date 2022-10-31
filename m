Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9D9FA3742
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.8314.1667216863355081333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 04:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eJlI3eTs;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id t4so6963712wmj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 04:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMSWH+drMsjYQY9jJSI8oQ7BW29FdqpWVjWqLoG5D00=;
        b=eJlI3eTsKA5VtMOX3Oof554np4CfhYlcyai2AoPC+lzMxgVsoP/MvPCRqe1ir8HgcN
         fEwVBqSvdu6/87IeoGJwu58pIDauXZ2wqPMwGimVrvLrGEZgLFk0srb/oCTdLOEHxOI3
         XuyusdQPi8Al+7XtgE6BKziDsGnzpVmnXEdZXDPcagn5qIkY5zJllwOxuRnT2N9qe5oe
         RTcvhjmYqg6XDSyh5bmxXmflnbjvq9ajFcWESLlLTwyTpGPiUykM8NEPbhmorfjjX3tN
         W+W+joNdEtMjGPKulefXgpbjLQEKsveUn0JiYEJXGhkto2xafsJxcP+94cxuAQhUDpeL
         H1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMSWH+drMsjYQY9jJSI8oQ7BW29FdqpWVjWqLoG5D00=;
        b=nR1tw55D1PDzmCW0qCC1MfF0/Ss6eyXIF4dQEmEgRW6m3spugaMc3SF2wHjx59v0tF
         m43rcaaCOLTjZSvowF+rVIeHpAUdiJcGb6IK8H9C4JgbQ7E00fQ3qEykuesNtEJQAX8e
         tR4XNJpmpPa1nIvpK5bDF2OZKYCAPX5mMrOE3RaGx7no1AQS8JHRjS6vZXQ0IdQ4rx3r
         m487TCxc4itSS8hHfKGboU96LzUFGbO5CYpdCTF980gDrVe9C8m8Rj5/6pd6wx/sMqEI
         aX1DFrKzDoJ6SIsNC+uWMN/UYGpw51QkNf97fj06LNxLaxVMF239taWEpzebEMNVLWRK
         IFCw==
X-Gm-Message-State: ACrzQf24/tykdsWgVS1dabog7s+/OoNWBJctXrjIFYZsNA2jIH3yNVc0
	UXWeLkEWiCfKv+nX4UMNtDmkB4OluY8=
X-Google-Smtp-Source: AMsMyM4jthwS54Siw5Bv7sDJPxuM2u6PvX6JFSZSRG1Iz1HcBnm+l34vi4syXp3+/rrNm9yWtAPF1w==
X-Received: by 2002:a1c:46c5:0:b0:3cf:75ac:101a with SMTP id t188-20020a1c46c5000000b003cf75ac101amr1412111wma.196.1667216861708;
        Mon, 31 Oct 2022 04:47:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b002366e3f1497sm7017965wrb.6.2022.10.31.04.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/13] tcl: correct upstream version check
Date: Mon, 31 Oct 2022 12:47:12 +0100
Message-Id: <20221031114719.2725967-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031114719.2725967-1-alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 11:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172308

Sourceforge does not report the latest version reliably.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
index 9f6b003ffb..f8b2a69b9f 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -33,6 +33,7 @@ SRC_URI:class-native = "${BASE_SRC_URI}"
 # https://core.tcl-lang.org/tcl/info/7079e4f91601e9c7
 CVE_CHECK_IGNORE += "CVE-2021-35331"
 
+UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
 
 S = "${WORKDIR}/${BPN}${PV}"
-- 
2.30.2


