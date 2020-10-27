Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.1038.1603842017799958170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 16:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IoiDqSzh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id c194so2922412wme.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 16:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=1AxwDm4TM0g+lpzomrzgPnNpLAxNIdpQstaYaiDRGLU=;
        b=IoiDqSzhXdad7gVBu3EQsp1/Z1RZ8N/JXoYYdEr0mTFt7kczFYRSIRKehjVR+WCZ1N
         E9ei05e5TTuAzNNUo9Lx93xkNV0rl33bjCAjCuVQDfczP4z4SG41BfzilrT+uqUDrR8X
         uPmlH3jRbKiCRDg/C1nLyZQ0QstbWsY1uam90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1AxwDm4TM0g+lpzomrzgPnNpLAxNIdpQstaYaiDRGLU=;
        b=MhJTBqTspqo5fwM8bljnriDIrzcWGoD2XwdFgeDdkanwcG0gMrnxblUPQVrItmJadT
         EbHJS2SRySLIViomf6vFi5TmFkKtDDJ6UrnrgHyOiJMXt8M7YNcfj6ebEmMeW/nGet5v
         hzNbuGcUlqJRDq9lirIth44AaYSBhhJQzrD+ZM/Lhwxk+XArmA9G3nkJCJgleVvkpqzI
         4z7sVdV8Z+60whwNrPruYyEEvHEny3BxbkotSNIYd/AGHAxMTm5xZyeVE5YU+sdGazVh
         0uoNogGJ72tzt3tlckQb+4UtLy+/EJaVMgxDI5bx3N74joFRpu7xeJZicxMKWQjKoJtv
         j8LQ==
X-Gm-Message-State: AOAM532Gisho4C3tZg7jUkZ00ovPYjq8tVL+Hd5hAMTul8D8QDBlvOiC
	PXhhr/kUry+kG1UES4nOBxma1g==
X-Google-Smtp-Source: ABdhPJz9Xd0Re2jIvfJFfK4mNzU704BUE+MtiJx95yHljieuak/RKa69ykJ4QGn++7S0pmujApmh5g==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr5089240wmi.84.1603842016116;
        Tue, 27 Oct 2020 16:40:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id y4sm3976092wrp.74.2020.10.27.16.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 16:40:15 -0700 (PDT)
Message-ID: <d3d2b07773e8af90a4b1ba8e4366f035d5e28608.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] add new extrausers command passwd-expire - moved to PR 63
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joseph Reynolds <jrey@linux.ibm.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Oct 2020 23:40:13 +0000
In-Reply-To: <4fb6f623-c811-0593-dc89-877f128439a3@linux.ibm.com>
References: <978bccd7-a2f4-9aa0-9c77-9c10c81e068f@linux.ibm.com>
	 <f154c498c88dfc436d4b9547b889e3aa8436fc41.camel@linuxfoundation.org>
	 <4fb6f623-c811-0593-dc89-877f128439a3@linux.ibm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-27 at 18:19 -0500, Joseph Reynolds wrote:
> On 10/27/20 2:41 PM, Richard Purdie wrote:
> > Hi Joseph,
> > 
> > On Mon, 2020-10-26 at 15:41 -0500, Joseph Reynolds wrote:
> > > This enhances extrausers with a new passwd-expire command that
> > > causes
> > > a local user's password to be expired as if the `passwd --expire`
> > > command was run, so the password needs to be changed on initial
> > > login.
> > > 
> > > Example: EXTRA_USERS_PARAMS += " useradd ... sofia; passwd-expire
> > > sofia;"
> > > 
> > > Tested: on useradd accounts
> > > When configured with Linux-PAM, console login prompts for and can
> > > successfully change the password.  OpenSSH server
> > > works.  Dropbear
> > > SSH server notes the password must be changed but does not offer
> > > a
> > > password change dialog and rejects the login request.
> > > 
> > > Signed-off-by: Joseph Reynolds <joseph-reynolds@charter.net>
> > > ---
> > >    meta/classes/extrausers.bbclass   |  3 +++
> > >    meta/classes/useradd_base.bbclass | 18 ++++++++++++++++++
> > >    2 files changed, 21 insertions(+)
> > > 
> > > diff --git a/meta/classes/extrausers.bbclass
> > > b/meta/classes/extrausers.bbclass
> > > index 32569e9..90811bf 100644
> > > --- a/meta/classes/extrausers.bbclass
> > > +++ b/meta/classes/extrausers.bbclass
> > > @@ -46,6 +46,9 @@ set_user_group () {
> > >                usermod)
> > >                    perform_usermod "${IMAGE_ROOTFS}" "-R
> > > ${IMAGE_ROOTFS}
> > > $opts"
> > Unfortunately this patch is coming through line wrapped which makes
> > it
> > hard to apply. Can you resend it without the line wrapping, or
> > point at
> > a git tree with the patch in please?
> 
> Thanks.  The PR work flow is much easier for me.  I didn't realize
> OE 
> was on github.com.
> I hereby withdraw & abandon my email patch request and replace it
> with:
> https://github.com/openembedded/openembedded-core/pull/63

We don't. In this case since its mangled, I'm willing to pull from
somewhere. We do need patches on the mailing list for review since that
is where people look to review them. github works fine for a single
maintainer, I can't merge pretty much anything without public peer
review though.

Cheers,

Richard

