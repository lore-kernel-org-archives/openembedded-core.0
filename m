Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id BB07665D27
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 09:41:35 +0000 (UTC)
Received: from amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.117])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 1E4B83F5DC;
	Mon,  5 Jan 2015 10:41:35 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -0.499
X-Spam-Level: 
X-Spam-Status: No, score=-0.499 tagged_above=-999 required=3.5
	tests=[BAYES_05=-0.5, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Mon,  5 Jan 2015 10:41:34 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Mon,  5 Jan 2015 10:41:33 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 5 Jan 2015 10:42:45 +0100
Message-ID: <54AA5C4C.60201@topic.nl>
Date: Mon, 5 Jan 2015 10:41:32 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <54A2C3B2.9010006@topic.nl>			<20141230175915.GB18678@crash.betafive.co.uk>
	<54A44ADC.3010000@topic.nl>		 <54A65B5E.4030504@topic.nl>	
	<1420190187.25779.15.camel@linuxfoundation.org>
	<54A95A5A.70809@topic.nl>
	<1420450079.25779.21.camel@linuxfoundation.org>
In-Reply-To: <1420450079.25779.21.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 05 Jan 2015 09:41:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 01/05/2015 10:27 AM, Richard Purdie wrote:
> On Sun, 2015-01-04 at 16:20 +0100, Mike Looijmans wrote:
>> On 01/02/2015 10:16 AM, Richard Purdie wrote:
>>> On Fri, 2015-01-02 at 09:48 +0100, Mike Looijmans wrote:
>>>> On 12/31/2014 08:13 PM, Mike Looijmans wrote:
>>>>> On 30-12-2014 18:59, Paul Barker wrote:
>>>>>> On Tue, Dec 30, 2014 at 04:24:34PM +0100, Mike Looijmans wrote:
>>>>>>> What if the architecture of a package was accidentally left at its
>>>>>>> default, but it should have been "all" for example?
>>>>>>>
>>>>>>> Just putting "inherit allarch" or simply PACKAGE_ARCH=3D"all" into =
the
>>>>>>> recipe is not enough. You get stuck with a "more specific" older
>>>>>>> version, so that no device wants to upgrade to the newer version
>>>>>>> that's "all" architecture compatible.
>>>>>>>
>>>>>>
>>>>>> What package manager are you using on the device? If you're using op=
kg
>>>>>> it should
>>>>>> prioritise by version not arch unless the command line option
>>>>>> '--prefer-arch-to-version' is passed. If you're using opkg and it's
>>>>>> not doing
>>>>>> that, let me know and I'll look into it when I get chance to.
>>>>>
>>>>> It's opkg.
>>>>>
>>>>> But on closer inspection I noticed that the "git" version is also
>>>>> mysteriously reset to 0, so that the package also gets a lower versio=
n
>>>>> number instead of a higher one. Seems to be the PR server borking thi=
ngs
>>>>> again or so, I'll have to investigate that next year...
>>>>
>>>> Weird, something in OE killed "gitpkgv".
>>>>
>>>> in the recipe, I have this:
>>>>
>>>> inherit gitpkgv
>>>> PV =3D "2.0+git${SRCPV}"
>>>> PKGV =3D "2.0+git${GITPKGV}"
>>>>
>>>>
>>>> $ bitbake enigma2-plugin-extensions-autobackup -e | grep PKGV
>>>>
>>>> delivers correct information:
>>>>
>>>> PKGV=3D"2.0+git68+2e7a1db"
>>>> GITPKGVTAG=3D"0.0-68-g2e7a1db"
>>>> GITPKGV=3D"68+2e7a1db"
>>>>
>>>>
>>>> But after building and deploying the package, the version number will
>>>> eventually end up being this one:
>>>>
>>>> 2.0+git5+2e7a1db509-r0.2
>>>>
>>>>
>>>> What in OE is replacing a perfectly good PKGV tag with something
>>>> completely different bearing no relation whatsoever? Even the number o=
f
>>>> digits in the git tag differs from the one I put in the recipe!
>>>>
>>>> Even if I put some random text into PKGV, it gets replaced.
>>>
>>> Did something come from sstate?
>>
>> I got todays master from openembedded-core and meta-openembedded, and
>> the recipe above (with a fix for the license). I leave everything as the
>> script "oe-init-build-env" does, I only add meta-openembedded/meta-oe to
>> the bblayers.conf list to get access to the gitpkgv class.
>>
>> I named the recipe above "weirdversion.bb", and when I build it "as is",
>> I get the correct version number "z-pkgv+68+2e7a1db-r0" (with "pkgv" and
>> "68" in it).
>>
>> However, when I add the following line to local.conf to activate the
>> PR-SERVER, things go wrong:
>>
>> PRSERV_HOST =3D "localhost:0"
>>
>> After this change, the package suddenly gets "z-pv+0+2e7a1db509-r0.0" as
>> version string, so apparently the PR server kills the PKGV variable and
>> replaces it with something derived from PV alone.
>>
>> Since this is a completely clean situation with nothing but core code,
>> it must be a bug in the PR server (it seems to act as PV server instead.=
..).
>
> Imagine you're not using gitpkgv. You set:
>
> PV =3D "x.y+${SRCPV}"
>
> Since SRCPV contains a revision hash, you can end up in a situation
> where the version changes and you cannot upgrade the package since the
> hash didn't 'increase'.
>
> The PR server therefore combines with the git fetcher to add an
> incremental number at the start of the SRCPV string and yes, in that
> scenario, it acts as a PV server. This is actually working as designed.

Then the design is wrong. If a package chose to override PKGV manually, the=
n=20
the rest of the system should leave that value as is, and not touch it.=20
Apparently the recipe author knows better, so please let him use that wisdo=
m.

Also, if you change the architecture of the package, the PR server will res=
et=20
the version counter to 0 and break the upgrade path too. That was the probl=
em=20
that caused me to discover this problem, the PR server is making it hard to=
=20
fix arch errors in recipes.

> When you add in gitpkgv, something is obviously going wrong. gitpkgv is
> in meta-oe since I've refused to add it to core on the several occasions
> its been requested. I've said this before but I will say is again, it
> *needs* become part of the standard fetcher API rather than a hacked in
> afterthought which doesn't integrate well.

I already volunteered and tried to do that, but got stuck in lack of=20
understanding how the fetcher works, and did not get any help so abandoned =
it=20
in favor of keep using gitpkgv "as is". I'm still volunteering, but without=
=20
help I can't do it.

M.


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


