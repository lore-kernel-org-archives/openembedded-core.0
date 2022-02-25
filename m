Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D071CC433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:58:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.7272.1645801112870070517
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=acPOnUSY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 n13-20020a05600c3b8d00b0037bff8a24ebso1842414wms.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9EE5uXwyZFQqEVSExCWf03Yto8pZOcYKn35SnXQAago=;
        b=acPOnUSYjnpUO4kr4D0N6JNLFCKdA1cSH2IUcphp3RkRz7Ys/Ew0w+yHJj0l3UHWxQ
         83gZEJzimihY8aCviY8Wu5o9lTl0htM99YxKCPbtYZB1+mhg572uHbggl+dS856Qf+Re
         wGhNQTO7qYPhmxyrpD2HUUd0mu0oDTWTuq+ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9EE5uXwyZFQqEVSExCWf03Yto8pZOcYKn35SnXQAago=;
        b=T/+E8ixnNMDcs+0fmvxuOfaSlnykrQRc2XEs/vaa4HESi776ylBZihoRSak5UEKwdv
         N4v8DLrFiANUTqQEzFkU8irpJAMz4YmbliS9TwYms6CclQd0nN5fWxB3RxQ+G4ot3RB3
         A13mWt2bIRYxZ74LM/9SYZtbRUm+27sQVu3NkeWS02TzZuGNJNA0W966Ze0lqGwcRfBl
         zAzy39vwYpKvD+sj6RyDT9x1TI6AVVhPODnNxGrYmM/o1nXJTTJO+fF2Um3SE0AQChHi
         ml5pVJeZextC4Ub94xqheRZKoaP40e4BShBBu/LcioWhK6f4VGu68QRLKba6WYw4V+sr
         z3sA==
X-Gm-Message-State: AOAM532YW53kfxrO68oGwNPJ4VCEjk2WMnjOefN2swm3RX19cvpU0ozj
	+9f4HBabp07LJAQv/U2O/DQFVQsXdOiiwANu
X-Google-Smtp-Source: 
 ABdhPJx9a+wbBbtUlenWp9EUlOD1ie88cGckTgm5EGr6DxDnvJn/17/xSv4UGy5Dwv8DnLEVsteEgA==
X-Received: by 2002:a1c:f018:0:b0:37b:c13c:3128 with SMTP id
 a24-20020a1cf018000000b0037bc13c3128mr3049655wmb.157.1645801110757;
        Fri, 25 Feb 2022 06:58:30 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8c05:a731:3c1:5d08])
        by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b00352cdcdd7b2sm17121733wmq.0.2022.02.25.06.58.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:58:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] pip_install_wheel: Recompile modified files
Date: Fri, 25 Feb 2022 14:58:27 +0000
Message-Id: <20220225145828.88238-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225145828.88238-1-richard.purdie@linuxfoundation.org>
References: <20220225145828.88238-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:58:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162400

If we modify the file, we need to recompile the pyc files since the file
hash has changed. This would otherwise result in reproducibility failrues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/pip_install_wheel.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
index f0312e0b1eb..8a848c0ebab 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -32,6 +32,11 @@ pip_install_wheel_do_install () {
             sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PIP_INSTALL_PYTHON}," $i
             sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PIP_INSTALL_PYTHON}:g" $i
             sed -i -e "s:${STAGING_BINDIR_NATIVE}:${bindir}:g" $i
+            # Recompile after modifying it
+            cd ${D}
+            file=`echo $i | sed 's:^${D}/::'`
+            ${STAGING_BINDIR_NATIVE}/python3-native/python3 -c "from py_compile import compile; compile('$file')"
+            cd -
         fi
     done
 }
-- 
2.32.0


