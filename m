Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804B2C64EC4
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:22 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.24058.1675260851079455079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UM/30pb7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id e10so12566511pgc.9
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1MW2Nq6rVTF0P2fnisgXciEhwwaJ0qx1qa4sne64Nw=;
        b=UM/30pb7gqdv3pxe7X7ezKsDDTkodOUMLTYfQBf/0+LVi8TASEah22JpiLwnbEgaFC
         Rrvkf2SzCGw/Jt1omS7cQHwB3MtBKzVNs0DP0VtIRq89QUc6+Msams1TtV5Qh36N7dWv
         d+sph2Kf1vzSsqgMYLKQAq0zckHhyvow/w1sVlVF8NCyHn3ld9cGXkD+2nsN+/9GNyMb
         txSoHFLfmaBXBPdA4JB2NA0qUrk+LhOgO2eSqUuL3mZ86Sx9h/1YT7/nA6FIJT/xO3+R
         UWZa3yl6CflmvWUK2dl9xGd7Jwk99fF9XYULFIQ2+r5C3PXu3SxwgljpAeBi3K0RZYJT
         TYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1MW2Nq6rVTF0P2fnisgXciEhwwaJ0qx1qa4sne64Nw=;
        b=uLEhaSBcnyHBXWMuhgcFruBKBhJupujwDYQgh1AhymVKxcYIQ64LCumNxIL8ZAe8xP
         XvYZ6KxJAPTMkLg54k9tzPnueqD4tvlWTjtbJ6gviEw4ZrRUNG158LaQ3xY1RgUGPGZG
         tFPKTXbZhIzdZLYylfoushMTFIwebnGTwJtx3jVp8s58YqM6FXmtyRw8wn3MhsDquI26
         YHJG/dwISShL9eCzSa+V5ZdR+xYCh6qun0edpaAMhjbvqIgxxPvxOX/W0SE6XUCyEbrm
         EHa5KmFbfhc5gH43Z8vyTFKcTHfRCwQ0SUGNIcin/YStcVgINtHcK7pd37oK5e5YuZA5
         aMWw==
X-Gm-Message-State: AO0yUKWyRJEmjMEzNH0ioiMHOIMyuOBPdLtdf5VUx1wpiulnH6UbUUbO
	OfsuAxWfCsbQhrpZ+veL+Abzlh0ySCs+OF+9Cyo=
X-Google-Smtp-Source: AK7set9n1QVXDunXRjncBiiqUUyX30LquKc6re2+RXc0QYBrLP51Kv5Rx6gUS2tIA4GCc0pAQhfXHw==
X-Received: by 2002:a05:6a00:3685:b0:590:6d0d:a3eb with SMTP id dw5-20020a056a00368500b005906d0da3ebmr13214998pfb.0.1675260859704;
        Wed, 01 Feb 2023 06:14:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/17] devtool: fix devtool finish when gitmodules file is empty
Date: Wed,  1 Feb 2023 04:13:47 -1000
Message-Id: <7bc6bb2d3f01f3c9fe42417b6cfad194f9931a3a.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176544

From: Thomas Roos <throos@amazon.de>

When a .gitmodules file exists but is empty then devtool finish fails.
Add an additional check for this.

[YOCTO #14999]

Signed-off-by: Thomas Roos <throos@amazon.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4f0f7c4934bade9e4d4a1086f9d8b29d8e9ad45)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 0deb5dbf5f..26c5803ee6 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -230,7 +230,7 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            if os.path.exists(os.path.join(s_dir, ".gitmodules")):
+            if os.path.exists(os.path.join(s_dir, ".gitmodules")) and os.path.getsize(os.path.join(s_dir, ".gitmodules")) > 0:
                 submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
                 for line in submodule_helper.splitlines():
                     module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-- 
2.25.1


