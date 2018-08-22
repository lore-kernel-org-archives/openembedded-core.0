Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id E275D7929B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 12:48:21 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id j19-v6so1327223ljc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 05:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KxVO1r4Xk4ELFsN4Iu/cirSCIbSIpKkzDJU1nf9tKi8=;
	b=LoFPvHf+69KwOfsTlQ1N3H+en7/C4Qt+3r7TDxLv8vhQn4dhE5tPy79xb1lLkTJEWF
	X5e1P9w3pP/ySxRpLdzXcsCBmOHtTiHvlRskZTHNNtCTU/6IpEHkmi8G4ziAn6o1CX9j
	LykxQsVKy1r8Powz73yD5dpYt5i9s+uhn5zP8VFbdJtOL8CgXvXI5/ijxLKr/FkbBKbv
	HSikt2PFd4Chu60L+AB5Zj/9DAXjpqiRJYQIauy16Rduke5CAMX5+XX7Dwd7qkkiCp15
	4OeaGZJFjwaBTR0Fiy7PJexPtbGmwmh4r4ImDmTHEPIdP95AP72Lsp68f+q6k43IF/UV
	WGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KxVO1r4Xk4ELFsN4Iu/cirSCIbSIpKkzDJU1nf9tKi8=;
	b=Bw7+c9NIQzcaNHH5tRMup2f4T06UmXCOXZEr1Ub1LchinAnAAEtdVtKFKX0Mis4bC6
	Ml7ZeG8HS+chC51VjsGkAr6OxZv7er9Nq1m59bMh22wT4uoj723L2T8vpk+PpsFVLgFw
	0WpEoosu9gyA1XMVMQIcO03D63qqsjq89IqWIc/69j2BxaJynA2to/w0IxbOhzojyDY/
	CtyuMRbLDT1gVgkvLCI9VqHtvo9xPLKKoQH6T/yxJ4MnCX44s8Tasapn+ylSqlJNLzNK
	FdNuBwHrD7pmQ6mnhzKNA4iz0NBTqIFach4Y9UGXT4vdnn6bfYogUySqDZKx5cNnfbQm
	fntw==
X-Gm-Message-State: APzg51DRM/16yLRNai41z6VIYn33qw26f8HX9FOoq9ZB6v9fxL09VuNO
	9vLBYxr8VHtlSwHcOYEEV99W7zZ+98UMWDEmfgw=
X-Google-Smtp-Source: ANB0Vdb4tlcAg4NS5yz1XxkPo8CfUmpkp5xcbxqF0va/bXDwieRdOP/jgV1fZfGtzLcTQSA7qLlFPDBYTUGCEDGTmEc=
X-Received: by 2002:a2e:1086:: with SMTP id 6-v6mr2440317ljq.59.1534942102321; 
	Wed, 22 Aug 2018 05:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
In-Reply-To: <10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 22 Aug 2018 14:48:05 +0200
Message-ID: <CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 12:48:22 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard


On Wed, Aug 22, 2018 at 2:45 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2018-08-21 at 16:58 +0200, Ricardo Ribalda Delgado wrote:
> > RTLDLIST table does not include /lib/ld-linux-x86-64.so.2, resulting
> > on the following error:
> >
> > root@qt5122:~# ldd ./qtec_webcam
> > not a dynamic executable
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
> >  .../glibc/glibc/0031-ldd-rewrite.patch        | 22
> > +++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.28.bb         |  1 +
> >  2 files changed, 23 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc/0031-ldd-
> > rewrite.patch
>
> I'm a bit confused as with MACHINE=qemux86-64, building core-image-sato
> with ldd added to IMAGE_INSTALL, ldd works correctly even though it has
> /lib/ld-linux-x86-64.so.2 (which is listed in RTLDLIST).
>
> We have an automated QA test checking this too:
>
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oeqa/runtime/cases/ldd.py
>
> Which version of the project are you using? How would we reproduce the
> issue?
>

I am using yocto-sumo

Maybe your tests are run agains an image that has the package lsb
installed. Which creates symbolic links to the standard locations


> Regards,
>
> Richard



-- 
Ricardo Ribalda

