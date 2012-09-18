Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TE6mR-0001ID-GD
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 01:00:35 +0200
Received: by eaad12 with SMTP id d12so97746eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 15:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=P2UOuzq36+2EkU0sHgC4fxJ/+XoGuQW6FSFLDVgLJS4=;
	b=Kc0L617jSWqjCAqrTE4N199kEhQZ4FTpWDqTHNUSpTLroXBvhC3Ey1anzRgaIp2nf4
	/hmgTBrwHXrG+ildnxzykY1lTKhcJU7xqy688/MuKvAK14kAynirwMvUVf2LRuU3qZ7h
	rFq0HNYB1o8Rq0PX4fKwUAAbCIV+rbr42WubsdduU3tieR3gWKSeEnU7raee9j7oRdLZ
	30OaWTglrMcEGA/6v/C71ndlbCewypt1BypNy8iWnToiJTFOKqDg1Zr/z4iBnFNtMyW3
	XJkjTW0kSo14ioRVhSAAKr9sa6QCMCdIWSfUcUxvUTnGbU/SjP3QuG14Fu90rPl8hAYU
	D6Pg==
Received: by 10.14.4.201 with SMTP id 49mr1691511eej.0.1348008475155; Tue, 18
	Sep 2012 15:47:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 18 Sep 2012 15:47:24 -0700 (PDT)
In-Reply-To: <1348007893.20356.21.camel@omclinuxballt.devnet.ordermatic.net>
References: <1348007893.20356.21.camel@omclinuxballt.devnet.ordermatic.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2012 15:47:24 -0700
Message-ID: <CAMKF1sp=qvEm+1VBXPQU4rT5AHCLqrY0ihpmT8GC5na50j7pZQ@mail.gmail.com>
To: Brian Lloyd <blloyd@familyhonor.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: building wxwidgets under oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 23:00:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 18, 2012 at 3:38 PM, Brian Lloyd <blloyd@familyhonor.net> wrote:
> Before going to the core methodology, the classic openembedded had
> support for building wxwidgets.
>
> That library is one that does not appear to have been picked back up
> since the refactoring of the code, either because there wasn't much
> interest or else it proved hard to do.
>
> When I tried it myself, I found that the autotools class assumed use of
> all parts of autotools, which unfortunately wxwidgets doesn't do.  It
> almost looks like I would have to write a custom class (or include it
> all in the wxwidgets packet/includes) that only calls configure instead
> of trying to do autoreconf (as well as deleting the bakefile generated
> acinclude.m4).
>
> Does anyone have any suggestions how to fit these two systems together
> smoothly in a way that is likely future change resistant?  Is making a
> custom class like configure_only.bbclass a good idea?  After all, the

I think we would like to reconfigure since it then gets the wanted
libtool macros
and so on. We use libtool 2.4 and if package has old libtool macros that may
not go well if you dont refresh them

> tar files for wxWidgets doesn't have the issues that the forced
> autoreconf is trying to avoid but the attempt to fix the issue is
> bringing in all sorts of added files/dependencies required.  Or is there
> a way to use the autotools class which will ensure the hack code does
> not fire?
>

you can always override do_configure () { oe_runconf } sort of thing see
how binutils or gcc does it.


> Of course, if someone has already made this work and it's somewhere I
> missed, a pointer to where it is would be greatly appreciated.
>
>
> Brian Lloyd
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


