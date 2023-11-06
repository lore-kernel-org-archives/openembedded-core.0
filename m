Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7085C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 19:44:52 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.64175.1699299883808574705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 11:44:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 3A6JgaCT010785;
	Mon, 6 Nov 2023 13:42:36 -0600
Message-ID: <b03edbba-8c06-cb80-ec43-b7f60750a706@kernel.crashing.org>
Date: Mon, 6 Nov 2023 13:42:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [Openembedded-architecture] [OE-core] Core workflow: sstate for
 all, bblock/bbunlock, tools for why is sstate not being reused?
Content-Language: en-US
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
        Michael Halstead <mhalstead@linuxfoundation.org>,
        Yocto-mailing-list <yocto@lists.yoctoproject.org>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Julien STEPHAN <jstephan@baylibre.com>
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
 <649b2f000761831cabd1f5737fb5b30a2ffc3654.camel@gmail.com>
 <CANNYZj_Cq+cncw5SCGii=Mhj0KGgo=qr=hCuo+wpdvtR9C=Qyg@mail.gmail.com>
 <58e2c7a830bceac9b3a8c6cee63f03ae4a118da0.camel@gmail.com>
 <0b1cfe6b26e5c61b1e700e3801900038e2d48f25.camel@linuxfoundation.org>
 <dd3d342e400b900c7f7ddbbe93c725472f6d6f1f.camel@gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <dd3d342e400b900c7f7ddbbe93c725472f6d6f1f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 3A6JgaCT010785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 19:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190244



On 11/5/23 1:43=E2=80=AFPM, Adrian Freihofer wrote:
> On Sat, 2023-11-04 at 11:09 +0000, Richard Purdie wrote:
>> On Sat, 2023-11-04 at 11:29 +0100, adrian.freihofer@gmail.com=C2=A0wro=
te:
>>> Hi Alex, hi Richard
>>>
>>> After some internal discussions, I would like to clarify my
>>> previous
>>> answers on this topic.
>>>
>>>  =C2=A0* Usually there are two different workflows
>>>  =C2=A0=C2=A0=C2=A0 - application developers: could use an SDK with a=
 locked
>>> sstate-cache.
>>>  =C2=A0=C2=A0=C2=A0 - Yocto/BSP developers: need an unlocked SDK. The=
y change the
>>> recipes.
>>>  =C2=A0* A locked SDK
>>>  =C2=A0=C2=A0=C2=A0 - can work with setscene from SSTATE_MIRRORS
>>>  =C2=A0=C2=A0=C2=A0 - setscene does caching in the SSTATE_DIR (no iss=
ue about that)
>>>  =C2=A0=C2=A0=C2=A0 - But network problems can occur during the initi=
al build
>>> because
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake executes many independent set=
scene tasks. Opening so
>>> many
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 independent connections slows down th=
e build, especially if
>>> the
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 server treats them as a denial of ser=
vice attack.
>>>  =C2=A0=C2=A0=C2=A0 - The denial of service problem is difficult to s=
olve because
>>> each
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setscene task runs in its own bibtake=
 task. Reusing a
