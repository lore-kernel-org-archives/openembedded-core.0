Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0E17B6AF22;
	Mon,  1 Jul 2013 07:33:46 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id k14so3394471wgh.17
	for <multiple recipients>; Mon, 01 Jul 2013 00:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bf8RvJ8QodoRa5K5J4BaYUMpkXSAh8+1m8Gwj8ihiKA=;
	b=a3YIeIAM673AGxzwnl5Jt206UFixroTAmQCaoeVeM7mnA5/cm60dWS1KF1vkvICTqB
	EcYTVBrb2e4suBRBqCT1Hj0yW1YC9A4KWzVeMyEptNPLUmkmCXyW4mcnE65KzgyYnVAp
	PxHABMT6lfCsZB5ySOXGzLwh+TtAOnBrLfIMb7XRzUL7RkvqY+Ors8rWKU+RVYWCOqiu
	GtFQRUc5hbthokhhMNuIb4lYZAZohWXK/lw39e8HzIcaa/SnBEPAlY8jzZ9NZnwAZUiv
	caYBu9STcn+MkCJ1uZnruMmmsC2ozcJok8R2yxkocYDeyTtFOm2rVYdHsb9TxvDyKcFm
	sZEg==
MIME-Version: 1.0
X-Received: by 10.194.20.193 with SMTP id p1mr17369443wje.65.1372664027430;
	Mon, 01 Jul 2013 00:33:47 -0700 (PDT)
Received: by 10.194.16.136 with HTTP; Mon, 1 Jul 2013 00:33:47 -0700 (PDT)
In-Reply-To: <51D0E5EC.3050903@windriver.com>
References: <20130625163758.7F04650176@opal> <20130628115633.GL3261@jama>
	<51D0E5EC.3050903@windriver.com>
Date: Mon, 1 Jul 2013 09:33:47 +0200
Message-ID: <CA+chaQcMRE9HZ_pv4YLKEjvYfa2HBFTYL+Tvg6CAWSWnULtRMQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Chen Qi : busybox: add the ability to split the busybox binary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Jul 2013 07:33:48 -0000
Content-Type: multipart/alternative; boundary=047d7b5d8731c046ee04e06e3f22

--047d7b5d8731c046ee04e06e3f22
Content-Type: text/plain; charset=UTF-8

Hi Chen,

1) install image created before this change on target device (which doesn't
include coreutils, wget and is depending on usable busybox)
2) build feeds which include this change
3) run  "opkg update && opkg upgrade" on target device (or equivalent in
your favorite package manager)
4) you'll get unusable (and probably unbootable) system at this point,
because /bin/busybox binary from old busybox version was already removed,
but u-a symlinks to new /bin/busybox.(no)suid weren't created because "sed"
used in u-a doesn't work anymore.

As work around I've used
ln -s /bin/busybox.nosuid /bin/busybox
to make old u-a links happy and able to finish postinst in new busybox
version.

FWIW: having /bin/busybox -> busybox.nosuid sounds like good idea to have
"default" busybox in path for people who're running it directly.

Regards,


On Mon, Jul 1, 2013 at 4:14 AM, ChenQi <Qi.Chen@windriver.com> wrote:

