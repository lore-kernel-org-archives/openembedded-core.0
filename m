Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320A2CD4F5E
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 17:22:42 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4114.1779211357152735350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 10:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iKXTcna/;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2be1dd4af34so21124255ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779211356; x=1779816156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KafQ98kLKN1LWRPRiQIi+XwBSJ3WiN0rqiQYhWslBRI=;
        b=iKXTcna/s94Gcni9TA0+5NQKX1CuhCyAvyPXV3EXgb6Cda/cP7bBBvtmdBqB+nuZFN
         3JDTLQrSENGsUp2Xh4DvH6DyCB6KEORXmf2CjUA5PRzIEmgh6Y1iYRUtZjarK0MfBn9x
         ChCqJV/Pm8dj9G7aNzbpeOqvFug8SigmGAAqsXAcx9mZ6/3N87nKqpiWFxM3C2RttYaZ
         RWBTMB6cQDUf9EMzJmZeNg/flp09sp0tG8b3IC9JzXnykBTt6ITfenjmDVU4MzDxgAmt
         hoFsW3/f/UwKgwTHxJKmvscLONEpqkVEDwBT/m6br6y7dGlMCIeZk2Zeq777yHWwng3Z
         IvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211356; x=1779816156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KafQ98kLKN1LWRPRiQIi+XwBSJ3WiN0rqiQYhWslBRI=;
        b=DVMASR26WStPP6p67AaLR4ZXLwSKwj19jOt9pVXCRSrrgDmBa6lLZs0XHmcnYYf7OB
         cbP9TV3rAtbMR8bpuJTRu7q5PTlSNuIiVtvSBfGaKKdFe2OrzJHeQdgGVUgIdtd0dtHp
         5uAACGwWwotnxy0BIE2/zpsIL8PeC7obZ9aJxe3NXw3vMBHRhqmloW7sBpIAUAxjuvfU
         yHH85lUJWao2BWD5Izb8h2OTh8f4cWPN0g2kRMLevekb/t0QqTJSNIMNbEZMjw9XyMLC
         O++94uTZGqyJL5Ettjvlfsye9LSR5smRdgr7Jf/Fnp6amhQOIlT87wC2P1Z+igqCh+Cg
         +xjg==
X-Gm-Message-State: AOJu0Yw5aAkHub15jVsk6Id9X8PhjnqB1lQSWDom4YV4LyUwQJ2f/TGC
	xsPTOQpQ36X1I3afnpnJc0SdisT5Zj6xjCLgsLm+npX6YBuJ0tHF3AcFfEXNIvpa
X-Gm-Gg: Acq92OHnSrfUHvxFR0+/o2iVU+4AGXmigOkueUsvTXonPERSaGaRfKhcSPtyt1urQ64
	KQbbUXiuaxpHSwLwUJr62nO/6QoO9aapn8p5/NQcrEiy6xfbkONPLE+DXr7qD94/sQ7bu6I7xjv
	euOJWtSlOwiiM2dSw1Gz+gJp4m3omrfRz7gWw6uHqh4z24TU8LLOQ2PeiK6f96XqIZmLSu/OgVa
	dDkZ+gPjSyMjEyd7bS0kVxAHpMMnNqQL+fmenGwNPEd17M5diDWa8m3bL5mLSEPNOJXKjAF4DhW
	z69TKv00ZnwNs1dKj8VjgEg89DDq5CFDzemvb2Pnh+mcEiwT6Od3ubYAGNdlKIWb1d2B+SMB5FS
	10UTClPIX0lN8n1AjW1irn+XUrQvXtv+uq53OYFI91wca/io0aObdOGb17wOZqtCoAGUpiGDKkA
	rtoSF7WJBQVAJbqRyYXsGechDHGMiyvLNF6qZCfWbyVE+zwfGN5vyh4nd9u0XlF5NHCxkc
X-Received: by 2002:a17:902:a701:b0:2bd:5b20:a5b5 with SMTP id d9443c01a7336-2bd7e951360mr158746215ad.37.1779211356493;
        Tue, 19 May 2026 10:22:36 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com ([103.172.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc58575dfsm107910735ad.20.2026.05.19.10.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:22:35 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 6/7] python3-requests: upgrade 2.33.1 -> 2.34.2
Date: Tue, 19 May 2026 22:52:04 +0530
Message-ID: <20260519172205.274641-6-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519172205.274641-1-Yash.Shinde.oss.dev@gmail.com>
References: <20260519172205.274641-1-Yash.Shinde.oss.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 17:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237342

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

https://github.com/psf/requests/releases/tag/v2.34.2
https://github.com/psf/requests/compare/v2.33.1...v2.34.2

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 .../{python3-requests_2.33.1.bb => python3-requests_2.34.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.33.1.bb => python3-requests_2.34.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.33.1.bb b/meta/recipes-devtools/python/python3-requests_2.34.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-requests_2.33.1.bb
rename to meta/recipes-devtools/python/python3-requests_2.34.2.bb
index e9c6fe4e97..79ce30feef 100644
--- a/meta/recipes-devtools/python/python3-requests_2.33.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.34.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517"
+SRC_URI[sha256sum] = "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
 
 SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
 

