Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB89C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 15:25:43 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web12.5539.1647098742518292644
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 07:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout04.t-online.de (Postfix) with SMTP id 5A93A54C8;
	Sat, 12 Mar 2022 16:25:39 +0100 (CET)
Received: from [192.168.178.83] ([79.219.225.239]) by fwd82.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nT3cg-1XzRVB0; Sat, 12 Mar 2022 16:25:38 +0100
Message-ID: <b05dda2b-b796-08d6-c488-c1f14d8e7842@t-online.de>
Date: Sat, 12 Mar 2022 16:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [meta-oe][PATCHv3 3/3] librsvg: inherit vala
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220312073022.2894-1-f_l_k@t-online.de>
 <20220312073022.2894-3-f_l_k@t-online.de>
 <8ee120c2a797e8cb2b9fe011312b932fe8e83b6c.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <8ee120c2a797e8cb2b9fe011312b932fe8e83b6c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1647098738-0000B8A1-72B386E0/0/0 CLEAN NORMAL
X-TOI-MSGID: 1d717b66-e7a1-4264-b7ef-af206e339385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 15:25:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163091


Am 12.03.22 um 14:32 schrieb Richard Purdie:
> On Sat, 2022-03-12 at 08:30 +0100, Markus Volk wrote:
>> this fixes a build error about missing vapigen and enables vapi build
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   meta/recipes-gnome/librsvg/librsvg_2.52.5.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
>> index 1279c663f7..ede6454c2b 100644
>> --- a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
>> +++ b/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
>> @@ -14,7 +14,7 @@ SECTION = "x11/utils"
>>   DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
>>   BBCLASSEXTEND = "native"
>>   
>> -inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection rust
>> +inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection rust vala
>>   
>>   SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch \
>>              file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
>
> I'm curious whether we've just been missing some functionality in librsvg or
> whether the recent changes exposed some new error?
>
> Put another way, how did you see this when the autobuilder does not?
>
> Cheers,
>
> Richard
In any case, this adds functionality. For example, a real life issue for 
the lack of vapi in librsvg is that you can't build gnome-chess because 
it has a dependency on it.

The second question is a good one. Normally vala bindings should be 
optional in librsvg autotools buidsystem.

https://github.com/GNOME/librsvg/blob/c5d0eb679ee45377417bbf9ce2dabde0eb72802d/configure.ac#L293

I noticed similar behavior with some xfce recipes when I did an oe-core 
update a little over two weeks ago. I suddenly had build aborts due to 
missing vapigen, even though --enable-vala was not explicitly specified.

https://git.openembedded.org/meta-openembedded/diff/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb?h=master-next&id=26d9d0b627177f6f710c5d7b902d73b84ac14804

All recipes that were affected by this already had 'inherit 
gobject-introspection' added. vapi build is basically just 
gobject-introspection too, so this seems related somehow.
But why has this only been the case for two weeks? And why not with 
autobuilder? I really don't know.
I'll see if I can reproduce the vapi error in librsvg.