> On 06/28/2013 07:56 PM, Martin Jansa wrote:
>
>> On Tue, Jun 25, 2013 at 04:37:58PM +0000, git@git.openembedded.org wrote:
>>
>>> Module: openembedded-core.git
>>> Branch: master
>>> Commit: e5a1442819dfb74e86a6f69da008ba**6908c8bbc7
>>> URL:    http://git.openembedded.org/?**p=openembedded-core.git&a=**
>>> commit;h=**e5a1442819dfb74e86a6f69da008ba**6908c8bbc7<http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=e5a1442819dfb74e86a6f69da008ba6908c8bbc7>
>>>
>>> Author: Chen Qi <Qi.Chen@windriver.com>
>>> Date:   Mon Jun 17 12:47:20 2013 +0800
>>>
>>> busybox: add the ability to split the busybox binary
>>>
>>> This patch enables us to split the busybox into two binaries, one
>>> containing suid applications, and the other containing nosuid apps.
>>>
>>> Add a variable, BUSYBOX_SPLIT_SUID, to control whether to split the
>>> busybox binary into two parts. We default it to "1" to enable the
>>> splitting, but users could still override it to disable the splitting.
>>> After all, busybox has no internal support for this suid apps splitting,
>>> so there might be users out there who want just one busybox binary.
>>>
>>> The basic idea here is to build the busybox twice, each with the correct
>>> configuration items. We extract the non-app part of the original .config
>>> file, and merge this part with the suid-app part to form a .config which
>>> contains only suid apps. The same strategy applies to the non-suid apps.
>>>
>> Hi,
>>
>> have you tried to do on-device upgrade with this change?
>> It looks very broken, description follows:
>>
>> 13:48:33 < JaMa> was sed applet removed from busybox or something like
>> that? upgrade path seems to be broken
>> 13:48:34 < JaMa> Configuring busybox-syslog.
>> 13:48:34 < JaMa> /usr/bin/update-alternatives: line 186: sed: not found
>> 13:48:58 < JaMa> and then all applets in main busybox package fail to set
>> u-a because of missing sed..
>> 13:49:27 < JaMa> and then fixing that is more complicated because wget
>> symlink is gone too, so opkg update opkg upgrade wont work
>> 13:49:40 < zecke> JaMa: IIRC the specific postinst was removed from
>> busybox?!
>> 13:50:55 < JaMa> /var/lib/opkg/info/busybox.**postinst is still there
>> 13:51:02 < JaMa> with a lot of u-a calls
>> 13:51:34 < zecke> JaMa: generated by the bbclass and not the one that was
>> in the busybox.inc (but i only read the digest and skip stuff)
>> 13:51:37 < JaMa> that commit says it removes redundant u-a
>> 13:52:11 < JaMa> SHR root@gjama ~ $ grep sed /var/lib/opkg/info/busybox.*
>> *postinst   update-alternatives --install /bin/sed sed
>> /bin/busybox.nosuid 50
>> 13:52:23 < zecke> JaMa: Do you know if they/he tested on device upgrade?
>> 13:52:56 < zecke> i am obviously just guessing
>> 13:54:05 < JaMa> all u-a are still pointing to /bin/busybox, but that one
>> is gone replaced by /bin/busybox.(no)suid
>> 13:54:44 < JaMa> we should install /bin/busybox -> /bin/busybox.nosuid to
>> fix upgrade path..
>>
> Hi Martin,
>
> Could you please provide me more information about how to reproduce this
> problem?
>
> Thanks,
> Chen Qi
>

--047d7b5d8731c046ee04e06e3f22
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Chen,<div><br></div><div>1) install image created befor=
e this change on target device (which doesn&#39;t include coreutils, wget a=
nd is depending on usable busybox)</div><div>2) build feeds which include t=
his change</div>
<div>3) run =C2=A0&quot;opkg update &amp;&amp; opkg upgrade&quot; on target=
 device (or equivalent in your favorite package manager)</div><div>4) you&#=
39;ll get unusable (and probably unbootable) system at this point, because =
/bin/busybox binary from old busybox version was already removed, but u-a s=
ymlinks to new /bin/busybox.(no)suid weren&#39;t created because &quot;sed&=
quot; used in u-a doesn&#39;t work anymore.</div>
<div><br></div><div>As work around I&#39;ve used</div><div>ln -s /bin/busyb=
ox.nosuid /bin/busybox</div><div>to make old u-a links happy and able to fi=
nish postinst in new busybox version.</div><div><br></div><div>FWIW: having=
 /bin/busybox -&gt; busybox.nosuid sounds like good idea to have &quot;defa=
