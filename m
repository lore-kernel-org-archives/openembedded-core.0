Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 25CEC6AF46
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 02:23:53 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id s9so914845iec.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2013 19:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/7Ea04F7uhPaGz1kR85O369rqoiXqyAai2on2FM/A78=;
	b=sqUAyjG+ZfUyfmRkOJVttKZUc7n+vgkdFElKwbp3W0pXIKSsBxq0DgYEPxHKZU9LtB
	QMmNp7szh1FlAWWQPnP3r1wKzeZQZ/ZM1jyc61C+IOZEnek9BJQnAy31PsINYhDkUSAg
	B8299aA/rbajABFeWpQnXQOknPH0lWeVYrVuBabkGFb/Nr1VCR8eSZzOXQLdCKtqHjfS
	LDJ+GVs3RdKE8suBeyhLFNiaBny5xRtveUfIGiWZRGBTSrjqkY/6cQa+einY0I3qS5Zn
	55xpSRYWWyHgf3o8sCMgJmOntnF6GLqNFz9A+7zWR+mMIGqVR4/Zs0XTYuz1LGBslpCM
	s0mw==
MIME-Version: 1.0
X-Received: by 10.50.3.42 with SMTP id 10mr1078027igz.39.1375928633327; Wed,
	07 Aug 2013 19:23:53 -0700 (PDT)
Received: by 10.50.216.137 with HTTP; Wed, 7 Aug 2013 19:23:53 -0700 (PDT)
In-Reply-To: <5202FE14.70101@windriver.com>
References: <cover.1375862591.git.Qi.Chen@windriver.com>
	<3ea48b1c837fd67e81f367ff6943cae9f7fbeb33.1375862591.git.Qi.Chen@windriver.com>
	<CABcZAN=kKF1cLeCR+SMenSBG2bRxVd==GR727XN-h72FW2ZT2w@mail.gmail.com>
	<5202FE14.70101@windriver.com>
Date: Wed, 7 Aug 2013 19:23:53 -0700
Message-ID: <CAMKF1sqwzMQb5W2+2VdASiDi2J+R_9gNWAFU0dAftqBtTgVipA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Chris Larson <clarson@kergoth.com>, "chen_q07@163.com" <chen_q07@163.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 09/10] irda-utils: fix for read-only rootfs
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
X-List-Received-Date: Thu, 08 Aug 2013 02:23:53 -0000
Content-Type: multipart/alternative; boundary=089e013c6a726d0af804e36659bc

--089e013c6a726d0af804e36659bc
Content-Type: text/plain; charset=UTF-8

On Wednesday, August 7, 2013, ChenQi <Qi.Chen@windriver.com> wrote:
> On 08/07/2013 10:18 PM, Chris Larson wrote:
>
> On Wed, Aug 7, 2013 at 1:08 AM, <Qi.Chen@windriver.com> wrote:
>>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> The init script for irda writes configuration items to
/etc/sysconfig/irda
>> if that file is not available in system. But it's actually not necessary,
>> the behavior doesn't change whether the init script writes to the file
or not.
>>
>> Considering it issues error messages in case of a read-only rootfs, I
delete
>> the writing process.
>>
>> [YOCTO #4103]
>> [YOCTO #4886]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>
> This is a start, but is incomplete, from what I can tell. As mentioned in
the other thread, the startup script shouldn't be using /etc/sysconfig/ at
all, in any form. We use /etc/default/ for our startup script config files,
not /etc/sysconfig/.
>
> Yeah, I agree with you.
> But when I checked the irda source code, I saw that it actually could
ship its own init script (irda-utils-xxx/etc/irda.rc). And I think our init
script is derived from this one. In its own init script, /etc/sysconfig is
used.
> (Of course, I still think /etc/default is a better location for its
configuration file.)
>
>
> Also, the purpose of this block was clearly to implement a default
configuration, yet the recipe isn't altered to ship a default configuration
to provide equivalent functionality.
>
> In its source code, there's a default configuration file, and we don't
use that. I think there might be a reason.
> So I'm not sure about this one.
>
> If you have a patch to fix the irda issue properly, send it out and I'll
rebase my remote branch and drop this one.

Whether Chris has a patch or not this patch in its form should be dropped
since there is a better way to do it

>
> Best Regards,
> Chen Qi
>
>
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>

--089e013c6a726d0af804e36659bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, August 7, 2013, ChenQi &lt;<a href=3D"mailto:Qi.Chen@=
windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br>&gt; On 08/07/2013 1=
0:18 PM, Chris Larson wrote:<br>&gt;<br>&gt; On Wed, Aug 7, 2013 at 1:08 AM=
, &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt=
; wrote:<br>
&gt;&gt;<br>&gt;&gt; From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.=
com">Qi.Chen@windriver.com</a>&gt;<br>&gt;&gt;<br>&gt;&gt; The init script =
for irda writes configuration items to /etc/sysconfig/irda<br>&gt;&gt; if t=
hat file is not available in system. But it&#39;s actually not necessary,<b=
r>
&gt;&gt; the behavior doesn&#39;t change whether the init script writes to =
the file or not.<br>&gt;&gt;<br>&gt;&gt; Considering it issues error messag=
es in case of a read-only rootfs, I delete<br>&gt;&gt; the writing process.=
<br>
&gt;&gt;<br>&gt;&gt; [YOCTO #4103]<br>&gt;&gt; [YOCTO #4886]<br>&gt;&gt;<br=
>&gt;&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.co=
m">Qi.Chen@windriver.com</a>&gt;<br>&gt;<br>&gt; This is a start, but is in=
complete, from what I can tell. As mentioned in the other thread, the start=
up script shouldn&#39;t be using /etc/sysconfig/ at all, in any form. We us=
e /etc/default/ for our startup script config files, not /etc/sysconfig/.<b=
r>
&gt;<br>&gt; Yeah, I agree with you.<br>&gt; But when I checked the irda so=
urce code, I saw that it actually could ship its own init script (irda-util=
s-xxx/etc/irda.rc). And I think our init script is derived from this one. I=
n its own init script, /etc/sysconfig is used.<br>
&gt; (Of course, I still think /etc/default is a better location for its co=
nfiguration file.)<br>&gt;<br>&gt;<br>&gt; Also, the purpose of this block =
was clearly to implement a default configuration, yet the recipe isn&#39;t =
altered to ship a default configuration to provide equivalent functionality=
.<br>
&gt;<br>&gt; In its source code, there&#39;s a default configuration file, =
and we don&#39;t use that. I think there might be a reason.<br>&gt; So I&#3=
9;m not sure about this one.<br>&gt;<br>&gt; If you have a patch to fix the=
 irda issue properly, send it out and I&#39;ll rebase my remote branch and =
drop this one.<br>
<br>Whether Chris has a patch or not this patch in its form should be dropp=
ed since there is a better way to do it<br><br>&gt;<br>&gt; Best Regards,<b=
r>&gt; Chen Qi<br>&gt;<br>&gt;<br>&gt; --<br>&gt; Christopher Larson<br>
&gt; clarson at kergoth dot com<br>&gt; Founder - BitBake, OpenEmbedded, Op=
enZaurus<br>&gt; Maintainer - Tslib<br>&gt; Senior Software Engineer, Mento=
r Graphics<br>&gt;

--089e013c6a726d0af804e36659bc--
