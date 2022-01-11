Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377F4C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:12 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.12242.1641927731869588030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OHal+wkM;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so7055383pjj.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C1CEOSvjkX8zhs4YBAvjgrKvEDMbMvq4g97OjpeTR6o=;
        b=OHal+wkMT+ExJUTo+CwRjwjf9PZpbgzlySoUpxJF6Z78l/pZ2YQAsNGZrT5pkJmXtf
         YRQqxiyqhBOJjqYS0LsUkeig154P4r6WCkF4FQIS7eGs9NjKJoYiRwkIWTSDgtB1QZEO
         HfkUsbHdCbH7QXZzTZOMikDOHzs8gn6HsXRzzNRt5ocgxgqkuEfdv/nifsiYfUa72cRN
         Tsfraae5zV3fZL7YWVPWxPJ5tiFGt84JmVBY6lSCb5F/ETCc9prscKOZxBvJTParkbKX
         JfVyMEuMqf8bhMBKI81LPW+hdBXFiMTAl/Ye7/0hNhMVGJnnlxACijJObqdd4MoE5hoc
         lHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C1CEOSvjkX8zhs4YBAvjgrKvEDMbMvq4g97OjpeTR6o=;
        b=PjsINHR95YhNfsuOq6udO0LevfvH232OgM64AAt1IddGbzGx0Np7RpcAlaZEbCwopv
         PPuHF8w1jU4vDbVbMzax4mGi2kesFxsjkReEcwYuke+PDq/HlWCafhaTkxsYM7nZeABe
         5EZFIDmxboMNrZVPbhBNKmS9NrJJ/3ps2xH3IRoAGmyXiK/lSors4QeUy6scHqlVBmNX
         ukXHdQl4aw9Nap7rcTzfCro9qhHhMagbpugredcXnCxi15CX5HMM8m5rIQWHcgt0rKp9
         jULBIBcJm3rbXCUh4Op/SvWn0tpRecuk8UG757JuMpLR/9ib1MZo4SwJoZSHYqSEmEyj
         U3rA==
X-Gm-Message-State: AOAM5308eW5UmEPWEGD9uQF08JZ7u7lmlSu/jgqGAUGvhbEc6TtdbSR1
	LjIuS0fsOP/iejmHtdYnJhU0ib4acW4=
X-Google-Smtp-Source: 
 ABdhPJyQVksYZsI6dVEsGQdXiz+WiQII24dLR8uexEjaGMI5PztmQwM/tUvlJ+0CZ41Tit5ZI8D5jQ==
X-Received: by 2002:a17:903:124c:b0:149:b16d:917e with SMTP id
 u12-20020a170903124c00b00149b16d917emr6140219plh.91.1641927731097;
        Tue, 11 Jan 2022 11:02:11 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:10 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 05/22] libdnf: inherit setuptools3-base not distutils
Date: Tue, 11 Jan 2022 11:01:14 -0800
Message-Id: 
 <43bc44b6c51fa856629a70265c28ff5acd5f5f15.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160440

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/libdnf/libdnf_0.65.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
index fbda7769c07..81da04c9ca1 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd json-c swig-native"
 
-inherit gtk-doc gobject-introspection cmake pkgconfig distutils3-base
+inherit gtk-doc gobject-introspection cmake pkgconfig setuptools3-base
 
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DWITH_MAN=OFF -DPYTHON_DESIRED=3 \
                   ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DWITH_GIR=ON', '-DWITH_GIR=OFF', d)} \
-- 
2.30.2


