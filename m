Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QPODk-00082Y-PD
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 02:14:36 +0200
Received: by vws2 with SMTP id 2so186368vws.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 17:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=f9nTyrkp5ZR26blwj1sEJt9mnEKZkpgpXwTgwcjYS5s=;
	b=ci9X22fYBda3RmpjCJplQuT24ru8q9kSGeJH0ndAhmZjXLtiyr6azOB5/jXLU0VCAc
	gAojHuNzQMhGt3C3ICvqOxDWZvAly0GSoWJDePJ8PtaESMz1jmK9v0kRl/su8A/+iF+D
	7OHTptJsM5yUMHIgIk7l+h93Y/46ULSf/Nu3s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=jsuP02nHmNUymVTVmqqQXI/+LQPvLaHOvXpXPK8wVAYnpFgPcJkyL4kiNO9nQ4vAWt
	MiVix+nqBACpccZchY2a9wKN8igTAt1Q811L8VBdINgFQ+oGnLvk12Z8imJGUsS+nruU
	JlKC+D1FAXDhti06vsxtAG0g8LOpRIYYsaeoE=
Received: by 10.52.183.164 with SMTP id en4mr295568vdc.108.1306368693037; Wed,
	25 May 2011 17:11:33 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.109.202 with HTTP; Wed, 25 May 2011 17:11:13 -0700 (PDT)
In-Reply-To: <1306368023.27470.91.camel@rex>
References: <1306342881.2525.258.camel@phil-desktop>
	<1306364520.27470.81.camel@rex> <1306368023.27470.91.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 25 May 2011 17:11:13 -0700
X-Google-Sender-Auth: 7OVde6U5UW8_1EadBxaX3s6u6Ds
Message-ID: <BANLkTimYeFSAq30E3hC3HdJ9r81WyOD0bw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RDEPENDS_${PN} and virtclass-native
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
X-List-Received-Date: Thu, 26 May 2011 00:14:36 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 25, 2011 at 5:00 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-05-26 at 00:02 +0100, Richard Purdie wrote:
>> I think we need to fix native.bbclass. I dread to think what this is
>> doing to the dependency tree at present. We did remove most references
>> to RDEPENDS directly so I think that makes this a high priority to fix.
>>
>> I'd note that the rewriting code is fraught with ordering/expansion
>> issues which is why that code plays games with the variables like it
>> does.
>>
>> DEPENDS is horrible and it looks like we needed to do something similar
>> for RDEPENDS. Better solutions to the ordering problems would be very
>> welcome. It problem was the use of DEPENDS_prepend in places iirc.
>
> I just reminded myself of the problem with DEPENDS.
>
> Imagine the recipe says:
>
> DEPENDS = "foo"
> inherit autotools
>
> Behind the scenes, autotools (amongst other thinsg) does a:
>
> DEPENDS_prepend = "autoconf-native"
>
> The trouble comes when you try:
>
> DEPENDS_virtclass-native = ""
>
> since you want to drop the foo dependency. The dependencies being added
> by autotools.bbclass are still wanted but they get overwritten. At this
> point I had to remember bitbake's finalize ordering. It does:
>
> finalize()
> <call anonymous python>
> finalize()
>
> The first call to finalize() expands the _prepend/_append before we see
> them. We then lose the ability to see what was added though the classes
> vs. what was in the recipe. The second finalize can then only clobber
> the data.
>
> If we could get our function called before the first finalize(), we
> would remove the need to play the games we do which is looking very very
> attractive.
>
> I suspect its time to extend the anonymous python to indicate more
> specifically when it would like to be run...

Just need to add another event at the appropriate place. I wonder
where RecipeParsed fits into that ordering.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


