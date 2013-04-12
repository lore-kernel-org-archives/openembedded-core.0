Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UQa3P-0003TZ-16
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 11:13:57 +0200
Received: by mail-vb0-f47.google.com with SMTP id x13so1927391vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 01:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=klDrgMj0oUn9XMMHsilJTLZZ/S9DEQ3eZ7AK5yIEIZ0=;
	b=uSpXS6MJwpAFcQ1utR5h8D0egcOmAXPbGzVdJP5jC3pm7E7yTGNwhzHys2INBHhLbE
	FsuwkpWkMyVAKWx1rUoBpIF8ExcZ0ZhwmV2tGNEnGcopkDXdpZwLZ63w9vpZ/gc6F/78
	9KwBZ/FfRo443AbTPCrm05Hr22FAnMFFd454ed89Ax6kk/JjtX8N9RlJ1n0276wfBkej
	S+w4DQAkyBVaXXCbK9IGqXBb8/jf8DzjscAMCTavlVmNf1GHBsFsbNj5ej5QsTQfUvzh
	mNo4dfswOBAkS3WIF6Otqjs8q0qVSkWcP9Ji/oOhpOstzCPtoAKwXwS3lF5sDFnMAO/z
	ee4g==
MIME-Version: 1.0
X-Received: by 10.58.13.10 with SMTP id d10mr7810316vec.2.1365756990457; Fri,
	12 Apr 2013 01:56:30 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Fri, 12 Apr 2013 01:56:30 -0700 (PDT)
Date: Fri, 12 Apr 2013 10:56:30 +0200
Message-ID: <CALbNGRRgm8MspqB0ouUFp2s+y_7CGL+qEFFWRZLC+6bh9sJOGg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: systemd/sysvinit switches (was [meta-systemd][PATCH 1/2] Delete systemd class)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 09:13:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2013 at 2:12 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Apr 9, 2013 at 10:01 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Tue, Mar 05, 2013 at 11:59:07PM +0100, Martin Jansa wrote:
>>> On Tue, Mar 05, 2013 at 11:50:41PM +0100, Andreas M=C3=BCller wrote:
>>> > On Tue, Mar 5, 2013 at 11:18 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
>>> > > On Wed, Feb 13, 2013 at 09:25:34AM -0800, Khem Raj wrote:
>>> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> > >
>>> > > good old meta-systemd should now parse again,
>>> > Thanks - will come back to test HEADs soon.
>>>
>>> But be aware that I've fixed only parsing of avahi and wpa-supplicant.
>>>
>>> I haven't tested it properly in runtime because my upgrade path is a bi=
t
>>> broken (because I was building images with khem's patches for a while t=
o
>>> test other stuff) and even clean build with failed to boot with
>>> qemux86-64 and I don't have time to debug it now.
>>>
>>> > > I wont apply this 2 commits
>>> > > until systemd discussion in oe-core is finished and future of
>>> > > meta-systemd decided.
>>> > >
>>> > After systemd regression is worked around yocto 1.4 release regressio=
n
>>> > is knocking at the door...
>>>
>>> yes :/
>>>
>>> If we need to maintain meta-systemd bbappends for upgrade path we can
>>> also maintain them with PN-systemd packages and good old systemd bbclas=
s.
>>
>> Khem pinged me about this patch, so here are my thoughts:
>>
>> PN-systemd discussion in oe-core haven't moved a bit since this patch
>> was proposed, I think we have 2-3 options, lets vote about meta-systemd =
future.
>>
>> 1) keep PN-systemd separation in meta-systemd and fixup .bbappends to
>> resolve issues created by oe-core (I've fixed some issues, but still a
>> lot of issues in postinst/postrm/prerm scripts when both inits are
>> sharing the same PN)
>>
>> 2) give up on clean separation of PN-<init> and provide upgrade path
>> from PN-systemd to PN (mostly done by these 2 commits from khem).
>>
>> 3) give up on clean separation of PN-<init> and upgrade path (there are
>> many issues in other parts of oe-core, so upgrade path from danny to
>> dylan doesn't look usable.
>>
>> A) migrate existing .bbappends to their recipes to .bb files and
>> remove this layer. Any volunteer for that?
>>
>> My vote: 3) + A) later in 1.5
> A bit off-topic and mentioned here & there: I am working on
> network-manager(-applet) 0.9.8.0 update and xinput-calibrator. I could
> add 3) + A) for them if agreed. Hope to send them beginning of next
> week.
>
OK - just in case I have spare cycles to start this: I am afraid I
lost overview regarding distro features. I found systemd and sysvinit
which can be set both - still correct?

Ross could you please link me to the information how the use case 'I
want to build for both init-systems but let image decide which one to
use' is set up.
Sorry I didn't follow the last changes in detail because of other
issues (and personally I just use sysvinit).

Andreas


