Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13171C38A23
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.82193.1674238337957449331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:12:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=BmESSGY4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id z31so1476101pfw.4
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFddCWv98KrixbiDx5i3p7H+g+JZiEprfhtXMDS1BF8=;
        b=BmESSGY4ZpLMFgAYm/cwm3OFlJxf8uwE1raTjx+kt4xYvLyFxLOIrdw2g5LdL6ByF2
         5LiCSaVAdtkM0VrdjhfD8mSjM+v8uI2gR2nixWBwWI8yc4Z+g1FwX8Ojie4SAd9yjoeR
         RWsZh201HBNPOkDEBK/Y3BVe8nCIZfrBvqa1+W7XHBfcajE8sJkbNTt2rxmupKHMB6ri
         033spdpM4PFsTeoQGUxDsP0XwgO7/zjPLpqcWyzYZFjGnN4mv6nWR18zx45sNe7ZW7+4
         KPy6BGKx8V/4Ac4tG/GZ6eZ8vf4+SnczpOZdrC511ccIwEfpRQ3R0a8fuTXvrlbfRYQe
         UHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFddCWv98KrixbiDx5i3p7H+g+JZiEprfhtXMDS1BF8=;
        b=NfpoVZ8MbeVcr/X1VUlxZlKc1LGitTFw0XttLhHEWWOF6AhQszI1pjLDxkKfmn/Bq3
         5ezYJhEYYOGq2fnbM67nmugBb0yic0JDgAK9MQ7epEG9k3OV1Qr/azn83V1eYBL+rzPN
         +ltNdJNGWH20khg6aggR9So7XyV7Y7/ryETz7gqaMcEoeV1P4evQPMe5XlMDG77Dd510
         9i/6eoUi9NYQocJJPBkFTWxwujqtPZehUF6RJa5HFj/3p2CyL8iemFMW2tCEMGOgValV
         JUl/2PkvJsyJy9sInN/ig8iHY/7FbeU3r6MsrU1YqXwqoJLXyDmXHtdAF5bijWsFYdwT
         g1fA==
X-Gm-Message-State: AFqh2koWTLVYv4SKXd3MugRfQIBjlYsQAdU1uCRhwUSw5wW/JAz8UbLc
	3xxtRRzZKHXzeMPIfqqmAhB+AbgmC1lyBhLjIiA=
X-Google-Smtp-Source: AMrXdXtI44RL9Q98exTeyFz7sEqNIWJfHT3oZGtOaurQRywSyAz5D1FAx7XNApNlP2EztcosK/UBzQ==
X-Received: by 2002:a62:e80e:0:b0:576:1c37:5720 with SMTP id c14-20020a62e80e000000b005761c375720mr17708953pfi.4.1674238337064;
        Fri, 20 Jan 2023 10:12:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.12.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:12:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 40/41] lib/oe/reproducible: Use git log without gpg signature
Date: Fri, 20 Jan 2023 08:10:57 -1000
Message-Id: <1075cdeae6af392acddb8c975ac4facc91a5ccde.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176247

From: Benoît Mauduit <bmauduit@beneth.fr>

Previously, if "showSignature" is present in user gitconfig, parsing
of the timestamp will fail.

Ideally we should replace this command with a git plumbing command.

Signed-off-by: Benoît Mauduit <bmauduit@beneth.fr>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3bd6f78f79b3d3e87d8db1e11f58d8021f929843)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/reproducible.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 04a1810d4f..9ac75c02e3 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -115,7 +115,8 @@ def get_source_date_epoch_from_git(d, sourcedir):
         return None
 
     bb.debug(1, "git repository: %s" % gitpath)
-    p = subprocess.run(['git', '--git-dir', gitpath, 'log', '-1', '--pretty=%ct'], check=True, stdout=subprocess.PIPE)
+    p = subprocess.run(['git', '-c', 'log.showSignature=false', '--git-dir', gitpath, 'log', '-1', '--pretty=%ct'],
+                       check=True, stdout=subprocess.PIPE)
     return int(p.stdout.decode('utf-8'))
 
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
-- 
2.25.1


