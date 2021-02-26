Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.8929.1614344477387837955
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q6xD6ijh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id a18so293044wrc.13
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fl6weBP1JOQsXnbz0jY7JpnzcAWTTY3R597CrCmOLCs=;
        b=Q6xD6ijhrjQq1YuMjG17g19GOEDw3+aViRt8Nnj7XdW521Ljn9c39v9joxQWOJTg9m
         +AGKofDed5F46xo8NLYeX1LqCPXUpnUP46leM4kLAp5DElx+0+0aicpOtEjRcf779vA7
         RawS6bJyK0ITE5FNbLUxi3f73bQDrwzcmXMFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fl6weBP1JOQsXnbz0jY7JpnzcAWTTY3R597CrCmOLCs=;
        b=QO5xirsJ8WLPZFdgY3F4k8b2paJq1EwBWDdzIcmuj7XXAeYhtNdVrzwtLvtagUByWU
         m5uQSYqc7kzLBjbpE14+4oc9MU6m03arQVxG1tBaQENZ/6vnQmNWXpdYPZ3Y7TkKhxX3
         5N8ttMdI7lM089kOAINinD0f6563JkvfRjqIyoXAh99DCPt7klDkHxiUaqHTxajwhbTW
         hBHpvpnK7gaLlqWARjiedFLU+ajCMJtGMcrI13GNfzn1VoyhJIrgkW4yJ2gq2nEQHIiU
         PdH1JNJAv+C+rXNGjgOmUq7RS1wFQUfxMZNHZUS2lhDr43apzyxEuxPd3XQ0Gfx/6E/V
         uAZg==
X-Gm-Message-State: AOAM533KjFtWv38TJ5FHNqeq1a4phGrxmlqkkdgc86OKMXD8gvqYaTqh
	eYQB41msFvz4gSYLs6s1AeyOtIScdgaKhQ==
X-Google-Smtp-Source: ABdhPJxA3XaY+fPhUUiXLF2Mk/9vmwLNaxJlvu/IzN2u0s4e8VLWI6O/iZToc1m43YwSzA7h8foyiQ==
X-Received: by 2002:a5d:6147:: with SMTP id y7mr3111882wrt.306.1614344475264;
        Fri, 26 Feb 2021 05:01:15 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:15 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/13] populate_sdk: Add directories to PSEUDO_IGNORE_PATHS
Date: Fri, 26 Feb 2021 13:01:04 +0000
Message-Id: <20210226130106.3925837-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some paths used in sdk construction shouldn't be tracked under pseudo
so list these.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 4db0511dba0..c8a7084d335 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -178,7 +178,7 @@ do_populate_sdk[sstate-inputdirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
 do_populate_sdk[stamp-extra-info] = "${MACHINE_ARCH}${SDKMACHINE}"
 
-PSEUDO_IGNORE_PATHS .= ",${SDKDEPLOYDIR}"
+PSEUDO_IGNORE_PATHS .= ",${SDKDEPLOYDIR},${WORKDIR}/oe-sdk-repo,${WORKDIR}/sstate-build-populate_sdk"
 
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
-- 
2.27.0

