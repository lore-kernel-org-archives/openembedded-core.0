Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RrIRS-0001fn-0d
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jan 2012 01:16:23 +0100
Received: by lahc1 with SMTP id c1so1551160lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2012 16:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YxP/wzTVU8R3yjIS17LYRFX+kzCsI0mHp3+6X8YtfhA=;
	b=L5sgmjj83ijtrvIEKV35/HnbN/3ID2sQ3TMJgOaV8VK3mEwEb0WqypP+jtwpDrPGAJ
	hZDTb73y+X+ReIkIU07d2DiYTM639Fj0cJgHA/0CRrtY9tiHweYLIm8eNlW1tbl1oO4+
	vFSEjVBDIDB2LuQf3dtqaegsdAxqCvqE4Vqy0=
MIME-Version: 1.0
Received: by 10.112.27.165 with SMTP id u5mr1572003lbg.48.1327795711162; Sat,
	28 Jan 2012 16:08:31 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Sat, 28 Jan 2012 16:08:31 -0800 (PST)
In-Reply-To: <CALbNGRRdC_Au4174RUZvr20hB1+PTqNuOmkHpoykEOtwbF-8ww@mail.gmail.com>
References: <CALbNGRS-WsE45UakTV5VE2T5bAxb1C2iWgPeN+Ys+OTx-i48Rw@mail.gmail.com>
	<CALbNGRR8cJJfDcHm1hX8cRf7JOKwkoU-sySx1mYujMgXJYHBdA@mail.gmail.com>
	<CALbNGRQza2-LE2bH2Z51nC9jVsNk6Vind3JqOfk1vU7z3+x13g@mail.gmail.com>
	<7463040.mHMHaff4Os@helios>
	<CALbNGRRdC_Au4174RUZvr20hB1+PTqNuOmkHpoykEOtwbF-8ww@mail.gmail.com>
Date: Sun, 29 Jan 2012 01:08:31 +0100
Message-ID: <CALbNGRT4=F0cbdJ4oO1HmuhXnfmmmoBG1mWqziyDLM+vb-BKiw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [oe] evince: who is responsible to pack all within usr/lib/evince/3/backends to ${PN}?
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
X-List-Received-Date: Sun, 29 Jan 2012 00:16:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 28, 2012 at 11:46 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Sat, Jan 28, 2012 at 4:03 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Saturday 28 January 2012 00:29:28 Andreas M=FCller wrote:
>>> Have modified bitbake.conf here to
>>>
>>> PACKAGES =3D "${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN} ${PN}-doc
>>> ${PN}-locale"
>>>
>>> now I get the expected behavior.
>>>
>>> Will start a build from scratch for the night to see if there is some
>>> fallout..
>>
>> We would need to be extremely careful before changing the default value =
of
>> PACKAGES. I would strongly suggest you enable buildhistory when you do t=
his so
>> you can spot any changes easily, particularly in package content.
>>
> I am afraid you are so right: First build fallout is db. It shows that
> the current implementation
>
> SOLIBS =3D ".so.*"
> SOLIBSDEV =3D ".so"
>
> fails at least here. The main shared lib is found in -dev!
>
> Uhhh cold in here...
>
How about splitting bitbake.conf changes:
1. Now: move ${PN}-staticdev before ${PN}. This should not have the
dramatic impact and makes it easier to fix new QA warnings.
2. (Much) later ${PN}-dev before ${PN}. This has huge impact and needs
massive testing

Andreas


