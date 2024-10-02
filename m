Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E20CF6D34
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:34 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.6961.1727874808160001990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iVB0hY+T;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71788bfe60eso4950175b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874807; x=1728479607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pClXeEwguvV5L63vA5XlFlhJpPp8X5ix7QDR0f62/OU=;
        b=iVB0hY+Tf2j+E/iuY3Ep2I449fUENe7JD81AKG2z83figLre/9sd9Ksry8AQ5k/e22
         GWGiFIlskuaNLASXyPKqLLLLv667H2hKtylbh2crW3XoWYD7MAYZbc6TXiEZrKhX33Ns
         wywMaKkLqp8chKs9nF0zn0kTVs/9HKYjqBSXX0ygDya/WG2gfmrI4ZKhH/Cg6EE/Gl9q
         uv6x4ER1QereUsNiJnDzcEyt7KL1oR7crCtJphJYFmwSk8P9I7RWMENidI8KsC7AaHgS
         AfQM5VF/k6xYG9vHmTt2rdZMneg2v8Yioz3H6ybAdLdDH0RvLRlQEOrCzm7OjCvAZ+AA
         9YQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874807; x=1728479607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pClXeEwguvV5L63vA5XlFlhJpPp8X5ix7QDR0f62/OU=;
        b=oWQovDgf0H7//zvDzM0zD8JID7SJgOuJiwHxIZkXqEFAtajx6J4hFbc/f0LR4JnatL
         Hw13vsBcNRWEj7flW+gb+uPqA5sjZX2syVbUGpbMvmNL3kdsLjE74achkzqPCyXe2ybB
         i2Ok8E6xq4p7vYo6jD2GYknVkBLFjoNTI8C7r5K/y++xhqVL/Zv8qe39RyRky5BzHeoM
         zGgdb2IykH9AtQ8jWdLd9eMzGqkyE/bVGxdfngm7N3V2wEccSH9z6U/pwkYypM6CG3I0
         5P/1wNROF1QT0Qqun/bKVj+ExgstbJuH3v8EPNVAwlzosfrMKVXKiGIsGmLW/LN6T0xi
         d7LA==
X-Gm-Message-State: AOJu0Ywae0Nh1+Z0iBpxUv0s64WPyEkeZfN0vKV2sSKs9BZ7appBgmut
	B4eScS/yMZNxPMYTapHhXcwiGe81TcVmi9rFboB84mt7sVm36v8x9ChNeL9o+4E90rUsbgI1Cp+
	fd6Y=
X-Google-Smtp-Source: AGHT+IFlOUuwGROgLtMvCJFTFQfmhn2aKXurxtKmJLxiLO9ZwgU/kYGix4diSiZvl66ghC2E0arzGw==
X-Received: by 2002:a05:6a00:2295:b0:70d:3938:f1a5 with SMTP id d2e1a72fcca58-71dc5d53280mr4733086b3a.22.1727874807428;
        Wed, 02 Oct 2024 06:13:27 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/16] scripts/install-buildtools: Update to 4.0.21
Date: Wed,  2 Oct 2024 06:12:54 -0700
Message-Id: <e6170a6c9ea419d2fdc4e4ceb04c8a399b4a3b43.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205198

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.21 release of the 4.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 4f85fe87d4..9054eb5f36 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -56,9 +56,9 @@ PROGNAME = 'install-buildtools'
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
-DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.1'
-DEFAULT_INSTALLER_VERSION = '4.1'
+DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
+DEFAULT_RELEASE = 'yocto-4.0.21'
+DEFAULT_INSTALLER_VERSION = '4.0.21'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.34.1


