Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B03C7EE23
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 05:08:32 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.60821.1677388108115058323
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Feb 2023 21:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qlztg57f;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id ee7so13169249edb.2
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 21:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkpeX8UWUg83KZrmEuVNIcqbiKXMgSo0D5b6ZZvbG5Y=;
        b=qlztg57fGB2CT2a4xufiahuHFzMehNDlHUZ07jU3V0D83Qm5DEIFQm1+WD2paZhmmZ
         RmGicGBI2eRRCmN/QHRachX7gC9ws9yT29XlbuN55ArlAOBNou3t0XVG+637a8qq48o0
         qIJgv/2kAu/qoCmuZm++8O+n5kDyJiz1dDDaKRDTW7rGvgakq0DtJvSqSGYr7diet0ho
         0RAGK+b5zpzvyynBXKwn9IORmnacAFrWyO8MBmUn9X8UkQ2HUlaLiXJL23XZZpMoaiCM
         9CfGHmSgO4RhWeuHgxbXouo1hgRYZKPaEWWZ0ERbJ2HW/36GpTZ0JWy6Evcg/vkqqfjI
         bGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkpeX8UWUg83KZrmEuVNIcqbiKXMgSo0D5b6ZZvbG5Y=;
        b=hav9MElaLilCwVi1WPF0tGG7LehKwP90FaEM9sZBy+foEBPP2yHsF6RJB/ZMcZIKU8
         YH4Vl5qwBZxA3iHlfoU55pF7Midwq6LznrksMQofazeyJmTBCXKht1aYyv9PYaO2hAkb
         a1NHa4vEJcwjArPnYns6q6wZ+YVPQDg40FPuUz4C2OPFGjDpboipVYzKs2DWbfnq/tUV
         TdRrx12K6VrE070rU0/Vd32CFLuebMq15GLw3XtH7Pc69jatCf1PuWbD1lenMZLyqIUm
         5MCBQQGlV7g79F145203QBH9qcd6tYXzkQ83ofADNkCYa7nESIXQWr0FaWftb7jSYCDW
         eL4Q==
X-Gm-Message-State: AO0yUKXSQGRmGSbeUXz8D8AteofyP5gX2Ah0PV9mQODA8JBAtVjchVvQ
	IiWIH/ie4kk6TJ0NMRu/nwKF6YH9JxV+T/qf
X-Google-Smtp-Source: AK7set9ncAIwAA0FtwulmIjdHieNvobdZIYYiCZrdi0lDCY+sJu5ku9fmibRTo1jlVHjCpNuM2Xrdw==
X-Received: by 2002:a50:ec94:0:b0:4ab:2504:c7ff with SMTP id e20-20020a50ec94000000b004ab2504c7ffmr21013025edr.23.1677388105881;
        Sat, 25 Feb 2023 21:08:25 -0800 (PST)
Received: from localhost.localdomain (BC24436C.dsl.pool.telekom.hu. [188.36.67.108])
        by smtp.gmail.com with ESMTPSA id b27-20020a50ccdb000000b004aef48a8af7sm1546262edj.50.2023.02.25.21.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 21:08:25 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH v2 0/3] Mesa 23.0.0
Date: Sun, 26 Feb 2023 06:08:11 +0100
Message-Id: <20230226050814.929055-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224093850.3393567-1-zboszor@gmail.com>
References: <20230224093850.3393567-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 05:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177725


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


