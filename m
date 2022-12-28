Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAB5C54EF0
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:43 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.177177.1672213056038755280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FEnCh0z4;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id t15so5385359wro.9
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jsNXuF29wQVGX0Uy2xWL1TRz0YMH/lbr4ZeD3QEIjI=;
        b=FEnCh0z4w21kvsA+uFSZr+n8I+pm8i5o+lDfo9zTVw/oQ+WFh+q7o1OY80ivq2pDBb
         fMn1xD2K+bczkoAkXzNORwk4aOt/tFuAr43bod9su0g/LmSENF3nuIjj5+g85Bx9eUg1
         AtgAvLSgQfnmVq40xuaRjZUzNnB1NNVGIgKzM6HzrOnmLV6SLYvwVQvN0uIREvEFqlEU
         bQ+iKQmtphk+LXyLGxYLUtQlUc12kbOnUdS09A/Tmp442oszsYgGWGCIBb1TfxM+mbUA
         NUiheVBibPDxUpzc8bcVxM01d5D6SF5Uq7N34+zS6gOJS0ljylxYVgtWlm62iSh6HE+I
         9mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jsNXuF29wQVGX0Uy2xWL1TRz0YMH/lbr4ZeD3QEIjI=;
        b=N+8Z+oqs25p7lYc7ohsRmb7HMtcpdZinbidS7/ECSeJTPGclxpoFBcQJLZeJZK3gLt
         pe4LTgRVubICVQ6OTMAYqNIK2G+Ruqcq+AHQO7sqHbEJXfVTeEiAldKkzEMmam1t04Q3
         JOl90rMR8F0hAATGxBwqrRs9wjg2uEnVUhgwBu8zLtoU//xOhr/jIUFyqzZ2jjJbSWkQ
         uBwePno7hWAwm2bJPC2LHwj/sM+Jl3tAlSXO1pb9J4k765YHIu6LJKmjU667TUI0pmsa
         hidJ1Fvzb530wFQL6anGkpu6x96VC7j4EIGcn8iUiRXAOnbsVEdbTFSNBct6a5tyO4GA
         afpQ==
X-Gm-Message-State: AFqh2kpeYLUtPb5wXBqk4nWFpLw4p7X2FUVTwqLdEf3WNPX7WQyniQtm
	OFgBz8V1iZTNxQ7r/f4e2GZdtTivEeI=
X-Google-Smtp-Source: AMrXdXtDDlPWLh2pvnztX/zvMKd2SikVXdMPLWuHBl3YFIn/+CLspv5B//fnrK1qhEp43BxX94zSow==
X-Received: by 2002:a5d:6145:0:b0:27a:5709:7d96 with SMTP id y5-20020a5d6145000000b0027a57097d96mr6902932wrt.41.1672213054479;
        Tue, 27 Dec 2022 23:37:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/25] xkbcomp: update 1.4.5 -> 1.4.6
Date: Wed, 28 Dec 2022 08:37:04 +0100
Message-Id: <20221228073721.3454255-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175047

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-app/{xkbcomp_1.4.5.bb => xkbcomp_1.4.6.bb}            | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.5.bb => xkbcomp_1.4.6.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb
index 657ec7580d..44f462f523 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb
@@ -15,4 +15,5 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF += "--disable-selective-werror"
 
-SRC_URI[sha256sum] = "6851086c4244b6fd0cc562880d8ff193fb2bbf1e141c73632e10731b31d4b05e"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "fa50d611ef41e034487af7bd8d8c718df53dd18002f591cca16b0384afc58e98"
-- 
2.30.2


