Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.367.1620161240284554256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 13:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JqPOJSoj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id a10-20020a05600c068ab029014dcda1971aso41457wmn.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 13:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bIxP4lUfJ5onbZKaOBbOhVAHYqRnX1FOZh3f8XV99c0=;
        b=JqPOJSojY4q/5blCXVfiL6JcVbG90/KnWCBdOBqgjGsP6ikrD7/y2inDO749/8obtw
         54RByTtONbD0NrDi+rDpiClSUxuFwpmop2lMJ4MhcUhysgzW2XIa9tgQmzYQJoCgPesH
         az5YkTnOiehEKfGXnF4+HjKXckqeGK4iUITNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bIxP4lUfJ5onbZKaOBbOhVAHYqRnX1FOZh3f8XV99c0=;
        b=OAc9suoLf/lATmQTC1AcoHgw1ma4V4+piZy8aaH245QngJPzDe3gzhID66SZGOeZV9
         9iZ2IlaYZjCozRm1wEn6c6uL0dRr2oCeg95QqzpsMbZLaC9N9sFImXrW6lq9iYuXlHhd
         BJ3tfVnRUD18E0LIqwGEH5ZR2e3x78Tm41XYmnxwDN5QN0ZWQY6ma0YjhKqhKUb9Y1gH
         Xo6MeYnOCjXRwxpabRceQb8G29gCgg6VMQYW+RVvfYZ1H0nofT56d5yuERO9Jhd5zIHa
         iR+Yo390XfKQQ8aJd4tSIOKiybJKYTcRzyWhFB4x0mHEYz+HjA4msuv2MuQSNoZ9rjp/
         Zl1Q==
X-Gm-Message-State: AOAM531H1hvuQAztmEYZXJtXGGSBKDWdAjLJV1wMlYy1zLQaoO7/CCM9
	eayCcGxPqGL9j3e4RmKM2Lw6dw==
X-Google-Smtp-Source: ABdhPJw8DnOr04f3pxEcFKlkYhrse/SZWjNzhPsEbdjjoF9WmD7EMBK6MEJtCHh/oBhN2gCPwjwN9A==
X-Received: by 2002:a1c:e409:: with SMTP id b9mr6195708wmh.189.1620161238721;
        Tue, 04 May 2021 13:47:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8041:e424:9226:62e7? ([2001:8b0:aba:5f3c:8041:e424:9226:62e7])
        by smtp.gmail.com with ESMTPSA id g19sm3331995wme.48.2021.05.04.13.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 13:47:18 -0700 (PDT)
Message-ID: <682545dbbe96af7d1fba65e31c3309c7207e85b5.camel@linuxfoundation.org>
Subject: Re: [OE-core] making the meaning of "FILES_${PN}-bin" a little more obvious?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Tue, 04 May 2021 21:47:17 +0100
In-Reply-To: <6b33f481-616-f965-dc5b-b671751b657a@crashcourse.ca>
References: <bff7177-906f-f4e7-8085-6f245ad9a262@crashcourse.ca>
	 <b2fe670bee26b1d723e9bcdf6cbb3d77fa732a11.camel@linuxfoundation.org>
	 <6b33f481-616-f965-dc5b-b671751b657a@crashcourse.ca>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-05-04 at 16:31 -0400, Robert P. J. Day wrote:
> On Tue, 4 May 2021, Richard Purdie wrote:
> 
> > On Tue, 2021-05-04 at 09:31 -0400, Robert P. J. Day wrote:
> > >   more nitpickery, but i note in OE's current bitbake.conf the
> > > initially odd definitions:
> > > 
> > >   FILES_${PN} = "${bindir}/* ${sbindir}/* ...'
> > >      ... snip ...
> > > 
> > >   FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"
> > > 
> > > i say "odd" since someone perusing that file could be confused, first,
> > > that that "-bin" package definition overlaps with the base package
> > > file list and, more, that just above that, the definition of PACKAGES
> > > doesn't include the "-bin" package:
> > > 
> > >   PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev \
> > >       ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
> > > 
> > > so anyone currently RTFS is likely to stop and think, "what the heck
> > > is the '-bin' package defined for if it's not even included in the
> > > normal package list?"
> > > 
> > >   of course, one need to consult lib_package.bbclass to finally
> > > understand what its purpose is:
> > > 
> > >   PACKAGE_BEFORE_PN = "${PN}-bin"
> > > 
> > > but if that's the only purpose for that package definition, would it
> > > not make more sense to just move it to lib_package.bbclass so it's
> > > next to the variable setting that actually causes it to be processed?
> > > 
> > >   of course it works as is, it just seems unnecessarily confusing,
> > > unless there's some subtle ordering requirement happening here.
> > 
> > I suspect such a change may break as some other recipe may use
> > ${PN}-bin but not the class. We'd need a careful audit to figure it
> > out...
> 
>   i know this seems like a minor point, but i'll expand on this a bit
> more, then i'll shut the hell up about it.
> 
>   as i read it, the *only* context where a package called
> "FILES_${PN}-bin" makes sense is to separate the binaries from an
> obvious library package, where -- in the overwhelming number of cases
> -- any binaries that accompany a library package are non-essential
> executables for things like, say, configuration, or a demo program, or
> possibly debugging, that sort of thing.
> 
>   so you're absolutely right -- combining the package definition with
> its inclusion in the PACKAGES variable in lib_package.bbclass might
> very well break something, but i submit that that's something that can
> then be cleaned up, the object being that, whenever anyone sees
> "FILES_${PN}-bin", they know *exactly* what it's being used for and
> the code is clearer. if any recipe is using that variable for any
> other reason, i submit that it's being misused and should be "fixed."

I have no objection to the idea, I just wanted to make it clear there is 
work that has to be done to do this. If someone steps up and does the work,
great. What I don't particularly want is an untested patch which breaks 
things and then I get forced into cleaning up the mess.

Cheers,

Richard




