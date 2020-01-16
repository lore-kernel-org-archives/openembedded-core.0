Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0909C7C410
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 15:17:45 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 5so19145744qtz.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 07:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Cmy66hlr6w5r4DFzCmCZBsFikNfEYpT0u0fx4KcaBFs=;
	b=B48WRsgbgyMOC5iSEqSDZhUygjmW8xIxo6Oe/Wmm7Q1svtIe1ZJLQAzuJZziQYKtp0
	/R0WtFME4WbJidHr0LbKQmXfeMiz9PoLGt56LKRRnKMvlSvWi3fXsf5RjCZQn9ZxduEi
	URuZFZ8bfTV+ZagfTscFpHKN8hJok4lscICt2gqG4rXQAcngADFMIh6eTGfHo4Zq4LQd
	ZiEj16Gk2Wjc7RiVIxRzOS/YZWw5KgRjSTvDnK7LFdNJpHRz+RJBc2d1vmsmhKUN2dfV
	8n9rifsgAV+z72N4ncftBstbo2fWCz7NEYZ7wguHovZZiZvVfxZ1mkzH+2k9vUYGwGsJ
	nYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Cmy66hlr6w5r4DFzCmCZBsFikNfEYpT0u0fx4KcaBFs=;
	b=WLJWb15KxTvx2u3vEaBGOpqiY+bKKLReVmvgXKn0z/AL2q7PYmz9twA1436V1zWamM
	k4QNhJn/EHwrY94Th38MCswJwz8cXluzbFVwem3Rp+H7//KczuZbQR45wm+l5/52L1VI
	LFmLkxaLUReZqolHmt6fbwlvJ0pEYsTDBN0HZpS5e0CwEGymQTqRC+mQTaAdxI1yY9Vv
	Z9tfmSsFRHtIi6wfeEEqzgO0qV0sbwHsc30mqeAgFIjmcEdRXKwbBMNKYhkGDxgVKinM
	YhrHLnp8mJDBAqqc+341P0tVNrP9WqRM6jtFoUKRHMf8HDhew8VOpkE7FI0G41hImODu
	hoZw==
X-Gm-Message-State: APjAAAUn5uh4jRKk+qAPbyeEbZr2KEMDiU6mCcfu2XjXgSK+gURyrp0F
	OJdKuXevJEaCnsKt4U2IQHc7OzMaBG5le2FiVAEF7ZdKR8E=
X-Google-Smtp-Source: APXvYqxvYqDcSLQecSUahpdecX584e1+5WpylY87oq1bqTerAPgXxteqXuAJPxvdtE0HiiBkYAW2cDEsjD6P3cl2GJc=
X-Received: by 2002:ac8:4657:: with SMTP id f23mr2895770qto.378.1579187866449; 
	Thu, 16 Jan 2020 07:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20200116044609.3902260-1-raj.khem@gmail.com>
	<20200116131330.GA2546@localhost>
In-Reply-To: <20200116131330.GA2546@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Jan 2020 07:17:20 -0800
Message-ID: <CAMKF1spz1u9sPwQK2wyyQBUeLJ611XXYwUWHUfK6TZXcFNXJ=Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gettext: Fix overloadable error with clang
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
X-List-Received-Date: Thu, 16 Jan 2020 15:17:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 16, 2020 at 5:13 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Jan 15, 2020 at 08:46:09PM -0800, Khem Raj wrote:
> > Clang detects that getcwd is being re-declared and signatures don't
> > match, simple solution is to let clang use overloadable attribute
> >...
> > +Fixes
> > +dcigettext.c:147:7: error: redeclaration of 'getcwd' must have the 'overloadable' attribute
> >...
> > +-char *getcwd ();
> >...
>
> Looks like a bug in clang to me, and should be fixed there.
>
> The code does not tell anything regarding the parameters,
> but clang seems to misinterpret it as "no parameters".
>
its conflicting with declaration from glibc system headers

usr/include/unistd.h:extern char *getcwd (char *__buf, size_t __size)
__THROW __wur;

> cu
> Adrian

