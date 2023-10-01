Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7CAE748F5
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:55 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.62432.1696176048984257003
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mZIfry0z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c5db4925f9so16251355ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176048; x=1696780848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pv8C/dlq/7lTmzBX3OOP5dL/Ixl2MGxmFge7kvWBZc0=;
        b=mZIfry0z/+zOD+LYdJhICcuBu70JgucepEQsdVGPPhHjmvdVEA3xsST2ZKZMjasH2x
         P5u0HZ5M8bH8DUQ4ErXJ2oViIqP/Iu0wFwq/bqPl1ndi3GAMFP5yePoVZRY4uaZ3J+AQ
         gJyJbKPc/yKObIQ9oZcBwCQjD6uHgsG8CHHG27aC7G3xbI0Yf11ixViiK0sltE+mEJ/j
         yRE1Zx3cAhlHBBCrDisUEaApc9Xa/TIVK0XisubmySH1Q1wNsSmFzQeEmkb0cynzmvbC
         c4fa0Hld1Y7HSwleprdvVSNBOsmuqfK9D9bD0cFHHnMP4syANgtoXTNexWLEpfrnn7AA
         z2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176048; x=1696780848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pv8C/dlq/7lTmzBX3OOP5dL/Ixl2MGxmFge7kvWBZc0=;
        b=TDcTXKxRYjZukHU5U0vc3jni4pMqk0aa2oGVs4FSbhtldQ/2tPW4rWuhnlblSvyA3K
         Yu5U5P3rzO9VhQSIhebDkiIm+/z6I62r8erUk3/G0o+WQD2ZfVcar6mNtzibCnGNeAEH
         AWsYRi5R8PZmWwksowQxOrA3PhS84XTG4p7hySW8gIa5YV1wcZZn+QAOaza/naq0kIcN
         TYkGVUeb9OXBX6rUKuU/pXLJI4CQnqrAUC682Wl3DlGBiweknqL2An55gdP9CulAecUM
         6RBn6SY5/bNIyWqIa2yIZ7QixDO3GnLyFq7KVDdTgJK10nkOof4WYlsy2uMJIA9xm1K/
         AwLA==
X-Gm-Message-State: AOJu0YymX6c1mLdFhfqo3uRWklpcE4t+rV6EaMFwFXxt2p8BMxM2IJ6Q
	NgUG5PFqBPKJzP1vjeBsgX8aN22jqxNAt7HJ/HLFiA==
X-Google-Smtp-Source: AGHT+IF2kALOVcVrGxHxvo1LZE4EMKoGMpnKXcFwRaStUxcZN7izWXxlkzA8CBj+R7alqE7Y5BmDXA==
X-Received: by 2002:a17:902:ce84:b0:1c3:868f:5958 with SMTP id f4-20020a170902ce8400b001c3868f5958mr14201477plg.20.1696176047413;
        Sun, 01 Oct 2023 09:00:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/23] bitbake.conf: add bunzip2 in HOSTTOOLS
Date: Sun,  1 Oct 2023 06:00:03 -1000
Message-Id: <08ab02865bb94865826515def8cf13352bacda8a.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188505

From: Alberto Planas <aplanas@suse.com>

rpm2cpio.sh can make calls to bunzip2 to uncompress the RPM payload that
conform the cpio file.

bzip2 is already part of HOSTTOOLS, as a link to the system installed
bzip2.

This patch add bunzip2 in HOSTOOLS list as a non-optional binary, so is
available to rpm2cpio.sh when it is required.

The currect rpm2cpio.sh has other calls to gunzip (present in HOSTOOLS),
xzcat (missing), unlzma (missing) and unzstd (present in HOSTTOOLS since
bff58d337890e804d33d7decbaa46065a4d3bba4)

Adding the missing ones will not add any new host dependency as xz-utils
is already listed as a requirement.

Signed-off-by: Alberto Planas <aplanas@suse.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fd376a11ed8d1b79633c2572ec0b4341d3ca2f1c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f679a49eb0..b2a8cea4b7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -521,7 +521,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 
 # Tools needed to run builds with OE-Core
 HOSTTOOLS += " \
-    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
+    [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
-- 
2.34.1


