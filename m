Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB88C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 00:45:25 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.401.1647045923755484472
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 16:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout01.t-online.de (Postfix) with SMTP id CCC083D41;
	Sat, 12 Mar 2022 01:45:21 +0100 (CET)
Received: from [192.168.0.117] ([24.134.105.89]) by fwd77.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nSpsf-4AIyMi0; Sat, 12 Mar 2022 01:45:13 +0100
Date: Sat, 12 Mar 2022 01:45:07 +0100
From: f_l_k@t-online.de
Subject: Re: [OE-core] [meta-oe][PATCHv2] mesa: update to 22.0.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <7RWL8R.KIOTTKEBL4AT2@t-online.de>
In-Reply-To: 
	<0abd18c8268323c953e66ac12185de8641a37ac0.camel@linuxfoundation.org>
References: <20220311172010.2490948-1-f_l_k@t-online.de>
	<0abd18c8268323c953e66ac12185de8641a37ac0.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/QE9gSmgZTdR5ALYG+EU"
X-TOI-EXPURGATEID: 150726::1647045913-0001606D-5D163143/0/0 CLEAN NORMAL
X-TOI-MSGID: 8fe852a7-3252-4d24-90f8-e9d8ea5162af
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 00:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163080

--=-/QE9gSmgZTdR5ALYG+EU
Content-Type: text/plain; charset=us-ascii; format=flowed

Before I left for work, I started a core-image-weston build and ran 
into some problems. One of them was that librsvg was missing 'inherit 
vala', but that doesn't seem to be related. The main problem seems to 
be that mesa-22.0.0 dropped dri api and drivers. These are no longer 
buildable:
<https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/mesa/mesa_21.3.7.bb?h=master-next#n3>

My build did not have the problem because I did not include the dri 
drivers in my image.
There was also an error because gtk+3 tried to add libgl instead of 
virtual/libgl, but that whole line is deprecated, gtk no longer has an 
--enable-glx option.  
<https://git.yoctoproject.org/poky/tree/meta/recipes-gnome/gtk+/gtk+3.inc?h=master-next#n59>


I'll see if i can fix it when i'm home again

On Sat, Mar 12 2022 at 12:18:18 AM +0000, Richard Purdie 
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2022-03-11 at 18:20 +0100, Markus Volk wrote:
>>  - remove 0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch 
>> that
>>    was applied upstream
>> 
>>  - adjust 0002-meson.build-make-TLS-ELF-optional.patch
>> 
>>  - fix patch fuzz
>> 
>>  License-Update: removed references to deleted code.
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
> 
> Thanks for the v2, looks good.
> 
> I queued this for testing unfortunately it showed:
> 
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3220/steps/11/logs/stdio>
> 
> as well as
> 
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/4874/steps/11/logs/stdio>
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/4877/steps/12/logs/stdio>
> 
> I stopped that build since it seemed unlikely it would get anywhere.
> 
> Cheers,
> 
> Richard
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163079): 
> <https://lists.openembedded.org/g/openembedded-core/message/163079>
> Mute This Topic: <https://lists.openembedded.org/mt/89715526/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-/QE9gSmgZTdR5ALYG+EU
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>Before I left for work, I sta=
rted a core-image-weston build and ran into some problems. One of them was =
that librsvg was missing 'inherit vala', but that doesn't seem to be relate=
d. The main problem seems to be that mesa-22.0.0 dropped dri api and driver=
s. These are no longer buildable:</div><div><a href=3D"https://git.openembe=
dded.org/openembedded-core/tree/meta/recipes-graphics/mesa/mesa_21.3.7.bb?h=
=3Dmaster-next#n3">https://git.openembedded.org/openembedded-core/tree/meta=
/recipes-graphics/mesa/mesa_21.3.7.bb?h=3Dmaster-next#n3</a></div><div><br>=
</div><div>My build did not have the problem because I did not include the =
dri drivers in my image.</div>There was also an error because gtk+3 tried t=
o add libgl instead of virtual/libgl, but that whole line is deprecated, gt=
k no longer has an --enable-glx option. &nbsp;<a href=3D"https://git.yoctop=
roject.org/poky/tree/meta/recipes-gnome/gtk+/gtk+3.inc?h=3Dmaster-next#n59"=
>https://git.yoctoproject.org/poky/tree/meta/recipes-gnome/gtk+/gtk+3.inc?h=
=3Dmaster-next#n59</a></div><div><br></div><div><br></div><div>I'll see if =
i can fix it when i'm home again</div></div><div id=3D"geary-quote" dir=3D"=
auto"><br>On Sat, Mar 12 2022 at 12:18:18 AM +0000, Richard Purdie &lt;rich=
ard.purdie@linuxfoundation.org&gt; wrote:<br><blockquote type=3D"cite"><div=
 class=3D"plaintext" style=3D"white-space: break-spaces;">On Fri, 2022-03-1=
1 at 18:20 +0100, Markus Volk wrote:
<blockquote> - remove 0001-v3dv-account-for-64bit-time_t-on-32bit-arches.pa=
tch that
   was applied upstream
=20
 - adjust 0002-meson.build-make-TLS-ELF-optional.patch
=20
 - fix patch fuzz
=20
 License-Update: removed references to deleted code.
=20
 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
</blockquote>
Thanks for the v2, looks good.

I queued this for testing unfortunately it showed:

<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/3220/steps/11/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/81/builds/3220/steps/11/logs/stdio</a>

as well as

<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/37/build=
s/4874/steps/11/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/37/builds/4874/steps/11/logs/stdio</a>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/48/build=
s/4877/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/48/builds/4877/steps/12/logs/stdio</a>

I stopped that build since it seemed unlikely it would get anywhere.

Cheers,

Richard

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#163079): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163079">https://lists.openembedded.org/g/openembedd=
ed-core/message/163079</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89715526/3618=
223">https://lists.openembedded.org/mt/89715526/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-/QE9gSmgZTdR5ALYG+EU--


