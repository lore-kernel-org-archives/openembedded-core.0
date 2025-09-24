Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3E4CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 21:34:51 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web10.17927.1758729878100774450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 09:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m61Qie2k;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: dani.barra25@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8e0c90cac25so4068794241.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729877; x=1759334677; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iJVvK4eMgMoYdAFfBmUho2EuYRoc1OtlN6NDGDdS2IE=;
        b=m61Qie2kWFR1jU4e3J8dYBA7QYMhDJDRoGXTTqFuSBwvfOqGCsXxSuqqmLeA/nQ62u
         Zel+gFsn2phQ64iDK+hQntEEX4jHJFzbBl49FEil+X0u9V99hpDy/8p6ZpNOX0m+1JnP
         xYXxEx1KSmIMdIouObHCOwUcrtBxviUh66jnCWQsTo5QPuM0QPSDcK9Bn85ffNkn5h+k
         pE8ZTqU1Sf4DgDVRuXwkcu8LXqQ3T1EV5B62BPuqgOGfOwf0/bhscDdkC8ih2K9q93bz
         lECgkeP7v326Cqg/HeWWO2qVE8hDDP6PQgcUkP4nb9yuw9JyhjUJOIZUg9bvftexlZYB
         bTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729877; x=1759334677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJVvK4eMgMoYdAFfBmUho2EuYRoc1OtlN6NDGDdS2IE=;
        b=SsD6XL5/VmPnWUT7XC3axIcKd+wW8+BlDG4aESDPcybSRrqzmO/HLbR568yMdkS/kP
         nufG0wuFajV/L0ZOZ7A86NbaLvtM9zFodJ3xV2BJvqAuVmuMTojRM7u7DGAlC9q2J8VF
         bDKgMn9sr27pH0Jvee0KZiNCAJaLjD0AFTWZVjSE57oYuZ44+lqWg2U3R01FtCvDzutV
         ExCcFGcYUgQGFzK8GuBX/J6WhhOIq7diE3yrOltYmR1xazMI070ahPQlGovDdIuZ0d4O
         LrAFPveRjzT3cUkGG3OThYGn35BUzjl08fx0ni/Pb2QsI+T4Td2DraWd5Iswf7y/Ziej
         42XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsp1YKrzg2TbFNvU4Agp7u5bh4Zev3hiAW9Ft9F0OvORFK9DM3NXoIyQ0874qbCEYmPaiYNNcuKjrCFr8RLPhKXg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzSlc12xC9xsgSUIaE+vE5j8cUd6bXPl5pkfAlqmIQBS6w3+DBA
	/gvRn2xRX3n4Z72slDjuZzyQML67g2Qtvqd6ghZpD7PKOB0ynn8fRaiQHgi5lN7AZECkjTFuGeV
	oyjAjGmbe8kYXG9v0vIMf+yygOY82j7c=
X-Gm-Gg: ASbGncsqaUFDMmFzMNX3Ux2D63yVYPzmHQwDBDftHFTrYzCsvB1YIf06rKkesDiNxxj
	0VKkk4kTxdJjs9APrF7ab7kX0OukkI7Iis2iQw2/MmVqnwyaOqmZumrGWWj+wlI5/EuPd1fjO8m
	Mnz+EQ6OucI9WPwQ3wzt9k+G7zVRTKK2NDrrkgjUvm9mQc6dJSgZJBX+3I02RXVymVgSMkQZWSI
	3+22U5u
X-Google-Smtp-Source: AGHT+IFDfBabLJGNmIF0ewMYBCNO3uHYYFn7+DCZ3og4erKwjVzO0oUiCAAjIVDju7IbJb4wO9jHg27ZyQZdmRJJzfE=
X-Received: by 2002:a05:6122:91f:b0:537:3e57:6bdc with SMTP id
 71dfb90a1353d-54bea22dc76mr210599e0c.12.1758729874685; Wed, 24 Sep 2025
 09:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250902190555.7929-1-dani.barra25@gmail.com> <DCK51OC59LCA.XXERUU1OP7Y@bootlin.com>
 <16907d6c-a28d-4369-95fd-199fcccba105@windriver.com> <CA+-=zY2PzZ3RqtzLbFzd6TxSdBVft2KrSvzKQqP2oxZZUMnWhg@mail.gmail.com>
 <CA+-=zY09Um_hG1knpWFBRHx-mTBgNUN3vH9WA0nhiY7ub-PKvw@mail.gmail.com> <DD0EHMY9ITYL.3KAYD72BZUUIJ@bootlin.com>
