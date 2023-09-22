Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C268DCD4F2B
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:22 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.16028.1695367515170518624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hzbJRDjJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-52f3ba561d9so4335574a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367513; x=1695972313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lALJlrh1J46mTY8J9s/Xi1jA+CjPSUO3e7KPfjptops=;
        b=hzbJRDjJ3SytlTUFR2AzbkVZDus7/i0aqFSdrEOI985yers3DsTyZe0UuGvH4VcfR9
         qkwa8LDuNKb6Eb+gm+prPi5bBxPC2mdfDSWQ0cle6KGYoqW0NJeSEuV+NZqOf2lj0YSr
         DEqY34YvzilQZTAqm4lyhLGyORVNYUeHw9kfoBjv3KqpsZnfgakYSOffPJqHE6y+0w7R
         MdZwt/XBzjEJeQPm4jD1ohIFOO+uBJzqCs6DDEetij0t+4WzqaB3LRlhCqnt1+2XvQLO
         eKc62RAFfWHyx42OI7BHVPBoC0hkT6Wmtvf9oa5HZt6Zy2PxK6/OVLFVmQzZ15yN+geJ
         k1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367513; x=1695972313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lALJlrh1J46mTY8J9s/Xi1jA+CjPSUO3e7KPfjptops=;
        b=TPcAFpWAnyn8BCzANUuFbcwGvtPPn/RmItdQcgmF877olMWmXTKlmUy0UXRh4jBNII
         UJEJ7G4uUYYVeRQ40OCXN+wxK7niCrN+/50Wh3A46JEDA7TSPAwNt8bpKe/0GS8DE9Jw
         luSxVdGsyk145eludBAT7RF4+SFFZKr6xavoUbWXtnf9aAIzSDn2jGu4VOKT4dhQ2EXO
         OVfwMEj9lgTp/0xe9Yh0hRiuyYWUtt3H16OSJkUaEmpEaoGykesy9Sq+DQC/jo3bb7Cc
         OjSKMdp9edo+X3J3rUnRN8drzhHix1SpcYnSXubvksdoKm7psx3ef4S+wVNsTps5aCm5
         obkw==
X-Gm-Message-State: AOJu0YzI4lD5Pxhb5EmYLd+0YoiSere1NBmmv8o5vmTiw0pw3ctiU4Da
	kNA/ux1mQ87L2pXzlft78zSXK26VCqo=
X-Google-Smtp-Source: AGHT+IF4I/YdscGv8IHJSjNasz9VMlTCEzQ9TjplOzew3UgLPvhOcgAwPoFn2OEwXJi+lpmypseJTA==
X-Received: by 2002:a17:907:97d0:b0:9ae:65d6:a51f with SMTP id js16-20020a17090797d000b009ae65d6a51fmr3000100ejc.18.1695367492912;
        Fri, 22 Sep 2023 00:24:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/40] python3-dtschema: upgrade 2023.6.1 -> 2023.7
Date: Fri, 22 Sep 2023 09:24:20 +0200
Message-Id: <20230922072431.1481743-29-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188084

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-dtschema_2023.6.1.bb => python3-dtschema_2023.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.6.1.bb => python3-dtschema_2023.7.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.7.bb
index 0c2c156ec43..c1dc3e019aa 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "d9dc11cea6a46ae2ee5ac4a5a1c7da7cb3704417cb390881820460f7c61eb784"
+SRC_URI[sha256sum] = "de7cd73a35244cf76a8cdd9919bbeb31f362aa5744f3c76c80e0e612489dd0c0"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.30.2


