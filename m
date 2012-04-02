Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SEcZW-0007oJ-Qs
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 10:25:07 +0200
Received: by wera1 with SMTP id a1so1497807wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2012 01:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=31BLGP/4AMHQm+n0K1ijBv7DaJmbS9B+yB0OBxABmnI=;
	b=06KnJFU3rLgR9cbusH7EfVg5f7L3/KjTPxGx0Y1m6H2abdFQ1bG1EVzMkIHldp+8qn
	nS7HLY8YEgauk1N5rXsYSYOrgjuqQeSt4OL+bPFDj8FIKXzFPtYlcpRbblcz2PJKGtf7
	eFO6yloI7fMI3RuVYfcPlD8Z5JesestnLhTz/Zc4hkkjKyi8Lu+5vupymjtwPGAGYrMi
	OvosQ2fdkqMgCQo/RsPxxNZoEdKOQJeVOQph75qdFzgJtqJ5ogS/H7ztbb5HkMkWfwpS
	gXgftVHR8xtUy9V2RVfWWdTS8VTf+Ep4lMj/1tsrw5wouUmkwJncnZXsljYqYpdcMWAK
	xjlg==
MIME-Version: 1.0
Received: by 10.180.80.9 with SMTP id n9mr22685840wix.4.1333354558725; Mon, 02
	Apr 2012 01:15:58 -0700 (PDT)
Received: by 10.223.89.83 with HTTP; Mon, 2 Apr 2012 01:15:58 -0700 (PDT)
In-Reply-To: <1333104347.18082.65.camel@ted>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<CADkTA4MvYRmsLQogaQMHwUeP5y7ws5NvmXiBMgvsreiGNQrsJw@mail.gmail.com>
	<CAGiJk9deLrVFhtGF6pAvvWUgyo5kbAE77t9bnWciKtdtC4oD8g@mail.gmail.com>
	<1333099931.18082.52.camel@ted>
	<CAGiJk9faGyjgRObDSGk5smQRy6to=U_0UDUuALpEgpZ9s7VFKA@mail.gmail.com>
	<1333104347.18082.65.camel@ted>
Date: Mon, 2 Apr 2012 10:15:58 +0200
Message-ID: <CAGiJk9de5XSqZnHDoHxHb1NdHHjPxDzRLSFtbE4uECY3sJUBew@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 Apr 2012 08:25:07 -0000
Content-Type: text/plain; charset=UTF-8

2012/3/30 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Fri, 2012-03-30 at 12:07 +0200, Samuel Stirtzel wrote:
>> Of course this will only reduce the time of recipes if they are build
>> for the first time,
>> or when the version/URL changes.
>> It is not that important, I agree,
>> but it would improve the situation for first time users, or new installations.
>>
>> Example for 2 threads:
>> http://pastebin.com/kviwQZJ3
>> It is very likely that the current situation also uses cpu and network
>> resources at the same time,
>> but it might occur that the build-task has to wait for a download to
>> finish or vice versa.
>>
>> Ignoring fetch tasks from the thread count would only do half of the
>> job and _could_ cause network bottlenecks ;)
>> Fetching should be "independent" from the dependency chain.
>
> This simply isn't true and there is also no benefit to splitting them to
> be independent. The fetch tasks have dependencies just like any other
> task (for example git:// urls depend on git-native being built unless
> its in ASSUME_PROVIDED).
You are right, my mistake.
Adding some line like PARALLEL_FETCH to the config will do the rest.

>
>> E.g.: it should not wait with the downloads for dependencies to finish building,
>> the download sequence should still match the dependency chain sequence.
>
> I'm afraid I don't understand what you mean. I think you will find that
> if you exclude the "fetch" tasks from the normal "cpu" thread count you
> will get the behaviour you are describing.

I was erroneously assuming that the download only starts after all
dependencies finished building,
but of course this was only derivated as the threads where blocked by
the build tasks.
So yes the method you mentioned will work.
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



-- 
Regards
Samuel


