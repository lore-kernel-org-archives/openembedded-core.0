Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B058C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:45 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.4104.1637788483891013590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pewCN82S;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id b11so2637471qvm.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0zdksnoLdN/i6O8oAc3ixunrj+mE9eLx4d5N1Hnazss=;
        b=pewCN82SMpv+ZE5Cfr/gKKuMl2hJqsFiLwx7c53CUtBkxv01Ekxdk+Bb9Re363AWa/
         +iagos0Fq9QBk23cUSchpWYHa9F2hete/5CXbEJIdAowRNUfzWKZikYrzzxBpCUCVmF9
         FpdodVwdFaIX8Bu9hJHNnZuMiFhpRRVARo0sIQ0h4dxMmjKs8YdajE4zGO1ZbkERaDrd
         bD6YPP/YKLC4tmgTYCXmVVRMvypKh6SGrwZtNtiDvQORBiC6j/djk/F9vLA83qedJjx+
         HMIBsKgTt9wrxyd/gy2OxsyboRKuNwrPSr4RTkJQ17On/SEtLOLUqKjYVyJ7g5VjsXPI
         UKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0zdksnoLdN/i6O8oAc3ixunrj+mE9eLx4d5N1Hnazss=;
        b=Goq+BHuUR8m0OKLtrVovrof3frDUhc5gKRBU/Y11hxVdK/Vdo3pDAypXa0T4h+JOiN
         AVSkp3pxdyhKbJtAwqQF0NY8/wBhn4nylr1pPGfkyBqVWC/LrD2v1dl8mb7osetNMONh
         793JjPeqJeGvkpYQG4YBbIYyx8z89ZOebDeFhT+p4ctZY8+FvcHFzLqMqLQbHnfs5EZA
         PV1NRBXwujOJyA3J8Slhfs3ZVCkg9CJfxn98ZkTInrUDsU5cMSJjBDs+sYbjHlAEgv5V
         slhbWGEZwFq2zXjKIYR/5BDTOWNXV3m5MNs64/dhlLn8whRKFsfW6lBpA6KyvkTfL6m9
         DsZQ==
X-Gm-Message-State: AOAM531tnw3P+2f8tn+jLDW24Y2o+iXQl40qYAEpwDr+QJ5yW1b8GsSz
	MWBjJ0yU7s+Y6CJr+1FCM68=
X-Google-Smtp-Source: 
 ABdhPJw3fHUbpCjmuw8UMeQIUMZTHy0TO+EuaQJmRV3VvyE9/iKTp0HMDLcn/7S4fJHCbvdshunE/w==
X-Received: by 2002:a05:6214:f2e:: with SMTP id
 iw14mr11463609qvb.21.1637788483061;
        Wed, 24 Nov 2021 13:14:43 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:42 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 14/20] python: import vcversioner from meta-python
Date: Wed, 24 Nov 2021 16:14:20 -0500
Message-Id: 
 <1aa6edf45acb6db033375faf91620896af8998fb.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158760

From: Bruce Ashfield <bruce.ashfield@gmail.com>

vcversioner is a dependency of jsonschema, which is being
imported to support kernel device tree validation.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-vcversioner_2.16.0.0.bb           | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb b/meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
new file mode 100644
index 0000000000..149078c51b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Python vcversioner, automagically update the project's version"
+HOMEPAGE = "https://github.com/habnabit/vcversioner"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=827a7a91a8d20d3c666b665cd96db8e3"
+
+SRC_URI[md5sum] = "aab6ef5e0cf8614a1b1140ed5b7f107d"
+SRC_URI[sha256sum] = "dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.19.1


