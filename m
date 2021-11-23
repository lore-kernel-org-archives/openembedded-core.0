Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF426C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:01 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.805.1637704681248982527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AJFmokTN;
 spf=pass (domain: gmail.com, ip: 209.85.219.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id g1so320479qvd.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SWUKMCxWM2wO87bo4Kb5Vg2jaTTBc1cgQL+o4sSjMvk=;
        b=AJFmokTNIxCCQWwcOexX13A5wfhM9UQL7KD2YrFLUGyOH6ggAHMNZbf4XKeDTDV/J7
         iYCk22i5DScsAXyM5LnutaDAHh3SEBK7AWNOiLE8vUt140D0KLxCNllCmvk2fGq6x6ag
         FenQ+8z5i1wPF3g8aMAxkFhZ5BsFyUc3vDxRtwwRqA2bETmRGcbkLIqfoRuPStO4afeY
         Obthihudc/InqMYEqv4UvJEJRtG1NiNpwUnymCLxDjNans4ltEGbQLm4CSjJt8x3sn20
         UQyAhF10XZ9SmoNeNNwxImaXZZTmmh11Hd8gkPGWBIDpIjYkKOXxuj7t0tVGoCHZAJuf
         pb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SWUKMCxWM2wO87bo4Kb5Vg2jaTTBc1cgQL+o4sSjMvk=;
        b=VzMTXHyEc838JjQiNRnEG6yu6Sd37PpPvkNNKE7sONs7EyhGv9s5JaGK/3GfYGjegm
         IkeoCKwMBh6Xo3kKlmUPe/6ZKkgwzVwys4HJDXZly03PSWNaSw+9uB5AW2BYi1eobw/7
         yxJz4vOHOoDHPZsTTv+KjAUBVzY/OQi6K3vFOr/DxIdhkBdAFOwjsnO2vx4+Kfqi9vDO
         B6FIoAGJI3C6IgyOHrVFj86Q6OIP1vKXcpSjbugZP44/3JE0loiKvFfWJaqyHunLep/u
         RYeu/NRn31jhn+dU1YCc3PMQVbvj/GCdOQyxrww0ln56RPTqkT+yJ42ywPjJvPcbZnOh
         IX0A==
X-Gm-Message-State: AOAM531yG/tKsWkPCJYA/OOYTvNVY5J2HaE5gB/dUgqF1LKm4waeT6Ft
	a6BaEDSx8HjUgILRhWwolKU=
X-Google-Smtp-Source: 
 ABdhPJytpW0tdfl8zL1mvzWvZetLPOWSNqkjlhorerF3g+4GIEsK2iTvnWa0PXSEMLAbqcG2lIgtww==
X-Received: by 2002:a05:6214:5186:: with SMTP id
 kl6mr608634qvb.33.1637704680387;
        Tue, 23 Nov 2021 13:58:00 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:58:00 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 10/20] python: import idna from meta-python
Date: Tue, 23 Nov 2021 16:57:37 -0500
Message-Id: 
 <dd47cfcdac3a48077478497930d3bdd1c76840c2.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158631

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


