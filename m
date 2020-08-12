Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.19248.1597251828273152585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LVyIVTyq;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id v22so2016707qtq.8
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sESpPAVLpX1VLb0v0PMTMXsjCQcDZs4nbPQOa2uQ/Mg=;
        b=LVyIVTyqqM/W80Q3r2Pf815L+DuMsmByJItgcKw/FvhHhQ28UK/c3P9Ti6KcaZxweJ
         +jPKYHyLDdH4BHJYzAi++W30mZfgOsFQR4SZTj7//CXrXz9RetKS/18YTwZmgRZL/kJs
         iCBSEbrVSNaEbeJdjmdEhSRp1ttKQDsJmqc2JiGxKHW7lxf9RIFdDo5Zyi+PoGDqLcPW
         hMPPc8nTTnmqO4iM7eHDATbbu4CAog+lbMAeIF2NofHI3xvvVSuiSQq5FgLCT7r8fRlL
         p9i8WGYtNT4vehlvWCYwgfGP4u9HxCzS9YCXbMylCKenDiPoqBPCHhvo29EE7V/BiIMz
         Z/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sESpPAVLpX1VLb0v0PMTMXsjCQcDZs4nbPQOa2uQ/Mg=;
        b=rtdc/lMTtD45s6oYbAEA9fMow1BzwzfjlmnVjd/jwFJ7DmqP015iDgUBEepVqOUjNO
         QWwVZ0+sNiwK498wTz4AemW0N39mD9x3OtOamvG7SvLOZCSFsPfyFSf39ZkR7kxUnwWL
         oTjqUIcsZTCbnHboVpxykfBTlZ7/NXGfa8jgHxGU0UXRcHPcE3sg/dzj1NmU/tWqGQ5e
         w0BmzNjpPZq3XgPdCmnb/3CEBf1yxSDf+MAj9o2Rv9qEZ9J8MOe3/FI4wSCVtD7Ob4Is
         /ys09Aq5OIo+9AMaHws8c7pUepn7EC6KaYD4X2+Uej2pnX4CBuLS4VpF6g4rfMtkNFaS
         qc3w==
X-Gm-Message-State: AOAM533xWFeYer9j/U8m3u2oWd65LyTLf2kybWxPsr0hKeQ+G42Unc/w
	+vO1azEZZ4EOyF3/vfhvdskR4oQiYKrHQw==
X-Google-Smtp-Source: ABdhPJw9S+0ehdXt/8eeFOhDsFN+kFd2N8F/wYB4ldwvqt8ow2MNlYFS+l3SMXdFwNTNOzsdBq/jgQ==
X-Received: by 2002:ac8:548b:: with SMTP id h11mr591366qtq.209.1597251827378;
        Wed, 12 Aug 2020 10:03:47 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k24sm3249977qtb.26.2020.08.12.10.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 10:03:46 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] kernel-devsrc: fix on target modules prepare for ARM
Date: Wed, 12 Aug 2020 13:03:30 -0400
Message-Id: <c66778c2b70baac78215247c6e3f63d30637f664.1597203921.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597203921.git.bruce.ashfield@gmail.com>
References: <cover.1597203921.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The arm compiler and linker weren't matching the replacement
regex's in devsrc. We make the expressions a bit more generic
to catch the triplets for ARM.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 6a606c3570..34b947b599 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -259,8 +259,8 @@ do_install() {
     touch -r $kerneldir/build/.config $kerneldir/build/include/config/auto.conf* 2>/dev/null || :
 
     if [ -e "$kerneldir/build/include/config/auto.conf.cmd" ]; then
-        sed -i 's/ifneq "$(CC)" ".*-linux-gcc.*$/ifneq "$(CC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
-        sed -i 's/ifneq "$(LD)" ".*-linux-ld.bfd.*$/ifneq "$(LD)" "ld"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(CC)" ".*-linux-.*gcc.*$/ifneq "$(CC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(LD)" ".*-linux-.*ld.bfd.*$/ifneq "$(LD)" "ld"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(CC_VERSION_TEXT)".*\(gcc.*\)"/ifneq "$(CC_VERSION_TEXT)" "\1"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(srctree)" ".*"/ifneq "$(srctree)" "."/' "$kerneldir/build/include/config/auto.conf.cmd"
         # we don't build against the defconfig, so make sure it isn't the trigger for syncconfig
-- 
2.19.1

