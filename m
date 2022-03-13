Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB36FC433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 12:26:28 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.14723.1647174387349827224
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 05:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L/UJlBpk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so8006295wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 05:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Ut+9Gm9w2SQCJ3RnLzZP47ITLntKHvQLo0NaPHWB1QE=;
        b=L/UJlBpksxeTrwUEAZWfuXqDLJaTnUg5M/0DU31WTg1gPUePmdpFf99pH7/6VZ9ZEI
         KYiNaPoCG6S+NEtzowGQwY2AO8Jaxt2j8K/6l+kh314uSuNjdwXDLvMbqK9V6cGfUn8H
         Z8qcLT31JovhO+iK9uZhCxFgOZ1c/gxumezUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ut+9Gm9w2SQCJ3RnLzZP47ITLntKHvQLo0NaPHWB1QE=;
        b=4DfR7axUdjNOwNHJt66+yxdIA1l7DaXrNv03u6IlDAKJBjOKf9/QNdw4n8q45qCry+
         AbGi+t1H8D0BGwfYzzXRHiNngK6Tjs3Y+jiez1WRRSQFXl2EG8RVEuVcKYBumeZksofT
         UKsYOgxzeuAVK8J9L7Gjy2R6zIEl/h7V4kB4k/h8twkeVDOzeafgfLJnOVL7qqKLZqgR
         2ylTyayFQNdCE1QMoZ+K8vq/MLiiz6HVQcXu/tIkDv4MN8IDfYgMGKXFjfDWxJdZmnHi
         RhNFrgGV87IYeuBWGDsoBeLWKDbcnd67/cElTfSTfu3WsYL93AOJoxP/HS6l2ad2UVsp
         Dogw==
X-Gm-Message-State: AOAM531egFn2W/NveioVrOZmGW76mNlaRy2iDTj2wdr6cZi2JW+Xorsr
	0iZ/s2430N+PdccCqnAzJ1pROGKhksoxIiRs
X-Google-Smtp-Source: 
 ABdhPJw1bdtIr5m5tC9OyTzlO8hwtUy2iPlX2LwRANUh8I4RcjUEzOvlicwYIEKH0s79u5DcXwuqYA==
X-Received: by 2002:a1c:f70a:0:b0:37c:533d:d296 with SMTP id
 v10-20020a1cf70a000000b0037c533dd296mr13859774wmh.147.1647174385826;
        Sun, 13 Mar 2022 05:26:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cbdf:7d09:95e7:c814?
 ([2001:8b0:aba:5f3c:cbdf:7d09:95e7:c814])
        by smtp.gmail.com with ESMTPSA id
 p18-20020adfba92000000b001e4ae791663sm11438914wrg.62.2022.03.13.05.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 05:26:25 -0700 (PDT)
Message-ID: 
 <21dd4bb2b67dbc3d677c7a5d13151d7a98c9c781.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] image.bbclass: make sure do_rootfs run from a
 clean workspace
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2022 12:26:24 +0000
In-Reply-To: <16DBAEAA36B258DD.19757@lists.openembedded.org>
References: <20220312115303.10434-1-liu.ming50@gmail.com>
	 <16DBAEAA36B258DD.19757@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Mar 2022 12:26:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163107

On Sat, 2022-03-12 at 16:22 +0000, Richard Purdie via lists.openembedded.org
wrote:
> On Sat, 2022-03-12 at 12:53 +0100, Ming Liu wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> > 
> > Add ${IMAGE_ROOTFS} and ${IMGDEPLOYDIR} to do_rootfs[dirs] and
> > do_rootfs[cleandirs], this ensures do_rootfs run from a clean
> > workspace, with this change, we can now remove two bb.utils.mkdirhier
> > lines from meta/lib/oe/rootfs.py.
> > 
> > Also drop ${S} from do_rootfs[cleandirs], nothing being installed into
> > that directory.
> > 
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/classes/image.bbclass | 4 ++--
> >  meta/lib/oe/rootfs.py      | 4 ----
> >  2 files changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 2b0ce4a988..98a0555040 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -252,8 +252,8 @@ fakeroot python do_rootfs () {
> >  
> >      progress_reporter.finish()
> >  }
> > -do_rootfs[dirs] = "${TOPDIR}"
> > -do_rootfs[cleandirs] += "${S} ${IMGDEPLOYDIR}"
> > +do_rootfs[dirs] = "${IMAGE_ROOTFS} ${IMGDEPLOYDIR} ${TOPDIR}"
> > +do_rootfs[cleandirs] += "${IMAGE_ROOTFS} ${IMGDEPLOYDIR}"
> >  do_rootfs[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
> >  addtask rootfs after do_prepare_recipe_sysroot
> 
> I think the removal of ${S} breaks things:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3279/steps/14/logs/stdio

FWIW I've dropped that piece of the patch and merged.

Cheers,

Richard


