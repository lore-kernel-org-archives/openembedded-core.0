Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D53CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 21:23:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1673.1759526575943869929
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 14:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OuxEbpSQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so20111035e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 14:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1759526574; x=1760131374; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HKYi8bAvxmyhSDUtW3Ruksy5KRGMleypcKhy4MOlOcE=;
        b=OuxEbpSQcfqiX9Hq9somViW+2HALUAtDXrkc+CgEl9vHx8KFlcZQdHFS2zGSOlT/3E
         NmbHEmqu1Rskh5hX7vhxSDI1hmrGD5MIbSD5cwfhoPzaOLTgsiVmkO6nDr3X6jtVB2F2
         TxXWXx4t7dp4pUUvVEHr6Sv7/C5rKwExolFfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759526574; x=1760131374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKYi8bAvxmyhSDUtW3Ruksy5KRGMleypcKhy4MOlOcE=;
        b=YDNFsySAcvC0OmFfuzUDiQcExBcK7yxD6fMct0mz4NijXGbR9PT8J5/cIpK0R/y7rl
         jZSApbwfh1aWEwVw/hACb3AenPtGK1fTDuDlLnEG6Qof0gZodeuzdoOLypUTHSbUd/kX
         r34YZZl/4KFc9eTZxXcnomGIOtBSceatRvDlU0HBHY20aw2+CgZNiSnrjxKMzCpqVv85
         VGpXl0rkMZgR8FPmybHBm6I145HsKrC8v6uQZfF6kLZgcz8bTK7MtxKWZRSkWOg/oqjt
         lcula9rQ44G8mnwp+KHmInG8Vk/ZReMKicqb1Fj8bZZaCu3SS+hYcFV8bSYZ1QmqVtz7
         X0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWorFM1lrxhXUEvVJOFSsitZGo8+Xg6JaHNvRiA1weaACgK8t+Fn+eNFxhabyEn+VJhdTKq5SIPzuxFRteV02ghg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzUve9yaj1MeOFA8poMaNEe1Q2q74C8b3UJAXqgM9EuAb0frjEN
	5pHZL/kLd9bDSMuRpWJ+v+N23+s+/4fZ8bvviWNKONBfporAR07hrV0xD8d5n1qjtio02ujk1xS
	JCQ9D92w8wJRb1QFed4iLvk6/qHAgeNlbVBRyQPlsvw==
X-Gm-Gg: ASbGncv6oO7i/26S0/ZECKhwf2TU8Ny2ozZPFhFuSigxpxjbKt4CILTOkvgl6FbKwjX
	mUwr3iRlwxtMZfyQWSbURHrGiTryXwP2/J/TyduqxpaqqBqfcK9WOAXEUlbjJIbbkDHNG5g8vBO
	nlfhzYxfYcCLYkruBj2DoxsmNGpalseP2gevrgcqZVHglJwcRijFUEO8TxfOR3ZBWFGujcIhXf7
	V0yTqe9g0RGXoig5AAwINfMoxnBppMDiE7/l9EV+EAHSXa66SjkESYaMzeHNsYG
X-Google-Smtp-Source: AGHT+IHBKX8/QdpJGLodgcqkSMQ1P2K9xxeKRyiiYWjRT05wgtg+6+01xQ5ndLXbxAqw2/EtlDKzI6IhqGCCclTC8e8=
X-Received: by 2002:a5d:584b:0:b0:3f3:97df:a2b9 with SMTP id
 ffacd0b85a97d-42566c4b958mr3419396f8f.24.1759526573991; Fri, 03 Oct 2025
 14:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250903144528.2248743-1-pierre-loup.gosse@smile.fr>
 <DD8SAYMI039W.2BNRYZDREQTNO@bootlin.com> <DD8SELHX4UAB.MPYI46KKMURF@bootlin.com>
In-Reply-To: <DD8SELHX4UAB.MPYI46KKMURF@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 3 Oct 2025 23:22:26 +0200
X-Gm-Features: AS18NWCtMC8rHECb6T0wSytYi2Je46Iv_FPUVlP-QBmqcu6TpVuZl11Opb7Am00
Message-ID: <CAMSfU+7H8SKAo3U2H5YOfNCx089xAP+L+NqYFriCbHpyGD0ajQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 1/2] wic: add --extra-partition-space option
 to set unused space