ult&quot; busybox in path for people who&#39;re running it directly.</div>
<div><br></div><div>Regards,</div></div><div class=3D"gmail_extra"><br><br>=
<div class=3D"gmail_quote">On Mon, Jul 1, 2013 at 4:14 AM, ChenQi <span dir=
=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.=
Chen@windriver.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 0=
6/28/2013 07:56 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Tue, Jun 25, 2013 at 04:37:58PM +0000, <a href=3D"mailto:git@git.openemb=
edded.org" target=3D"_blank">git@git.openembedded.org</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Module: openembedded-core.git<br>
Branch: master<br>
Commit: e5a1442819dfb74e86a6f69da008ba<u></u>6908c8bbc7<br>
URL: =C2=A0 =C2=A0<a href=3D"http://git.openembedded.org/?p=3Dopenembedded-=
core.git&amp;a=3Dcommit;h=3De5a1442819dfb74e86a6f69da008ba6908c8bbc7" targe=
t=3D"_blank">http://git.openembedded.org/?<u></u>p=3Dopenembedded-core.git&=
amp;a=3D<u></u>commit;h=3D<u></u>e5a1442819dfb74e86a6f69da008ba<u></u>6908c=
8bbc7</a><br>

<br>
Author: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_bla=
nk">Qi.Chen@windriver.com</a>&gt;<br>
Date: =C2=A0 Mon Jun 17 12:47:20 2013 +0800<br>
<br>
busybox: add the ability to split the busybox binary<br>
<br>
This patch enables us to split the busybox into two binaries, one<br>
containing suid applications, and the other containing nosuid apps.<br>
<br>
Add a variable, BUSYBOX_SPLIT_SUID, to control whether to split the<br>
busybox binary into two parts. We default it to &quot;1&quot; to enable the=
<br>
splitting, but users could still override it to disable the splitting.<br>
After all, busybox has no internal support for this suid apps splitting,<br=
>
so there might be users out there who want just one busybox binary.<br>
<br>
The basic idea here is to build the busybox twice, each with the correct<br=
>
configuration items. We extract the non-app part of the original .config<br=
>
file, and merge this part with the suid-app part to form a .config which<br=
>
contains only suid apps. The same strategy applies to the non-suid apps.<br=
>
</blockquote>
Hi,<br>
<br>
have you tried to do on-device upgrade with this change?<br>
It looks very broken, description follows:<br>
<br>
13:48:33 &lt; JaMa&gt; was sed applet removed from busybox or something lik=
e that? upgrade path seems to be broken<br>
13:48:34 &lt; JaMa&gt; Configuring busybox-syslog.<br>
13:48:34 &lt; JaMa&gt; /usr/bin/update-alternatives: line 186: sed: not fou=
nd<br>
13:48:58 &lt; JaMa&gt; and then all applets in main busybox package fail to=
 set u-a because of missing sed..<br>
13:49:27 &lt; JaMa&gt; and then fixing that is more complicated because wge=
t symlink is gone too, so opkg update opkg upgrade wont work<br>
13:49:40 &lt; zecke&gt; JaMa: IIRC the specific postinst was removed from b=
usybox?!<br>
13:50:55 &lt; JaMa&gt; /var/lib/opkg/info/busybox.<u></u>postinst is still =
there<br>
13:51:02 &lt; JaMa&gt; with a lot of u-a calls<br>
13:51:34 &lt; zecke&gt; JaMa: generated by the bbclass and not the one that=
 was in the busybox.inc (but i only read the digest and skip stuff)<br>
13:51:37 &lt; JaMa&gt; that commit says it removes redundant u-a<br>
13:52:11 &lt; JaMa&gt; SHR root@gjama ~ $ grep sed /var/lib/opkg/info/busyb=
ox.<u></u>postinst =C2=A0 update-alternatives --install /bin/sed sed /bin/b=
usybox.nosuid 50<br>
13:52:23 &lt; zecke&gt; JaMa: Do you know if they/he tested on device upgra=
de?<br>
13:52:56 &lt; zecke&gt; i am obviously just guessing<br>
13:54:05 &lt; JaMa&gt; all u-a are still pointing to /bin/busybox, but that=
 one is gone replaced by /bin/busybox.(no)suid<br>
13:54:44 &lt; JaMa&gt; we should install /bin/busybox -&gt; /bin/busybox.no=
suid to fix upgrade path..<br>
</blockquote></div></div>
Hi Martin,<br>
<br>
Could you please provide me more information about how to reproduce this pr=
oblem?<br>
<br>
Thanks,<br>
Chen Qi<br>
</blockquote></div><br></div>

--047d7b5d8731c046ee04e06e3f22--
