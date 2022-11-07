Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6303BC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:03:02 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.1901.1667847772457025580
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 11:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout09.t-online.de (Postfix) with SMTP id 815C11A9C6;
	Mon,  7 Nov 2022 20:02:49 +0100 (CET)
Received: from [192.168.178.122] ([79.219.226.160]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1os7OQ-195xz60; Mon, 7 Nov 2022 20:02:46 +0100
Date: Mon, 07 Nov 2022 20:02:41 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] webkitgtk: use libsoup-3.0 by default
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <HKRZKR.SA7XF70Y2R4I3@t-online.de>
In-Reply-To: 
	<CAMKF1sok84zeArjLdO5bTWUm=7h9DCv2eG2zz70uz=RT_b8SDw@mail.gmail.com>
References: <20221105164343.1328765-1-f_l_k@t-online.de>
	<CAMKF1sok84zeArjLdO5bTWUm=7h9DCv2eG2zz70uz=RT_b8SDw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-i+ewLm4iofY5r8OBjac5"
X-TOI-EXPURGATEID: 150726::1667847766-EFFE97E2-836AB7BD/0/0 CLEAN NORMAL
X-TOI-MSGID: 0f59d6e8-07e4-4927-9d98-8158163d02e5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 19:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172931

--=-i+ewLm4iofY5r8OBjac5
Content-Type: text/plain; charset=us-ascii; format=flowed

Fortunately, there are fewer problems than I feared. I will send 
patches for them.
minio seems to have a problem with position-independent-code. Maybe 
removing this line will help?
CGO_LDFLAGS:append:mips = " -no-pie"
But it doesn't look related to me either.

Am Mo, 7. Nov 2022 um 08:25:21 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> On Sat, Nov 5, 2022 at 9:44 AM Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  Some Gnome projects have stopped  supporting libsoup-2.4. 
>> Therefore, switch to libsoup-3.0.
>>  This would unblock the update of geary or gnome-online-accounts, 
>> which would otherwise
>>  fail like this:
>> 
>>  | Run-time dependency webkit2gtk-4.1 found: NO (tried pkgconfig)
>>  |
>>  | ../git/meson.build:70:0: ERROR: Dependency "webkit2gtk-4.1" not 
>> found, tried pkgconfig
>> 
> 
> There is also a break overved in some meta-oe packages see
> 
> <https://errors.yoctoproject.org/Errors/Build/154536/>
> Perhaps minio is not related but I have not looked too closely.
> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta/recipes-sato/webkit/webkitgtk_2.36.7.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>>  diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb 
>> b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
>>  index 76b119c9c7..f3e1adee70 100644
>>  --- a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
>>  +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
>>  @@ -43,7 +43,7 @@ DEPENDS = " \
>>             gstreamer1.0-plugins-base \
>>             "
>> 
>>  -PACKAGECONFIG_SOUP ?= "soup2"
>>  +PACKAGECONFIG_SOUP ?= "soup3"
>>   PACKAGECONFIG ??= "${@bb.utils.filter 
>> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd wayland 
>> x11', d)} \
>>                      ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11 opengl', 
>> 'webgl opengl', '', d)} \
>>                      ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', '', 'webgl 
>> gles2', d)} \
>>  --
>>  2.34.1
>> 
>> 
>> 
>> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172925): 
> <https://lists.openembedded.org/g/openembedded-core/message/172925>
> Mute This Topic: <https://lists.openembedded.org/mt/94829885/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-i+ewLm4iofY5r8OBjac5
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>Fortunately, there are fewer problems than I feared. I will send patches for them.</div><div>minio seems to have a problem with position-independent-code. Maybe removing this line will help?</div><div>CGO_LDFLAGS:append:mips = " -no-pie"</div><div>But it doesn't look related to me either.</div></div></div><div id="geary-quote" dir="auto"><br>Am Mo, 7. Nov 2022 um 08:25:21 -0800 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Sat, Nov 5, 2022 at 9:44 AM Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 Some Gnome projects have stopped  supporting libsoup-2.4. Therefore, switch to libsoup-3.0.
 This would unblock the update of geary or gnome-online-accounts, which would otherwise
 fail like this:

 | Run-time dependency webkit2gtk-4.1 found: NO (tried pkgconfig)
 |
 | ../git/meson.build:70:0: ERROR: Dependency "webkit2gtk-4.1" not found, tried pkgconfig

</blockquote>
There is also a break overved in some meta-oe packages see

<a href="https://errors.yoctoproject.org/Errors/Build/154536/">https://errors.yoctoproject.org/Errors/Build/154536/</a>
Perhaps minio is not related but I have not looked too closely.

<blockquote> Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  meta/recipes-sato/webkit/webkitgtk_2.36.7.bb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
 index 76b119c9c7..f3e1adee70 100644
 --- a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
 +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
 @@ -43,7 +43,7 @@ DEPENDS = " \
            gstreamer1.0-plugins-base \
            "

 -PACKAGECONFIG_SOUP ?= "soup2"
 +PACKAGECONFIG_SOUP ?= "soup3"
  PACKAGECONFIG ??= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd wayland x11', d)} \
                     <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
                     <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
 --
 2.34.1


 

</blockquote></div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#172925): <a href="https://lists.openembedded.org/g/openembedded-core/message/172925">https://lists.openembedded.org/g/openembedded-core/message/172925</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/94829885/3618223">https://lists.openembedded.org/mt/94829885/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-i+ewLm4iofY5r8OBjac5--


