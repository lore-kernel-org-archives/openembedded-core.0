Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1C4C19F2B
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 17:04:31 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web08.22532.1658941463411583302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 10:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id 5AB0A3C9B;
	Wed, 27 Jul 2022 19:04:21 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.44.9]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oGkSK-3PBHiy0; Wed, 27 Jul 2022 19:04:21 +0200
Date: Wed, 27 Jul 2022 19:04:15 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [meta-oe][PATCH] wic/direct.py: ignore root mountpoint
 in fstab updater
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <3FVOFR.R0ZY9H7K1WKY1@t-online.de>
In-Reply-To: <1705BCB17DD12169.1380@lists.openembedded.org>
References: <20220727134512.4033-1-f_l_k@t-online.de>
	<A08B6BB6-EFD1-425D-AC02-457EF8A40229@arm.com>
	<1705BCB17DD12169.1380@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-O8SlnrN2xRnOluGbDDN1"
X-TOI-EXPURGATEID: 150726::1658941461-014551EF-F19CB7D1/0/0 CLEAN NORMAL
X-TOI-MSGID: 7060902c-2a90-4e11-984b-cc1f8fc9ae92
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 17:04:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168581

--=-O8SlnrN2xRnOluGbDDN1
Content-Type: text/plain; charset=us-ascii; format=flowed

But looking at the commit that introduced the problem, I see that it 
completely undoes it.
In general, I like the idea of having the fstab_updater create the root 
entry, but for this to work without duplication, the /dev/root entry 
would have to be removed from fstab.
This would force any wic image to use the fstab_updater (which can also 
be disabled) and would otherwise result in an fstab file with no root 
entry.
Probably removing the /dev/root entry would also break the boot of 
images that do not use wic

Translated with www.DeepL.com/Translator (free version)

Am Mi, 27. Jul 2022 um 18:31:38 +0200 schrieb Markus Volk 
<f_l_k@t-online.de>:
> Yes. With the patch the warning disappears from dmesg
> 
> Am Mi, 27. Jul 2022 um 15:44:48 +0000 schrieb Ross Burton 
> <ross.burton@arm.com>:
>> This looks like a fix for 
>> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=14865>, can you 
>> confirm that?
>> 
>> Ross
>> 
>>>  On 27 Jul 2022, at 14:45, Markus Volk via lists.openembedded.org 
>>> <f_l_k=t-online.de@lists.openembedded.org 
>>> <mailto:f_l_k=t-online.de@lists.openembedded.org>> wrote:
>>> 
>>>  We already have a root entry in fstab. This commit prevents 
>>> processing root
>>>  mountpoint in fstab_updater and thus avoids duplicate entries for 
>>> root in fstab.
>>> 
>>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>>> <mailto:f_l_k@t-online.de>>
>>>  ---
>>>  scripts/lib/wic/plugins/imager/direct.py | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>> 
>>>  diff --git a/scripts/lib/wic/plugins/imager/direct.py 
>>> b/scripts/lib/wic/plugins/imager/direct.py
>>>  index c44159b235..75004ab320 100644
>>>  --- a/scripts/lib/wic/plugins/imager/direct.py
>>>  +++ b/scripts/lib/wic/plugins/imager/direct.py
>>>  @@ -117,7 +117,8 @@ class DirectPlugin(ImagerPlugin):
>>>          updated = False
>>>          for part in self.parts:
>>>              if not part.realnum or not part.mountpoint \
>>>  -               or not part.mountpoint.startswith('/'):
>>>  +               or not part.mountpoint.startswith('/') \
>>>  +               or part.mountpoint == "/":
>>>                  continue
>>> 
>>>              if part.use_uuid:
>>>  --
>>>  2.34.1
>>> 
>>> 
>>> 
>>> 
>> 
>> 
>> 
>> 


--=-O8SlnrN2xRnOluGbDDN1
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>But looking at the commit that int=
roduced the problem, I see that it completely undoes it.</div><div>In gener=
al, I like the idea of having the fstab_updater create the root entry, but =
for this to work without duplication, the /dev/root entry would have to be =
removed from fstab.</div><div>This would force any wic image to use the fst=
ab_updater (which can also be disabled) and would otherwise result in an fs=
tab file with no root entry.</div><div>Probably removing the /dev/root entr=
y would also break the boot of images that do not use wic</div><div><br></d=
iv><div>Translated with www.DeepL.com/Translator (free version)</div></div>=
<div id=3D"geary-quote" dir=3D"auto"><br>Am Mi, 27. Jul 2022 um 18:31:38 +0=
200 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type=3D"c=
ite"><div id=3D"geary-body" dir=3D"auto"><div>Yes. With the patch the warni=
ng disappears from dmesg</div></div><div id=3D"geary-quote" dir=3D"auto"><b=
r>Am Mi, 27. Jul 2022 um 15:44:48 +0000 schrieb Ross Burton &lt;ross.burton=
@arm.com&gt;:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=
=3D"white-space: break-spaces;">This looks like a fix for <a href=3D"https:=
//bugzilla.yoctoproject.org/show_bug.cgi?id=3D14865">https://bugzilla.yocto=
project.org/show_bug.cgi?id=3D14865</a>, can you confirm that?

Ross

<blockquote> On 27 Jul 2022, at 14:45, Markus Volk via lists.openembedded.o=
rg &lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=
=3Dt-online.de@lists.openembedded.org</a>&gt; wrote:
=20
 We already have a root entry in fstab. This commit prevents processing roo=
t
 mountpoint in fstab_updater and thus avoids duplicate entries for root in =
fstab.
=20
 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
 scripts/lib/wic/plugins/imager/direct.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/pl=
ugins/imager/direct.py
 index c44159b235..75004ab320 100644
 --- a/scripts/lib/wic/plugins/imager/direct.py
 +++ b/scripts/lib/wic/plugins/imager/direct.py
 @@ -117,7 +117,8 @@ class DirectPlugin(ImagerPlugin):
         updated =3D False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
 -               or not part.mountpoint.startswith('/'):
 +               or not part.mountpoint.startswith('/') \
 +               or part.mountpoint =3D=3D "/":
                 continue
=20
             if part.use_uuid:
 --=20
 2.34.1
=20
=20
=20
=20
</blockquote>
</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">


</div></blockquote></div>
</blockquote></div>
--=-O8SlnrN2xRnOluGbDDN1--


