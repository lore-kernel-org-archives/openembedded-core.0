Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.126.1620160306439822509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 13:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:60706 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1le1hp-0005GF-0v; Tue, 04 May 2021 16:31:44 -0400
Date: Tue, 4 May 2021 16:31:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] making the meaning of "FILES_${PN}-bin" a little more obvious?
In-Reply-To: <b2fe670bee26b1d723e9bcdf6cbb3d77fa732a11.camel@linuxfoundation.org>
Message-ID: <6b33f481-616-f965-dc5b-b671751b657a@crashcourse.ca>
References: <bff7177-906f-f4e7-8085-6f245ad9a262@crashcourse.ca> <b2fe670bee26b1d723e9bcdf6cbb3d77fa732a11.camel@linuxfoundation.org>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: multipart/mixed; boundary="8323328-1375221362-1620160304=:9871"

--8323328-1375221362-1620160304=:9871
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 4 May 2021, Richard Purdie wrote:

> On Tue, 2021-05-04 at 09:31 -0400, Robert P. J. Day wrote:
> >   more nitpickery, but i note in OE's current bitbake.conf the
> > initially odd definitions:
> >
> >   FILES_${PN} = "${bindir}/* ${sbindir}/* ...'
> >      ... snip ...
> >
> >   FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"
> >
> > i say "odd" since someone perusing that file could be confused, first,
> > that that "-bin" package definition overlaps with the base package
> > file list and, more, that just above that, the definition of PACKAGES
> > doesn't include the "-bin" package:
> >
> >   PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev \
> >       ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
> >
> > so anyone currently RTFS is likely to stop and think, "what the heck
> > is the '-bin' package defined for if it's not even included in the
> > normal package list?"
> >
> >   of course, one need to consult lib_package.bbclass to finally
> > understand what its purpose is:
> >
> >   PACKAGE_BEFORE_PN = "${PN}-bin"
> >
> > but if that's the only purpose for that package definition, would it
> > not make more sense to just move it to lib_package.bbclass so it's
> > next to the variable setting that actually causes it to be processed?
> >
> >   of course it works as is, it just seems unnecessarily confusing,
> > unless there's some subtle ordering requirement happening here.
>
> I suspect such a change may break as some other recipe may use
> ${PN}-bin but not the class. We'd need a careful audit to figure it
> out...

  i know this seems like a minor point, but i'll expand on this a bit
more, then i'll shut the hell up about it.

  as i read it, the *only* context where a package called
"FILES_${PN}-bin" makes sense is to separate the binaries from an
obvious library package, where -- in the overwhelming number of cases
-- any binaries that accompany a library package are non-essential
executables for things like, say, configuration, or a demo program, or
possibly debugging, that sort of thing.

  so you're absolutely right -- combining the package definition with
its inclusion in the PACKAGES variable in lib_package.bbclass might
very well break something, but i submit that that's something that can
then be cleaned up, the object being that, whenever anyone sees
"FILES_${PN}-bin", they know *exactly* what it's being used for and
the code is clearer. if any recipe is using that variable for any
other reason, i submit that it's being misused and should be "fixed."

  anyway, i'll shut up now and find something else to gripe about. :-)


rday

--8323328-1375221362-1620160304=:9871--
