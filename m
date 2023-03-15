Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82307C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 17:22:04 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.2377.1678900919840660921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 10:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout07.t-online.de (Postfix) with SMTP id 1D97118F1;
	Wed, 15 Mar 2023 18:21:58 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.85]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pcUp2-14JGDI0; Wed, 15 Mar 2023 18:21:57 +0100
Date: Wed, 15 Mar 2023 18:21:50 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] glib: update 2.74.6 -> 2.76.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <E8OKRR.MV94C2TWISKQ@t-online.de>
In-Reply-To: 
	<CANNYZj_tKEA=CgQJ8QL2660VbvkXizX7+yrZ4EgaPdPnc33Siw@mail.gmail.com>
References: <20230315070909.422721-1-f_l_k@t-online.de>
	<CANNYZj-k2EG4giH=zhXQywFhnVnpuaFtc4ngHgn8SV3w2kQhrw@mail.gmail.com>
	<LZHKRR.FOHLRDXQDV053@t-online.de>
	<CANNYZj_tKEA=CgQJ8QL2660VbvkXizX7+yrZ4EgaPdPnc33Siw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-TIcvFL5KHZGrKjtuVIuX"
X-TOI-EXPURGATEID: 150726::1678900917-FB7F9992-A12D5361/0/0 CLEAN NORMAL
X-TOI-MSGID: 673b2e32-3a2c-449e-9d85-f4ccc20d64f7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 17:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178653

--=-TIcvFL5KHZGrKjtuVIuX
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

That linking is done in initscripts. Removing this line will fix the=20
issue
<https://git.yoctoproject.org/poky/tree/meta/recipes-core/initscripts/inits=
cripts-1.0/volatiles?h=3Dmaster-next#n32>

But that would affect not only ptest images. It would additionally be=20
needed to adjust that recently added commit:
<https://git.yoctoproject.org/poky/commit/meta?h=3Dmaster-next&id=3Dd5d4047=
9d706cbb382850b9479c5dd9bfb801c99>

So this would be quite invasive. Overall the logic here is just the=20
other way around as described in the systemd documentation, where /tmp=20
should be volatile and /var/tmp should be covered by physical memory

Am Mi, 15. M=E4r 2023 um 16:51:34 +0100 schrieb Alexander Kanavin=20
<alex.kanavin@gmail.com>:
> You probably need to find out what links /var/tmp to /tmp in ptest
> images, and see if it can be reconfigured to do the same thing as the
> image where the tests passed.
>=20
> Alex
>=20
> On Wed, 15 Mar 2023 at 16:07, Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  Am Mi, 15. M=E4r 2023 um 08:27:33 +0100 schrieb Alexander Kanavin=20
>> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>:
>>=20
>>  Guesswork is a fast track to frustration.
>>=20
>>=20
>>  True :D But thats what always happens to me if I dont know enough=20
>> and can't find a way to reproduce.
>>  Thanks to your hint on  core-image-ptest-glib-2.0 I was able to=20
>> reproduce the issue. Running the test from /var/volatile/tmp didn't=20
>> solve the issue. But compared to core-image-ptest-glib-2.0 where=20
>> /tmp links to /var/tmp the tmpdir is handled by systemd tmp.mount in=20
>> my image and thus is not a symbolic link.
>>=20
>>  According to systemd ducumentation /var/tmp and /tmp are not the=20
>> same and are handled differently
>>  <https://systemd.io/TEMPORARY_DIRECTORIES/>
>>=20
>>  Still I have no idea how this should be fixed or if the failed test=20
>> could maybe ignored but I was able to pass the tests in =20
>> core-image-ptest-glib-2.0 by removing the /tmp symlink and adding=20
>> this line to fstab:
>>  tmpfs /tmp tmpfs defaults 0 0
>>=20
>>  After a reboot the tests completed successful
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178581):=20
> <https://lists.openembedded.org/g/openembedded-core/message/178581>
> Mute This Topic: <https://lists.openembedded.org/mt/97622689/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org=20
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-TIcvFL5KHZGrKjtuVIuX
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>That linking is done in initscript=
s. Removing this line will fix the issue</div><div><a href=3D"https://git.y=
octoproject.org/poky/tree/meta/recipes-core/initscripts/initscripts-1.0/vol=
atiles?h=3Dmaster-next#n32">https://git.yoctoproject.org/poky/tree/meta/rec=
ipes-core/initscripts/initscripts-1.0/volatiles?h=3Dmaster-next#n32</a></di=
v><div><br></div><div>But that would affect not only ptest images. It would=
 additionally be needed to adjust that recently added commit:</div><div><a =
href=3D"https://git.yoctoproject.org/poky/commit/meta?h=3Dmaster-next&amp;i=
d=3Dd5d40479d706cbb382850b9479c5dd9bfb801c99">https://git.yoctoproject.org/=
poky/commit/meta?h=3Dmaster-next&amp;id=3Dd5d40479d706cbb382850b9479c5dd9bf=
b801c99</a></div><div><br></div><div>So this would be quite invasive. Overa=
ll the logic here is just the other way around as described in the systemd =
documentation, where /tmp should be volatile and /var/tmp should be covered=
 by physical memory</div></div><div id=3D"geary-quote" dir=3D"auto"><br>Am =
Mi, 15. M=E4r 2023 um 16:51:34 +0100 schrieb Alexander Kanavin &lt;alex.kan=
avin@gmail.com&gt;:<br><blockquote type=3D"cite"><div class=3D"plaintext" s=
tyle=3D"white-space: break-spaces;">You probably need to find out what link=
s /var/tmp to /tmp in ptest
images, and see if it can be reconfigured to do the same thing as the
image where the tests passed.

Alex

On Wed, 15 Mar 2023 at 16:07, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-onl=
ine.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 Am Mi, 15. M=E4r 2023 um 08:27:33 +0100 schrieb Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;:

 Guesswork is a fast track to frustration.


 True :D But thats what always happens to me if I dont know enough and can'=
t find a way to reproduce.
 Thanks to your hint on  core-image-ptest-glib-2.0 I was able to reproduce =
the issue. Running the test from /var/volatile/tmp didn't solve the issue. =
But compared to core-image-ptest-glib-2.0 where /tmp links to /var/tmp the =
tmpdir is handled by systemd tmp.mount in my image and thus is not a symbol=
ic link.

 According to systemd ducumentation /var/tmp and /tmp are not the same and =
are handled differently
 <a href=3D"https://systemd.io/TEMPORARY_DIRECTORIES/">https://systemd.io/T=
EMPORARY_DIRECTORIES/</a>

 Still I have no idea how this should be fixed or if the failed test could =
maybe ignored but I was able to pass the tests in  core-image-ptest-glib-2.=
0 by removing the /tmp symlink and adding this line to fstab:
 tmpfs /tmp tmpfs defaults 0 0

 After a reboot the tests completed successful
</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#178581): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178581">https://lists.openembedded.org/g/openembedd=
ed-core/message/178581</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97622689/3618=
223">https://lists.openembedded.org/mt/97622689/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-TIcvFL5KHZGrKjtuVIuX--