>>> connection to
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 download multiple sstate artifacts se=
ems almost impossible.
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is much easier to solve with sep=
arate sstate download
>>> script.
>>
>> FWIW, we did have a similar issue with do_fetch overloading
>> servers/proxies/ISPs and added:
>>
>> do_fetch[number_threads] =3D "4"
>>
>> Finding the right place to put a thread limit on overall setscene
>> tasks
>> is harder but in theory possible. Or perhaps a "network capable
>> tasks"
>> thread limit?
>>
>> Is the overload caused by the initial query of sstate presence, or,
>> does it happen when the setscene tasks themselves run?
>=20
> The most extreme situation is probably bitbake --setscene-only with an
> empty TMPDIR. Each of the setscene tasks establishes a new connection.
> A server receives so many connections that it treats them as a denial
> of service attack by throttling. A separate script would allow the same
> connection to be reused to download all the required artifacts.
> Limiting the number of threads does not really solve the issue because
> there are still the same amount of connections which get quickly
> opened.
>=20
>>
>>
>>>  =C2=A0* An unlocked SDK
>>>  =C2=A0=C2=A0=C2=A0 - Tries to download the sstate cache for changed =
recipes and
>>> their
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencies, which obviously can't w=
ork.
>>>  =C2=A0=C2=A0=C2=A0 - The useless download requests slow down the bui=
ld
>>> considerably and
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cause a high load on the servers with=
out any benefit.
>>
>> Is this sstate over http(s) or something else? I seem to remember you
>> mentioning sftp. If this were using sftp, it would be horribly slow
>> as
>> it was designed for a light overhead "does this exist?" check which
>> http(s) can manage well.
>=20
> Yes, we are evaluating sftp. You are right, it is not optimal from a
> performance point of view. For example S3 is much faster. A compromise
> is to set up a limited number of parallel sftp connections. This has
> worked very well so far.
>=20
> The question of why we use sftp brings us to a larger topic that is
> probably relevant for almost all Yocto users, but not for the Yocto
> project itself: Security.
>=20
> There is usually a git server infrastructure that makes it possible to
> protect Git repositories with finely graded access policies. As the
> sstate-cache contains the same source code, the protection concept for
> the Git repositories must also be applied to the sstate-cache
> artifacts.
>=20
> First of all a user authentication is required for the sstate-mirror.
> An obvious idea is to use the same user authentication for the sstate-
> cache server as for the Git server. In addition to https, ssh is also
> often used for git repositories. SSH even offers some advantages in
> terms of user-friendliness and security (if a ssh agent is used).=C2=A0=
This
> consideration finally leads us to use the sftp protocol for the sstate
> mirror. This is also relatively easy to administer: Simply copy the
> user's public ssh keys from the git server to the sftp server.

While being able to support ssh (or a related protocol) is useful, you ne=
ed to=20
also remember that MANY MANY organizations absolutely block SSH access th=
rough=20
their firewalls.  So _requiring_ sftp would be bad.  Allowing it's usage =
would=20
be good.

As for logging in, https is transport 'security' but not authentication w=
ithout=20
additional helpers.  I think it's absolutely reasonable to say https acce=
ss=20
either needs an external helper for authentication purposes or it's=20
un-authenticated.  If you want (internal to the company) then ssh/sftp or=
=20
similar using the ssh-agent (or similar) should be the suggested approach.

We don't want to exclude anyone, but we want to be clear on the limitatio=
ns=20
based on an organization's specific choice.

> If one then wants to scale an sstate-cache server for many different
> projects and users, one quickly wishes for an option for authorization
> at artifact level. Ideally, the access rights to the source code would
> be completely transferred to the associated sstate artifacts. For such
> an authorization the ssate mirror server would require the SRC_URI
> which was used to compile the sstate artifact. With this information,
> it could ask the Git server whether or not a user has access to all
> source code repositories to grant or deny access to a particular sstate
> artifact. It should not be forgotten that the access rights to the Git
> repositories can change.

In my experience you do not use _one_ sstate-cache for multiple projects =
(at an=20
organization level), each project is responsible for it's own cache.  Thi=
s=20
prevents even the possibility that one project could use code not intende=
d for it.

 From a more generic Yocto Project perspective, this means you really wan=
t to=20
use a hierarchy of sstate-caches.  (Maybe not a true hierarchy.). I.e. I =
use YP,=20
so I get the YP sstate-cache for the base functionality.  I use=20
meta-openembedded, so I want the meta-openembedded cache... project A, I =
want=20
the project's cache, OE and YP caches as well..  project B, I want that p=
rojects=20
cache, OE and YP caches.  Project C?  I might want it's cache, Project A,=
=20
Project B, and OE and YP.   You can see this gets complicated quickly.