In-Reply-To: <DD0EHMY9ITYL.3KAYD72BZUUIJ@bootlin.com>
From: Daniel Andrade <dani.barra25@gmail.com>
Date: Wed, 24 Sep 2025 17:04:23 +0100
X-Gm-Features: AS18NWCesMq5Ojx6BWIsmZ-oFIKmk8-SHCuK7_wLkyEMx56M49zutj0nht4NVK0
Message-ID: <CA+-=zY2HNd2r-Ux8vUbSU72dGXtPArRtzTaSnHiF0JEvC_jC-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] wic: updated fstab does not preserve metadata of the original file
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org, 
	hongxu.jia@windriver.com, trevor.woerner@linaro.org
Content-Type: multipart/alternative; boundary="0000000000006fc605063f8e354a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 21:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223993

--0000000000006fc605063f8e354a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mathieu,

Thank you for the quick answer.
Ok, I will start from the beginning.

The failing test is supposed to test `--no-fstab-update` flags on wks file.
According to the understanding of the code, the flag is being passed across
python scripts either as `self.no_fstab_update`, like in
scripts/lib/wic/partition.py, or `part.no_fstab_update`, on
scripts/lib/wic/plugins/source/rootfs.py.
The issue that is arising from the `oe-selftest -r
wic.Wic.test_no_fstab_update` is that it is not actually testing it,
because somehow the assigning of the previous variables is not correct,
which leads to a later assumption.
The thing that is really doing the "no update" is the line 134 of
`scripts/lib/wic/partition.py` where it excludes ext* and msdos partitions
from falling in the common plugin for Rootfs.
Because of this, I suggested someone to, in a clean and a different
environment compared to mine, change the wks file used to `squashfs` fstype
(or any other supported wic fstype) instead of `ext4` which indeed also
made the test fail.
In summary, the test is failing not because of the patch (even though maybe
something can be improved or fixed later), but because it is just checking
for ext4 partitions that fall in a different way of approaching fstab while
the real mechanism is not behaving as desired.

TLDR: The test is getting passed not because it is enforcing
`--no-fstab-update` but because the partition is ext* or msdos. Changing it
to squashfs, btrfs or any other wic supported partition, with or without
the patch, will cause this to fail. This is an extra thing non-related with
the proposed patch but that is preventing it to behave correctly as
intended by the test.

Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> escreveu (ter=C3=
=A7a,
23/09/2025 =C3=A0(s) 19:44):