To: mathieu.dubois-briand@bootlin.com
Cc: pierre-loup.gosse@smile.fr, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006a80b6064047b42a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 21:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224425

--0000000000006a80b6064047b42a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 3 oct. 2025 =C3=A0 17:20, Mathieu Dubois-Briand via
lists.openembedded.org <mathieu.dubois-briand=3D
bootlin.com@lists.openembedded.org> a =C3=A9crit :

> On Fri Oct 3, 2025 at 5:15 PM CEST, Mathieu Dubois-Briand wrote:
> > On Wed Sep 3, 2025 at 4:45 PM CEST, pierre-loup.gosse wrote:
> >> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> >>
> >> By default, the content of the partition is filled by the filesystem
> >> without leaving any unused free space. The --extra-space flag adds
> >> extra space to the filesystem size, not to the partition.
> >>
> >> Unused free space after the filesystem can be useful for some cases,
> >> such as encrypting a partition at runtime.
> >> With --extra-partition-space 32M, we ensure that the last 32M of the
> >> partition is unused: this space does not contain filesystem data and
> >> can store the LUKS2 header.
> >>
> >> The implementation sets a difference between the partition and
> >> filesystem size:
> >>   - With --fixed-size, the extra part space is removed from the
> >>     filesystem size.
> >>   - Otherwise (with or without --size flag), the extra part space is
> >>     added to the partition size.
> >>
> >> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> >>
> >> CC: Alexander Kanavin <alex.kanavin@gmail.com>
> >> CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> >> ---
> >
> > Hi Pierre-Loup,
> >
> > Thanks for the new version.
> >
> >> +    def test_extra_partition_space(self):
> >> +        native_sysroot =3D get_bb_var("RECIPE_SYSROOT_NATIVE",
> "wic-tools")
> >> +
> >> +        with NamedTemporaryFile("w", suffix=3D".wks") as tempf:
> >> +            tempf.write("bootloader --ptable gpt\n" \
> >> +                        "part                 --ondisk hda --size 10M
>       --extra-partition-space 10M --fstype=3Dext4\n" \
> >> +                        "part                 --ondisk hda
> --fixed-size 20M  --extra-partition-space 10M --fstype=3Dext4\n" \
> >> +                        "part --source rootfs --ondisk hda
>        --extra-partition-space 10M --fstype=3Dext4\n" \
> >> +                        "part --source rootfs --ondisk hda
> --fixed-size 200M --extra-partition-space 10M --fstype=3Dext4\n")
> >> +            tempf.flush()
> >> +
> >> +            _, wicimg =3D self._get_wic(tempf.name)
> >> +
> >> +            res =3D runCmd("parted -m %s unit b p" % wicimg,
> >> +                            native_sysroot=3Dnative_sysroot,
> stderr=3Dsubprocess.PIPE)
> >> +
> >
> > This fails when "parted" is not installed on the host machine:
> >
> > 2025-10-03 13:42:20,053 - oe-selftest - INFO - 9: 73/93 615/639 (37.32s=
)
> (0 failed) (wic.Wic2.test_extra_partition_plugin)
> > 2025-10-03 13:42:20,053 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
> >   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selft=
est/cases/wic.py",
> line 1683, in test_extra_partition_plugin
> >     self.assertEqual('4', result.output, msg=3D"Expect 3 partitions, no=
t
> %s" % result.output)
> >   File "/usr/lib/python3.11/unittest/case.py", line 873, in assertEqual
> >     assertion_func(first, second, msg=3Dmsg)
> >   File "/usr/lib/python3.11/unittest/case.py", line 1253, in
> assertMultiLineEqual
> >     self.fail(self._formatMessage(msg, standardMsg))
> >   File "/usr/lib/python3.11/unittest/case.py", line 703, in fail
> >     raise self.failureException(msg)
> > AssertionError: '4' !=3D "ERROR: Can't find executable parted\n1"
> > - 4
> > + ERROR: Can't find executable parted
> > 1
> >  : Expect 3 partitions, not ERROR: Can't find executable parted
> > 1
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2456
> >
> > You can easily reproduce this on a test machine by removing parted from
> > the host. Also, test_wic_sector_size use parted but does not show the
> > same issue:
> >
> > oe-selftest -r wic.Wic.test_wic_sector_size
> > ...
> > 2025-10-03 15:05:58,051 - oe-selftest - INFO - RESULTS -
> wic.Wic.test_wic_sector_size: PASSED (94.37s)
> >
> > I believe this comes from the following line and the associated
> > try/finally block to revert to the default PATH variable:
> >
> > os.environ['PATH'] =3D get_bb_var("PATH", "wic-tools")
> >
> > Can you use something similar?
> >
> > Thanks,
> > Mathieu
>
> And now I see that this patch is merged and I'm replying to a mail sent
> a month ago... Sorry.
>
> Still, this will lead to intermittent failures, can you take a bit of
> time to send a fix?
>

Hi Mathieu,

Here are the fixes: (Since that was triggered on AB, I prefered to do it
quickly)
There are 2 patches.

First one, for master:
[PATCH 1/2] oeqa/selftest/wic: fix PATH for
wic.Wic2.test_extra_partition_space
https://lists.openembedded.org/g/openembedded-core/topic/patch_1_2/11557826=
8

Second one for master-next: (but it could be squashed with Pierre-Loup
patch)
[PATCH 2/2 master-next] oeqa/selftest/wic: fix PATH for
wic.Wic2.test_extra_partition_plugin
https://lists.openembedded.org/g/openembedded-core/topic/patch_2_2_master_n=
ext/115578271

Regards,


> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224397):
> https://lists.openembedded.org/g/openembedded-core/message/224397
> Mute This Topic: https://lists.openembedded.org/mt/115046314/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000006a80b6064047b42a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 3 =
oct. 2025 =C3=A0=C2=A017:20, Mathieu Dubois-Briand via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;mathieu.dubois-briand=
=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@lists.=
openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Fri Oct 3, 2025 at 5:15 PM CEST, Mathieu Du=
bois-Briand wrote:<br>
&gt; On Wed Sep 3, 2025 at 4:45 PM CEST, pierre-loup.gosse wrote:<br>
&gt;&gt; From: Pierre-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup.gosse@sm=
ile.fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; By default, the content of the partition is filled by the filesyst=
em<br>
&gt;&gt; without leaving any unused free space. The --extra-space flag adds=
<br>
&gt;&gt; extra space to the filesystem size, not to the partition.<br>
&gt;&gt;<br>
&gt;&gt; Unused free space after the filesystem can be useful for some case=
s,<br>
&gt;&gt; such as encrypting a partition at runtime.<br>
&gt;&gt; With --extra-partition-space 32M, we ensure that the last 32M of t=
he<br>
&gt;&gt; partition is unused: this space does not contain filesystem data a=
nd<br>
&gt;&gt; can store the LUKS2 header.<br>
&gt;&gt;<br>
&gt;&gt; The implementation sets a difference between the partition and<br>
&gt;&gt; filesystem size:<br>
&gt;&gt;=C2=A0 =C2=A0- With --fixed-size, the extra part space is removed f=
rom the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0filesystem size.<br>
&gt;&gt;=C2=A0 =C2=A0- Otherwise (with or without --size flag), the extra p=
art space is<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0added to the partition size.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Pierre-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup=
.gosse@smile.fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; CC: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; CC: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-bri=
and@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt=
;<br>
&gt;&gt; ---<br>
&gt;<br>
&gt; Hi Pierre-Loup,<br>
&gt;<br>
&gt; Thanks for the new version.<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 def test_extra_partition_space(self):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot =3D get_bb_var(&quot;R=
ECIPE_SYSROOT_NATIVE&quot;, &quot;wic-tools&quot;)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with NamedTemporaryFile(&quot;w&quot;=
, suffix=3D&quot;.wks&quot;) as tempf:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tempf.write(&quot;bootl=
oader --ptable gpt\n&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;part=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0--ondisk hda --size 10M=C2=A0 =C2=A0 =C2=A0 =C2=A0 --ex=
tra-partition-space 10M --fstype=3Dext4\n&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;part=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0--ondisk hda --fixed-size 20M=C2=A0 --extra-partition-s=
pace 10M --fstype=3Dext4\n&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;part --source rootfs --ondisk hda=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--extra-partition-sp=
ace 10M --fstype=3Dext4\n&quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;part --source rootfs --ondisk hda --fixed-size 2=
00M --extra-partition-space 10M --fstype=3Dext4\n&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tempf.flush()<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _, wicimg =3D self._get=
_wic(<a href=3D"http://tempf.name" rel=3D"noreferrer" target=3D"_blank">tem=
pf.name</a>)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D runCmd(&quot;pa=
rted -m %s unit b p&quot; % wicimg,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot=3Dnative_sysroot, stderr=
=3Dsubprocess.PIPE)<br>
&gt;&gt; +<br>
&gt;<br>
&gt; This fails when &quot;parted&quot; is not installed on the host machin=
e:<br>
&gt;<br>
&gt; 2025-10-03 13:42:20,053 - oe-selftest - INFO - 9: 73/93 615/639 (37.32=
s) (0 failed) (wic.Wic2.test_extra_partition_plugin)<br>
&gt; 2025-10-03 13:42:20,053 - oe-selftest - INFO - testtools.testresult.re=
al._StringException: Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/=
build/meta/lib/oeqa/selftest/cases/wic.py&quot;, line 1683, in test_extra_p=
artition_plugin<br>
&gt;=C2=A0 =C2=A0 =C2=A0self.assertEqual(&#39;4&#39;, result.output, msg=3D=
&quot;Expect 3 partitions, not %s&quot; % result.output)<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.11/unittest/case.py&quot;, lin=
e 873, in assertEqual<br>
&gt;=C2=A0 =C2=A0 =C2=A0assertion_func(first, second, msg=3Dmsg)<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.11/unittest/case.py&quot;, lin=
e 1253, in assertMultiLineEqual<br>
&gt;=C2=A0 =C2=A0 =C2=A0self.fail(self._formatMessage(msg, standardMsg))<br=
>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.11/unittest/case.py&quot;, lin=
e 703, in fail<br>
&gt;=C2=A0 =C2=A0 =C2=A0raise self.failureException(msg)<br>
&gt; AssertionError: &#39;4&#39; !=3D &quot;ERROR: Can&#39;t find executabl=
e parted\n1&quot;<br>
&gt; - 4<br>
&gt; + ERROR: Can&#39;t find executable parted<br>
&gt; 1<br>
&gt;=C2=A0 : Expect 3 partitions, not ERROR: Can&#39;t find executable part=
ed<br>
&gt; 1<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35=
/builds/2456" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/35/builds/2456</a><br>
&gt;<br>
&gt; You can easily reproduce this on a test machine by removing parted fro=
m<br>
&gt; the host. Also, test_wic_sector_size use parted but does not show the<=
br>
&gt; same issue:<br>
&gt;<br>
&gt; oe-selftest -r wic.Wic.test_wic_sector_size<br>
&gt; ...<br>
&gt; 2025-10-03 15:05:58,051 - oe-selftest - INFO - RESULTS - wic.Wic.test_=
wic_sector_size: PASSED (94.37s)<br>
&gt;<br>
&gt; I believe this comes from the following line and the associated<br>
&gt; try/finally block to revert to the default PATH variable:<br>
&gt;<br>
&gt; os.environ[&#39;PATH&#39;] =3D get_bb_var(&quot;PATH&quot;, &quot;wic-=
tools&quot;)<br>
&gt;<br>
&gt; Can you use something similar?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Mathieu<br>
<br>
And now I see that this patch is merged and I&#39;m replying to a mail sent=
<br>
a month ago... Sorry.<br>
<br>
Still, this will lead to intermittent failures, can you take a bit of<br>
time to send a fix?<br></blockquote><div><br></div><div>Hi Mathieu,</div><d=
iv><br></div><div>Here are the fixes: (Since that was triggered on AB, I pr=
efered to do it quickly)</div><div>There are 2 patches.</div><div><br></div=
><div>First one, for master:</div><div>[PATCH 1/2] oeqa/selftest/wic: fix P=
ATH for wic.Wic2.test_extra_partition_space<br><a href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/topic/patch_1_2/115578268">https://lists.=
openembedded.org/g/openembedded-core/topic/patch_1_2/115578268</a></div><di=
v><br></div><div>Second=C2=A0one for master-next: (but it could be squashed=
 with Pierre-Loup patch)<br>[PATCH 2/2 master-next] oeqa/selftest/wic: fix =
PATH for wic.Wic2.test_extra_partition_plugin<br><a href=3D"https://lists.o=
penembedded.org/g/openembedded-core/topic/patch_2_2_master_next/115578271">=
https://lists.openembedded.org/g/openembedded-core/topic/patch_2_2_master_n=
ext/115578271</a></div><div><br></div><div>Regards,</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224397): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224397" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/224397</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115046314/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115046314/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000006a80b6064047b42a--

