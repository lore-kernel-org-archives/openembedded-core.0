Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DFBC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 20:40:48 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.4491.1677098443741875570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 12:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZQWgTVA4;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id i4so2496523ils.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 12:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omp+yohIe20ncrnfxVxZBGaLUCgMwVxYcnoUwj9Tn6s=;
        b=ZQWgTVA4vl3pVbVccqou0biSl6yRYiW+7Ex3TM8O3j8CaFzwwEAwm7nNfjRvz82Ye/
         SQZTHjwaR+1hXep9h2uqb4FD9Y9Cyk6p4U0b8fI9KGyu7ZR30ygAEd3mTmLaWrgBugNN
         Sd+KmsfyyCRWqmlEi78xUm3OPe8/m08xzl6D+TU0UWNlKZAInuLOoVD9fTZqflafKCgq
         FxlV4z6V3PaaDHrCsaJzqk9k+p74ziqwY8hkiG9rQTMf98OmYLTzhPX/u8SqW6yEi7QX
         HTZEPz/YYB+GWB0SIJR0eGO9oHv8pTD29SZAg/hgFDAedeTl8g9r8cYLGFkgfH5ILOUz
         GBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omp+yohIe20ncrnfxVxZBGaLUCgMwVxYcnoUwj9Tn6s=;
        b=bnBGGMYtAbEb3ypYEWoUDer5NSc/ro0CffQsoOUwpNvSEahbK4CWAMs0UBt5a92MaD
         U6cfVnhrzaJNPOcu1YxobBzr2LedQc7lJwC1wPHMdMXn+EygrKxHedAI0kdS4R0/d9bY
         jHHAblsALb2sjDX7ZpRml7hW6ocJ2XzfrXrO1e9cgb8O0QUkEYhWGpRs3R+rs99RVa81
         gvL27GgAmStg8uU7dZn/7+pfn3yozNKDuJfkYlukpT3a7sHf5bYpdKGTvKQr4Ycm3Uso
         QeRwPdGP/Ia9FpguYRC7fmfoDAJoo+FBKQnoqB6qwaM72Hg6HQvfTDcqhhXFvvgNjEH5
         +rKw==
X-Gm-Message-State: AO0yUKV9e/ukVXmhXTgmZUk5vBnrYIVXYWoGUva9IKbXz6MEhVf5oVz7
	DFPYiW15VE7d+OQmfWikcis=
X-Google-Smtp-Source: AK7set+OzY3lrlLMajeWb2Ha0M0EzjfXSUjzN1X30t5pLYLNqvy5nQb8VqSBbwMEpbwllovodPD/mw==
X-Received: by 2002:a92:b304:0:b0:315:5467:4a3f with SMTP id p4-20020a92b304000000b0031554674a3fmr7362769ilh.30.1677098442865;
        Wed, 22 Feb 2023 12:40:42 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id l25-20020a02cd99000000b003af2cdde559sm1882735jap.35.2023.02.22.12.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 12:40:42 -0800 (PST)
Date: Wed, 22 Feb 2023 15:40:40 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 08/11] build-appliance-image: use a real /tmp
Message-ID: <20230222204040.GA14941@localhost>
References: <20230221204445.23931-1-twoerner@gmail.com>
 <1745F1D06F6A6D6B.17041@lists.openembedded.org>
 <20230222022522.GA26598@localhost>
 <f2196b6ddf707837c46c3a3bfd86b1f3c82867db.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2196b6ddf707837c46c3a3bfd86b1f3c82867db.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 20:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177585

On Wed 2023-02-22 @ 02:46:30 PM, Richard Purdie wrote:
> On Tue, 2023-02-21 at 21:25 -0500, Trevor Woerner wrote:
> > On Tue 2023-02-21 @ 03:44:42 PM, Trevor Woerner via lists.openembedded.org wrote:
> > > Make /tmp a real directory in the root filesystem and not a link to an
> > > in-memory tmpfs. Otherwise bitbake will run out of inodes on /tmp very quickly
> > > and stop any build.
> > > 
> > > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > > ---
> > >  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > > index 3a84de0a2b43..1f7b96a9fcf4 100644
> > > --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > > +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > > @@ -113,6 +113,12 @@ fakeroot do_tweak_image () {
> > >  	# add a /lib64 symlink
> > >  	# this is needed for building rust-native on a 64-bit build appliance
> > >  	ln -rs ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/lib64
> > > +
> > > +	# make /tmp a real directory and not a link to an in-memory tmpfs
> > > +	# otherwise /tmp will run out of inodes very quickly when bitbaking
> > > +	sed -i -e 's#l root root 1777 /tmp /var/tmp#d root root 1777 /tmp none#' ${IMAGE_ROOTFS}/etc/default/volatiles/00_core
> > > +	mkdir -p ${IMAGE_ROOTFS}/tmp
> > > +	chmod 1777 ${IMAGE_ROOTFS}/tmp
> > >  }
> > 
> > Richard, this feels rather "hacky" to me. I can't help wonder if it would be
> > better to implement a VOLATILE_TMP_DIR mechanism (along the same lines as
> > VOLATILE_LOG_DIR)?
> > 
> > https://docs.yoctoproject.org/dev/ref-manual/variables.html?highlight=volatile_log_dir#term-VOLATILE_LOG_DIR
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initscripts/initscripts_1.0.bb#n107
> 
> When I saw this, I was wondering about that too...
> 
> I think I'll hold off this patch whilst we think about that a bit but
> my memory on this area is taking a bit of paging back in.

Sounds good. In that case I'll wait for the others to hit master then re-work
this patch to integrate a VOLATILE_TMP_DIR mechanism?

