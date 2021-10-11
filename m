Return-Path: <henry.kleynhans@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179D0C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 17:12:24 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.1434.1633972343035318616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 10:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XND7Fynw;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: henry.kleynhans@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id r7so58448551wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 10:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P4lgH85gXRaM8YIMpJL8RYq9PdiZMuq4EHuRG8D66L0=;
        b=XND7FynwE2GHjCaI/T00R4v1YXjJrN/o80hkuUcMoC1IPDWRlJFQxFpNOlEV/KAMnU
         ZdkDHB3ypblANo+uXxnwSve7JEHwrwjWwKD2q2qgYJ4AzAt4vDB8DvlZXF7vRZxa4Gqu
         MaZZ/1+uqudIf9LdgDfmToJaSsdFxD0xh5y26snO1tJMg10D0IYKeRrPV2OcCF75yxWP
         aVjgU6E+E0KoevTVeGk+CX7m+Nyyali+w11pzY6m63jS927B7x4i5PQnbHZ8fFum81jQ
         fnpzBkvx4UwEaFlGO7HZnzKNP4JiTHjshz3hKlPO+hJkbjpwRuCjLOn/FCxtkMEncKzY
         PM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P4lgH85gXRaM8YIMpJL8RYq9PdiZMuq4EHuRG8D66L0=;
        b=oFrZcyS95MRbMaiOrl0F1dTNu7JC6FclGikpflyfJPCEnSopY6uPznNQ+QA4oCHO4c
         ko+W5pZWYHxn0iJUxBYObsgAc1+tAQ7hNmuEVhIJyA4M7oSzFaliGWwwvtBiNbZN3zaI
         Bi43ixrnW7ni/5Fs2kyEeYqF8FmUtHXMnLFvqZic3bxJXGFDQ0qi3puovFVuFSNraKEi
         b5fWKl/vXLhAN6arDaL7V5qPy9G9+9pfmTdiiqpZHL6vx49XxhLFnaWx4TeGaqH6uRVz
         GgwxtOczGOYACQZpIkeSz/w6j3g4CpDoHMNVkXlUXNL8un8Vxt+QF6PPyDCCSIyAuSy6
         UC6A==
X-Gm-Message-State: AOAM532TO8fXF2vUqyDe98k5VMjhc7DvH9ztiw1RyFY8GtaHStwVAVxz
	r3teqX7MqrqrG9iCL6PofFu7kJCXRhyFfA==
X-Google-Smtp-Source: 
 ABdhPJwEcG6FkUCqxcQNaStpbwzdeSX0068o/ANf1DTygUK6ttQT4HH7k63h3GDvfO8zrYfl5jfgaw==
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr185919wmc.7.1633972340953;
        Mon, 11 Oct 2021 10:12:20 -0700 (PDT)
Received: from localhost ([2620:10d:c092:400::4:f758])
        by smtp.gmail.com with ESMTPSA id
 q7sm8641093wrs.73.2021.10.11.10.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 10:12:20 -0700 (PDT)
From: henry.kleynhans@gmail.com
X-Google-Original-From: hkleynhans@fb.com
To: openembedded-core@lists.openembedded.org,
	poky@lists.yoctoproject.org
Cc: hkleynhans@fb.com,
	rmikey@fb.com
Subject: [V2] sstate: Switch to Zstandard compressor 
Date: Mon, 11 Oct 2021 18:12:07 +0100
Message-Id: <20211011171208.3632459-1-hkleynhans@fb.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 17:12:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156844

* Fix broken sstate tests expecting .tgz files
* Fix broken signing tests expecting .tgz files


