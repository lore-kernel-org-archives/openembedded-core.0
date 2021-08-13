Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
 by mx.groups.io with SMTP id smtpd.web09.34721.1628849509330905808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 03:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=TG/m8Xfa;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.17, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id EU6LmMiOK7QW9EU6MmAGHv; Fri, 13 Aug 2021 11:07:47 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=H+BAP9Qi c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8nJEP1OIZ-IA:10 a=MhDmnRu9jo8A:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
 a=0v3lPkjCLC3KBxBmAEoA:9 a=wPNLvfGTeEIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description;
	bh=Fs+PB58mYPWUZpHt4USkp0lX6RVKPAuEf/zHnEkrOQg=; b=TG/m8XfaqIN6BF1iqVaPtWsM5e
	ybGr4DJJRvwjYX/687Y536m/sRpzAMHSeJXw+tC2wZXpW3Ih4iYgvPoyUe+H2KEs/gCqcQCYFIHBh
	LlK9hYPPhw1DKaPMCQwSYCmY901Qiv/iZxhCXLM2isJtjLQICSb2+7CtDowv/anfvEkk1Nt/7iWEh
	SYXlu2rYjfnDSd8/kVjAXO6RyZcbVidoqA6I4tvxl7MLttPZLz3XG/f9yPU7nNf5zcfImQdaXI4kY
	ZJFV1EsXOtPKUIyftAQsN+ffhyD4sAvoxY8ds34EkoWurq6KNQVAAHkWif/C5lJf8gMa8N5DFP+Jf
	TKW4u/DA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mEU6K-0001Qy-Ta; Fri, 13 Aug 2021 11:07:44 +0100
Date: Fri, 13 Aug 2021 11:07:44 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH] fcntl: Add support for F_GETPIPE_SZ
Message-ID: <20210813100744.GA1837@mcrowe.com>
References: <20210811155821.863938-1-mac@mcrowe.com>
 <20a5e86d077daf76bfc1398729b3a8ab71f9633c.camel@linuxfoundation.org>
 <169A7F7B2DA70883.29477@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <169A7F7B2DA70883.29477@lists.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfGVr85J6XgIZZAf8GdChQcgRyAZNP06jegejNYuQqXIQN17zGrr5U+SvA8NoREca6qctt/JwQLN171LCpYeVXCYi6PsWXaZgJSUsY32ejta2bBAw2Cxk
 EraEsGilM7yON9hCyJq28F6OiAMh5jz6Uknt8tmrCvqxeDa42U3XXKr6PA0iiIHBg98DkOXstHyI/g==
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thursday 12 August 2021 at 08:46:08 +0100, Mike Crowe via lists.openembedded.org wrote:
> On Wednesday 11 August 2021 at 22:38:23 +0100, Richard Purdie wrote:
> > On Wed, 2021-08-11 at 16:58 +0100, Mike Crowe via lists.openembedded.org wrote:
> > > When running the test suite on my Debian 11 box I see many occurrences
> > > of:
> > > 
> > >  unknown fcntl argument 1032, assuming long argument.
> > > 
> > > (for example from test-execl.sh.)
> > > 
> > > It appears that this is F_GETPIPE_SZ and it takes no arguments. Let's
> > > add it to avoid the warning messages.
> > > 
> > > I could add F_SETPIPE_SZ too, but that apparently takes an int argument
> > > which would mean moving the va_arg call into the switch statement. :(
> > > 
> > > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > > ---
> > >  ports/linux/guts/fcntl.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c
> > > index 434c7f3..e9c6140 100644
> > > --- a/ports/linux/guts/fcntl.c
> > > +++ b/ports/linux/guts/fcntl.c
> > > @@ -37,6 +37,9 @@
> > >  	case F_GETOWN:
> > >  	case F_GETSIG:
> > >  	case F_GETLEASE:
> > > +#if defined(F_GETPIPE_SZ)
> > > +        case F_GETPIPE_SZ:
> > > +#endif
> > >  		rc = real_fcntl(fd, cmd);
> > >  		break;
> > >  	/* long argument */
> > 
> > This goes make to making pseudo host specific which will break uninative/sstate.
> > We'll probably have to add a define if it isn't defined to get the behaviour we 
> > need.
> 
> Good point. I should have realised that.

Having said that, why doesn't that concern apply to F_DUPFD_CLOEXEC too? Do
we not care about systems that are so old that they don't have
F_DUPFD_CLOEXEC? In which case, why other with the #ifdef at all?

Similarly for F_OFD_GETLK and friends.

Mike.
