Received: from mail-ve0-f177.google.com ([209.85.128.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXv0I-0000rM-Br
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:01:04 +0200
Received: by mail-ve0-f177.google.com with SMTP id jw11so556055veb.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 07:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=OtC/abGuTEpoxEkplP1T29lhkC3FaqC8dd3Rgl15hqU=;
	b=ydoI3Vv4+u+RTZGAgI+c1GDJ62wNE1PI76z2XteoYD0HDh6VmWMXw6m66ih4XEoFKP
	hwMuCGOA53pV8d2YrWurKtgn8L+cIdyJ3SLU92+DD3itkgEJ29ucrh14/5PQvQAx3sHn
	7zIZDnv1MVyJZ/KzgDZ8mf/Ltj6k80UE4DzWO1Hm3NxpgLcThh+ax7KGeVqYA3H6ee9O
	ygHEs/w8G6qMG68lSavqwSj80eIgEacZouzjPcz4GO6SZoeG9Kx1UR41JJG8av/exzza
	1KPahYmbVS68ojXwiZ5SkYSnELOl0ZZDbqvXYisNEt0XIjx+L9i6SiUGDF+IV8M9deWv
	kSdQ==
MIME-Version: 1.0
X-Received: by 10.220.78.131 with SMTP id l3mr2251406vck.54.1367505788391;
	Thu, 02 May 2013 07:43:08 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Thu, 2 May 2013 07:43:08 -0700 (PDT)
In-Reply-To: <1556536.BsQG791ajX@helios>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<51826BBB.2090307@windriver.com> <1556536.BsQG791ajX@helios>
Date: Thu, 2 May 2013 16:43:08 +0200
Message-ID: <CALbNGRQipDCysg-o12sqE-sHgkYE5u=WftF=cBVnRxsSEwNTjA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: useradd.bbclass question
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
X-List-Received-Date: Thu, 02 May 2013 15:01:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2013 at 4:34 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 02 May 2013 08:35:55 Mark Hatle wrote:
>> On 5/2/13 2:49 AM, Andreas M=C3=BCller wrote:
>> > on one of my build machines useradd.bbclass seem to use the UID/GID of
>> > build host. On other machines useradd works correct.
>> >
>> > I have the follwing in gdm:
>> >
>> > <snip>
>> > do_install_append() {
>> >
>> >      ...
>> >      chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
>> >      chmod 0750 ${D}${localstatedir}/lib/gdm
>> >
>> > }
>> >
>> > ...
>> >
>> > USERADD_PACKAGES =3D "${PN}"
>> > USERADD_PARAM_${PN} =3D "--system --no-create-home --home
>> > ${localstatedir}/lib/gdm --user-group gdm"
>> > <snip/>
>> >
>> > In sysroot /etc/group I see
>> > gdm:x:990:
>> >
>> > In sysroot /etc/group I see
>> > gdm:!:993:990::/var/lib/gdm:
>> >
>> > The folder in packet/image has IDs 42:42 which is taken from build hos=
t.
>>
>> This says that something ran an operation outside of the pseudo environm=
ent.
>>  So it fell back to looking up the uid from the host system.  (The
>> alternative is the item was installed -before- the /etc/passwd,/etc/grou=
p
>> was written to the disk.
>
> Right, do_install will be well before this stuff happens and it is not a
> fakeroot task anyway. This needs to be moved to a postinstall script (whi=
ch
> should be able to run during image creation).
>
> Cheers,
> Paul
>
Did this change - it is mentioned this way in

meta-skeleton/recipes-skeleton/useradd/useradd-example.bb

Andreas