> Hi Daniel,
>
> Sorry, but I'm not sure to get your point.
>
> I ran the test locally, and it does fail. It also fails if I modify it
> to use squashfs instead of ext4.
>
> My reproduction procedure:
> git clone https://git.yoctoproject.org/poky-ci-archive -b
> autobuilder.yoctoproject.org/valkyrie/a-full-2320
> . oe-init-build-env
> echo 'SANITY_TESTED_DISTROS =3D ""' >> conf/local.conf
> oe-selftest -r wic.Wic.test_no_fstab_update
>
> Thanks,
> Mathieu
>
> On Tue Sep 23, 2025 at 5:05 PM CEST, Daniel Andrade wrote:
> > Good Afternoon,
> >
> > I have been trying to figure it out and something seems off.
> > The specific test you refer to may be hiding a problem or maybe I have =
my
> > testbench compromised and I would like your help to test.
> > The test `test_no_fstab_update ` verifies if the fstab was updated or n=
ot
> > because on the wks file used to do it there is a --no-fstab-update. The
> > thing is, I think this test is passing because what is forcing it to no=
t
> > update is a constraint that I removed previously on the patch (the one
> that
> > checks if the system is ext* or msdos) and not because the flag is
> > triggering its intended functionality.
> > The crosscheck I did was modifying the fstype from ext4 to squashfs and
> > indeed the test failed.
> > Can someone also verify this?
> >
> > Daniel
> >
> > Daniel Andrade <dani.barra25@gmail.com> escreveu (s=C3=A1bado, 13/09/20=
25
> =C3=A0(s)
> > 11:02):
> >
> >> Hello guys, sorry for the delay.
> >> I have been busy, but I hope to provide you with a fix in the next few
> >> days.
> >>
> >> Sorry about that,
> >> Daniel
> >>
> >> Randy MacLeod <randy.macleod@windriver.com> escreveu (quinta,
> 11/09/2025
> >> =C3=A0(s) 17:56):
> >>
> >>> On 2025-09-04 11:58 a.m., Mathieu Dubois-Briand via
> >>> lists.openembedded.org wrote:
> >>>
> >>> On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via
> lists.openembedded.org wrote:
> >>>
> >>> From: Daniel Andrade <dani.barra25@gmail.com> <dani.barra25@gmail.com=
>
> >>>
> >>> Using `install` in the rootfs plugin forces fstab to be replaced
> entirely, meaning that even its Inodes will change, leading xattrs and
> SELinux context stored by pseudo not to be applied.
> >>> The fix just uses `cp` without preserving attributes from the
> temporary fstab since none of them are needed, just the content.
> >>> Same thing happens with the predefined mechanisms for ext4 and msdos.
> Using debugfs there is no way to replace contents while maintaining
> metadata, so the approach taken on the path was to remove the different
> fstab logic for those fstypes and also use the same modified cp command.
> Reviewing the builds I did it seems to work for all of the fstypes.
> >>>
> >>> Another problem is that the timestamp applied to fstab is not the sam=
e
> as every other file. It seems like the `SOURCE_DATE_EPOCH` variable goes =
to
> the fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
> >>> Since you are using that variable everywhere, it is not the same valu=
e
> as ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.conf`
> that is applied in every other file.
> >>>
> >>> Daniel Andrade (1):
> >>>   wic: Content of the temporary updated fstab should be copied into t=
he
> >>>     original not replacing it entirely.
> >>>
> >>>  meta/conf/bitbake.conf                   |  4 +++-
> >>>  scripts/lib/wic/partition.py             | 15 +--------------
> >>>  scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
> >>>  3 files changed, 6 insertions(+), 17 deletions(-)
> >>>
> >>> Hi Daniel,
> >>>
> >>> Thanks for your patch.
> >>>
> >>> It looks like it is breaking a test:
> >>>
> >>> 2025-09-04 15:28:11,112 - oe-selftest - INFO -
> wic.Wic.test_no_fstab_update (subunit.RemotedTestCase)
> >>> 2025-09-04 15:28:11,113 - oe-selftest - INFO -  ... FAIL
> >>> ...
> >>> 2025-09-04 15:28:11,114 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
> >>>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/self=
test/cases/wic.py",
> line 859, in test_no_fstab_update
> >>>     self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
> >>>   File "/usr/lib/python3.12/unittest/case.py", line 885, in assertEqu=
al
> >>>     assertion_func(first, second, msg=3Dmsg)
> >>>   File "/usr/lib/python3.12/unittest/case.py", line 1251, in
> assertMultiLineEqual
> >>>     self.fail(self._formatMessage(msg, standardMsg))
> >>>   File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
> >>>     raise self.failureException(msg)
> >>> AssertionError: 'af3c087d6c9131735c8d1f270a226892' !=3D
> '9edb8255abd217fdb20e118833afb856'
> >>> - af3c087d6c9131735c8d1f270a226892
> >>> + 9edb8255abd217fdb20e118833afb856
> >>>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2412ht=
tps://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2268
> >>>
> >>> Can you fix it please?
> >>>
> >>> Ping?
> >>>
> >>> I think this is being tracked by:
> >>>
> >>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15947
> >>>
> >>> "WIC does not preserve metadata when updating fstab"
> >>>
> >>> Btw, we were just following the "Need Info" process during the bug
> review
> >>> meeting
> >>> so that's why I'm sending this email.
> >>>
> >>> ../Randy
> >>>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>
> >>>
> >>>=20
> >>>
> >>>
> >>>
> >>> --
> >>> # Randy MacLeod
> >>> # Wind River Linux
> >>>
> >>>
>
>
>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000006fc605063f8e354a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Mathieu,<br><br>Thank you for the quick answer.<br>O=
k, I will start from the beginning.<br><br>The failing test is supposed to =
test `--no-fstab-update` flags on wks file. According to the understanding =
of the code, the flag is being passed across python scripts either as `self=
.no_fstab_update`, like in scripts/lib/wic/partition.py, or `part.no_fstab_=
update`, on scripts/lib/wic/plugins/source/rootfs.py. <br>The issue that is=
 arising from the `oe-selftest -r wic.Wic.test_no_fstab_update` is that it =
is not actually testing it, because somehow the assigning of the previous v=
ariables is not correct, which leads to a later assumption. <br>The thing t=
hat is really doing the &quot;no update&quot; is the line 134 of `scripts/l=
ib/wic/partition.py` where it excludes ext* and msdos partitions from falli=
ng in the common plugin for Rootfs. <br>Because of this, I suggested someon=
e to, in a clean and a different environment compared to mine, change the w=
ks file used to `squashfs` fstype (or any other supported wic fstype) inste=
ad of `ext4` which indeed also made the test fail.<br>In summary, the test =
is failing not because of the patch (even though maybe something can be imp=
roved or fixed later), but because it is just checking for ext4 partitions =
that fall in a different way of approaching fstab while the real mechanism =
is not behaving as desired.<br><br>TLDR: The test is getting passed not bec=
ause it is enforcing `--no-fstab-update` but because the partition is ext* =
or msdos. Changing it to squashfs, btrfs or any other wic supported partiti=
on, with or without the patch, will cause this to fail. This is an extra th=
ing non-related with the proposed patch but that is preventing it to behave=
 correctly as intended by the test.</div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Mathieu Dubois-Bri=
and &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.com">mathieu.dubois=
-briand@bootlin.com</a>&gt; escreveu (ter=C3=A7a, 23/09/2025 =C3=A0(s) 19:4=
4):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Daniel,<b=
r>
<br>
Sorry, but I&#39;m not sure to get your point.<br>
<br>
I ran the test locally, and it does fail. It also fails if I modify it<br>
to use squashfs instead of ext4.<br>
<br>
My reproduction procedure:<br>
git clone <a href=3D"https://git.yoctoproject.org/poky-ci-archive" rel=3D"n=
oreferrer" target=3D"_blank">https://git.yoctoproject.org/poky-ci-archive</=
a> -b <a href=3D"http://autobuilder.yoctoproject.org/valkyrie/a-full-2320" =
rel=3D"noreferrer" target=3D"_blank">autobuilder.yoctoproject.org/valkyrie/=
a-full-2320</a><br>
. oe-init-build-env<br>
echo &#39;SANITY_TESTED_DISTROS =3D &quot;&quot;&#39; &gt;&gt; conf/local.c=
onf<br>
oe-selftest -r wic.Wic.test_no_fstab_update<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
On Tue Sep 23, 2025 at 5:05 PM CEST, Daniel Andrade wrote:<br>
&gt; Good Afternoon,<br>
&gt;<br>
&gt; I have been trying to figure it out and something seems off.<br>
&gt; The specific test you refer to may be hiding a problem or maybe I have=
 my<br>
&gt; testbench compromised and I would like your help to test.<br>
&gt; The test `test_no_fstab_update ` verifies if the fstab was updated or =
not<br>
&gt; because on the wks file used to do it there is a --no-fstab-update. Th=
e<br>
&gt; thing is, I think this test is passing because what is forcing it to n=
ot<br>
&gt; update is a constraint that I removed previously on the patch (the one=
 that<br>
&gt; checks if the system is ext* or msdos) and not because the flag is<br>
&gt; triggering its intended functionality.<br>
&gt; The crosscheck I did was modifying the fstype from ext4 to squashfs an=
d<br>
&gt; indeed the test failed.<br>
&gt; Can someone also verify this?<br>
&gt;<br>
&gt; Daniel<br>
&gt;<br>
&gt; Daniel Andrade &lt;<a href=3D"mailto:dani.barra25@gmail.com" target=3D=
"_blank">dani.barra25@gmail.com</a>&gt; escreveu (s=C3=A1bado, 13/09/2025 =
=C3=A0(s)<br>
&gt; 11:02):<br>
&gt;<br>
&gt;&gt; Hello guys, sorry for the delay.<br>
&gt;&gt; I have been busy, but I hope to provide you with a fix in the next=
 few<br>
&gt;&gt; days.<br>
&gt;&gt;<br>
&gt;&gt; Sorry about that,<br>
&gt;&gt; Daniel<br>
&gt;&gt;<br>
&gt;&gt; Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com" t=
arget=3D"_blank">randy.macleod@windriver.com</a>&gt; escreveu (quinta, 11/0=
9/2025<br>
&gt;&gt; =C3=A0(s) 17:56):<br>
&gt;&gt;<br>
&gt;&gt;&gt; On 2025-09-04 11:58 a.m., Mathieu Dubois-Briand via<br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; From: Daniel Andrade &lt;<a href=3D"mailto:dani.barra25@gmail.=
com" target=3D"_blank">dani.barra25@gmail.com</a>&gt; &lt;<a href=3D"mailto=
:dani.barra25@gmail.com" target=3D"_blank">dani.barra25@gmail.com</a>&gt;<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Using `install` in the rootfs plugin forces fstab to be replac=
ed entirely, meaning that even its Inodes will change, leading xattrs and S=
ELinux context stored by pseudo not to be applied.<br>
&gt;&gt;&gt; The fix just uses `cp` without preserving attributes from the =
temporary fstab since none of them are needed, just the content.<br>
&gt;&gt;&gt; Same thing happens with the predefined mechanisms for ext4 and=
 msdos. Using debugfs there is no way to replace contents while maintaining=
 metadata, so the approach taken on the path was to remove the different fs=
tab logic for those fstypes and also use the same modified cp command. Revi=
ewing the builds I did it seems to work for all of the fstypes.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Another problem is that the timestamp applied to fstab is not =
the same as every other file. It seems like the `SOURCE_DATE_EPOCH` variabl=
e goes to the fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).<br>
&gt;&gt;&gt; Since you are using that variable everywhere, it is not the sa=
me value as ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.=
conf` that is applied in every other file.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Daniel Andrade (1):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0wic: Content of the temporary updated fstab should=
 be copied into the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0original not replacing it entirely.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++-<br>
