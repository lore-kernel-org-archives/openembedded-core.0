Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SDQO3-0004W8-Rw
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 03:12:19 +0200
Received: by wibhj13 with SMTP id hj13so92124wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 18:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5U1TuJZe0VeIibyeRDDi6Ybidbly96P8dibVg1s1/8s=;
	b=wMrTdbxcbLX2ZHrHYstu59oQUNOxa9mtV12ZtZmtUY3B2hbQqTeOc9aHPYZ3N5XOhy
	Gqpu68NDkfmSMibgjwBxaBoV2TbTD1dEcxpCeT8aU6fKA4bUBBAMBUqpNf7DLBinKsHM
	dknGOtowt46p6XSWkc4gxdxioHYUEXDvImcZlScJw15WdF5qKczoN+Lwh+FcwIYLfRno
	VWjBswDIm3HwY6aKMO6MRlQ9TTyG+ht4Aa8J00ELh5wOTt9F/4z8YMXeeaQ3bPV2mQFk
	YGMT7atXqtPquG4c92g2a8qrTZJPKe+EEWgNXtiSq8K9co7W9z9SpKHLWD8BDg8NeVBt
	NJ8w==
MIME-Version: 1.0
Received: by 10.180.102.129 with SMTP id fo1mr769052wib.6.1333069395995; Thu,
	29 Mar 2012 18:03:15 -0700 (PDT)
Received: by 10.216.38.135 with HTTP; Thu, 29 Mar 2012 18:03:15 -0700 (PDT)
In-Reply-To: <1333058593.18082.40.camel@ted>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
Date: Thu, 29 Mar 2012 21:03:15 -0400
Message-ID: <CADkTA4MvYRmsLQogaQMHwUeP5y7ws5NvmXiBMgvsreiGNQrsJw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 01:12:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 6:03 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-03-29 at 22:53 +0200, Eric B=E9nard wrote:
>> I noticed in from scratch builds for qemuarm that the longest time is
>> taken in fetching sources, especially those fetched using git
>> (linux-yocto for example) & svn (gcc, eglibc & co).
>
> Are you timing these as fetches from the source control systems or from
> the mirror tarballs of the repositories. The tarballs should be
> faster...
>
>> To reduce the fetch time would that make sense to
>> - fetch gcc/glibc & co from the archive of a stable version and then
>> =A0 apply patches on top of it (maybe patches stored in an archive
>> =A0 fetched from oe's website and applied in bulk or patches stored in O=
E)
>
> Unfortunately the patches tend to get unwieldy. The tarballs of the svn
> repos on the mirror should be about equal in size to the upstream
> archive in this case.
>
>> - do the same thing for the linux-yocto kernel or add a --reference
>> =A0 option to the git fetcher so that we can provide a local tree as a
>> =A0 reference ?
>
> This is effectively how the repositories in DL_DIR are used. If you
> place a tree in the right place there, it should reuse references...

Agreed .. they definitely do here.

Richard probably recalls me asking for a --reference option several
years ago as well .. but in the end, at some point the initial fetch happen=
s
and then the blobs are re-used. So setting up local mirrors, or pre-fetchin=
g
are options to make sure that the first download is primed and ready to
go. For most builds I do, any time fetching just happens in the background
and doesn't get in the way.

>
>> Do you have other ideas (appart from using a local mirror) to optimize
>> the fetch time ?
>
> I'd be interested firstly to understand if you're using the SCM directly
> or using the mirror tarballs as that should make a big difference. In
> the standard configuration it should be using mirror tarballs...

As would I, since there are some ideas, but they either break workflows,
don't follow best practices or compromise the completeness of the data.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