If this either isn't inteded or a good idea, then alternatives need to be=
=20
provided for this.  Everyone always ends up with an upstream provider (or=
=20
providers) be it YP, OE, OSVs, ISVs, local company resources, etc.  How d=
o we=20
manage this and keep it aligned?

Bring in hash equivalency and PR service and things get complicated.  The=
=20
sstate-cache itself is NOT separable from those services.  There are ways=
 to=20
decouple them, but they can be 'extreme'.  I.e. turn off hash-equivalency=
, no=20
need for a hash-equivalency service.   Don't cache the do_package_write* =
files,=20
no PR service....  (but even that isn't fool proof due to git AUTOINC... =
so you=20
end up seeding the AUTOINC with static entries or some other method...)

All of these items need to be dealt with and documented together.  My PER=
SONAL=20
preference, (without knowing any specific implementation details) is that=
 the=20
contents of hash-equivalency and PR service is somehow stored with the ss=
tate-cache.

One possible way this could be done..  System starts up, determines it ne=
eds=20
something it doesn't have, then goes out and checks if an updated index i=
s=20
present.  If it is, downloads it adds to it's hash equivalency server.  I=
f no=20
index present, it can then look for the file lets say "sstate:....link". =
 If=20
that comes back, we know we have an equivalency, it's downloaded added to=
 the=20
local database and then the pointed to file is retrieved..  (.siginfo and=
=20
.tar.xz or whatever).  This would ensure that the index is an optimizatio=
n, but=20
not a requirement and would allow a "live" sstate-cache while losing some=
=20
performance.  (This doesn't negate any of the comments about rights or=20
possibility to DoS a server via too many connections!)

Still have to solve the PR service problem, but this could get 'seeded' v=
ia the=20
associated do_write_package siginfo or similar..  and for the AUTOINC, se=
ed it=20
from the siginfo file for a given hash?

Doing something like the above could then allow the order specificed in t=
he=20
SSTATE_MIRRORS to be used to truely indicate the order things are resolve=
d and=20
loaded.

>>
>> Recently we've been wondering about teaching the hashequiv server
>> about
>> "presence", which would then mean the build would only query things
>> that stood a good chance of existing.
>>
> Yes, that sound very interesting. There are probably even more such
> kind of meta data which could be provided by the hashserver to improve
> the management of a shared sstate mirror.
>=20
> Would it make sense to include e.g. the SRC_URI in the hashserv
> database and extend the hashserver's API to also provide meta data e.g.
> for the authorization of the sstate-mirror? Or is security and
> authorization something which should be handled independently from hash
> equivalence?

The more I've thought about this, any sort of query directly to a remote=20
hashservice seems more and more problematic..  Local hash database, absol=
utely=20
needed as an optimization.

There is a second problem.  My org for instant, it's easy for me to reque=
st=20
https server where I can serve files to the public.  But asking for our I=
T to=20
support a hash equivalency (and pr) server?  This will likely take months=
 of=20
negotiation, possible security review, mitigation process, etc etc etc.. =
and no=20
guaranty that it will actually get approved.  I expect other people will =
be in a=20
similar situation.

> Another topic where additional meta data about the sstate-cache seams
> to be beneficial is sstate-mirror retention. Knowing which artifact was
> compiled for which tag or commit of the bitbake layer could help to
> wipe out some artifacts which are not needed anymore.
>=20
>>>  =C2=A0=C2=A0=C2=A0 - A script which gets a list of sstate artifacts =
from bitbake
>>> and then
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 does a upfront download works much be=
tter
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + The script runs only when the=
 user calls it or the SDK
