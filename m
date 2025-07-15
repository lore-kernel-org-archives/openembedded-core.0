Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DA5C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:05:58 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.10852.1752591957076622139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ClNutx/3;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fd1b2a57a0so48266076d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752591956; x=1753196756; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKsNGahqw2RLkWmAqBdB5X5QiFDCR50G+kZR76CMDUc=;
        b=ClNutx/35rmiEFTV+4Bdrcb1IX/7nJTHSjm9fARJJKTYciCx6TGY1Quh2NE/2tLBP1
         Ec2dveTXCnP9Dedb/sF4Ub2LXiO8jHrWFV0ebSta/3J3ETaNuipk02dc4WxrsgUvGvoB
         CBEHLVwEDgpOwhlOGpqXQikc2CHtIp7jLzEEO25oOhYXhQKZ20LGdtYHyNJUgMkjjdhB
         L9mh5D7s4vKbeh0Md8uPkEj6px2dZdQDBd3KRDkS52JuKx0igZg6xPnzGaMml4gj3NAT
         VhYeMi2Bw0yuBLab6bqHzE5Cr//5XFT9ROAtX6D4e67ohP8Kg/Y19pOQY8Az+/Lw7H+5
         kUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752591956; x=1753196756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKsNGahqw2RLkWmAqBdB5X5QiFDCR50G+kZR76CMDUc=;
        b=pYxv2cxaQKNLzJCJe5Y2S66xvUDacb2y0k8zbPYqN5q/UbGhpDn3XIYwWTTdWCYnsp
         8oJqYnvqlZdwIqEdBRxU7FrxUj2vF5PUpzs2OPwWz72dCGDcQT/m+LdTCK/gLIqdLM9f
         b2z+RaAZjN4wivZZBseDHy7C6vj3ymJ86ZFr2gcGUmbfa67L7BrPGXN5b4NeeKJxholC
         hLqw2uNxICAHdpHfKxNjnorQK9ONmRaIGK3uTmtZSaqGZf2GMO/GNT+GRxL9Iy/h0z6R
         2o9QxNlYXR3S+Dtb4Hrt5EvBxf+0olgN3j7p2QKZBNBapcU/uLZpTtAbCDfPMUr+sUmb
         AXXg==
X-Gm-Message-State: AOJu0YwYeps80r99hy/pYIvBwYAwitgrYK6HTf7jAcX02r/n/P1Mr7r8
	0tE/sRf9asOdB+rEdtS7IXVy0vZ+DPaOiyvmSI0Phcs6wAx+bi9QwU1PXq7JitkdtjvWXb1Fo0I
	VVmAgl8lms7T0euqv+G9T+KO6No5tYDw=
X-Gm-Gg: ASbGncvqojqazPg5eTPrkNbR1ocu7VLqtINvKZOb01NHdMDoI7QKhCiEk+bld/HQGx0
	0mKf8lRtSrIYznHXtAFvJNOK23rtIjf/Gizqra2JFx+Ik4staVI7i2ZJbOKMkAVmn3HYHQjTRFO
	hzu+A2mCBmRXP55dvYGpXBZHREquFOCq1pG2sh88dXuvnae1vj3PYtGOaBpf/qXiHHQOR5OKSBU
	FLE
X-Google-Smtp-Source: AGHT+IElnOPl9U2dm4RD30WUJZ4RuAPiONKs96muoOCHhwcHbZMF5h4AMiFWjebFZlSiq1hlg8z73XVKWIZUKb1o+2w=
X-Received: by 2002:a05:6214:419a:b0:6fd:24e8:7b04 with SMTP id
 6a1803df08f44-704e5702473mr42805926d6.33.1752591955877; Tue, 15 Jul 2025
 08:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250715143139.1829393-1-ross.burton@arm.com> <nj7fgmdc26aeloydskcehk7fkkucxmr3bpnzfrmvhji7fpyeh5@bdhms5msviu4>
 <E2842659-CDB1-473F-91F5-9074337D1BE8@arm.com>
In-Reply-To: <E2842659-CDB1-473F-91F5-9074337D1BE8@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Jul 2025 17:05:46 +0200
X-Gm-Features: Ac12FXyzkBlHERsjeA4RL0sSKZ4MtLU1VNCfgW4pQqrfuXhRFmEiD49Kfk0EBtQ
Message-ID: <CANNYZj_eT9sKEBORBOPdCSbh86N3eTngJ6qxQexbpa9oo2EbGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libclc: split out of clang
To: ross.burton@arm.com, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220306

On Tue, 15 Jul 2025 at 17:01, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
> Yes, good point.
>
> Because building _all_ of clang when you don=E2=80=99t need it is painful=
, and introduces a large recipe build that bottlenecks everything else.
>
> Adding clang and using it in mesa resulted in a massive increase in build=
 time due to mesa and thus all of clang needed to be built twice.  I=E2=80=
=99m trying to recover some lost ground, by splitting out components. Even =
if they=E2=80=99re all used in the end, by not doing the build in a monolit=
hic lump you get to run more tasks in parallel.

I'd also add that this has been mentioned in weekly status emails for
the past many many weeks. Those emails are a good way to know what are
the current pain points in the core project where help is appreciated
(and ideally joining the weekly tech meeting that starts right now).

Alex

