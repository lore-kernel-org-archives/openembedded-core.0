Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF83C6FD19
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 09:11:23 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.29198.1678093876679432376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 01:11:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RXuL+3x4;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id cy23so35361583edb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 01:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678093875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy9JlTkkS6OwvagLFYHBNaSxVXV7kBYNiv1Yq1KMODc=;
        b=RXuL+3x4DZuRFWbtK1HZwU49uES7ia/1KWOWXtU62pGXiZgl7igDiGXNft/Yxusxct
         ZbWMquqvZOn0tkEfq+pOpNQUOwHcByCZWz+9C63G6YqPklNB0XKTobGZesVU0kQxF1Wa
         lqS/UybBpEsGjel9/97hWlVFpiFIvmqHRAcP4Ci8MnEFXve+z5ju8pwL55qLKvTl5qnn
         DAyhnlrSXDL3PzlxYX0wwWIqbIAfXpCW4pze/XnA0KoXJOyXgcFWwG+ahltmOBC1oAUc
         5CpzjrtKhhZ/bJGkfmYSUfSA3a3JrhTwd7kuJBqqZF01IeSL7dtS0CLK4CN1NT5+ULjT
         QIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678093875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy9JlTkkS6OwvagLFYHBNaSxVXV7kBYNiv1Yq1KMODc=;
        b=vzpL5F6jMC/mQcqnOa+8Gw8zS9xsPps87s5HCvK6Ev47yfdtiqKJBFbMnnJlNyaObI
         lMzulFIbpTHP+MlYPZdya0rm1isn65ToQFyAjuEgatVZWnCgGZ/1P5QSgiFn7AMt11Wl
         KsXakeaKKaGkfB+HUjRosSUf5BL/eb5NLmXL0a/HtOzZ7eUHOj2M1NbFvDl3DgL67k19
         ++q1HWpRmONxk0ZyLoQwLmevmYyBUXe1dkQGzH1Q1IKTGjhMlsx9jrLsDZHqBJIckiPC
         /TILO3Aox2FxsnXV0BHtLwPSfoUlheZ3319ehjneLg6qtREkIK4DAaxuIHWBgpZAarZg
         esSQ==
X-Gm-Message-State: AO0yUKXEM0RcnJPLgfdhjN5m8OfQgZv4kAv9ow2y7paf+VMnjnTi+jE2
	Nrw9ufpbxRjwKZhuIFW2lZ8HXgEbOao=
X-Google-Smtp-Source: AK7set97S0+t2pY1GlrlefJW3LvPPqXcDRTLNfkzZ+5XvgyvPXmBiM6wRHK/SKbJXJ8bw9QriYuekg==
X-Received: by 2002:a17:907:31ca:b0:88d:f759:15b0 with SMTP id xf10-20020a17090731ca00b0088df75915b0mr11691927ejb.45.1678093874687;
        Mon, 06 Mar 2023 01:11:14 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id q2-20020a50cc82000000b004acbda55f6bsm4760953edi.27.2023.03.06.01.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:11:14 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH v3 0/3] Mesa 23.0.0
Date: Mon,  6 Mar 2023 10:11:05 +0100
Message-Id: <20230306091108.3347363-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <17474798FA156F5A.18951@lists.openembedded.org>
References: <17474798FA156F5A.18951@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 09:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178060


Changelog for v3:

* bindgen-cli MR has the suggested changes
  See https://github.com/kraj/meta-clang/pull/748
* The rusticl patch relies on the bindgen wrapper doing
  the right thing regarding loading libclang.
* Moved the __anonymous() function changes to the 3rd patch
  with a comment in both the function and the commit message.

Changelog for v2:

* bindgen-cli recipe was moved to meta-clang.
  See https://github.com/kraj/meta-clang/pull/748
* The __anonymous() function that tweaks packaging variables
  were confused by two libopencl-mesa packages, creating havoc
  in naming subsequent packages. Use a synthetic "opencl"
  value that's added to the pkgconfig variable in this function 
  if either "clover" or "rusticl" exists in PACKAGECONFIG. 
* Made "inherit rust" conditional on PACKAGECONFIG="rusticl".
  (This fails under Kirkstone somehow for me.)


