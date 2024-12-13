Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7845BE7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 21:34:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.6299.1734125690409115474
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 13:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kdvlksEz;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cf3e36a76so21580595ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 13:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734125690; x=1734730490; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s0PWybQ4WocnxgKmGpP1OvaSUVMakHQDJ1YBm9GXk3U=;
        b=kdvlksEzIpAJTBMJRwaGpD7WeAJDUMmrW1k//c3VpDSOB6391vTKIzaJo3g11r4DpK
         sqvnzP+wr0K2zZVYjwlhdfarUKTWVqgEPHP8xCjCMVPwoNMG1nf/AEC1vcwensOtWc3S
         Lshi+MhJuq0KzojJABi/jR4Llgg5UX8IpJ4fPzrMrkD8VyKOJQ60ILjSMucFt63Rq46Q
         95lTST1SgFqdsFeMTwjjJBZu++nK6CNo/bRQj5F6XR38NPxK6evKbS8+a43HCom0ECM+
         UlAyJpZw+LMGvNvdGKdTAgSDSVt5hNHZgTQPFLbOqXsgqdM3gzvwyLoD8Gk3n+2+L9VB
         sZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734125690; x=1734730490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0PWybQ4WocnxgKmGpP1OvaSUVMakHQDJ1YBm9GXk3U=;
        b=tcrNtNu1PuEIqKbGdJ/Jp9bEL020/KwkUsTu6PCFdSCgpuO+HhwSStAbIe/NFHFGX5
         s70zoTndFs+7+AShun+ONkxyo/KwAtccSBb7daHmIydyyJb16VlzFaMHwoMsEw6UbLFo
         XV65JfdjoRkiYIUbUJfuuBwOJ7E3eok2qJQ+YfwSBTplIdi/RZatiMQklmkZ6OKTB9bA
         0aG27BixjvtqC6dDxDGljVVK5x6zyh5Isk3IDQ3eZkYlt0IU+usht4+FC1g7flf3oj1c
         Fd1M8KFdD6k9jBQeeek7RU43HkoSwoXTdm9Tgp3+UnrTDe2hfokm6S6UqPNrC2N5zIr0
         bwQQ==
X-Gm-Message-State: AOJu0YzWZbbeMkiAyiU5muxu+WebXyeLDQ2icL2iu9juec+kbxeiyEAZ
	5fZOXkY6Xtrb72uyzHbF2PQdJHd47pZuxCOxefSEx2cSYu9PrNd0
X-Gm-Gg: ASbGncuT+TCbGt51T3+V3ZYpuT67+Po48WSoFOEH2pqPf2IdC6go8biMFMompo+hWxT
	7/sgicYDC3JvIutZXh8xm364t7unzgm1hU3oXT881QWj2y84q0B3MLcboP0jN74I4r3CPS7RI/1
	cCjm1uETkRughGJrywJGVAo84yNNrxoFHvCdi16nhyKbXiHrnhc5DdPNSC3IED/5bXB3fiFdEJH
	QH7h7SVCPQ/bvlNznAokE/9aBz3ZaFEQsRH3d0/DyyjChgunI44NvJD
X-Google-Smtp-Source: AGHT+IEETd+fcPP7PgyAIRBx2TSy3MIvQy2PbQ2jRDkhBt4YX505Ij5JOEbrHe9JoYgG0zg8s02Rrg==
X-Received: by 2002:a17:902:ec91:b0:216:4165:c05e with SMTP id d9443c01a7336-218929d702fmr63678465ad.24.1734125689707;
        Fri, 13 Dec 2024 13:34:49 -0800 (PST)
Received: from hiago-nb ([2804:1b3:a7c2:98cb:f0e2:79db:d3f2:453e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db7f50sm2172145ad.39.2024.12.13.13.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 13:34:49 -0800 (PST)
Date: Fri, 13 Dec 2024 18:34:46 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH] weston-init: remove kbd from RDEPENDS
Message-ID: <20241213213446.c7m4dy4sqiix6h4l@hiago-nb>
References: <20241212212431.248280-1-hiagofranco@gmail.com>
 <D6AOJ3VED5U3.3D1CKY2VGA933@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D6AOJ3VED5U3.3D1CKY2VGA933@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 21:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208697

Hi Mathieu,

On Fri, Dec 13, 2024 at 04:31:44PM +0100, Mathieu Dubois-Briand wrote:
> On Thu Dec 12, 2024 at 10:24 PM CET, Hiago De Franco via lists.openembedded.org wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > The kbd package is no longer a hard dependency for weston-init, as
> > weston has replaced weston-launch with libseat and logind as its only
> > launchers (see [1]). Remove this dependency.
> >
> > [1] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/663/commits
> >
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> >  meta/recipes-graphics/wayland/weston-init.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
> > index 5723655a9bba..0f79a44e48bc 100644
> > --- a/meta/recipes-graphics/wayland/weston-init.bb
> > +++ b/meta/recipes-graphics/wayland/weston-init.bb
> > @@ -84,7 +84,7 @@ USERADD_PACKAGES = "${PN}"
> >  #
> >  require ${THISDIR}/required-distro-features.inc
> >  
> > -RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
> > +RDEPENDS:${PN} = "weston ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
> >  
> >  INITSCRIPT_NAME = "weston"
> >  INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
> 
> Hi Hiago,
> 
> I believe this patch is breaking some oe-selftest:
> 
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/runtime/cases/weston.py", line 81, in test_weston_can_initialize_new_wayland_compositor
>     self.assertTrue(new_wl_processes, msg='Could not get new weston-desktop-shell processes (%s, try_cnt:%s) weston log: %s' % (new_wl_processes, try_cnt, weston_log))
>     ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> AssertionError: [] is not true : Could not get new weston-desktop-shell processes ([], try_cnt:5) weston log: cat: can't open '/tmp/weston-2.log': No such file or directory
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/runtime/cases/weston.py", line 89, in test_weston_supports_xwayland
>     self.assertEqual(status, 0, msg=msg)
>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
> AssertionError: 1 != 0 : xwayland does not appear to be running
> 
> https://valkyrie.yoctoproject.org/#/builders/48/builds/556/steps/14/logs/stdio
> https://valkyrie.yoctoproject.org/#/builders/75/builds/581/steps/17/logs/stdio
> 
> And another QA error:
> 
> NOTE: recipe core-image-full-cmdline-1.0-r0: task do_testimage: Succeeded
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/no-x11/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/no-x11/build/meta/lib/oeqa/runtime/cases/weston.py", line 81, in test_weston_can_initialize_new_wayland_compositor
>     self.assertTrue(new_wl_processes, msg='Could not get new weston-desktop-shell processes (%s, try_cnt:%s) weston log: %s' % (new_wl_processes, try_cnt, weston_log))
> AssertionError: [] is not true : Could not get new weston-desktop-shell processes ([], try_cnt:5) weston log: cat: can't open '/tmp/weston-2.log': No such file or directory
> 
> https://valkyrie.yoctoproject.org/#/builders/25/builds/638/steps/12/logs/stdio
> 
> Can you have a look at these issues ?

Thanks for letting me know, sure, I will take a look.

> 
> -- 
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

Cheers,

Hiago.

