Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SDVij-0004xn-A8
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 08:54:01 +0200
Received: by wgbdr12 with SMTP id dr12so212995wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 23:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=B7KvrWofX1qt/+R7JXUSVOWxvQUFEgFKGb+WswXS6zo=;
	b=Zpw9/F65uEFH/D4oKJ+YfQLNfyzHtdkowP4xiZMEw9lP4pSrJEm/0/YZtqFgneept7
	FfPzpw0lYIRAzVFjNPmz+yfw/a2pMW826ixP/YnTl7afFO+XmiiAevctf7OfZsJsJABM
	YpujjDUPoM+WgI4iUziFHpmdDppwBMVWqdPedgGQ0E/vKz2ZvUJd4vm2VG4K21puNvQF
	0D1OO5Vy8CBp59KC9J6WGDl+pNg9C9VlUTg9iFNFkBLqn/Rm8L8aROqI9CVVwGZUij/o
	hLXVGngAIuWWoMt0Ml4tVW4f9+gfX58PUU+GFY6+BdGGHRdDJ/zFHqHVFfuR74yXBEfY
	jxmg==
MIME-Version: 1.0
Received: by 10.180.80.9 with SMTP id n9mr3326657wix.4.1333089896932; Thu, 29
	Mar 2012 23:44:56 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 29 Mar 2012 23:44:56 -0700 (PDT)
In-Reply-To: <CADkTA4MvYRmsLQogaQMHwUeP5y7ws5NvmXiBMgvsreiGNQrsJw@mail.gmail.com>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<CADkTA4MvYRmsLQogaQMHwUeP5y7ws5NvmXiBMgvsreiGNQrsJw@mail.gmail.com>
Date: Fri, 30 Mar 2012 08:44:56 +0200
Message-ID: <CAGiJk9deLrVFhtGF6pAvvWUgyo5kbAE77t9bnWciKtdtC4oD8g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
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
X-List-Received-Date: Fri, 30 Mar 2012 06:54:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/3/30 Bruce Ashfield <bruce.ashfield@gmail.com>:
> On Thu, Mar 29, 2012 at 6:03 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2012-03-29 at 22:53 +0200, Eric B=C3=A9nard wrote:
>>> I noticed in from scratch builds for qemuarm that the longest time is
>>> taken in fetching sources, especially those fetched using git
>>> (linux-yocto for example) & svn (gcc, eglibc & co).
>>
>> Are you timing these as fetches from the source control systems or from
>> the mirror tarballs of the repositories. The tarballs should be
>> faster...
>>
>>> To reduce the fetch time would that make sense to
>>> - fetch gcc/glibc & co from the archive of a stable version and then
>>> =C2=A0 apply patches on top of it (maybe patches stored in an archive
>>> =C2=A0 fetched from oe's website and applied in bulk or patches stored =
in OE)
>>
>> Unfortunately the patches tend to get unwieldy. The tarballs of the svn
>> repos on the mirror should be about equal in size to the upstream
>> archive in this case.
>>
>>> - do the same thing for the linux-yocto kernel or add a --reference
>>> =C2=A0 option to the git fetcher so that we can provide a local tree as=
 a
>>> =C2=A0 reference ?
>>
>> This is effectively how the repositories in DL_DIR are used. If you
>> place a tree in the right place there, it should reuse references...
>
> Agreed .. they definitely do here.
>
> Richard probably recalls me asking for a --reference option several
> years ago as well .. but in the end, at some point the initial fetch happ=
ens
> and then the blobs are re-used. So setting up local mirrors, or pre-fetch=
ing
> are options to make sure that the first download is primed and ready to
> go. For most builds I do, any time fetching just happens in the backgroun=
d
> and doesn't get in the way.
>
>>
>>> Do you have other ideas (appart from using a local mirror) to optimize
>>> the fetch time ?
>>
>> I'd be interested firstly to understand if you're using the SCM directly
>> or using the mirror tarballs as that should make a big difference. In
>> the standard configuration it should be using mirror tarballs...
>
> As would I, since there are some ideas, but they either break workflows,
> don't follow best practices or compromise the completeness of the data.
>
> Cheers,
>
> Bruce
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Hi,
this might be a bit off-topic, but another idea would be to add a
separate threading mechanism for fetching.

Current threading can help to use the CPU and memory load to it's optimum,
but sometimes you have to wait for a download to finish..
Instead there could be a separate set of threads that only download
the sources and make optimal use of the bandwidth too.

This would also allow to fetch files when the normal threads are busy
with configuring/building/packaging recipes.


The downside would be that it requires some sort of inter process
communication.
Or it could be regulated with a simple check if the download is finished..

How does this idea sound to you?


--=20
Regards
Samuel


