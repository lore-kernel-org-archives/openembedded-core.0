Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EEAC54E72
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:21 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.34073.1710728536161891790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w1WIBsXI;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.175, mailfrom: steve@sakoman.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-36695f8029aso11073165ab.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728535; x=1711333335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0TF8jgX0f1qGrQ5D0psLmgvj1Fpi9/7gqfo1Recj/g=;
        b=w1WIBsXI4V3HxP6rT5wP+UzN6k7hDJI+8aaFZjPfb17eB/9bEzAuyNhL8KTLoknMG8
         Z1KJEm4GTMpUfFF0T0/+GkcYD0rFBqdyJtf2d+JN759NAlh3dU6yWPv9a04zREZwTHh4
         YZ1bBFTqLB4HCAyjPZ2Ve7NNfeInesXKLgcaGrARmSZKvEWPITWNLoJ+80xHWVgQ9lDz
         rQawLGjUM2Wniq6XawEA5rJATLuTum1y9t+6WXiVnmULFO5d3Ub9vSvAUjkELPrh5yry
         qxq3A6Cao9dVf5s8k4TJxDJHIuK7rwgOntbHk2YF2e3ShyWgU0w/jvw27uwf66cFUvpa
         4QBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728535; x=1711333335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0TF8jgX0f1qGrQ5D0psLmgvj1Fpi9/7gqfo1Recj/g=;
        b=kqvTE0Rkw0AQ9c7odCuDNDSJh8PKqQ9+jnlmwAsNB2jG+/JuNNR1YnugLDeXg7hFWF
         VIUey5hf1P5rjROPUcmjHts+leLarRuCJ2s7dOjJpKVqD6KD0NRrTP0ScwCLxGg4N9gL
         OByuKDLBxA+e2nUgk0UDMj0n78iqCeQAmK2PPeEAH5grSB933tgjvwp5rsOvkPs8y005
         pPPfCJZLtIwkUcPHMEJxuEv0ZuP5etveXRHdpWHJpwV6bCy1QJG8iwve5x+E+TOw8s0Q
         B2xJRiqXK3oW0yShCmExy2yv/7KAixA3oRREwH8Kx1VSXXotmUAUfRS+5LtsbmS3+1ft
         JCLw==
X-Gm-Message-State: AOJu0Yw/9F/gjmTYOwshEFNvcPc9PKo0HRedB5KKzKemApVeuFiv2fnd
	1GMOvxuUcZ93kxpyG+oylOmhHSe4Th6GEoEmLQrcmnlSZtDWmKdyWPpYNwQ0ozLg+GP7fHjEVC8
	5nhRkUQ==
X-Google-Smtp-Source: AGHT+IFQ0qBf/+QK/3fS/VLvbG1bV03fw3WiXs01PTw9jCVZMSdbFQm1B7gSGiwMVXQofvOr0Heh2A==
X-Received: by 2002:a92:d312:0:b0:366:5af3:3e34 with SMTP id x18-20020a92d312000000b003665af33e34mr11098970ila.17.1710728535069;
        Sun, 17 Mar 2024 19:22:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 07/14] cve-update-nvd2-native: Fix CVE configuration update
Date: Sun, 17 Mar 2024 16:21:51 -1000
Message-Id: <67c4d9d27f06a07eac46c0f2cba8cfa1691b0737.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197282

From: Yoann Congal <yoann.congal@smile.fr>

When a CVE is created, it often has no precise version information and
this is stored as "-" (matching any version). After an update, version
information is added. The previous "-" must be removed, otherwise, the
CVE is still "Unpatched" for cve-check.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 641ae3f36e09af9932dc33043a0a5fbfce62122e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 5bba2219d6..4b8d01fe84 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -357,6 +357,10 @@ def update_db(conn, elt):
                 [cveId, cveDesc, cvssv2, cvssv3, date, accessVector, vectorString]).close()
 
     try:
+        # Remove any pre-existing CVE configuration. Even for partial database
+        # update, those will be repopulated. This ensures that old
+        # configuration is not kept for an updated CVE.
+        conn.execute("delete from PRODUCTS where ID = ?", [cveId]).close()
         for config in elt['cve']['configurations']:
             # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
             for node in config["nodes"]:
-- 
2.34.1


