Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B262C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 00:18:02 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46948.1782519480849022220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 17:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IvU7T4tp;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51a8dcdd8c7so5517531cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 17:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782519480; x=1783124280; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEOX+M8qXU4janaQc7MDkT2o0v5eZ75fP9ZdBz902AQ=;
        b=IvU7T4tpKZqKPRxjyjlblotnd12bufEo0rft5WC5ilf+W/h/JdW8nnXb+7BDKJtnlZ
         rEESt3a4zy3YQO9D6YcC//a9pczua2Tt8kS+5FARwQfsOcS5l8Kk6/tv5wb6YZjjliJL
         TWayMX07VR+Us2NXRBQQRFSK3Rrr0s0eEFreXZS/xMLVajIjd8XSrJlxz3fHd4G4zCd/
         mXNOV+hxE5CoLc2FIEf5BMUwfie984lPhD1NrD0VLBDUp+gjn2vUcJr88FQaC+K4gyn+
         ntAqsuMguhmU5wTvWtxO6pAPgML7lxgzDY877und5a+H1UT3J4+9WYkQB9CA4BvEhChy
         +kpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782519480; x=1783124280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEOX+M8qXU4janaQc7MDkT2o0v5eZ75fP9ZdBz902AQ=;
        b=q4kLOt2kVSKXXeIMirMcl1gHOn2DK4kCKBvFmTWQ/Y6klzCFzxcgcqHXDQC3NvdNAF
         xk+vFRl8ztd6MgUdetXeHMcyq3GoE2zjxqeRHOt+NB1/i9QjioXHaBxKIQR2Sylh+DCJ
         +PKnmKIn8z6DXBd4bgoZmFd5yyv8t4W2LqdCXIxyfIRzYO5OPKzrg8x1FBuajH6xdxD1
         arDP9r8t89mrdYZneCaHSRKDQ/GR8h0nt1j6vYGKFqRJ5O1YwUcnzYLntj1KgXolzd3g
         Cwq3y3AuqPYo/uFNJYfxaiHo/WsFxEtcTADK4ysHwpGiDzXZaGoZK62qoUW3dvAqgsh0
         w9KQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bg30igD6iUSXixoLevOAhGy8dgnsoREvfWyIp7ouTQ0puli/tdBvc1AnOFQc3nwvApmCx1cFH019P+07ILJ8kcg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyTiHGbq7yI7Wv+XfAvixp0Nm/f17xZ5PruVPixcGMXA+xDbMsO
	yvUuswsUxSqi/xwIZzF+FSFb1Yb+D4pK2qQhdzNLRsAiYceskh45zE7s
X-Gm-Gg: AfdE7cl2gZrfG2QbH59ICENHgC6+bUlcjhUPK+ZCyoHgs9oT4quLmqCQkuw+SxIgXgj
	xfSXQ8mk8n5kj/mjGum3O5/4kjd5WJ+8b3zyBQ19es/F2yauvc/SV4JAjvXqsfrsgq76oP2Z6as
	T+7ogLP+YEarMY1X8qt0QwPmqsmkXD9B9P+SI8/nZknpwU3LyZ2q/+2o1/GK/AD/0RyK7z2wX0F
	JrmKoRxN7XVEN9QtiNVobpl29umwjyFz5lIuVR4dXUc3nz2hZbYOx6d/CEuoxrYzbW/pbtsn8oc
	4v+qqAsAs7Tw0E7KfdFl+wZ4ThVK8AOCo1Yi59xz2S/sfGidW2nAkL9/1yKUVwOOujK1vwA3Ept
	cs24rG8lmEoAgNF9aBDoAm2iqt7FYBnIGGNn5GcoF1uXtIATHao4adfVTDq7SyEEVFh/rEPtiXg
	aQnWrovPrTHgwj5x3sFJzfB95tzt4i1GsmICo7JKi00bElghwNBNnqld9FrbbFQ7q4kg==
