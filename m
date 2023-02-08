Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450F6C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 17:39:10 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.4728.1675877942650828735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 09:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout09.t-online.de (Postfix) with SMTP id 85B6D16535;
	Wed,  8 Feb 2023 18:39:00 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.202]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pPoPI-1c5nk00; Wed, 8 Feb 2023 18:38:56 +0100
Date: Wed, 08 Feb 2023 18:38:51 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] wic-imager-direct.py: use fstab update also
 for root device
To: luca.ceresoli@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <ROVRPR.FB1N8ZXIZPRS1@t-online.de>
In-Reply-To: <20230208134950.6f1f1064@booty>
References: <20230207124456.6091-1-f_l_k@t-online.de>
	<20230208134950.6f1f1064@booty>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-pgtodb6Ijwb8ySf8AxL9"
X-TOI-EXPURGATEID: 150726::1675877936-40ABC378-01E391C3/0/0 CLEAN NORMAL
X-TOI-MSGID: 63f3c78b-15fa-4819-b658-ca0a29328a0c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 17:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176911

--=-pgtodb6Ijwb8ySf8AxL9
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello Luca,

unfortunately I still have a qemu issue if running this test but I had 
a look at the files it creates and the entry for the root partition in 
/etc/fstab looks like this:

 /dev/root            /                    auto       ro              1 
 0

Reasonable because it wants to check for read-only filesystem

if using the fstab-update this would be replaced by the default:

/dev/root	/	ext4	defaults	1	1

This is rw and i guess thats what makes the test fail.

Following this theory it should be a valid fix to just not use the 
fstab update here ?

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py 
b/meta/lib/oeqa/selftest/cases/overlayfs.py
index dfd9f1486d..9b1538a16b 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -438,6 +438,7 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
         configLower = """
 OVERLAYFS_ETC_EXPOSE_LOWER = "1"
 IMAGE_INSTALL:append = " overlayfs-user"
+WIC_CREATE_EXTRA_ARGS = "--no-fstab-update"
 """
         testFile = "lower-layer-test.txt"



Am Mi, 8. Feb 2023 um 13:49:50 +0100 schrieb Luca Ceresoli via 
lists.openembedded.org 
<luca.ceresoli=bootlin.com@lists.openembedded.org>:
> Hello Markus,
> 
> On Tue,  7 Feb 2023 13:44:56 +0100
> "Markus Volk" <f_l_k@t-online.de <mailto:f_l_k@t-online.de>> wrote:
> 
>>  wic imager is able to add entries for the partitions to fstab. This 
>> patch also
>>  creates an entry for the root device, which was previously ignored. 
>> The root
>>  device entry can now optionally be uuid or label based.
>> 
>>  The stock fstab file provided by base-files.bb already contains an 
>> entry for the
>>  root device. To avoid a duplicate entry in fstab, this  '/dev/root' 
>> line is removed
>>  during the fstab update.
>> 
>>  The default /dev/root entry in base-files adds the value '1' for 
>> dump and passno. Add an
>>  argument to set dump, which formerly has been hardcoded to '0'. 
>> Like this we can provide the
>>  same settings if using the fstab_update.
>> 
>>  The result looks something like this:
>> 
>>  proc /proc proc defaults 0 0
>>  devpts /dev/pts devpts mode=0620,ptmxmode=0666,gid=5 0 0
>>  tmpfs /run tmpfs mode=0755,nodev,nosuid,strictatime 0 0
>>  tmpfs /var/volatile tmpfs defaults 0 0
>> 
>>  UUID=055A-69B5 /boot vfat defaults 0 0
>>  UUID=0eb2df23-3638-4bbf-b045-9a425cb45954 / ext4 defaults 1 1
>> 
>>  If neither '--on-disk' nor '--use-label' nor '--use-uuid' are set 
>> in the wks file, wic falls
>>  back to '/dev/sda' as the default device entry, which may or may 
>> not be valid.
>>  Avoid starting to guess if we don't know anything and just skip the 
>> partition in that case,
>>  except for the root partition where we add back '/dev/root' as a 
>> reasonable default,
>>  because we can rely on it in the yocto/oe environment.
>> 
>>  The result is now like this:
>> 
>>  proc                 /proc                proc       defaults       
>>        0  0
>>  devpts               /dev/pts             devpts     
>> mode=0620,ptmxmode=0666,gid=5      0  0
>>  tmpfs                /run                 tmpfs      
>> mode=0755,nodev,nosuid,strictatime 0  0
>>  tmpfs                /var/volatile        tmpfs      defaults       
>>        0  0
>> 
>>  /dev/root	/	ext4	defaults	1	1
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
> 
> This patch is failing on the autobuilders:
> 
>   AssertionError: False is not true : /dev/sda2 on / type ext4 
> (rw,relatime)
> 
> and also this, even though I'm not sure how it relates to your 
> changes:
> 
>   AssertionError: None is not true : diff: can't stat 
> '/data/overlay-etc/lower/lower-layer-test.txt': No such file or 
> directory
> 
> Logs:
> 
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4780/steps/15/logs/stdio>
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4725/steps/14/logs/stdio>
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com <https://bootlin.com/>
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176905): 
> <https://lists.openembedded.org/g/openembedded-core/message/176905>
> Mute This Topic: <https://lists.openembedded.org/mt/96806003/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-pgtodb6Ijwb8ySf8AxL9
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Hello Luca,</div><div><br></div><d=
iv>unfortunately I still have a qemu issue if running this test but I had a=
 look at the files it creates and the entry for the root partition in /etc/=
