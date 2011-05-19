Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QN2cq-000216-52
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 14:46:50 +0200
Received: by gwb11 with SMTP id 11so943393gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 05:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=k2+d53l3xI1s2NslUbNo08NGUuqGOSBsNcCtB+Ec5Lc=;
	b=r6+kb/UBj6ZWPWmJINmy5Pw09CPrpWyRWmhSApmeA6yXe9ZbTx+hubhB5hkDNqKIKV
	aKOvLEr8tdfCcdHTi2yjOZyrEoaTiBZThW2hQ/vLo/3ihpanohlRJ/gz4kFo04KIiAVh
	boY6KEeGgqoXB5ysRknNrfA4rlkMNX96sSfag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=aVHyRXIf8UWoHgvVryQLhzwXBMQK1B9ZU0pFZXvVS3DyP+GIb0l3lwmdxme6ZBZX7Y
	nz3OEyKWpZS+pnZgY97bifJc2vkdMtiQ7+SoudQZ2OEGVgEbNLkoXmqBf23Z2o70Eavw
	kCFs62vUBsVMm71rPdhpC4BpVbJuq4lcTgtgA=
MIME-Version: 1.0
Received: by 10.91.198.23 with SMTP id a23mr2434833agq.45.1305809030016; Thu,
	19 May 2011 05:43:50 -0700 (PDT)
Received: by 10.91.176.3 with HTTP; Thu, 19 May 2011 05:43:49 -0700 (PDT)
In-Reply-To: <1305807748.3424.515.camel@rex>
References: <cover.1305800693.git.lianhao.lu@intel.com>
	<BANLkTimrb+YjVGP_eh_i8nDunvye0vApJA@mail.gmail.com>
	<1305804906.3424.480.camel@rex>
	<BANLkTinzLqz6ED+=WpT_wnXkta03OiC0Yw@mail.gmail.com>
	<1305807748.3424.515.camel@rex>
Date: Thu, 19 May 2011 14:43:49 +0200
Message-ID: <BANLkTim6=weFcE9PTyZxOHrdpNZOJuEiug@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 0/5] network based PR service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2011 12:46:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/5/19 Richard Purdie <richard.purdie@linuxfoundation.org>

> On Thu, 2011-05-19 at 14:02 +0200, Frans Meulenbroeks wrote:
> > 2011/5/19 Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > > On Thu, 2011-05-19 at 13:01 +0200, Frans Meulenbroeks wrote:
> > > > What should I do to either disable this for some recipes, or use a
> > > > different (private) server?
> > > > We do not wish to rely on an external server for proprietary recipes
> (or
> > > for
> > > > recipes for which we made a local change in an overlay).
> > > > How is this case handled?
> > >
> > > This could be handled by doing things like setting:
> > >
> > > PRSERV_HOST_pn-myprivaterecipe = "somelocalhost"
> > >
> > > or
> > >
> > > PRSERV_HOST_pn-myprivaterecipe = ""
> > >
> > > to disable it.
> > >
> > > One thing we lack is a good way to apply changes like this, only if
> code
> > > is within a given layer. Even in that case, it should be possible with
> > > anonymous python to look at the location of the current .bb file and
> > > then conditionally set these variables as appropriate to the right
> > > server.
> > >
> > > Certainly this needs to be thought about and documented but I think
> > > there are ways to do it.
> > >
> > > Pardon my ignorance, but I do not really understand the complete flow
> and
> > way of working.
> >
> > Anyway if I do something like:
> >  PRSERV_HOST_pn-myprivaterecipe = ""
> > would I still be able to use PR in my recipe (like I do today)?
>
> Yes, since the PR server appends to this.
>
> > Also we do have the issue that it is desired to be able to rebuild
> without
> > network connectivity (e.g. while temporary offline while travelling).
> Would
> > that still be possible?
>
> You could use a local PR server. Obviously connecting to one central
> server without any network connectivity isn't going to happen so we have
> to be realistic about expectations.
>
> To make a perfect rebuild the local PR server would need a dump of the
> database on the central server. There isn't code for that at the moment
> and I don't think its the highest priority task out there or the most
> important use case but its certainly possible for someone to add.
>

I'd say it would already be nice if some caching is being done locally (just
like is done with e.g. downloads).

>
> > For layers, one solution could be to allow variable overriding on the
> > overlay level. I can imagine there are more uses for that (and I
> understand
> > this requires changes to the bitbake machinery).
>
> There is certainly a use case for something like this. The exact
> implementation and workings needs a lot more thought and discussion
> though. I believe its at least already possible in anonymous python (and
> if not, any extensions needed shouldn't be invasive by comparison).
>
> Hm. you consider this PR change to be non-invasive?

BTW I am not saying it is not good, and I understand the problem that you
want to solve, but I feel this could require some more thought wrt the
issues I raised before in this thread (and some more documentation and usage
info).

Frans.

