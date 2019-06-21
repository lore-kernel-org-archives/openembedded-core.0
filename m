Return-Path: <jdmason@kudzu.us>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8147D200
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 17:44:41 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id w25so221463ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aSfhbjT7Zd9DtFHaF337lPLzU+2NAqOB2AefMNsUUXc=;
	b=h7yBXxhYWzv57T1nON+D8XLbcSAdP71wHv5+LJU3RJirE9GxUcf/6z/0/FGy9kVSbJ
	0goYZh+EjGeMU0P1ocjo7PstjLcrk7c9Ydz5erqKNdbBIH55ZnFSCkjxpYDEVkAgmo3n
	MfksNkfTK6JDtGeKVaC2VkAxA9GX/jlcz3RKXDfCiqzQLWmbNqB6c0l4pnmQR+HGyAvL
	FJ+oXbNmJENgY6qkHSM5EP8NxnVA+7yZ80/1fACrLyRdqIU8MfMDkR+Tk37cGEm0AXwH
	siQRuAqdnhC+tCbn6fE297svxYDm93Ea0WlxcUyv354BXrSEqejX4Z0Wz9nG0jQFVyjJ
	ztHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aSfhbjT7Zd9DtFHaF337lPLzU+2NAqOB2AefMNsUUXc=;
	b=srPC5IDkNkdXub15somuh50zd8oNFnk6aJekiyz5HmMh/vXhi2rQHwWy3fNYu9MRqE
	MDRi79n5lyyrVa1g+6xkL8XobEiBTp6nrZaRNvrX0KyaKenqnqZGEQ95/vIg+Zdv2aMT
	wiy/0K3fzVL1S+8lmEp0JrLtTzvv9caffBEUG3M7m56Zig2f/T2V2SYpUL8Xjb5iRYne
	cUVRgl3YTYjH24f/fpj90ZgFQL5aV/JXRaTaFfR8hJW49la/dPzIWSSZw+ZEJUIGu5kw
	6ddLhKUbo8t9AShA+Pme6WRaEN+0fCG6ZcgYQJC70Zjsu8jsCwBhJnoLX8I3ajDcCp9p
	y3Qw==
X-Gm-Message-State: APjAAAV2ctvMFpiciBWyeLMGb/pE2LwkBNr29mp7rZTVdnkC1KGfQNeg
	o37xk1yyMnRfoLf1VPYndHCrhc3PBilNglHzaXPoyg==
X-Google-Smtp-Source: APXvYqxxkWLY6h+66CTFafpeLEKbOilL/LdQt9ho0d/8DhHpZBQbgRQGEHQQl8gTagCZqvpujRGADoJL9avi9vijcgw=
X-Received: by 2002:a5d:8508:: with SMTP id q8mr14770453ion.31.1561139082562; 
	Fri, 21 Jun 2019 10:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190621154213.12761-1-jdmason@kudzu.us>
	<eea8e0445b82a8fd472fa9333a665555a990728a.camel@linuxfoundation.org>
	<CAPoiz9zekGpeDRd=PMCneuzNeBgEBzHjgoKvcrR5WjnWHUDSiw@mail.gmail.com>
	<1a9c38dca2be655c935d435a6cf6f52ae8342bf6.camel@linuxfoundation.org>
In-Reply-To: <1a9c38dca2be655c935d435a6cf6f52ae8342bf6.camel@linuxfoundation.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 21 Jun 2019 13:44:31 -0400
Message-ID: <CAPoiz9z-5w_jGUtzJVtAfByUroGAo+6-rkuDP+WkKk1s89r3HA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe_syslog.py: Handle syslogd/klogd restart race
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
X-List-Received-Date: Fri, 21 Jun 2019 17:44:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 21, 2019 at 12:58 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-06-21 at 12:39 -0400, Jon Mason wrote:
> > On Fri, Jun 21, 2019 at 12:14 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Fri, 2019-06-21 at 11:42 -0400, Jon Mason wrote:
> > > >
> > > Thanks, I think this is reasonable however I think we may need to
> > > make
> > > the above a function and then call it from other places in the
> > > tests in
> > > that file.
> > >
> > > test_syslog_restart should check it did restart using the above
> > >
> > > test_syslog_startup_config does a second restart which we should
> > > also
> > > check?
> >
> > Seems reasonable.  I'll crank out v2 shortly.
> >
> > > Out of interest were you able to see error codes being returned in
> > > status in your tests?
> >
> > I used code to force every error path during development, but not
> > that
> > the testcase will fail.  So, your question did cause me to notice a
> > bug in the code when verifying that the old ones are no longer
> > running.  That should return 0 if still running, which wouldn't cause
> > the assert outside of the loop.  So, I'll need to tweak this there.
> > v2 will have this fix as well.
>
> The reason I ask is that its far from clear that busybox's starts-stop-
> daemon would notice if the daemon didn't restart so I don't think we
> can reliably trust status to be set correctly.
>
> Is there any reason we can't run these checks regardless of status?

The current code logic would work regardless of whether it failed or
not.  I we can run it every time, and it would not hurt anything.

> I realise there is slightly more overhead but it might give us more
> chance of fixing all the races?

4 extra function calls would almost be statistical noise.  I'll code
it up to do the check every time regardless and add it for each
syslogd/klogd call.

>
> Cheers,
>
> Richard
>

