Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8E6C4708A
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:53 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.92030.1669557336713068613
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CcywH6Hr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id x13-20020a17090a46cd00b00218f611b6e9so7994080pjg.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBcjFuTSdugV8+I5dcNqagfWQlu4t9DWYMzYzWw+omk=;
        b=CcywH6Hrco9CCN0x9UMRYOfRef8SiISNXq1BG36XHrt3MzzH90pENAWEWp1N9a+sh4
         JYkTH2g0fya47nonqyX1Wggws18vfA61e4sIWmih+r/IbyMM9v5R8WdskjdnC4/vnCSi
         pvz+1/b8dDYbsTkleIi1uaLBIFi4MHtSed8NZOePAuwmGQ5Dh92ujD3TUTsYto9LjJOJ
         m2zfPXf8hDq4ZH9ePbEOB0phOZlgrwNDvUkWbr+5QLBcNp+BHlhOHF/6s+Pp4s4TWVAj
         MduYB6h9zti82/BDpshhRs5J5zsq1TSa1bRwTe21PNzKlfBytpse21B1zCtmbxAm/yFJ
         rcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBcjFuTSdugV8+I5dcNqagfWQlu4t9DWYMzYzWw+omk=;
        b=DfINUR/ukUpf2+9osASP89cjT0zkC8V3PsdpRIS0sPIJFGt185FEJ3m6SbmiXbcxJM
         6omAVuUG2DfY83KjYwVOghEmKog20/VS70tUzFt7F8PmUwlX9CJjD2X+c/qQSs01FcMR
         vxuvq8Fl0K47dO3fQcrI1TESwfPVGJaFsWLU1ef3sd+BAk9KZHY66+P7azpTj7EG81u8
         jDsFSAsVcn5FYdT7GxCNbLIPAKB2ft+IF3HTpkXMexAUs6+orRNsdqoXh6DcIjRN0VkJ
         SdN0p8RJE1mSX+vMCm4CUoR+PulBpvH6HDl/PSM6Tii65CG/Asc6p7/DZeqDesZ7v3YT
         kdOQ==
X-Gm-Message-State: ANoB5pmshoINf+CGq+cqz7I2Q0XHEeezeZOm6A3hH6Wk8OhPz3/8nI0c
	wNkA5v8kv+32wDO7C9rUCkyEYV1Bk6xWCKlUvJ4=
X-Google-Smtp-Source: AA0mqf5RYbB6wpmafNvOZFM2+xhOeAYBEkpzIwcNdWwVYVnz4NASgUjnHzN+HVOwtfbleNkX5unl6A==
X-Received: by 2002:a17:90a:be0f:b0:219:21c0:8e32 with SMTP id a15-20020a17090abe0f00b0021921c08e32mr5579360pjs.101.1669557347477;
        Sun, 27 Nov 2022 05:55:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/31] xwayland: upgrade 22.1.4 -> 22.1.5
Date: Sun, 27 Nov 2022 03:54:55 -1000
Message-Id: <9c1fc7e6c3d96f17f3eed2d8665dd6388ddcf1c5.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173854

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 48ca760427f14ae291bf2ebf6f93f8d0fb27e3ab)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_22.1.4.bb => xwayland_22.1.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.4.bb => xwayland_22.1.5.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
index 8597d07a7d..c1c5407dee 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5c39bdd77444c3fa7a0e2ef317ae69ddde89a901dc8914dbc8eac39a9313512a"
+SRC_URI[sha256sum] = "e317ac1f119f8321654921761420901e4abd95585a8c763ce26af3b045ac1672"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