fstab looks like this:</div><div><br></div><div>&nbsp;/dev/root &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;auto &nbsp; &nbsp; &nbsp; ro &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;1 &nbsp;0</div><div><br></div><div>Reasonable b=
ecause it wants to check for read-only filesystem</div><div><br></div><div>=
if using the fstab-update this would be replaced by the default:</div><div>=
<br></div><div><span style=3D"white-space: break-spaces;">/dev/root	/	ext4	=
defaults	1	1</span></div><div><span style=3D"white-space: break-spaces;"><b=
r></span></div><div><span style=3D"white-space: break-spaces;">This is rw a=
nd i guess thats what makes the test fail.</span></div><div><span style=3D"=
white-space: break-spaces;"><br></span></div><div><span style=3D"white-spac=
e: break-spaces;">Following this theory it should be a valid fix to just no=
t use the fstab update here ?</span></div><div><span style=3D"white-space: =
break-spaces;"><br></span></div><div><span style=3D"white-space: break-spac=
es;">diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa=
/selftest/cases/overlayfs.py</span></div><div><span style=3D"white-space: b=
reak-spaces;">index dfd9f1486d..9b1538a16b 100644</span></div><div><span st=
yle=3D"white-space: break-spaces;">--- a/meta/lib/oeqa/selftest/cases/overl=
ayfs.py</span></div><div><span style=3D"white-space: break-spaces;">+++ b/m=
eta/lib/oeqa/selftest/cases/overlayfs.py</span></div><div><span style=3D"wh=
ite-space: break-spaces;">@@ -438,6 +438,7 @@ OVERLAYFS_ETC_DEVICE =3D "/de=
v/sda3"</span></div><div><span style=3D"white-space: break-spaces;">       =
  configLower =3D """</span></div><div><span style=3D"white-space: break-sp=
aces;"> OVERLAYFS_ETC_EXPOSE_LOWER =3D "1"</span></div><div><span style=3D"=
white-space: break-spaces;"> IMAGE_INSTALL:append =3D " overlayfs-user"</sp=
an></div><div><span style=3D"white-space: break-spaces;">+WIC_CREATE_EXTRA_=
ARGS =3D "--no-fstab-update"</span></div><div><span style=3D"white-space: b=
reak-spaces;"> """</span></div><div><span style=3D"white-space: break-space=
s;">         testFile =3D "lower-layer-test.txt"</span></div><div><span sty=
le=3D"white-space: break-spaces;"> </span></div><div><span style=3D"white-s=
pace: break-spaces;"><br></span></div></div><div id=3D"geary-quote" dir=3D"=
auto"><br>Am Mi, 8. Feb 2023 um 13:49:50 +0100 schrieb Luca Ceresoli via li=
sts.openembedded.org &lt;luca.ceresoli=3Dbootlin.com@lists.openembedded.org=
&gt;:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-=
space: break-spaces;">Hello Markus,

On Tue,  7 Feb 2023 13:44:56 +0100
"Markus Volk" &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a=
>&gt; wrote:

<blockquote> wic imager is able to add entries for the partitions to fstab.=
 This patch also
 creates an entry for the root device, which was previously ignored. The ro=
ot
 device entry can now optionally be uuid or label based.
=20
 The stock fstab file provided by base-files.bb already contains an entry f=
or the
 root device. To avoid a duplicate entry in fstab, this  '/dev/root' line i=
s removed
 during the fstab update.
=20
 The default /dev/root entry in base-files adds the value '1' for dump and =
passno. Add an
 argument to set dump, which formerly has been hardcoded to '0'. Like this =
we can provide the
 same settings if using the fstab_update.
=20
 The result looks something like this:
=20
 proc /proc proc defaults 0 0
 devpts /dev/pts devpts mode=3D0620,ptmxmode=3D0666,gid=3D5 0 0
 tmpfs /run tmpfs mode=3D0755,nodev,nosuid,strictatime 0 0
 tmpfs /var/volatile tmpfs defaults 0 0
=20
 UUID=3D055A-69B5 /boot vfat defaults 0 0
 UUID=3D0eb2df23-3638-4bbf-b045-9a425cb45954 / ext4 defaults 1 1
=20
 If neither '--on-disk' nor '--use-label' nor '--use-uuid' are set in the w=
ks file, wic falls
 back to '/dev/sda' as the default device entry, which may or may not be va=
lid.
 Avoid starting to guess if we don't know anything and just skip the partit=
ion in that case,
 except for the root partition where we add back '/dev/root' as a reasonabl=
e default,
 because we can rely on it in the yocto/oe environment.
=20
 The result is now like this:
=20
 proc                 /proc                proc       defaults             =
 0  0
 devpts               /dev/pts             devpts     mode=3D0620,ptmxmode=
=3D0666,gid=3D5      0  0
 tmpfs                /run                 tmpfs      mode=3D0755,nodev,nos=
uid,strictatime 0  0
 tmpfs                /var/volatile        tmpfs      defaults             =
 0  0
=20
 /dev/root	/	ext4	defaults	1	1
=20
 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
</blockquote>
This patch is failing on the autobuilders:

  AssertionError: False is not true : /dev/sda2 on / type ext4 (rw,relatime=
)

and also this, even though I'm not sure how it relates to your changes:

  AssertionError: None is not true : diff: can't stat '/data/overlay-etc/lo=
wer/lower-layer-test.txt': No such file or directory

Logs:

<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/4780/steps/15/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/79/builds/4780/steps/15/logs/stdio</a>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/4725/steps/14/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/80/builds/4725/steps/14/logs/stdio</a>

<div>--=20
</div>Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
<a href=3D"https://bootlin.com">https://bootlin.com</a>
</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#176905): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176905">https://lists.openembedded.org/g/openembedd=
ed-core/message/176905</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96806003/3618=
223">https://lists.openembedded.org/mt/96806003/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-pgtodb6Ijwb8ySf8AxL9--