X-Received: by 2002:a05:622a:ab09:10b0:51a:89db:95a4 with SMTP id d75a77b69052e-51a89db9912mr27400901cf.6.1782519479711;
        Fri, 26 Jun 2026 17:17:59 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51b0cc9csm107145611cf.31.2026.06.26.17.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 17:17:57 -0700 (PDT)
Date: Fri, 26 Jun 2026 20:17:55 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: yoann.congal@smile.fr
Cc: aleksandar.nikolic010@gmail.com,
	openembedded-core@lists.openembedded.org,
	Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: Re: [OE-core] [scarthgap][PATCH v2] wic: Fix updating fstab for nvme
 devices
Message-ID: <aj8Ws4BY4p5RTISk@localhost.localdomain>
References: <20260621202519.177293-1-aleksandar.nikolic22@pm.me>
 <DJJCKP83KPUW.2ECUA0V3VKK9P@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DJJCKP83KPUW.2ECUA0V3VKK9P@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 00:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239670

On Sat 2026-06-27 @ 12:51:14 AM, Yoann Congal via lists.openembedded.org wrote:
> On Sun Jun 21, 2026 at 10:25 PM CEST, Aleksandar Nikolic via lists.openembedded.org wrote:
> > From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
> >
> > In case wks file references nvme, update_fstab() function will not add
> > prefix 'p' before the partition number, as the if condition only takes
> > mmcblk into consideration.
> >
> > In case of nvme0n1 this leads that following entries are added to fstab:
> >
> >     /dev/nvme0n11
> >     /dev/nvme0n13
> >
> > instead of:
> >
> >     /dev/nvme0n1p1
> >     /dev/nvme0n1p3
> >
> > The patch fixes this as it extends the if condition and adds prefix 'p' for
> > both mmcblk and nvme.
> >
> > Upstream-Status: Backport [https://git.yoctoproject.org/wic/commit/?id=f20cda73b495b75ef399c331f59b0e2401a3e76a]
> > Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
> 
> Hello,
> 
> Sorry I missed it in earlier reviews but it look like this patch is also
> needed on wrynose: wrynose has wic 0.3.0 but this patch is 2 commits
> above that.
> 
> To accept this patch on scarthgap, I would need a equivalent patch for
> wrynose. Can you send that and ping back here?

In scarthgap wic is part of oe-core, in wrynose it is not.

For wrynose it would require a completely different patch; but it would
probably be best to just update the SRCREV instead.

> Thanks!
> 
> > ---
> >  scripts/lib/wic/plugins/imager/direct.py | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> > index a1d152659b..b06e6a8f23 100644
> > --- a/scripts/lib/wic/plugins/imager/direct.py
> > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > @@ -133,8 +133,8 @@ class DirectPlugin(ImagerPlugin):
> >              elif part.use_label:
> >                  device_name = "LABEL=%s" % part.label
> >              else:
> > -                # mmc device partitions are named mmcblk0p1, mmcblk0p2..
> > -                prefix = 'p' if  part.disk.startswith('mmcblk') else ''
> > +                # mmc and nvme device partitions start with prefix 'p'
> > +                prefix = 'p' if part.disk.startswith(('mmcblk', 'nvme')) else ''
> >                  device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
> >  
> >              opts = part.fsopts if part.fsopts else "defaults"
> > @@ -266,7 +266,7 @@ class DirectPlugin(ImagerPlugin):
> >                  elif part.label and self.ptable_format != 'msdos':
> >                      return "PARTLABEL=%s" % part.label
> >                  else:
> > -                    suffix = 'p' if part.disk.startswith('mmcblk') else ''
> > +                    suffix = 'p' if part.disk.startswith(('mmcblk', 'nvme')) else ''
> >                      return "/dev/%s%s%-d" % (part.disk, suffix, part.realnum)
> >  
> >      def cleanup(self):
> 
> 
> -- 
> Yoann Congal
> Smile ECS
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239668): https://lists.openembedded.org/g/openembedded-core/message/239668
> Mute This Topic: https://lists.openembedded.org/mt/119915320/900817
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [twoerner@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


