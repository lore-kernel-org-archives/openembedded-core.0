Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web08.3823.1606911103456956378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 04:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 74C246008F;
	Wed,  2 Dec 2020 12:11:36 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
Subject: Re: [OE-core] [PATCH 2/2] connman: set service to conflict with systemd-networkd
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
References: <20201102092012.15968-1-yi.zhao@windriver.com>
 <20201102092012.15968-2-yi.zhao@windriver.com>
 <f4fb20c8-e735-bc5e-bd42-3d1f8823dffd@embed.me.uk>
 <bdfe3b74-d0ff-6d53-4a8a-2195b9b49497@windriver.com>
Cc: kai.kang@windriver.com
From: "Jack Mitchell" <ml@embed.me.uk>
Message-ID: <3cb971ce-8358-5355-0698-2330f436d1bc@embed.me.uk>
Date: Wed, 2 Dec 2020 12:11:32 +0000
MIME-Version: 1.0
In-Reply-To: <bdfe3b74-d0ff-6d53-4a8a-2195b9b49497@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable

On 02/12/2020 02:20, Yi Zhao wrote:
>=20
> On 12/1/20 5:02 AM, Jack Mitchell wrote:
>> On 02/11/2020 09:20, Yi Zhao wrote:
>>> Do not run systemd-networkd and connman simultaneously. These two
>>> network managers may conflict with each other.
>>>
>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> ---
>>>  ...stop-systemd-networkd-when-using-con.patch | 29 ++++++++++++++++++=
+
>>>  .../connman/connman_1.38.bb                   |  1 +
>>>  2 files changed, 30 insertions(+)
>>>  create mode 100644 meta/recipes-connectivity/connman/connman/0001-con=
nman.service-stop-systemd-networkd-when-using-con.patch
>>>
>>> diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.se=
rvice-stop-systemd-networkd-when-using-con.patch b/meta/recipes-connectivit=
y/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con=
.patch
>>> new file mode 100644
>>> index 0000000000..dd012750a4
>>> --- /dev/null
>>> +++ b/meta/recipes-connectivity/connman/connman/0001-connman.service-s=
top-systemd-networkd-when-using-con.patch
>>> @@ -0,0 +1,29 @@
>>> +From 9fea099d0a3ece37d80ad70d32ebb8a93f8f3280 Mon Sep 17 00:00:00 200=
1
>>> +From: Yi Zhao <yi.zhao@windriver.com>
>>> +Date: Fri, 30 Oct 2020 13:48:45 +0800
>>> +Subject: [PATCH] connman.service: stop systemd-networkd when using co=
nnman
>>> +
>>> +Stop systemd-networkd service when we use connman as network manager.
>>> +
>>> +Upstream-Status: Inappropriate [configuration]
>>> +
>>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> +---
>>> + src/connman.service.in | 1 +
>>> + 1 file changed, 1 insertion(+)
>>> +
>>> +diff --git a/src/connman.service.in b/src/connman.service.in
>>> +index 79e75d6..014eafe 100644
>>> +--- a/src/connman.service.in
>>> ++++ b/src/connman.service.in
>>> +@@ -6,6 +6,7 @@ RequiresMountsFor=3D@localstatedir@/lib/connman
>>> + After=3Ddbus.service network-pre.target systemd-sysusers.service
>>> + Before=3Dnetwork.target multi-user.target shutdown.target
>>> + Wants=3Dnetwork.target
>>> ++Conflicts=3Dsystemd-networkd.service systemd-networkd.socket
>>> + Conflicts=3Dsystemd-resolved.service
>>> +=20
>>> + [Service]
>>> +--=20
>>> +2.17.1
>>> +
>>> diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/=
recipes-connectivity/connman/connman_1.38.bb
>>> index 027c41e9af..45c2934dec 100644
>>> --- a/meta/recipes-connectivity/connman/connman_1.38.bb
>>> +++ b/meta/recipes-connectivity/connman/connman_1.38.bb
>>> @@ -3,6 +3,7 @@ require connman.inc
>>>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>>>             file://0001-plugin.h-Change-visibility-to-default-for-debu=
g-symb.patch \
>>>             file://0001-connman.service-stop-systemd-resolved-when-we-=
use-co.patch \
>>> +           file://0001-connman.service-stop-systemd-networkd-when-usi=
ng-con.patch \
>>>             file://connman \
>>>             file://no-version-scripts.patch \
>>>             "
>>>
>> Hi Yi,
>>
>> This breaks our usecase where we have been using connman and
>> systemd-networkd in tandem for a long time. IMO this should be reverted
>> as if the two applications are conflicting then the correct fix is that
>> they should be configured so that they don't both try to configure the
>> same interfaces. As systemd-networkd doesn't ship with any rules by
>> default it shouldn't be doing anything to interfere?
>=20
>=20
> Currently, A systemd-networkd configuration file 80-wired.network from
> systemd-conf package is also installed by default on HW BSPs. Comman is
> the default network-manager in Yocto. It will manage the wired interface
> automatically. But with this configuration file, the systemd-networkd
> will also try to manage the wired interface as connman does. They may
> conflict with each other.In addition to revert this patch, I think we
> should consider whether to install this configuration file by default.
> Maybe it=E2=80=99s better to install it as an example and users can enab=
le it as
> needed.
>=20
> Thanks,
> Yi
>=20


Hi Yi,

I see, thank you for pointing that out. I agree that we shouldn't be
shipping custom catch-all networkd snippets. Perhaps it should be
something appended by the Poky distro rather than installed by default?
I assume it is included so that network interfaces come up with a DHCP
address by default so people can ssh into the machine without an extra
config.

Cc kai.kang@windriver.com as it looks like they were the original author.

Regards,
Jack.

>=20
>> With this patch I can no-longer run both services as it's a hard
>> conflict with no option to either revert locally, or bbappend this patc=
h
>> out.
>>
>> Regards,
>> Jack.
>>
>=20
>=20
>=20
>=20

