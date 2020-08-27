Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.24882.1598550846598197676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 10:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EUq6jFbv;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id b14so6741954qkn.4
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 10:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jI10cr6TCpanbdx9T6Rfi1tUACWKXlqHUZIknWdd398=;
        b=EUq6jFbvxShPoqOpmVrrSPuqQl1TDzuHgIez/2Igi04GME/w3TaIawanWRNTsrAEL2
         NFS/To5Foyi5JQASfznc48BaOV7eJrouApYrAHJDU52Y9HZZwfXvVLpnZfRPZThE4Z0S
         YdXprilw7Fp3T53Tea1MOPw1j5OLzMamz9vmVGrmF/SKIZZKlpsfuP5xki9WEjZO15xM
         cGQ6188p4dZKHfm3AjH/Q9W7j6qgQ/fsVl+yKcqYDhkDixQRmT6VUcNz2L3nPvfehQ9E
         +G1GAezIadr7tdA0FoocsT3roKKmMk9jDaBM5m5utuXQb385IJMoe/kw4aweSM6BFUKz
         q0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jI10cr6TCpanbdx9T6Rfi1tUACWKXlqHUZIknWdd398=;
        b=Xp9SYtRWXMPs46SfJzu3Xfg6DQDi+4ua1B3DBgqWMeJUP1FPtZOe5L4UuYNAVhp2Ie
         zIP4a+cMWh179KxgaTS7D/Spn1M/JHInw8jz/diY/NNIPIXvTPs3Dj9EDX7jFGaqX5qY
         TaSdu83YL3hCXAthBg50MDgHKCmP7EyKw3rIGC3ZdaBwjvNKnl5z1VPdRN4AVFVSUZC7
         7BH9UEoSTFadMFizgFyeNBa0e7GhV212ldq1/zVnEhY30unZGFYOzh3Wtu9YAXnSM4K/
         1O2d3T6svXkW5G5a4bGcX8wUOS4QyutLUz9Ip7nFPKreDTMV1UQOl7BZGtt4A2uRBjqI
         lLFA==
X-Gm-Message-State: AOAM533IQ8sprXbUc5udn690fync9pEc41AFABOCzNDtQ9jKGLb3vC5/
	qwesU5f6rDcBCEvd3Jojf+o=
X-Google-Smtp-Source: ABdhPJzgDjHy6OnRCuNZL/xAoZdOs5+YwxOYDsrjsxEYEkWZE7+MyUZwibv+JLXpWlzBQltM5w5YdQ==
X-Received: by 2002:a37:4048:: with SMTP id n69mr19050454qka.421.1598550845628;
        Thu, 27 Aug 2020 10:54:05 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f4sm2339963qtp.38.2020.08.27.10.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 10:54:04 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel-yocto: consolidated pull request
Date: Thu, 27 Aug 2020 13:53:58 -0400
Message-Id: <cover.1598550535.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest set of queued kernel changes.

Two are routine -stable updates, the other meta data change is the cherry pick
of a 5.4 change we had, that I somehow missed when creating the 5.8 config
branch. This will get rid of he intermittent reproducibility failure, which
I'll continue to debug.

The two kernel-yocto changes are features that have been requested for some
time. One simply allows an configuration audit warning to be an error (off by
default), and the other allows changes to files pointed to by .scc files to
be part of the checksum.

I checked the checksum patch as discussed earlier, and it does look like it
will work with directories that don't already exist, since if something isn't
listed already as :True, it will be added as either :True or :False based on
whether it exists when the checksum is calculated.

There's a corner case that a moved file doesn't seen to trigger a new exec of
the task, but that isn't something commonly done and something that I can look
into if it pops up. I've had this patch in my tree for ~8 months, so it is
time to get it out and about :D

Cheers,

Bruce

The following changes since commit b67303460c9da25f69b206d0bbb3fa1467857bab:

  devtool: expand SRC_URI when guessing recipe update mode (2020-08-27 08:28:03 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.61
  linux-yocto/5.8: update to v5.8.4
  linux-yocto/5.8: disable IKHEADERS in default builds
  kernel-yocto: checksum all modifications to available kernel fragments
    directories
  kernel-yocto: allow promotion of configuration warnings to errors

 meta/classes/kernel-yocto.bbclass             | 52 ++++++++++++++++++-
 .../linux/linux-yocto-rt_5.4.bb               |  6 +--
 .../linux/linux-yocto-rt_5.8.bb               |  6 +--
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +--
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 ++++----
 7 files changed, 86 insertions(+), 38 deletions(-)

-- 
2.19.1

