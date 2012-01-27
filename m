Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RqjP9-0005zj-9z
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 11:51:39 +0100
Received: by wgbdt11 with SMTP id dt11so1178002wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 02:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=BzPw0+XVfXzHtm1Hi6we2NK2aKjV3N0ZOZBhM+rUHWM=;
	b=Sb5u1ekZuInW+2f8RfukTivL1z1Xk9zmLB2LIgnYDq22k6+0zsdthCGuL2doH7o4iA
	FzuJlWrQxn1cBVcF9xUJk0bzGXGK6jY5RRBugx4c2UBFbtP3Cg/VsZWYbTHUWwKTh5ox
	HhCvI3U0PFEOdcOgFj2D01gyihvdjH692xYWQ=
MIME-Version: 1.0
Received: by 10.180.95.131 with SMTP id dk3mr10630967wib.6.1327661030572; Fri,
	27 Jan 2012 02:43:50 -0800 (PST)
Received: by 10.223.117.72 with HTTP; Fri, 27 Jan 2012 02:43:50 -0800 (PST)
In-Reply-To: <CA+M6bXmAt2xBmCpiXBXxtEB-ykB_4qwtZqF9FrgXf3AD7ranpg@mail.gmail.com>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<1322066940.26081.27.camel@phil-desktop>
	<1322068148.15626.15.camel@ted> <1412695.vvBBPeJL4B@helios>
	<CA+M6bXmAt2xBmCpiXBXxtEB-ykB_4qwtZqF9FrgXf3AD7ranpg@mail.gmail.com>
Date: Fri, 27 Jan 2012 11:43:50 +0100
Message-ID: <CAGiJk9fVik9Cc425O5kntWzgtf0Z2WPYnVcAjdTkswHY5YX7_Q@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Fri, 27 Jan 2012 10:51:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/1/17 Tom Rini <tom.rini@gmail.com>:
> On Thu, Dec 29, 2011 at 5:55 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Wednesday 23 November 2011 17:09:08 Richard Purdie wrote:
>>> On Wed, 2011-11-23 at 16:48 +0000, Phil Blundell wrote:
>>> > b) introduce some sort of concept of "feature epochs", where the DIST=
RO
>>> > gets to declare what epoch it is expecting and the compatibility code
>>> > then backfills DISTRO_FEATURES to take account of things that were
>>> > enabled by default in past epochs but have since been removed. =C2=A0=
This
>>> > introduces a certain extra maintenance burden but it means that DISTR=
Os
>>> > will no longer get unpleasant surprises
>>>
>>> I'm wondering if we can do something in the core like:
>>>
>>> DISTRO_FEATURES_BACKFILLOPTS =3D "pulseaudio"
>>>
>>> and have the distro set:
>>>
>>> DISTRO_FEATURES_BACKFILLCONSIDERED =3D ""
>>>
>>> and then add some code which looks for anything in
>>> DISTRO_FEATURES_BACKFILLOPTS but not in
>>> DISTRO_FEATURES_BACKFILLCONSIDERED and adds it to DISTRO_FEATURES.
>>>
>>> Distros can then opt out of a given feature by adding it to
>>> DISTRO_FEATURES_BACKFILLCONSIDERED.
>>>
>>> This would let us maintain compatibility but also move forward and
>>> create new settings with names that make sense.
>>
>> I'd like to try to move forward with this fix (although I prefer an alte=
rnative
>> term to "backfill", perhaps "introduce" instead?) If this is what we wan=
t to
>> do, should it be implemented by:
>>
>> (a) modifying DISTRO_FEATURES directly (as I think Richard is suggesting=
), or
>>
>> (b) a simple python call that the distro needs to add to their own
>> DISTRO_FEATURES (i.e. "${@distro_features_introduce(d)}" ?
>>
>> Option (a) is a little tidier but (b) makes it obvious where any introdu=
ced
>> items in DISTRO_FEATURES are coming from.
>
> I'm terrible at naming things so I guess backfill is as good as any (I
> agree with Phil about introduce). =C2=A0Option a is clear so long as
> there's a good comment, so lets go that way.
>
> --
> Tom
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Hi,
just a quick question, couldn't we use a separate recipe for phonon,
so if a recipe depends on it we don't have to change distro vars?

To be honest, I haven't thought about the pro and contra about this.
But as I am porting software that "needs" phonon and can't be patched
to remove this need...
IMHO it would be easier to just depend on libphonon.bb instead of
adding a distro var for the one single recipe I'm working on.
Just my 0.02 cents.


By the way: KDE did this too: http://quickgit.kde.org/?p=3Dphonon.git&a=3Ds=
ummary


--=20
Regards
Samuel