>>> gets boot-
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strapped
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + The script uses a reasonable =
amount of parallel
>>> connections which
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 are re-used for mor=
e then one artifact download
>>
>> Explaining to users they need to do X before Y quickly gets tiring,
>> both for people explaining it and the people doing it trying to
>> remember. I'd really like to get to a point where the system "does
>> the
>> right thing" if we can.
>>
>> I don't believe the problems you describe are insurmountable. If you
>> are using sftp, that is going to be a big chunk of the problem as the
>> system assumes something faster is available. Yes, I've taken patches
>> to make sftp work but it isn't recommended at all. I appreciate there
>> would be reasons why you use sftp but if it is possible to get a list
>> of "available sstate" via other means, it would improve things.
>>
>>>  =C2=A0* Idea for a smart lock/unlock implementation
>>>  =C2=A0=C2=A0=C2=A0 - Form a user's perspective a locked vs. an unloc=
ked SDK does
>>> not make
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 much sense. It makes more sense if th=
e SDK would
>>> automatically
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 download the sstate-cache if it is ex=
pected to be available.
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Lets think about an implementation (w=
hich allows to override
>>> the
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logic) to switch from automatic to ma=
nual mode:
>>>       =20
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SSTATE_MIRRORS_ENABLED ?=3D "${is_sst=
ate_mirror_available()}"
>>
>> What determines this availability? I worry that is something very
>> fragile and specific to your use case. It is also not an all or
>> nothing
>> binary thing.
>=20
> It would probably be better to query a harserver if an artifact is
> present.
>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 In our case the sstate mirror is expe=
cted to provide all
>>> artifacts
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for tagged commits and for some git b=
ranches of the layer
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 repositories.
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The sstate is obviousely not usable f=
or a "dirty" git layer
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 repository.
>>
>> That isn't correct and isn't going to work. If I make a single change
>> locally, there is a good chance that 99.9% of the sstate could still
>> be
>> valid in some cases. Forcing the user through 10 hours of rebuild
>> when
>> potentially that much was available is a really really bad user
>> experience.
>=20
> Maybe there is a better idea.
>=20
>>
>>>  =C2=A0That's what the is_sstate_mirror_available function
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 could check to automatically enable a=
nd disable lazy
>>> downloads.
>>>       =20
>>>  =C2=A0=C2=A0=C2=A0 - If is_sstate_mirror_available() returns false, =
it should
>>> still be
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 possible to initiate a sstate-cache d=
ownload manually.
>>>       =20
>>>  =C2=A0* Terminology
>>>  =C2=A0=C2=A0=C2=A0 - Older Yocto Releases:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + eSDK means an installer which=
 provides a different
>>> environment with
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 different tools
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + The eSDK was static, with a l=
ocked sstate cache
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + Was for one MACHINE, for one =
image...
>>>  =C2=A0=C2=A0=C2=A0 - Newer Yocto Releases:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + The bitbake environment offer=
s all features of the eSDK
>>> installer. I
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 consider this as al=
ready implemented with meta-ide-support
>>> and
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-sysroots.
>>
>> Remember bblock and bbunlock too. These provide a way to fix or
>> unlock
>> specific sections of the codebase. Usually a developer has a pretty
>> good idea of which bits they want to allow to change. I don't think
>> people have yet realised/explored the potential these offer.
>>
>=20
> Yes, I also started thinking about the possibilities we would get for
> the SDK if there is a hash-server or an even more generic a meta data
> server for the sstate-cache in the middle of the infrastructure
> picture. it would probably solve some challenges which I could not find
> a solution so far.

Using the standard download model/approach we already have a "generic" me=
tadata=20
server approach (and standard download URI supported by bitbake).  The=20
specialized approaches (prserver/hashserver) are where we run into issues=
=20
because it's no longer "generic" and well understood by others.  Need to =
figure=20
out a way for this all to work and allow the most "reasonable" re-use we =
can.

--Mark

>=20
> Thank you for your response.
>=20
> Adrian
>=20
>=20
>> Cheers,
>>
>> Richard
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1830): https://lists.openembedded.org/g/openembedde=
d-architecture/message/1830
> Mute This Topic: https://lists.openembedded.org/mt/102320110/3616948
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture=
/unsub [mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

