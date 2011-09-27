Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R8hLp-000181-2J
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 01:46:13 +0200
Received: by yia27 with SMTP id 27so6972853yia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 16:40:43 -0700 (PDT)
Received: by 10.236.185.233 with SMTP id u69mr16293012yhm.94.1317166843077;
	Tue, 27 Sep 2011 16:40:43 -0700 (PDT)
Received: from [10.1.10.78] (rrcs-97-79-162-178.sw.biz.rr.com. [97.79.162.178])
	by mx.google.com with ESMTPS id z53sm35862107yhj.7.2011.09.27.16.40.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Sep 2011 16:40:41 -0700 (PDT)
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
	<CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
In-Reply-To: <CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 27 Sep 2011 18:40:37 -0500
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Tue, 27 Sep 2011 23:46:13 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 27 sep. 2011 om 08:52 heeft Bruce Ashfield <bruce.ashfield@gmail.com> het=
 volgende geschreven:

> On Sat, Sep 17, 2011 at 6:18 PM, Dmitry Eremin-Solenikov
> <dbaryshkov@gmail.com> wrote:
>> MACHINE_KERNEL_PR was introduced long ago in org.oe.dev. It's present in
>> meta-oe kernel.bbclass. Several machines depend on this functionality.
>=20
> I don' t have a big problem with this, since the change is obviously
> harmless if it
> doesn't need to be used. But similar to my comment on patch 3/5, is there a=
ny
> history/technical reasons we can capture here ?
>=20
> I did a quick search to dig up a bit on this myself, but a summary
> would definitely
> help, since I see that this has a long and sometimes twisting history. Is i=
t as
> simple as ?
>=20
> "A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
> rebuilds for kernel and external modules"

It is that simple :)=20



>=20
> Cheers,
>=20
> Bruce
>=20
>=20
>>=20
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> ---
>>  meta/classes/kernel.bbclass |    5 +++++
>>  1 files changed, 5 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index c577011..b44e3b5 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -20,6 +20,11 @@ python __anonymous () {
>>     image =3D bb.data.getVar('INITRAMFS_IMAGE', d, True)
>>     if image:
>>         bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d=
)
>> +
>> +    machine_kernel_pr =3D bb.data.getVar('MACHINE_KERNEL_PR', d, True)
>> +
>> +    if machine_kernel_pr:
>> +        bb.data.setVar('PR', machine_kernel_pr, d)
>>  }
>>=20
>>  inherit kernel-arch deploy
>> --
>> 1.7.2.5
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>=20
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


