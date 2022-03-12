Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851C1C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 15:45:01 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web12.5736.1647099900625325191
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 07:45:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout10.t-online.de (Postfix) with SMTP id C66F0153B9;
	Sat, 12 Mar 2022 16:44:58 +0100 (CET)
Received: from [192.168.178.83] ([79.219.225.239]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nT3vO-4MYCOn0; Sat, 12 Mar 2022 16:44:58 +0100
Message-ID: <91cf4ccf-7f26-2022-dc1d-9aa614cbbac8@t-online.de>
Date: Sat, 12 Mar 2022 16:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [meta-oe][PATCHv3 3/3] librsvg: inherit vala
Content-Language: en-US
From: Markus Volk <f_l_k@t-online.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220312073022.2894-1-f_l_k@t-online.de>
 <20220312073022.2894-3-f_l_k@t-online.de>
 <8ee120c2a797e8cb2b9fe011312b932fe8e83b6c.camel@linuxfoundation.org>
 <16DBAB94989A6D75.19757@lists.openembedded.org>
In-Reply-To: <16DBAB94989A6D75.19757@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1647099898-00014AB5-4495D96D/0/0 CLEAN NORMAL
X-TOI-MSGID: bf90dbef-066c-4bf6-9310-76066f34fa9a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 15:45:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163093


Am 12.03.22 um 16:25 schrieb Markus Volk:
>
> Am 12.03.22 um 14:32 schrieb Richard Purdie:
>> On Sat, 2022-03-12 at 08:30 +0100, Markus Volk wrote:
>>> this fixes a build error about missing vapigen and enables vapi build
>>>
>>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>>> ---
>>> =C2=A0 meta/recipes-gnome/librsvg/librsvg_2.52.5.bb | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb=20
>>> b/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
>>> index 1279c663f7..ede6454c2b 100644
>>> --- a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
>>> +++ b/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
>>> @@ -14,7 +14,7 @@ SECTION =3D "x11/utils"
>>> =C2=A0 DEPENDS =3D "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
>>> =C2=A0 BBCLASSEXTEND =3D "native"
>>> =C2=A0 -inherit gnomebase gtk-doc pixbufcache upstream-version-is-eve=
n=20
>>> gobject-introspection rust
>>> +inherit gnomebase gtk-doc pixbufcache upstream-version-is-even=20
>>> gobject-introspection rust vala
>>> =C2=A0 =C2=A0 SRC_URI +=3D=20
>>> "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat=
ch=20
>>> \
>>> file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patc=
h=20
>>> \
>>
>> I'm curious whether we've just been missing some functionality in=20
>> librsvg or
>> whether the recent changes exposed some new error?
>>
>> Put another way, how did you see this when the autobuilder does not?
>>
>> Cheers,
>>
>> Richard
> In any case, this adds functionality. For example, a real life issue=20
> for the lack of vapi in librsvg is that you can't build gnome-chess=20
> because it has a dependency on it.
>
> The second question is a good one. Normally vala bindings should be=20
> optional in librsvg autotools buidsystem.
>
> https://github.com/GNOME/librsvg/blob/c5d0eb679ee45377417bbf9ce2dabde0e=
b72802d/configure.ac#L293=20
>
>
> I noticed similar behavior with some xfce recipes when I did an=20
> oe-core update a little over two weeks ago. I suddenly had build=20
> aborts due to missing vapigen, even though --enable-vala was not=20
> explicitly specified.
>
> https://git.openembedded.org/meta-openembedded/diff/meta-xfce/recipes-x=
fce/libxfce4util/libxfce4util_4.16.0.bb?h=3Dmaster-next&id=3D26d9d0b62717=
7f6f710c5d7b902d73b84ac14804=20
>
>
> All recipes that were affected by this already had 'inherit=20
> gobject-introspection' added. vapi build is basically just=20
> gobject-introspection too, so this seems related somehow.
> But why has this only been the case for two weeks? And why not with=20
> autobuilder? I really don't know.
> I'll see if I can reproduce the vapi error in librsvg.
>
It looks like i'm not able to reproduce the issue. It only happened on=20
the first clean build. Now, that i have sstate cache available it's=20
working as expected. Adding or removing vala from inherit just enables=20
or disables generation of the vapi files.

