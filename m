Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFC4C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:00 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.4674.1645478638985061564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DbnX3vXT;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id w37so8929369pga.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Z4GyW3UYSIOlkficzKkN7ofC8bgCuOL9jtTKLJhGIRs=;
        b=DbnX3vXT3gAWDfULBvrhToViwFq6stDI1g5exCEGgkHYWK5q/FfaWIBkrah/Nll2tR
         4DNghvQPvHYqLmjFf+QJwB1bPuHnhqGuojIGxKOw/jNBo/Cd6T6PqVz898pQfHOgagwA
         a7jd1vmpaQL9m0XUWNlDLxCK+AwuVMPPu+kpBfBDlzwNPnEzuNo4c2ZN6dCujj+pHJ4/
         Byk6cysDCOc3v1m5U2ID5IEs1NvnEZ+vVFeos5v3+wzh5OEwP3ZX3jBvi50qrZ0NWSgH
         UB02w4gKmVWkphzUfXjXr64K87vg0YykeOOSi/1G7w78l6icKsFGERaVQ36mQoGLLQCk
         6EOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z4GyW3UYSIOlkficzKkN7ofC8bgCuOL9jtTKLJhGIRs=;
        b=QILWCJ2OVG29+//E83QRNFhQccRZiB/V0+3zIYT9WqlcAVU/NK4L+jOG//jxnpFe6G
         /s1fubnNRQrhn7SX4NjVK2fbI55BXLmE1md3ZP9IvTrWCzgmhl3VLUCxy6W/+KnhJoA7
         EzUlD+zUPYnQQB3E9S8Fyf/U+QnM0iLXvK4Rc5DRqPc2aNztfORHfkqtHJkn2nBkP0dJ
         vQVz+iQrWsIWr0iQHlp+RY4QSOjCuoNNtSNOLE1kghYVvFrUlcaJISCYjALwTz4I66Df
         x2/dhyS/7hhSNJvjrXII4dVSNUUs8j+1AeTJ3OPitbkL5/W+CggnuH52PdRenQ1mDiQh
         nxTw==
X-Gm-Message-State: AOAM530oMcTRTJQozENOcWbG7SIBps7+BXOHIYNmGB7tdnHYiF30+ikA
	WcUel/M6mX7kdWZpyH1QKPzIHO+zWeQaBw==
X-Google-Smtp-Source: 
 ABdhPJx1NRuQtjhNAP8GQ4ykRx1rGZbcQ2pL9wUJJ+Wgf+AlALMdxL7srNFw+JyFMFY41/+q0qF01g==
X-Received: by 2002:a05:6a00:8c5:b0:4c7:f9a5:ebc6 with SMTP id
 s5-20020a056a0008c500b004c7f9a5ebc6mr22042974pfu.34.1645478638016;
        Mon, 21 Feb 2022 13:23:58 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.23.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:23:57 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 01/32] python3-wheel: move 0.37.0 from meta-python
Date: Mon, 21 Feb 2022 13:23:16 -0800
Message-Id: 
 <2c82b18cfcc34dce08fa4600baa2bbdc046a0350.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162077

This is one of the "new build tools" which are part of pypa (Python
Packaging Authority) toolchain.

Wheels are the official delivery mechanism for Python packages, replacing
the now deprecated Eggs (egg-info).

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc             |  1 +
 meta/recipes-devtools/python/python3-wheel_0.37.1.bb | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-wheel_0.37.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 740e5fe55c4..72cd0125814 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -651,6 +651,7 @@ RECIPE_MAINTAINER:pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.
 RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-webcolors = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-wheel = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-zipp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
new file mode 100644
index 00000000000..6c7a31db9e7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "The official binary distribution format for Python "
+HOMEPAGE = "https://github.com/pypa/wheel"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[sha256sum] = "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
+
-- 
2.30.2


