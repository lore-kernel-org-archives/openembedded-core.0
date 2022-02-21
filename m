Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E036C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:27:56 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.5660.1645406875561953557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z9Sp1PQs;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id b8so13615972pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EetkXY9EtwmTexw7LRaue0OgOxnFbRJcYqknZV8nokg=;
        b=Z9Sp1PQsyW8c7dwrs+RKp8N/Zk/eXo4IEVqEtnUTOr48Fkt/Z8hTqC27FS9KJmZNnT
         W9Z5kviqtceiCiPthMq+QKIrTEQBtaNSrZOXzS2jrs31CVKAUwsu9knxsp/tEv2mr0TS
         gc/cMy0MzrE0TSAypuqpyB6QUYtUCt/2bTvY7yZpiPTjMsNg+NwAwM+nCwuprmQB40cY
         pSouG4n+cyFw+9PkHOLWHK40WlgPgcAzfiO5sASAB6ax0vw/FyoCCeSmOiXqy1qN0hhP
         ebdEtdrYcWs/h5RBg50/Qw1B26O+5U3IWWfYSNfqlqIWWXTjEArfzPOQFLsNm4c3S28I
         hMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EetkXY9EtwmTexw7LRaue0OgOxnFbRJcYqknZV8nokg=;
        b=G8wxIAXsZmebWWxgR0iWfZBlB5p3fjkSIqphahHv0k40JcPAoEN7HHNBNVzr1BlQAZ
         KQVy9eR5iDSwYAY+ZY3xz+YnOJKFz+etN7QUeWtFHu2j7267j6Un8OkEdO3rScGILWI/
         Y8NoebMvWTrQcKxu0AxILIHqS1RXS91o1cOe8wZ/xIQpRm8QpXjZ4drhttpgdukuYVL1
         vXQhp20itDPFDENvnm1aBvB6GIf/jF+H/ZZQPrzxLibFPmHO1x376NylG8ocB7axI3U4
         GOAXvC5Yp9odFwFhjBLjAxch7cBC0S4icoDqQ5f/11ApMj3Q5jIvTiK+kZ9M2RRD4a/B
         mUIg==
X-Gm-Message-State: AOAM531/Q/+JS6Uh7dgD/n7HLSD41aYV9UUobR0cAiAreCRNE4QSAK4W
	+2mIGKfkh7eKDsEzkq3TMc0176ER8GFtyQ==
X-Google-Smtp-Source: 
 ABdhPJwA00SGW30TaIXd5Hwl+LxQg83cjT7FgFrMHivROAHu4+haTM12b4MXIWeghR5ki4ZCFilKqw==
X-Received: by 2002:a17:902:6b04:b0:14f:2cc0:fa98 with SMTP id
 o4-20020a1709026b0400b0014f2cc0fa98mr17176153plk.44.1645406874670;
        Sun, 20 Feb 2022 17:27:54 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.27.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:27:54 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/19] python3-wheel: move 0.37.0 from meta-python
Date: Sun, 20 Feb 2022 17:27:30 -0800
Message-Id: 
 <e71dbdfb6e554ef67b97ce68528ea9c383ec0205.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:27:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161993

This is one of the "new build tools" which are part of pypa (Python
Packaging Authority) toolchain.

Wheels are the official delivery mechanism for Python packages, replacing
the now deprecated Eggs (egg-info).

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-wheel_0.37.1.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-wheel_0.37.1.bb

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


