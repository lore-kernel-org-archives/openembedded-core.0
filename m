Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.7941.1631778820345569384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 00:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UC0eZj9i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so3804226wml.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 00:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JJPpQLnCibeJ7snnUQAKh07m2SSOIUR7oo20/bfhgKg=;
        b=UC0eZj9iVa2qqeoqUuwt+5CC8ZFhpxCQVRzN1lkLTa2ChAvqcjgOS7l3PXWADWvVve
         GhjYWzSgyWgV7NfH8BymX4SAMqJgls+R8hZVA3cVnR+PDXy7vroNkxBp7Og8yEQdgNKT
         8kT3YKzWNhqBsevCCYjgI5KmyIDRBy9jSnOJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JJPpQLnCibeJ7snnUQAKh07m2SSOIUR7oo20/bfhgKg=;
        b=mWkr1x6yLP12FwOi8uJ0zd2b9AXoi4wCtYGo89zulL5kQVP6SMXU1gk0RCR+1vTtNk
         C2WTlrB16h+0V/QWNRwqFRqCyhOs60zZkwK9m5oYd4fjLftD6PxbSa2q4m/Xfx1Kc3zW
         YYVA4RMAfXZ1Ae6zgYpHgOMzEsqtjZsxJH4cecwrRbwWDLHXAoHqwdF4C3vAk1Nt4AHz
         SVPY5I3OswUazw1OdCqy51pV6Kxw7xCH1Y1JffynUJRRdlYVQWwDcnAaNdFlCUoXxFpB
         YyC2QGpnnTz5eQPVIdMTj/1r6S5NQZO5j3PpNbBqcqnsUdEfs+ntyXoslGxDh2Hk8IbT
         kboQ==
X-Gm-Message-State: AOAM532rnCE1cGqPNwC1yOnte8MCyUcD3rb4CBeHkn9gmz12VkE94JV2
	//6HA6vGrjCdtcD1Gb1jK5ksSg==
X-Google-Smtp-Source: ABdhPJxovMxIu5z1gBU39rc/LiXT/LpW3yckW+iUyIGcJcFxRxzEpEbghI6dbba2bQHC+fTJIdWIZQ==
X-Received: by 2002:a05:600c:1c9a:: with SMTP id k26mr8614028wms.95.1631778818826;
        Thu, 16 Sep 2021 00:53:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c? ([2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c])
        by smtp.gmail.com with ESMTPSA id c9sm2611241wrf.77.2021.09.16.00.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 00:53:38 -0700 (PDT)
Message-ID: <07fc5dc3d216f0fa6c081506aa92701508604bab.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] state/staging: Fix directory not deleted for race
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, vinay.m.engg@gmail.com
Date: Thu, 16 Sep 2021 08:53:37 +0100
In-Reply-To: <16A53DBD300C0C8E.4388@lists.openembedded.org>
References: <20210915114618.157245-1-pgowda.cve@gmail.com>
	 <16A53DBD300C0C8E.4388@lists.openembedded.org>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-09-16 at 08:45 +0100, Richard Purdie via lists.openembedded.org
wrote:
> On Wed, 2021-09-15 at 04:46 -0700, Pgowda wrote:
> > The race issue resulted in some empty directories not being deleted.
> > During staging_copyfile, it results in "file already exists error" on
> > creating link for directories during do_prepare_recipe_sysroot.
> > The following patch checks whether the directory and its sub directories
> > have no files in it and removes them.
> > 
> > The issue was observed on running rust-hello-world for glibc and musl
> > one after the other.
> > TCLIBC=glibc MACHINE=qemuarm bitbake rust-hello-world
> > TCLIBC=musl MACHINE=qemuarm bitbake rust-hello-world
> > 
> > On fixing the above issue, it was found that
> > arm-poky-linux-musleabi.json files are not being generated.
> > $/del/build/tmp/work/x86_64-linux/rust-cross-arm/1.54.0-r0/targets/
> > arm-poky-linux-musleabi.json': No such file or directory
> > 
> > It is generated and builds successfully when musl lib is built standalone.
> > However, when musl is built after glibc or viceversa results in the
> > latter json file not being generated.
> > 
> > Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> > ---
> >  meta/classes/staging.bbclass | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> > index af3397bab6..4b751af4d3 100644
> > --- a/meta/classes/staging.bbclass
> > +++ b/meta/classes/staging.bbclass
> > @@ -145,6 +145,16 @@ def staging_copyfile(c, target, dest, postinsts, seendirs):
> >      if os.path.islink(c):
> >          linkto = os.readlink(c)
> >          if os.path.lexists(dest):
> > +            # Check if directory is not deleted for race issue
> > +            if os.path.isdir(dest):
> > +                count = 0
> > +                for root, dirs, files in os.walk(dest):
> > +                    for Files in files:
> > +                        count += 1
> > +                if count == 0:
> > +                    import shutil
> > +                    shutil.rmtree(dest)
> > +                    os.symlink(linkto, dest)
> >              if not os.path.islink(dest):
> >                  raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
> >              if os.readlink(dest) == linkto:
> 
> This change looks like a good fix but it can be improved a little.
> 
> Firstly, rather than the count and os.walk, we can just use
> "if not os.listdir(dest):".
> 
> Secondly, if we know the directory is empty and is a directory, we don' need
> rmtree, we can just use os.rmdir() which should be much faster.
> 
> I'd also clarify the comment to something like:
> 
> # Empty directories are not removed due to race issues but if we
> # find a conflict, we can remove empty directories here.

Looking further at this and your description, I think you might be saying there
are multiple levels of empty directories. If that is the case my simplification
may not work but I am more worried about why we have multiple levels of this
issue.

I would also like to understand why these files overlap and are symlinks in one
case but directories in another. Can you show some specific examples of the
files in question?

The missing json file sounds like there could be some file not being handled by
sstate but it is hard to know without looking at the code.

Cheers,

Richard

