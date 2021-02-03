Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web09.11988.1612370044302567707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 08:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fgKdAjDW;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id v123so121350yba.13
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 08:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cr7j7by9z0T+MopAtox2AhFVDYT7GV8by2RPJLDJF1U=;
        b=fgKdAjDWL5sQOMdVZM2uUrJcdeCPOKIip7KlokhoFXJENk4aBGyKmUfXv1EWQOQ6y7
         dwpFX4ChI4FbS+nLIFApx1UcU/6SJF55hxFNF9oEaEO5V007VjILo1oBIYEtrV/rSG2j
         StWKZatU7Fi1sHwszJEyHYZpS/HSjCczKPBMQPyD175WYdxboh8fBFWRNy3lC/rrvgTN
         k1NjgL2zgRQHOnJYN2hFk/BbxL0GNoJuSLSM/WHbX7HGK83Us6yZVLHUqA02ZZuxul+M
         I2tXtO4ILKLjk/Ke3QEf5k1j5XMpyjo7ITNlnfGLVr+gSx2vY0G7rriJNfvHsuoGAgl/
         htWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cr7j7by9z0T+MopAtox2AhFVDYT7GV8by2RPJLDJF1U=;
        b=qIh6VdrW1xQtj8w0yJVR20akFLbSgal/uB1v+D2S16LGS9BRBC4AaUa4nTGrVudfhy
         /IJlieZib86BSo9LCD+zad8qXdAwcNv82MaPj91iCIm8M4FxEcI/SIoWNIipNWxm8nTT
         mqPIivAKf9rGvOvr0ECGcH4n2of7a1YtBKwaD0nNtP23mlu0sY3P1FXAxuEtyWOwrWRj
         uyQel7jyDVhQRSjBK1Dw7bCo7+p/SM8iWBXADAGptXOxEnqHqTeeQ7vOvtvgHQjUNLms
         6mP7pIXckfZlS+7haU6T06VvShgMHi7ZR1VTaxZRdGZ9tDLWT4rhRkz7i0v23mH51HXH
         enFQ==
X-Gm-Message-State: AOAM531c4BGqnDC35ERrlRT51GyJiGD/W0Jpx8gf6T53FAY7NAwuvPdi
	0e1G4TvoFJTBYpXabl2u1Q9HV1ZaQTBpkD063uc=
X-Google-Smtp-Source: ABdhPJzIWp0Hjux11QK0Iz49BZEJSnspIQ9616gs8JOXYsoplESKPHNCrexZZtZd2+QfYOKLq7GNcW+u8KzrzoF/nzU=
X-Received: by 2002:a25:d015:: with SMTP id h21mr5796065ybg.61.1612370043584;
 Wed, 03 Feb 2021 08:34:03 -0800 (PST)
MIME-Version: 1.0
References: <1612369223-5608-1-git-send-email-sbanerje@codeaurora.org> <c26b70b89acf21df70c8be98c1797baf@codeaurora.org>
In-Reply-To: <c26b70b89acf21df70c8be98c1797baf@codeaurora.org>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 3 Feb 2021 06:33:52 -1000
Message-ID: <CAGDS+nksVdAgWgwCiC1JcoBbnMyQzOMCL8wFr5bAHQU2vGRwug@mail.gmail.com>
Subject: Re: [OE-core] [Dunfell][PATCH] layer.conf: fix sanity error for PATH variable in extensible SDK workflow
To: Sourabh Banerjee <sbanerje@codeaurora.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, vkraleti@codeaurora.org, 
	ndeche@codeaurora.org, himalg@codeaurora.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 3, 2021 at 6:24 AM Sourabh Banerjee <sbanerje@codeaurora.org> wrote:
>
> On 2021-02-03 21:50, Sourabh Banerjee wrote:
> > Sanity checker reports following error for the PATH variable,
> > when bitbake -e <recipe> command is run in an extensible SDK workspace.
> >    PATH contains '.', './' or '' (empty element), which will break the
> > build
> >
> > In case of extensible SDK, PATH variable is formed with two consecutive
> > ':'
> > as bb.utils.which(d.getVar('PATH'),'bitbake') call returns an empty
> > string.
> >
> > This change adds ':' if BITBAKEPATH is a non empty string.
> >
> > (From OE-Core rev: 05a87be51b44608ce4f77ac332df90a3cd2445ef)
> >
> > Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/conf/layer.conf | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> > index d593492..2d9cd05 100644
> > --- a/meta/conf/layer.conf
> > +++ b/meta/conf/layer.conf
> > @@ -102,4 +102,6 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
> >  SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
> >
> >  # We need to keep bitbake tools in PATH
> > -PATH :=
> > "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
> > +# Avoid empty path entries
> > +BITBAKEPATH :=
> > "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
> > +PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' is not '' else
> > ''}${HOSTTOOLS_DIR}"
>
> Hi Steve,
>
> This is a backport from from master to Dunfell.

Got it.  Thanks!

Steve
