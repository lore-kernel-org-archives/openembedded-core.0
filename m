Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330ADC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:36 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.3994.1637788475252159013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nxBGbwXW;
 spf=pass (domain: gmail.com, ip: 209.85.219.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id jo22so2618282qvb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SWUKMCxWM2wO87bo4Kb5Vg2jaTTBc1cgQL+o4sSjMvk=;
        b=nxBGbwXWcXPVkIWeI1vL8aUSeEUP2UNxLLYtRj0vyyrCKgFAqXHxMEU/15PvLsmyN5
         UFH8toNk2ppNK3ntk2cIpFO10QzYASOmXeawYUmdRqDP0NRA7CJccNcZIgLmQH2mXY3a
         FshqNPnuWdJdl3htCBJ+Sr/PpstPhE2mkpakLhluPhf606uezOAfqt8DgMVev3q7QZC9
         usA6bsA3pWYOGbMTdpPv/IsnRwIPV2Zlkpr29t9EugprQY/hqksmx3sO0Pedeap9aty2
         NIPjk8+2uVQmPEz2EoeHN5s0BUWlaSCpYbecXyoEB81Uv3wvYcvPBf+SmhLvkh1dIDTT
         3Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SWUKMCxWM2wO87bo4Kb5Vg2jaTTBc1cgQL+o4sSjMvk=;
        b=n81hVbnEBKV/pP8wHTip7p353gucLh9pwRKvmqFlAUN7lu5/Nw5iSxBwi3UmeQIoYh
         kTEe20t5fLTNTTOH0M31/el2uEPRx61vemRb4Z5j283qhhbfD/oiazEmXP639A0m9H8K
         2ecpYj/YdrZrjVBZ6icPrzN1uXQ7KWN+scy251PkKTLnYu15sfeA61yPlbS7ksmwi79C
         zUROPLcpHeopL2EwJGYY7Pjc5kPSeP0oHp9qN/5ChGJfP6i3snt7mjHzVlf7FL6YvOtN
         dvZuGozFFB8NRtocU9X/V1f1TxsWwvs6wg8UgpeJLTIlrIob9ngoz107Gg8WArZVNI32
         W9zg==
X-Gm-Message-State: AOAM530OLIUfcnJC42+NMyXYxui9sf/ajCZRDkh25szmxmwLY2YBYg0m
	w3oRXQA1nTNJJSpk3TFFkUk=
X-Google-Smtp-Source: 
 ABdhPJyiSQukMnM+93uzA/Xyyv47wW0Zi6CQIqJmVmqMX//ZVfCxZZgCvMnP5VPapWahMVEHKWujNg==
X-Received: by 2002:ad4:5be9:: with SMTP id k9mr11655082qvc.62.1637788474413;
        Wed, 24 Nov 2021 13:14:34 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:34 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 06/20] python: import idna from meta-python
Date: Wed, 24 Nov 2021 16:14:12 -0500
Message-Id: 
 <8c8050afba93d619727e44821089e40c7a95b19d.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158752

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Importing idna from meta-python, which is a dependency of
python3-jsonschema. These packges are required to support
the validation of kernel device trees.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-idna_3.3.bb                | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-idna_3.3.bb

diff --git a/meta/recipes-devtools/python/python3-idna_3.3.bb b/meta/recipes-devtools/python/python3-idna_3.3.bb
new file mode 100644
index 0000000000..a0e6b79a56
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-idna_3.3.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Internationalised Domain Names in Applications"
+HOMEPAGE = "https://github.com/kjd/idna"
+LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
+
+SRC_URI[sha256sum] = "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
+
+inherit pypi setuptools3
+
+# Remove bundled egg-info
+do_compile:prepend() {
+    rm -rf ${S}/idna.egg-info
+}
+
+RDEPENDS:${PN}:class-target = "\
+    ${PYTHON_PN}-codecs \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


