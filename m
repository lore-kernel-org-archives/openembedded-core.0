Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SDYt4-00010h-9j
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 12:16:54 +0200
Received: by wgbdr12 with SMTP id dr12so364249wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 03:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=91P8/60GreWeatymotrFAR7iJuc6uEQORv1aYRT3ptA=;
	b=M2PfBboAh4AK1AodfSRMLqbaBpWOLmvLsrd1zr5niX/dmDwYi0cDRMgZjZWF62mgPZ
	G8asVMoQ1kYYoi4poMTIrXryu+cm+u09bDFgZ4e3wn1RN4FPH508N2rxJFLV16jztIke
	aFJVBBjIVpnW3jMufG7BdHWAKdyrZWQbmSULsHRwy3YkYZwVyDZJsNfS9RvJ5ZjP+HpC
	fhre378K9LbnvmiBXndROLytj2vl2B8HRsyabJq92wKc4laOgG4GIJNdBct6akItIZXU
	7nSldjRkToKDxljoxyZw+/qa94SbY2hMJqF6CLG8rurAy8e256qOUVv/ECKrJjY9YfNG
	Dbuw==
MIME-Version: 1.0
Received: by 10.180.100.2 with SMTP id eu2mr5006196wib.1.1333102070110; Fri,
	30 Mar 2012 03:07:50 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Fri, 30 Mar 2012 03:07:49 -0700 (PDT)
In-Reply-To: <1333099931.18082.52.camel@ted>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<CADkTA4MvYRmsLQogaQMHwUeP5y7ws5NvmXiBMgvsreiGNQrsJw@mail.gmail.com>
	<CAGiJk9deLrVFhtGF6pAvvWUgyo5kbAE77t9bnWciKtdtC4oD8g@mail.gmail.com>
	<1333099931.18082.52.camel@ted>
Date: Fri, 30 Mar 2012 12:07:49 +0200
Message-ID: <CAGiJk9faGyjgRObDSGk5smQRy6to=U_0UDUuALpEgpZ9s7VFKA@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Mar 2012 10:16:54 -0000
Content-Type: text/plain; charset=UTF-8

2012/3/30 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Fri, 2012-03-30 at 08:44 +0200, Samuel Stirtzel wrote:
>> this might be a bit off-topic, but another idea would be to add a
>> separate threading mechanism for fetching.
>>
>> Current threading can help to use the CPU and memory load to it's optimum,
>> but sometimes you have to wait for a download to finish..
>> Instead there could be a separate set of threads that only download
>> the sources and make optimal use of the bandwidth too.
>>
>> This would also allow to fetch files when the normal threads are busy
>> with configuring/building/packaging recipes.
>>
>>
>> The downside would be that it requires some sort of inter process
>> communication.
>> Or it could be regulated with a simple check if the download is finished..
>>
>> How does this idea sound to you?
>
> Its easier than you think to do this, bitbake has a plugable scheduler
> implementation so you'd just have to write one which ignores "fetch"
> operations from the total thread count.
>
> Sadly this isn't really the place most people have a bottleneck in day
> to day usage of the system. People have tried various algorithms for
> enhancing the scheduler and as far as I know never found anything that
> makes a significant difference, much to everyone's surprise :/.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Of course this will only reduce the time of recipes if they are build
for the first time,
or when the version/URL changes.
It is not that important, I agree,
but it would improve the situation for first time users, or new installations.


Example for 2 threads:
http://pastebin.com/kviwQZJ3
It is very likely that the current situation also uses cpu and network
resources at the same time,
but it might occur that the build-task has to wait for a download to
finish or vice versa.

Ignoring fetch tasks from the thread count would only do half of the
job and _could_ cause network bottlenecks ;)
Fetching should be "independent" from the dependency chain.
E.g.: it should not wait with the downloads for dependencies to finish building,
the download sequence should still match the dependency chain sequence.



If it is really that easy, then I will look into it.

-- 
Regards
Samuel


