Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD47C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:04 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.1856.1645557424001225736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LVdwrug+;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 75so17822107pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Z4GyW3UYSIOlkficzKkN7ofC8bgCuOL9jtTKLJhGIRs=;
        b=LVdwrug+Ikvl+6bJqV+e+LUQkWxU3V9ubrUDb9vFiZVLTyx1rAvGvNgBpZ/VgLNETn
         hjtoQxy65Io4qPicLvC6OIN7ZVl9P2aaTxWNx3wnLlFIcMugx0gpRv3itrZYAYq5DW9F
         F2csBgl5Y+j29+yyDuzrtZvmXARJN8dhbt1NJUIs0XqwvXcwL2yvv2718cKj4GYiSKKn
         L/jSiAzsagepB1feImCNiXwP94TG3Wb5oHyzNWtUK8CrZU57XsdZlc+29zEJi64bJiEK
         NddgkUOlOyrobD25V68tXuFLtB2n6hP57+6LEYuodTdNCyyKM62YgmLXsdffzp2Y1+IS
         xHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z4GyW3UYSIOlkficzKkN7ofC8bgCuOL9jtTKLJhGIRs=;
        b=vXGt91QJUwVrUHJvG4AxVaTeg1/rSjygoQHl3KBJyLeVBDzHFd6kt04cTgGXmMx9Ba
         Wtrscsj/FQEfDaTBDWhsWnhXqwSZk5WZTrfPUx0qNLYeOgIHrm17N7N57B1sQG+qjrjc
         32JlGlruhVu+vrp4gcLxOItdO+Yquufl9jsK+gmv/ZaaVXYmbIhFJ56h+3jqmC4rEWxQ
         Dshw4oGy3Sj6TCWANJmhoxgSHOONFtJFkzPlvTYsvWP46lWSBFTcVHGxNeSBHmKiNbiZ
         3rvGD3CyGWKSyHRsNPN2q9Q1gKU2JaS849BRZRGCigsdhWBZVITsgwuOa3UzwGwMqoE3
         834g==
X-Gm-Message-State: AOAM532xOMgVnKRJeZgjlkV8RdXxcofJ7DstH3BsThdikx9QANXBaW0Z
	5DLh91WeKMUvNYR+Wlm/r4ibnY7pwWXa9A==
X-Google-Smtp-Source: 
 ABdhPJxn81eG6G1d4gz9/SsfadDHScZSKuQFy2cEiEAObVE/UwUnmzUwBbhN2a0usnCqiJuUSYqYvQ==
X-Received: by 2002:a63:f551:0:b0:36c:54bd:da32 with SMTP id
 e17-20020a63f551000000b0036c54bdda32mr20493413pgk.285.1645557423082;
        Tue, 22 Feb 2022 11:17:03 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:02 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 01/32] python3-wheel: move 0.37.1 from meta-python
Date: Tue, 22 Feb 2022 11:16:27 -0800
Message-Id: 
 <c66c17660704dbf52642360d42c898d393035322.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162192

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