&gt;&gt;&gt;=C2=A0 scripts/lib/wic/partition.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 15 +--------------<br>
&gt;&gt;&gt;=C2=A0 scripts/lib/wic/plugins/source/rootfs.py |=C2=A0 4 ++--<=
br>
&gt;&gt;&gt;=C2=A0 3 files changed, 6 insertions(+), 17 deletions(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi Daniel,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks for your patch.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It looks like it is breaking a test:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 2025-09-04 15:28:11,112 - oe-selftest - INFO - wic.Wic.test_no=
_fstab_update (subunit.RemotedTestCase)<br>
&gt;&gt;&gt; 2025-09-04 15:28:11,113 - oe-selftest - INFO -=C2=A0 ... FAIL<=
br>
&gt;&gt;&gt; ...<br>
&gt;&gt;&gt; 2025-09-04 15:28:11,114 - oe-selftest - INFO - testtools.testr=
esult.real._StringException: Traceback (most recent call last):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/oe-selftest=
-armhost/build/meta/lib/oeqa/selftest/cases/wic.py&quot;, line 859, in test=
_no_fstab_update<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0self.assertEqual(bf_fstab_md5sum, part_fsta=
b_md5sum[1])<br>
&gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.12/unittest/case.py&qu=
ot;, line 885, in assertEqual<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0assertion_func(first, second, msg=3Dmsg)<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.12/unittest/case.py&qu=
ot;, line 1251, in assertMultiLineEqual<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0self.fail(self._formatMessage(msg, standard=
Msg))<br>
&gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.12/unittest/case.py&qu=
ot;, line 715, in fail<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0raise self.failureException(msg)<br>
&gt;&gt;&gt; AssertionError: &#39;af3c087d6c9131735c8d1f270a226892&#39; !=
=3D &#39;9edb8255abd217fdb20e118833afb856&#39;<br>
&gt;&gt;&gt; - af3c087d6c9131735c8d1f270a226892<br>
&gt;&gt;&gt; + 9edb8255abd217fdb20e118833afb856<br>
&gt;&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/bui=
lders/23/builds/2412https://autobuilder.yoctoproject.org/valkyrie/%23/build=
ers/35/builds/2268" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/23/builds/2412https://autobuilder.yo=
ctoproject.org/valkyrie/#/builders/35/builds/2268</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Can you fix it please?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Ping?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think this is being tracked by:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D15947" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoprojec=
t.org/show_bug.cgi?id=3D15947</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &quot;WIC does not preserve metadata when updating fstab&quot;=
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Btw, we were just following the &quot;Need Info&quot; process =
during the bug review<br>
&gt;&gt;&gt; meeting<br>
&gt;&gt;&gt; so that&#39;s why I&#39;m sending this email.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ../Randy<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; Mathieu<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; # Randy MacLeod<br>
&gt;&gt;&gt; # Wind River Linux<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
<br>
<br>
<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--0000000000006fc605063f8e354a--

