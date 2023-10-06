Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0130E81E02
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 14:37:40 +0000 (UTC)
Received: from 3.mo576.mail-out.ovh.net (3.mo576.mail-out.ovh.net [188.165.52.203])
 by mx.groups.io with SMTP id smtpd.web10.14430.1696603052927612868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 07:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 188.165.52.203, mailfrom: louis.rannou@syslinbit.com)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.16.29])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 66D762704E
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Oct 2023 14:37:29 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8w9rc (unknown [10.110.103.149])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D3F0A1FEC2;
	Fri,  6 Oct 2023 14:37:28 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-8w9rc with ESMTPSA
	id /HjQL6gbIGVzAAAA9WQa5w
	(envelope-from <louis.rannou@syslinbit.com>); Fri, 06 Oct 2023 14:37:28 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G00125a35e4b-a5e5-440f-8ed0-a9bf81d48eb1,
                    666F94273B0C2A13EFE8D098A373195B3BD46C53) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 193.33.56.84
Message-ID: <c0520bc2-4d3e-43ef-8fbc-9c00c91745d4@syslinbit.com>
Date: Fri, 6 Oct 2023 16:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] systemd: sysusersd: change how the root home
 directory is set
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com,
 Qi.Chen@windriver.com, Louis Rannou <lrannou@baylibre.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20231005-sysusers3-v2-1-938c9cca79b7@syslinbit.com>
 <CAEHHSvZeXCv9HesBsfy4dC2GQ9K2t+aYJRui_3WyqLmqH3GERw@mail.gmail.com>
From: Louis Rannou <louis.rannou@syslinbit.com>
In-Reply-To: <CAEHHSvZeXCv9HesBsfy4dC2GQ9K2t+aYJRui_3WyqLmqH3GERw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Ovh-Tracer-Id: 1993124311986986309
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpedvieekiedtgeelveffledtiedtjeelteetgfelheelgffggfetieehteevhfdtjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgtohhnfhdrihhnpdhgihhthhhusgdrtghomhdpohhpvghnvghmsggvugguvggurdhorhhgnecukfhppeduvdejrddtrddtrddupdduleefrdeffedrheeirdekgedpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 14:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188771



On 06/10/2023 15:16, Julien Stephan wrote:
> Le jeu. 5 oct. 2023 =C3=A0 22:55, Louis Rannou <louis.rannou@syslinbit.=
com> a =C3=A9crit :
>>
>> From: Louis Rannou <lrannou@baylibre.com>
>>
>> Modifying the sources brings troubles in the devtool command. Therefor=
e it is
>> better to patch the source with a custom variable, and later replace i=
t with the
>> correct root path.
>>
>> Suggestion from :
>> <https://lore.kernel.org/all/DB5PR02MB102137939DE6D43E423A9D296EF03A@D=
B5PR02MB10213.eurprd02.prod.outlook.com/>
>>
>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
>> ---
>>   ...usersd-Change-the-user-root-s-home-direct.patch | 31 ++++++++++++=
++++++++++
>>   meta/recipes-core/systemd/systemd_254.4.bb         | 11 ++++----
>>   2 files changed, 37 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-t=
he-user-root-s-home-direct.patch b/meta/recipes-core/systemd/systemd/0029=
-sysusersd-Change-the-user-root-s-home-direct.patch
>> new file mode 100644
>> index 0000000000..dd0d96d11b
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user=
-root-s-home-direct.patch
>> @@ -0,0 +1,31 @@
>> +From bf97001978cdefad644f7b4b909f281368e5a4dd Mon Sep 17 00:00:00 200=
1
>> +From: Kas User <kas@example.com>
>=20
> Hi Louis,
>=20
> Is this intended to have kas user and email address instead of yours?

