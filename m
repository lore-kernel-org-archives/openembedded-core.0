Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtiT5-0006MW-58
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 17:55:47 +0200
Received: by ywe9 with SMTP id 9so831659ywe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 08:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=LNa7NTJXBgMCtt3SEVx2H9xJFEBC3Y59HWOOuDtSnaU=;
	b=b3nvmrhJtByyUzNQa/TyEoxcV75IUkXVzjPjvd8k73C+frthJdDOBQxg5zQU+IVGyr
	w+W5jj9Sv8HIoh7sZq8FEWU4B53Zo8yrM9hiN1ttGAcunq8NomzsWc+5bvYd5Li+1h7t
	3/GF/b9TXvXcpsi2VDysJ9mjnyBTj4u+JUXSw=
Received: by 10.142.187.3 with SMTP id k3mr524859wff.233.1313596267262; Wed,
	17 Aug 2011 08:51:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.197 with HTTP; Wed, 17 Aug 2011 08:50:36 -0700 (PDT)
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DEA22801@orsmsx504.amr.corp.intel.com>
References: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
	<C9D28EB1-CE86-42E9-9825-0A408698FD66@dominion.thruhere.net>
	<1312297317.4325.46.camel@phil-desktop>
	<AD653010-7DD2-4B79-8C80-326646464C00@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94DEA22801@orsmsx504.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Aug 2011 08:50:36 -0700
Message-ID: <CAMKF1spxCnGo7zJXptoNT_OcKQ9pVk6GvMLYw8Axq56tQ1h7uw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Wed, 17 Aug 2011 15:55:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2011 at 9:43 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
> Hi Koen,
> =C2=A0Sorry for replying late, I am on vacation now. I looked at my commi=
t 561d875404ef1783f94f37314b6e756766db8411, and from it I see that both egl=
ibc & glibc package.bbclass has same lines
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 eglibc_name =3D "%s.%s" % (m.group(1), m.group(2).lower().replace("-=
",""))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 eglibc_name =3D name
> So I am not sure that this is the correct fix. I will look into it furthe=
r and reply later.

this code is not the problem the real problem is the splitting code
that changed in this commit

-  m =3D re.match("(.*)\.(.*)", name)
+ m =3D re.match("(.*)_(.*)", name)


Why is regular expression splitting at _ and joining with . ?
original behaviour was to split and join with .

This seems incorrect to me.

> Thanks,
> Nitin
>
>> -----Original Message-----
>> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
>> Sent: Tuesday, August 09, 2011 11:14 PM
>> To: Patches and discussions about the oe-core layer
>> Cc: Kamble, Nitin A
>> Subject: Re: [OE-core] [PATCH] libc-package bbclass: fix binary
>> localedata dependency code
>>
>> Nitin, any insights on this?
>>
>> Op 2 aug. 2011, om 17:01 heeft Phil Blundell het volgende geschreven:
>>
>> > It does look a bit weird. =C2=A0That code was introduced in 561d8754,
>> > ostensibly as a merger of the eglibc and glibc equivalents. =C2=A0But,=
 the
>> > original code from glibc-package.bbclass did:
>> >
>> > =C2=A0 =C2=A0 =C2=A0 def output_locale_binary_rdepends(name, pkgname, =
locale,
>> encoding):
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match("(.*)\=
.(.*)", name)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 glibc_name =3D "%s.%s" % (m.group(1),
>> m.group(2).lower().replace("-",""))
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 glibc_name =3D name
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('RDEPE=
NDS_%s' % pkgname,
>> legitimize_package_name('glibc-binary-localedata-%s' % glibc_name), d)
>> >
>> > ... i.e. it was using the "." separator both for splitting and
>> joining,
>> > which seems reasonable. =C2=A0But somehow when it showed up in
>> > libc-package.bbclass it had gotten transmogrified so that it split on
>> > "_" but joined with "." as you showed below. =C2=A0That seems bogus to=
 me.
>> >
>> > p.
>> >
>> > On Tue, 2011-08-02 at 16:55 +0200, Koen Kooi wrote:
>> >> The bug I was seeing was caused by something else, but I'd still
>> like feedback on this patch to find out why the dot vs dash difference
>> exists
>> >>
>> >> Op 2 aug. 2011, om 16:47 heeft Koen Kooi het volgende geschreven:
>> >>
>> >>> When using binary locales rootfs generation fails with:
>> >>>
>> >>> | Unknown package 'locale-base-en-us'.
>> >>> | Collected errors:
>> >>> | =C2=A0* opkg_install_cmd: Cannot install package locale-base-en-us=
.
>> >>>
>> >>> This is due to:
>> >>>
>> >>> $ dpkg-deb -I ipk/armv7a/locale-base-en-us_2.12-r16_armv7a.ipk |
>> grep Depends
>> >>> Depends: eglibc-binary-localedata-en.us
>> >>>
>> >>> Note the '.' seperator
>> >>>
>> >>> $ ls ipk/armv7a/ | grep binary-localedata-en | grep us
>> >>> eglibc-binary-localedata-en-us_2.12-r16_armv7a.ipk
>> >>>
>> >>> Note the '-' seperator vs the '.' in the locale-base packages.
>> >>>
>> >>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> >>> ---
>> >>> meta/classes/libc-package.bbclass | =C2=A0 =C2=A02 +-
>> >>> 1 files changed, 1 insertions(+), 1 deletions(-)
>> >>>
>> >>> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-
>> package.bbclass
>> >>> index de57230..67d08c0 100644
>> >>> --- a/meta/classes/libc-package.bbclass
>> >>> +++ b/meta/classes/libc-package.bbclass
>> >>> @@ -243,7 +243,7 @@ python package_do_split_gconvs () {
>> >>> =C2=A0 def output_locale_binary_rdepends(name, pkgname, locale,
>> encoding):
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match("(.*)_(.*)", name)
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m:
>> >>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc_name =
=3D "%s.%s" % (m.group(1),
>> m.group(2).lower().replace("-",""))
>> >>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc_name =
=3D "%s-%s" % (m.group(1),
>> m.group(2).lower().replace("-",""))
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc_=
name =3D name
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('RDEPENDS_%s' % pk=
gname,
>> legitimize_package_name('%s-binary-localedata-%s' \
>> >>> --
>> >>> 1.6.6.1
>> >>>
>> >>
>> >>
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
>> core
>> >
>> >
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


