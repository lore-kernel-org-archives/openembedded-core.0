Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.253.1621289832737787341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RGAgIzIG;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id f8so6081062qth.6
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5OPQpfJS88EOORHulv9w+XW1OWjikT78VvKSq3fMQys=;
        b=RGAgIzIGbnPk/4mQ5XAu9LBz2nLu9NwzOezsKdgeogJ0L7M0RXSNywZMuVTU2dzHQ7
         NySOcUFIzAxSkojiexd706qxIuBmKdNB42GZAiXHY7zceTbAh2TS+axy4nIOkkH53XY2
         8KOlBnRsEMDS0nU/fNXKWQ13gw7eRskfY8Nl8YIweKQB3uvBD4Wrno8ep/tZzgcM0Vu5
         jfZur+9TDq/Qv1KBI3XySNTnZEhJc0Oxvz2Ct0fqshKRKiVB/WQ6vL0/enepwwRfk46M
         Fo9GhU92/SLlghfE//EczgUVEgw3nJTMWEb2/n869v3dN7MqvIGAcG0QSlaGSwkm0FEW
         qOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5OPQpfJS88EOORHulv9w+XW1OWjikT78VvKSq3fMQys=;
        b=F+Oo1uSg9mbmKDOF2/iOwaWyx52hTQ3APKiHLDP5hS4uXnhZuCrFFAci2ND6UlgvVM
         cVQOdBklhUwG+5mmK9u0FE+m1OQrh/p8gjGNR8H/TIeJkN5d7k7nH87nNKhGlejlz+tu
         f48fOxIQu9DQoYxiCjlgaAnpbK8kZAyjb2hj6pGLE668xCHrsNnLB4uKtBl28DcpZegS
         HepwBBj0AatwXpbb9Yy9dhuPnLc9RszO1TJQXNkBRCTbs8T4EvC9WdP0kRPuLzu8Hk1h
         LqqOTEZoFc6IP6laPqmUDHGIFZa9eb7lHJN4/PSJsxbAZqQrCdHxpg3htVVRA093Y7Wz
         b7SA==
X-Gm-Message-State: AOAM532XdGe8pJ+0/MBlnc/A2s1NBqo/j6Z4OrZglRlSQcTd/jw+3LlO
	fGFXqHhwwm7nMB8Rn06i/Ao=
X-Google-Smtp-Source: ABdhPJxPpUDd/xli/keD55QYhLRUiC3TQAaolfebRZCqTwJ4xDv3SQtJqOS4HZoHCD11/fpTW+5jPQ==
X-Received: by 2002:ac8:59c8:: with SMTP id f8mr1696881qtf.187.1621289831916;
        Mon, 17 May 2021 15:17:11 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id y10sm9789558qtm.17.2021.05.17.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:17:11 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] kernel-devsrc: adjust NM and OBJTOOL variables for target
Date: Mon, 17 May 2021 18:17:00 -0400
Message-Id: <9dfd4185df57bab734505df8992291c144c0c14a.1621275692.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1621275692.git.bruce.ashfield@gmail.com>
References: <cover.1621275692.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

v5.13 has started storting the values for NM and OBJTOOL in
auto.conf.cmd

Just as we've done for other tools, we need to adjust NM and
OBJTOOL to the names of the on-target executables. With this
adjustment, 'make scripts prepare' continues to work without
user intervention on the target.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 455c836527..84e99233e6 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -272,6 +272,8 @@ do_install() {
         sed -i 's/ifneq "$(CC)" ".*-linux-.*gcc.*$/ifneq "$(CC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(LD)" ".*-linux-.*ld.bfd.*$/ifneq "$(LD)" "ld"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(AR)" ".*-linux-.*ar.*$/ifneq "$(AR)" "ar"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(OBJCOPY)" ".*-linux-.*objcopy.*$/ifneq "$(OBJCOPY)" "objcopy"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(NM)" ".*-linux-.*nm.*$/ifneq "$(NM)" "nm"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(HOSTCXX)" ".*$/ifneq "$(HOSTCXX)" "g++"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(HOSTCC)" ".*$/ifneq "$(HOSTCC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(CC_VERSION_TEXT)".*\(gcc.*\)"/ifneq "$(CC_VERSION_TEXT)" "\1"/' "$kerneldir/build/include/config/auto.conf.cmd"
-- 
2.19.1