No, I thought I changed that.
>=20
>> +Date: Thu, 27 Jul 2023 08:23:06 +0000
>> +Subject: [PATCH] sysusers.d: Change the user root's home directory
>> +
>> +The default sysusers basic.conf.in file sets the root home directory =
to `/root`
>> +and does not permit its configuration. Change this to `:ROOT_HOME:` w=
hich must
>> +be set before the installation.
>> +
>> +The upstream considers the root home directory should not be changed
>> +<https://github.com/systemd/systemd/issues/27959>
>> +
>> +Upstream-Status: Denied
>> +Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>> +---
>> + sysusers.d/basic.conf.in | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/sysusers.d/basic.conf.in b/sysusers.d/basic.conf.in
>> +index 0aec080a4c..f26c224341 100644
>> +--- a/sysusers.d/basic.conf.in
>> ++++ b/sysusers.d/basic.conf.in
>> +@@ -7,7 +7,7 @@
>> +
>> + # The superuser
>> + g root    0       -            -
>> +-u root    0:0     "Super User" /root
>> ++u root    0:0     "Super User" :ROOT_HOME:
>> +
>> + # The nobody user/group for NFS file systems
>> + g {{NOBODY_GROUP_NAME}} 65534       -            -
>> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes=
-core/systemd/systemd_254.4.bb
>> index 77724eb822..3adf62935d 100644
>> --- a/meta/recipes-core/systemd/systemd_254.4.bb
>> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
>> @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd"
>>   SRC_URI +=3D " \
>>              file://touchscreen.rules \
>>              file://00-create-volatile.conf \
>> -           file://basic.conf.in \
>=20
> If this file is not needed anymore you should probably delete it with
> this commit

Good catch. Thanks
Louis

>=20
> Cheers
> Julien
>=20
>>              ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_f=
allback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>>              ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_f=
allback', 'file://00-hostnamed-network-user.conf', '', d)} \
>>              file://init \
>> @@ -30,6 +29,7 @@ SRC_URI +=3D " \
>>              file://0002-binfmt-Don-t-install-dependency-links-at-inst=
all-tim.patch \
>>              file://0008-implment-systemd-sysv-install-for-OE.patch \
>>              file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-loa=
d.d-to-.patch \
>> +           file://0029-sysusersd-Change-the-user-root-s-home-direct.p=
atch \
>>              "
>>
>>   # patches needed by musl
>> @@ -260,10 +260,6 @@ EXTRA_OEMESON +=3D "-Dkexec-path=3D${sbindir}/kex=
ec \
>>   # The 60 seconds is watchdog's default vaule.
>>   WATCHDOG_TIMEOUT ??=3D "60"
>>
>> -do_configure:prepend() {
>> -  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > ${S}/sy=
susers.d/basic.conf.in
>> -}
>> -
>>   do_install() {
>>          meson_do_install
>>          install -d ${D}/${base_sbindir}
>> @@ -375,6 +371,11 @@ do_install() {
>>           sed -i -e 's/#RebootWatchdogSec=3D10min/RebootWatchdogSec=3D=
${WATCHDOG_TIMEOUT}/' \
>>               ${D}/${sysconfdir}/systemd/system.conf
>>       fi
>> +
>> +       # The root home directory specified in sysusers.d/ was patched=
 to
>> +       # `:ROOT_HOME:`. Change now to the correct path given by ${ROO=
T_HOME}.
>> +       [ ! -f ${D}${libdir}/sysusers.d/basic.conf ] ||
>> +               sed -i s@:ROOT_HOME:@${ROOT_HOME}@g ${D}${libdir}/sysu=
sers.d/basic.conf
>>   }
>>
>>   python populate_packages:prepend (){
>>
>> ---
>> base-commit: 095021ac61c1df357e5f1868badd38038004317f
>> change-id: 20231005-sysusers3-f448703f294f
>>
>> Best regards,
>> --
>> Louis Rannou <louis.rannou@syslinbit.com>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#188739): https://lists.openembedded.org/g/openembe=
dded-core/message/188739
>> Mute This Topic: https://lists.openembedded.org/mt/101785446/4356723
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[jstephan@baylibre.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

