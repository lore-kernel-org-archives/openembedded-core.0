Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E3AC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 14:46:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.10680.1677077193485640759
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 06:46:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FI2lvHNO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id p3-20020a05600c358300b003e206711347so5559401wmq.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 06:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uO/RhA8I2Pjy8sRZIJlv7BLIf+ATuXsfVnVWt+hMRCg=;
        b=FI2lvHNOwnDT1dYA6jF34iFDWECwICQX3S/5ahzFrYZAqO5QvQEs7Mrv23OJA9ztmt
         kckFlifJLmTS14laYf/LiOHbgU07rhNwgy0MwtvDA5A6OJEnS8dUBbP4N7De6vfPMyT6
         AcJaCWM/Az4oE5lbCCWBQeekyu38CxwBFiapM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uO/RhA8I2Pjy8sRZIJlv7BLIf+ATuXsfVnVWt+hMRCg=;
        b=T2xkH2E7HgEq5TNJwR7eilS09uNxoDcbefAKm+BpJTlz4DkCOqK6SgqoeS7MhdZ6Jy
         lPJtEG8HTq9ZZ4cCwhkUQ2hjzF2jmQoA25cBr6xIMPlYGDC5+W22x0dj1nuBo3y5cLv0
         O3+GTF/XNHKP8g2/xt9mgyc5rmfo9zsizr5K6VypE9t9r7lbNzdggYG/rSJXmIdGnYz6
         PNMqFLBcQdmm5LSC8XY1ufIQ3aqWLMll2RV9pleBOum5OBez63jZyTHlYgNtts2zjXnQ
         DL1eHzWpnjSVd75MVI7RUBdB3mUPvqKmKHX4XbV81KdVNkEFWSbmZ/iKK7ShMS9hpWf2
         k7uA==
X-Gm-Message-State: AO0yUKWeXhTCR+CJQy7rvuaBe4Qa4C4//SifQ8ONV4SZChXLlvlGjTpK
	xbPvejsamGscrXMcnoB0QzCJvw==
X-Google-Smtp-Source: AK7set8B0stokFQH4r9niUQasxVg5weMG7Z8B8z8L3bWKxQGE5+X6hv4EpzOEid8L5iUpzZ88C+W8A==
X-Received: by 2002:a05:600c:747:b0:3dc:5a13:c7d1 with SMTP id j7-20020a05600c074700b003dc5a13c7d1mr1406826wmn.16.1677077191784;
        Wed, 22 Feb 2023 06:46:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d5d1:6a95:9b62:17ab? ([2001:8b0:aba:5f3c:d5d1:6a95:9b62:17ab])
        by smtp.gmail.com with ESMTPSA id v17-20020adff691000000b002c70e60eb40sm46640wrp.11.2023.02.22.06.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:46:31 -0800 (PST)
Message-ID: <f2196b6ddf707837c46c3a3bfd86b1f3c82867db.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 08/11] build-appliance-image: use a real /tmp
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2023 14:46:30 +0000
In-Reply-To: <20230222022522.GA26598@localhost>
References: <20230221204445.23931-1-twoerner@gmail.com>
	 <1745F1D06F6A6D6B.17041@lists.openembedded.org>
	 <20230222022522.GA26598@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 14:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177571

On Tue, 2023-02-21 at 21:25 -0500, Trevor Woerner wrote:
> On Tue 2023-02-21 @ 03:44:42 PM, Trevor Woerner via lists.openembedded.or=
g wrote:
> > Make /tmp a real directory in the root filesystem and not a link to an
> > in-memory tmpfs. Otherwise bitbake will run out of inodes on /tmp very =
quickly
> > and stop any build.
> >=20
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b=
/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > index 3a84de0a2b43..1f7b96a9fcf4 100644
> > --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > @@ -113,6 +113,12 @@ fakeroot do_tweak_image () {
> >  	# add a /lib64 symlink
> >  	# this is needed for building rust-native on a 64-bit build appliance
> >  	ln -rs ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/lib64
> > +
> > +	# make /tmp a real directory and not a link to an in-memory tmpfs
> > +	# otherwise /tmp will run out of inodes very quickly when bitbaking
> > +	sed -i -e 's#l root root 1777 /tmp /var/tmp#d root root 1777 /tmp non=
e#' ${IMAGE_ROOTFS}/etc/default/volatiles/00_core
> > +	mkdir -p ${IMAGE_ROOTFS}/tmp
> > +	chmod 1777 ${IMAGE_ROOTFS}/tmp
> >  }
>=20
> Richard, this feels rather "hacky" to me. I can't help wonder if it would=
 be
> better to implement a VOLATILE_TMP_DIR mechanism (along the same lines as
> VOLATILE_LOG_DIR)?
>=20
> https://docs.yoctoproject.org/dev/ref-manual/variables.html?highlight=3Dv=
olatile_log_dir#term-VOLATILE_LOG_DIR
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/ini=
tscripts/initscripts_1.0.bb#n107

When I saw this, I was wondering about that too...

I think I'll hold off this patch whilst we think about that a bit but
my memory on this area is taking a bit of paging back in.

Cheers,

Richard

