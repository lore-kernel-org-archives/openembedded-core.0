Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 489CE60167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 12:09:14 +0000 (UTC)
Received: from amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.117])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 988153FE4F;
	Mon,  5 Jan 2015 13:09:12 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Mon,  5 Jan 2015 13:09:11 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Mon,  5 Jan 2015 13:09:10 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 5 Jan 2015 13:10:23 +0100
Message-ID: <54AA7EE5.2000304@topic.nl>
Date: Mon, 5 Jan 2015 13:09:09 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <54A2C3B2.9010006@topic.nl>					<20141230175915.GB18678@crash.betafive.co.uk>	
	<54A44ADC.3010000@topic.nl>			 <54A65B5E.4030504@topic.nl>			
	<1420190187.25779.15.camel@linuxfoundation.org>
	<54A95A5A.70809@topic.nl>		
	<1420450079.25779.21.camel@linuxfoundation.org>
	<54AA5C4C.60201@topic.nl>	
	<1420452462.25779.23.camel@linuxfoundation.org>
	<54AA6945.7020501@topic.nl>
	<1420457862.25779.25.camel@linuxfoundation.org>
In-Reply-To: <1420457862.25779.25.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Bug: PR server changes the PKGV variable too
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jan 2015 12:09:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 01/05/2015 12:37 PM, Richard Purdie wrote:
> On Mon, 2015-01-05 at 11:36 +0100, Mike Looijmans wrote:
>> =EF=BB=BFOn 01/05/2015 11:07 AM, Richard Purdie wrote:
>>> On Mon, 2015-01-05 at 10:41 +0100, Mike Looijmans wrote:
>>>> =EF=BB=BFOn 01/05/2015 10:27 AM, Richard Purdie wrote:
>>>>> On Sun, 2015-01-04 at 16:20 +0100, Mike Looijmans wrote:
>>>>> Imagine you're not using gitpkgv. You set:
>>>>>
>>>>> PV =3D "x.y+${SRCPV}"
>>>>>
>>>>> Since SRCPV contains a revision hash, you can end up in a situation
>>>>> where the version changes and you cannot upgrade the package since th=
e
>>>>> hash didn't 'increase'.
>>>>>
>>>>> The PR server therefore combines with the git fetcher to add an
>>>>> incremental number at the start of the SRCPV string and yes, in that
>>>>> scenario, it acts as a PV server. This is actually working as designe=
d.
>>>>
>>>> Then the design is wrong. If a package chose to override PKGV manually=
, then
>>>> the rest of the system should leave that value as is, and not touch it=
.
>>>> Apparently the recipe author knows better, so please let him use that =
wisdom.
>>>>
>>>> Also, if you change the architecture of the package, the PR server wil=
l reset
>>>> the version counter to 0 and break the upgrade path too. That was the =
problem
>>>> that caused me to discover this problem, the PR server is making it ha=
rd to
>>>> fix arch errors in recipes.
>>>
>>> You realise why it does that though? Imagine multiple MACHINE values
>>> being built against a PR server. Each MACHINE will have different
>>> package architecture values and different hashes. The 'PR' values shoul=
d
>>> therefore be seen as different. If the system didn't do this, it would
>>> increment PR for every MACHINE change.
>>>
>>> Ok, so you say, lets make it work against MACHINE. That fails in the
>>> case where multiple MACHINES share a package architecture :/. Its not a
>>> simple problem to try and deal with :(
>>>
>>> I make no claim the system is perfect or free from bugs but these
>>> behaviours you're referring to are like this for various reasons. I'm
>>> open to changing them but we need to address the underlying problems
>>> like changing MACHINE above.
>>>
>>> There are several other issues with changing package architecture such
>>> as the sstate files in the sysroot. There is an open bug for this and
>>> right now, I simply don't know how to solve it properly :(.
>>
>> Yeah, I stand corrected, this is not something easily fixed.
>>
>> I'd still like to have a way to override the PR server. Is there a way t=
o make
>> the PR server ignore a package, or at least, have it NOT modify the PKGV
>> variable for a package?
>> And if not, would you accept a patch to add that functionality to the pr=
server
>> system?
>
> I've not tested it but would something like:
>
> PRSERV_HOST_pn-XXX =3D ""
>
> work?
>
> There looks to be code to allow:
>
> PRSERV_HOST_XXX =3D ""
>
> to work too, looking at package.bbclass. Why, I have no idea :/. We
> should probably remove that in favour of the standard override.

That means I could also set PRSERV_HOST inside the recipe, I guess. That mi=
ght=20
be easier to manage. Anyway, good suggestions, I'll try them. That might be=
=20
useful in reducing the strain on network and flash now that 300+ packages g=
et=20
upgraded if someone happens to patch libc.

> Since I've just been looking at this, I'll write down an overview of
> what goes on:
>
> PKGR contains ${PRAUTO}. The PKG{E,V,R} variables are only meant to be
> accessed at packaging time. The code in package.bbclass,
> package_get_auto_pr() runs at packaging time and sets PRAUTO with a
> value from the PR server.
>
> The only exception to this is if the magic string "AUTOINC" is in PV. If
> it is, AUTOINC is replaced with the value from the PR server. You could
> ask why it sets PKGV with the value of PV and I honestly don't remember,
> that could be an oversight.
>
> What this did mean is that we could jettison the autoincrement code from
> the fetcher and just have one thing doing it.
>
> The PKGV being overwritten by PV does look like a bug and is worth
> looking into. Its not the PR server at fault though, its what
> package.bbclass is doing with the data. I would like to look at why it
> was added that way as I worry there was some underlying reason :/.

I see what you mean, in package.bbclass in  the "package_get_auto_pr" funct=
ion:

             if "AUTOINC" in pv:
                 srcpv =3D bb.fetch2.get_srcrev(d)
                 base_ver =3D "AUTOINC-%s" % version[:version.find(srcpv)]
                 value =3D conn.getPR(base_ver, pkgarch, srcpv)
                 d.setVar("PKGV", pv.replace("AUTOINC", str(value)))

I think this is the line that does it. It's surprising that it looks at PV =
in=20
this part of the method, while it looks at PKGV for the "PR Server not acti=
ve"=20
case.

And from looking at this code, the simple way to prevent this from happenin=
g=20
is making sure that PV does NOT contain the AUTOINC string, which SRCPV wil=
l=20
have by default when using git, and PV usually includes SRCPV.

That would mean that if I set SRCPV to something that doesn't contain AUTOI=
NC,=20
this part of the packager would not fire and leave the PKGV as is. Now that=
=20
would fix the issue for my particular case.

It still makes one wonder whether that code snippet above was accidentally=
=20
done this way, or that it was done for a particular reason... I worry right=
=20
along with you there.


>>>>> When you add in gitpkgv, something is obviously going wrong. gitpkgv =
is
>>>>> in meta-oe since I've refused to add it to core on the several occasi=
ons
>>>>> its been requested. I've said this before but I will say is again, it
>>>>> *needs* become part of the standard fetcher API rather than a hacked =
in
>>>>> afterthought which doesn't integrate well.
>>>>
>>>> I already volunteered and tried to do that, but got stuck in lack of
>>>> understanding how the fetcher works, and did not get any help so aband=
oned it
>>>> in favor of keep using gitpkgv "as is". I'm still volunteering, but wi=
thout
>>>> help I can't do it.
>>>
>>> I'm struggling since to provide the help you need, I'd nearly have to
>>> solve the problem myself. I've helped several different people
>>> understand the fetcher in the past, only to have most of them move onto
>>> other things :(. Add in the 101 other distractions I have and its
>>> frustrating for everyone including me. Can you remind me where you were
>>> at (links to the right emails would help)?
>>
>> This is basically as far as I got:
>>
>> http://lists.openembedded.org/pipermail/openembedded-core/2014-October/0=
98110.html
>
> Thanks, I do remember looking at this. I also remember getting horribly
> confused so I did start doing some things to try and help:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D593f14b2e3d1474d0c=
21d8d872dc7685163ffad2
> (which was merged into master, trying to unravel some horrible function
> chains)
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t22=
2&id=3D89a20582e4fb3b222ccfeaf068fc5cfc7ae2dbf9
> (this one should get merged, its just a comment tweak in bitbake).
>
> I also noticed this in my WIP branch:
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t22=
2&id=3D00deb71e6e9a6b7f8aa5509288b59c6e4526c300
> but that is perhaps best ignored, I think I had other ideas here.
>
> So to explain what happens, you write:
>
> PV =3D "x.y+{SRCPV}"
>
> and
>
> SRCPV =3D "${@bb.fetch2.get_srcrev(d)}"
>
> and this triggers the code in fetch2/__init__.py. That function returns
> a string which starts with AUTOINC+ and then a set of revisions.
>
> The problem you've run into is that PV is expanded during parsing and is
> used all over the place (for good reason) (e.g. in the value of WORKDIR)
> and fetching may not have occurred yet. That means as you observe you
> can't run git commands on a repo that may not yet exist (this function
> only uses remote commands like ls-remote if needed).
>
> So how to solve this? You need to add a function in parallel to
> get_srcrev(), lets call it get_pretty_srcrev() which basically does the
> same thing, but calls pretty_revision() instead of sortable_revision().
> You can probably parameterise get_srcrev() internally. You'd then add a
> pretty_revision to the git fetcher. At the metadata level you'd have
> something like:
>
> PRETTYSRCPV =3D "${@bb.fetch2.get_pretty_srcrev(d)}"
>
> The recipe would then set PKGV =3D "x.y.+${PRETTYSRCPV}" to get the
> gitpkgv behaviour.
>
> All this is very approximate and I'm sure it won't be that simple but
> hopefully it may let you move forward.

I'll give it another try one of these days with the information you added, =
and=20
return to it.





Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


