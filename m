Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SqFn4-0003N9-VX
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 05:46:40 +0200
Received: by qaat11 with SMTP id t11so1053977qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jul 2012 20:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=nZW7RxWIJuPzMjMvY8Q+qOCPcEidClLzy13CzEo7hJk=;
	b=u7HKrc7oSD+v/McPloB4JGDcbiEQH3bC8yFEiQCo3LDO8icSlVT0RZa4VzG6w7q6FS
	z+v7epjFjaHSnqxibipRgQYDMh/YC3EZSrmAPa1a+0IhVHFDk39NhG906pJ28R4JYWEG
	BB/GyO5MVyKo2gGhi4l4dX0uUYJhCcYolgxHRRacvEU2tvPloH/wUzZhDJwUOLp8B2fU
	Y1mEkVdlqRK2t4VSy+skyD0o3EMYgyiRVto9xHAzj1WLVedgHuso3okoru/9Ygp/2qV9
	lpDE2DC1T9aIJcgxr3MuowBvuiLx/pXAjRvcOm5FKpB4gs04NtT8gOwx5N3nGT7YrVek
	6AYw==
MIME-Version: 1.0
Received: by 10.229.136.202 with SMTP id s10mr3621623qct.36.1342323322104;
	Sat, 14 Jul 2012 20:35:22 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Sat, 14 Jul 2012 20:35:22 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207142056240.29290@oneiric>
References: <alpine.DEB.2.02.1207142056240.29290@oneiric>
Date: Sat, 14 Jul 2012 23:35:22 -0400
Message-ID: <CADkTA4PJHsdd+WshCps+9+mdCORs1hcFcSJZCmQMc0rZjCu28Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: isn't the check for a matching "meta" branch a bit too forgiving?
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
X-List-Received-Date: Sun, 15 Jul 2012 03:46:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 14, 2012 at 9:01 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>

Please cc me directly on these questions .. it's just by chance that I notice
these on the mailing list.

>   in kernel-yocto.bbclass, in do_kernel_checkout(), isn't this check:
>
>   git branch -a | grep -q ${KMETA}   <-- this check
>   if [ $? -ne 0 ]; then
>           echo "ERROR. The branch '${KMETA}' is required and was not"
>           echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
>           ... snip ...
>
> for now, as long as KMETA always equals "meta", it's fine, but won't
> that "grep" also erroneously match longer strings of which ${KMETA} is
> simply a substring?

That's on purpose, multiple meta branches (substrings) used to be possible,
and will be re-enabled at some point.

>
>   at the very least, shouldn't that be "grep -qw ${KMETA}"?

For the same reason as above .. no. In theory it could trigger a false
positive, but
it hasn't to date and it leaves the door open for future extensions.
At the moment,
meta MUST be 'meta' anyway, something that I've already got changes queued to
address and make it more flexible.

Cheers,

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


