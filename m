Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B087C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 17:34:27 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.503.1652808858706474660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 10:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KIqw396N;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 202so17517596pgc.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 10:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TpNqq9JFHR4lCxlXK0BZ2OeTBIFeb2viIWMtr6nvqOc=;
        b=KIqw396NiidayjqlB5H9Twyhxs0km+U+eZCekMSj7Bu6kY6ovYtqVXDwBaYyE4/MOq
         A2RVQy+wJwHNqkLpbCPtgNkycp3V2WayQZLsSk9MPJRpyadbtEqXQpqpTKn4oKThsPvW
         Vt9iquLj3iWtkVTz0hjHX0SxIGnUa35Dsq/i5MG0Q0rccOTPjQO4vXWcOqE6DFBZ6Vnh
         EP9jEwjKVcEWM/89eeC95+MSsrUPh/ZEWF8JX/bv3alICGVS3slN/Cg+IuCNwD9olMc1
         4D6K4kVS/Wt6YxdLHY6eMvRG2T0K4J14y+xJ6A+g4RnW/yIuhvforSqBe5M8mws+vEIa
         cgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TpNqq9JFHR4lCxlXK0BZ2OeTBIFeb2viIWMtr6nvqOc=;
        b=jgnuPfR6bX20Iw8jqvxS1pz9bcYOiBKXw89eXC4FRRt14FWO06ZKgumX7Ae8gdnBp2
         Ql6ZEOMPkgUIPbXMLS2YKJ1IAmKWJwp5Z7AdL7y8tGw60ZpwNkPCHsTulSwwrZ3QxP2Z
         rL7pyBIhgEQDy7zX1WJU/D+2j//IFueEHAOxYXNqtbo5PsCdMgoVfypqttdMgiHcna6k
         qZdqMQyQhqb5IuGid/1en+UJTmuMQJD1HTMqasgKKfe9bti4e0W7rTGtQvBkhHx0CyC+
         qyHKfzydnqHIQfGc82P/h0CeJPRYUPm0aTdFpH89mKG4VvS0+GadILA4dx01tqBbOMGv
         SeJA==
X-Gm-Message-State: AOAM530sRPj4VBQOXPB4QSOUnbYRMjypP5G34E4Cd/lCh7pfZc1pimsV
	zY0rjC05xYVlfObEKoBBqHIFQV/nxF698Ymw
X-Google-Smtp-Source: 
 ABdhPJyqjcbA90aUe/es3l2pc+KO1r9hgtqCue1w+vgBYyCqhQZivl6naBl0Y4ZcUX/wtyZWOf/EsA==
X-Received: by 2002:a65:63d1:0:b0:3c6:25b2:22ba with SMTP id
 n17-20020a6563d1000000b003c625b222bamr19988712pgv.360.1652808857171;
        Tue, 17 May 2022 10:34:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d13-20020a62f80d000000b0050dc762815asm13172pfh.52.2022.05.17.10.34.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 10:34:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone] python3: fix reproducibility issue with
 python3-core
Date: Tue, 17 May 2022 07:34:07 -1000
Message-Id: 
 <f883f32ac26d23a5fabb20544b6c8b9c824e4f11.1652808730.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652808730.git.steve@sakoman.com>
References: <cover.1652808730.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 17:34:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165741

traceback.cpython-310.pyc is non-deterministic due to 'frozenset'
being written without strict ordering.  For now let's just not
install the problematic file.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.10.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
index d678d55083..2ef320350e 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -193,6 +193,11 @@ do_install:append() {
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
 
+        # Similar to the above, we're getting reproducibility issues with 
+        # /usr/lib/python3.10/__pycache__/traceback.cpython-310.pyc
+        # so remove it too
+        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.cpython*
+
         # Remove the opt-1.pyc and opt-2.pyc files. They effectively waste space on embedded
         # style targets as they're only used when python is called with the -O or -OO options
         # which is rare.
-- 
2.25.1


