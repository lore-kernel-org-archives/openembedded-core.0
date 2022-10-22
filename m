Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC07CC433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 11:57:14 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.5504.1666439825273492994
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Oct 2022 04:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iIe2jyov;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id e18so15018453edj.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 04:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZiqEO2VIGDColOrfGnnuL1JFzyOdxkjR1MlWGs3chP0=;
        b=iIe2jyovB088WHQ6tjx3QKWPY2A5U7wr5RV5ALRbu1hjDHT1lbSKHbkovcgGabSmpm
         H5y7rxNSYMqMdEyjit8qN0j8DLu6aa9uVH1XZ58+Q0Otx81VXB/sJ908XIj61kw3O7C1
         u9iou8kV/VnoL3+Z/xgJDZ8/vfKpGNCm9DCjWZZ3dDiOjxARNNKOp12x3aQg0R8HoebF
         faS/vNPEhZ57hUYlYdf3hfln1Ew6t28KOfLq2v5fD9JyI3/7XnKXTmTq5AZ6B4VD8ypJ
         lm43so9bvCjfTGpifaYRP61Gw9RIROYlOX+jghnXCuMitGGyHrfk0/psbXhTu6MiG6Tm
         mjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZiqEO2VIGDColOrfGnnuL1JFzyOdxkjR1MlWGs3chP0=;
        b=OxAawX1bdvspbfOKrhjaLOE/d01lmhCvk3T1kGYRxA3lioqCWqmBtuaRPfeU8XV81b
         eD3EJjslst1NPnOmL5omXHQ8VMAV1fz3rs4Iczqp0EHo+qjC/wOqr+DoL9D0/ZqJaECM
         xOrjSXfZ2vbCEiazGCpbusPcEta0vNSysWXSYLuEAQ5+fjWkUpYwKLL4oqKNk9cCOTYn
         hrODZHRhbd3AMQG+zZkiwMttpDmsNpL3Vc5ZTOkxsBDs3oHOlPIRFQJmyrQPvPLnycWG
         aS+OEhP7Zmuo/JyTYlP/nbmWo1WxyclMTVMBSGxVft60fBJidzo20lPTVBZ8UO76/B6L
         e1JQ==
X-Gm-Message-State: ACrzQf0K5VggN/xNeXizxz1yo8hQXIVUEycnblfpnu17P11Nr9WNGjCH
	pNo55ZUu2LOCpKMGyS1WY5g=
X-Google-Smtp-Source: AMsMyM6523JnG/37bTjxrxtE3EeDrFJEfeHOqg12raeQWP0VPlcYhC5PQ1/nv+ZZvhCsJSIe38ECUQ==
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id b7-20020a056402084700b00453943b0bf4mr21344681edz.301.1666439823142;
        Sat, 22 Oct 2022 04:57:03 -0700 (PDT)
Received: from [192.168.1.70] (customer-85-204-195-200.ip4.gigabit.dk. [85.204.195.200])
        by smtp.gmail.com with ESMTPSA id h19-20020aa7c613000000b004611c230bd0sm2096862edq.37.2022.10.22.04.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 04:57:02 -0700 (PDT)
Message-ID: <501cca9780af3c36e3a7a3f987d8f9e49fc25133.camel@gmail.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH] gstreamer1.0-libav: fix
 errors with ffmpeg 5.x
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 22 Oct 2022 13:57:01 +0200
In-Reply-To: <EC8F43C9-5C4A-423A-8658-19A108FA0545@arm.com>
References: <20221021131639.94436-1-claus.stovgaard@gmail.com>
	 <EC8F43C9-5C4A-423A-8658-19A108FA0545@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 11:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172060

On Fri, 2022-10-21 at 15:30 +0000, Ross Burton wrote:
> The patches need your Signed-off-by: alongside the Upstream-Status.
>=20
> Thanks,
> Ross
>=20
>=20
>=20
Thanks for the feedback.

Will send a version 2 shortly where I have updated the patch file with
this info.

/Claus


