Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FF9CAC5B1
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:11:30 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web11.9547.1758800470483694411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 04:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LuphkXfQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: dani.barra25@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-89018e9f902so498224241.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 04:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758800469; x=1759405269; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sWlMoBo61C256T77PtOqYvDCpf48JosG9LXFyCNIvXw=;
        b=LuphkXfQMQbiqH1h1gVx9nNKOfKNY19cKGy5gQWPdUrZq3NNweCnGYDUWGTNfFtYst
         jrPjaH1g7+A77sJZ15ZkXiKv0hDFdasnhNlap3hOe0fxf8v0tbPzxvqpNGuolDxBSTtr
         HcfBGNbKHN3630MXmKOlvmEUKZlWu6BMWgUl9AD+cH5RPFbKAALiA7XxaQgWKJJmuRhU
         1XhPbDKCGyQlYRKqGMAZY5Z5snaSWR4JyA2PR6DkH56zrlGzEk9YkK9PLNkYHc1oJ//d
         3XoBQkhs+Xn88ZaE9QT365iP7TDZOlCDMAeaw/ZAkG5NR9RKcCRKwNvazeyb4VBPsVRH
         FwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758800469; x=1759405269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWlMoBo61C256T77PtOqYvDCpf48JosG9LXFyCNIvXw=;
        b=Phsi3KfZj052AY+dDI5+zw05wSO1spp+KV65Iy2CSk1ZY7iSUyjS7EEH4An3k/ZARg
         yDhTEbo0NBzGotH43JaBgtXVAMQU3waUZPuW8Vrezn5e+So9YuROX92x/2WVIHXFmGdk
         uXtJyyAxj5S5XlBfjeM/QROFuhC2JBIWAq5MCMM5KqMuayLMY6zrboO9aHd61wGUmvm9
         udVLoT2b6Y9l4m2msu/yRfP8+058QMhZ2IDl7L2rl77yr0vtouqvgUwUZucM+xEBfEWJ
         hxLN0YKNH5qWvhqFiOHK/qd5ASm5ydf4iDv26AGbzDFl6yZqDeQtQhftLE4AHWdH3xbj
         7fRA==
X-Forwarded-Encrypted: i=1; AJvYcCVm2kv9s6lowhI1x6kc9Y1f+EK9wB5uGolaAFxbk5ztCHOuCwlp7exvhDTAyEZcZH1NMho9J6uQ7gMh42/2DU5KWw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxWeHyMK9Ye6gqGO6/ScwxcMl4s4XZY2j/um/PwAn+Ohj7VLUO7
	XFWE3fzMKiQ29yL5KluafasPE//uD30ZNL3rZ/3J7D2ECGU0IRA1LIX/x03mXTmAPRSN4Omzv+r
	EiXRXrotTPQ/ycc6onrvVjtqc1KX1pvo=
X-Gm-Gg: ASbGncuodxukD64N/as2SZAEjraqbqDPgK3te+OVEz87dyiP2riYqLPgcVUlmidN/fZ
	xKHn0Chei0bld8UML4dDuUGUlGL9znLdff3qA6zXUoTyhlHDb7v8/DxvG43i03KAZ/K6mjvtRC5
	/2KGrV2s42sNW8e51LN5zmAgi4iK676A4gAXuRZZXaLyEcMnuJFJjAhPbn7DhqXKM0RgmwXLvEY
	ncLYBo=
X-Google-Smtp-Source: AGHT+IFDsIcqhWYulf3BA7ENULC0adJV6wxsY7KDDCuJ8hoUu3sZnHWAYlNOlnS7tnp0XjXT3uzFk4bA1xme8lbNqQ8=
X-Received: by 2002:a05:6102:3a11:b0:5a1:3bcf:a93f with SMTP id
 ada2fe7eead31-5acc83fb850mr1450474137.4.1758800469177; Thu, 25 Sep 2025
 04:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250902190555.7929-1-dani.barra25@gmail.com> <DCK51OC59LCA.XXERUU1OP7Y@bootlin.com>
 <16907d6c-a28d-4369-95fd-199fcccba105@windriver.com> <CA+-=zY2PzZ3RqtzLbFzd6TxSdBVft2KrSvzKQqP2oxZZUMnWhg@mail.gmail.com>
 <CA+-=zY09Um_hG1knpWFBRHx-mTBgNUN3vH9WA0nhiY7ub-PKvw@mail.gmail.com>
 <DD0EHMY9ITYL.3KAYD72BZUUIJ@bootlin.com> <CA+-=zY2HNd2r-Ux8vUbSU72dGXtPArRtzTaSnHiF0JEvC_jC-Q@mail.gmail.com>
 <DD1R90GRFNVC.24IBY55KSXN0@bootlin.com> <DD1U3SCOKELE.2CRIIUQH4JCZ3@bootlin.com>
In-Reply-To: <DD1U3SCOKELE.2CRIIUQH4JCZ3@bootlin.com>
From: Daniel Andrade <dani.barra25@gmail.com>
Date: Thu, 25 Sep 2025 12:40:57 +0100
X-Gm-Features: AS18NWAnNNsmHfVQFSUcifqDL8ckxpYuRqVFNSz5dGsn5HM2vovNqH9WsbwJwSc
Message-ID: <CA+-=zY0LBpJjJ=ezdcOzamX1BzyozLYpKGZH2LJUrJOM6PbUPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] wic: updated fstab does not preserve metadata of the original file
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Trevor Woerner <twoerner@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org, 
	hongxu.jia@windriver.com, trevor.woerner@linaro.org
Content-Type: multipart/alternative; boundary="00000000000032380e063f9ea52a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224040

--00000000000032380e063f9ea52a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Trevor and Mathieu,

If, by any chance, you need more information, goal or objective with what I
am trying to accomplish, or any other thing you might find useful, please
let me know.
I am available to provide more explanation, either via this thread or via a
separate email or meeting.
For the moment I will halt the research/fixing I was looking/doing until
you provide further confirmation on the behaviour of that mechanism.

Have a nice day,
Daniel

Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> escreveu (quinta,
25/09/2025 =C3=A0(s) 12:11):

> Hi Trevor,
>
> I'm not sure you have seen the following mail thread. It was suggested
> we seek for your advices during today patch review call.
>
> Do you have any opinion about this test, and if the behaviour we are
> seeing is expected?
>
> Thanks,
> Mathieu
>
> On Thu Sep 25, 2025 at 10:57 AM CEST, Mathieu Dubois-Briand wrote:
> > OK! So I misunderstood your previous mail.
> >
> > I confirm that on master branch the test succeed, but fails if I change
> > the filesystem to squashfs or btrfs.
> >
> > On a first glance, it looks like you are right, but I can't say I am
> > experienced with wic internals. We might want a second opinion here.
> >
> > If the test is wrong, it has to be fixed. And so probably the tested
> > code also have to be fixed. I this something you can do?
> >
> > Thanks,
> > Mathieu
> >
> > On Wed Sep 24, 2025 at 6:04 PM CEST, Daniel Andrade wrote:
> >> Hello Mathieu,
> >>
> >> Thank you for the quick answer.
> >> Ok, I will start from the beginning.
> >>
> >> The failing test is supposed to test `--no-fstab-update` flags on wks
> file.
> >> According to the understanding of the code, the flag is being passed
> across
> >> python scripts either as `self.no_fstab_update`, like in
> >> scripts/lib/wic/partition.py, or `part.no_fstab_update`, on
> >> scripts/lib/wic/plugins/source/rootfs.py.
> >> The issue that is arising from the `oe-selftest -r
> >> wic.Wic.test_no_fstab_update` is that it is not actually testing it,
> >> because somehow the assigning of the previous variables is not correct=
,
> >> which leads to a later assumption.
> >> The thing that is really doing the "no update" is the line 134 of
> >> `scripts/lib/wic/partition.py` where it excludes ext* and msdos
> partitions
> >> from falling in the common plugin for Rootfs.
> >> Because of this, I suggested someone to, in a clean and a different
> >> environment compared to mine, change the wks file used to `squashfs`
> fstype
> >> (or any other supported wic fstype) instead of `ext4` which indeed als=
o
> >> made the test fail.
> >> In summary, the test is failing not because of the patch (even though
> maybe
> >> something can be improved or fixed later), but because it is just
> checking
> >> for ext4 partitions that fall in a different way of approaching fstab
> while
> >> the real mechanism is not behaving as desired.
> >>
> >> TLDR: The test is getting passed not because it is enforcing
> >> `--no-fstab-update` but because the partition is ext* or msdos.
> Changing it
> >> to squashfs, btrfs or any other wic supported partition, with or witho=
ut
> >> the patch, will cause this to fail. This is an extra thing non-related
> with
> >> the proposed patch but that is preventing it to behave correctly as
> >> intended by the test.
> >>
> >> Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> escreveu
> (ter=C3=A7a,
> >> 23/09/2025 =C3=A0(s) 19:44):
> >>
> >>> Hi Daniel,
> >>>
> >>> Sorry, but I'm not sure to get your point.
> >>>
> >>> I ran the test locally, and it does fail. It also fails if I modify i=
t
> >>> to use squashfs instead of ext4.
> >>>
> >>> My reproduction procedure:
> >>> git clone https://git.yoctoproject.org/poky-ci-archive -b
> >>> autobuilder.yoctoproject.org/valkyrie/a-full-2320
> >>> . oe-init-build-env
> >>> echo 'SANITY_TESTED_DISTROS =3D ""' >> conf/local.conf
> >>> oe-selftest -r wic.Wic.test_no_fstab_update
> >>>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>> On Tue Sep 23, 2025 at 5:05 PM CEST, Daniel Andrade wrote:
> >>> > Good Afternoon,
> >>> >
> >>> > I have been trying to figure it out and something seems off.
> >>> > The specific test you refer to may be hiding a problem or maybe I
> have my
> >>> > testbench compromised and I would like your help to test.
> >>> > The test `test_no_fstab_update ` verifies if the fstab was updated
> or not
> >>> > because on the wks file used to do it there is a --no-fstab-update.
> The
> >>> > thing is, I think this test is passing because what is forcing it t=
o
> not
> >>> > update is a constraint that I removed previously on the patch (the
> one
> >>> that
> >>> > checks if the system is ext* or msdos) and not because the flag is
> >>> > triggering its intended functionality.
> >>> > The crosscheck I did was modifying the fstype from ext4 to squashfs
> and
> >>> > indeed the test failed.
> >>> > Can someone also verify this?
> >>> >
> >>> > Daniel
> >>> >
> >>> > Daniel Andrade <dani.barra25@gmail.com> escreveu (s=C3=A1bado, 13/0=
9/2025
> >>> =C3=A0(s)
> >>> > 11:02):
> >>> >
> >>> >> Hello guys, sorry for the delay.
> >>> >> I have been busy, but I hope to provide you with a fix in the next
> few
> >>> >> days.
> >>> >>
> >>> >> Sorry about that,
> >>> >> Daniel
> >>> >>
> >>> >> Randy MacLeod <randy.macleod@windriver.com> escreveu (quinta,
> >>> 11/09/2025
> >>> >> =C3=A0(s) 17:56):
> >>> >>
> >>> >>> On 2025-09-04 11:58 a.m., Mathieu Dubois-Briand via
> >>> >>> lists.openembedded.org wrote:
> >>> >>>
> >>> >>> On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via
> >>> lists.openembedded.org wrote:
> >>> >>>
> >>> >>> From: Daniel Andrade <dani.barra25@gmail.com> <
> dani.barra25@gmail.com>
> >>> >>>
> >>> >>> Using `install` in the rootfs plugin forces fstab to be replaced
> >>> entirely, meaning that even its Inodes will change, leading xattrs an=
d
> >>> SELinux context stored by pseudo not to be applied.
> >>> >>> The fix just uses `cp` without preserving attributes from the
> >>> temporary fstab since none of them are needed, just the content.
> >>> >>> Same thing happens with the predefined mechanisms for ext4 and
> msdos.
> >>> Using debugfs there is no way to replace contents while maintaining
> >>> metadata, so the approach taken on the path was to remove the differe=
nt
> >>> fstab logic for those fstypes and also use the same modified cp
> command.
> >>> Reviewing the builds I did it seems to work for all of the fstypes.
> >>> >>>
> >>> >>> Another problem is that the timestamp applied to fstab is not the
> same
> >>> as every other file. It seems like the `SOURCE_DATE_EPOCH` variable
> goes to
> >>> the fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
> >>> >>> Since you are using that variable everywhere, it is not the same
> value
> >>> as ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.con=
f`
> >>> that is applied in every other file.
> >>> >>>
> >>> >>> Daniel Andrade (1):
> >>> >>>   wic: Content of the temporary updated fstab should be copied
> into the
> >>> >>>     original not replacing it entirely.
> >>> >>>
> >>> >>>  meta/conf/bitbake.conf                   |  4 +++-
> >>> >>>  scripts/lib/wic/partition.py             | 15 +--------------
> >>> >>>  scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
> >>> >>>  3 files changed, 6 insertions(+), 17 deletions(-)
> >>> >>>
> >>> >>> Hi Daniel,
> >>> >>>
> >>> >>> Thanks for your patch.
> >>> >>>
> >>> >>> It looks like it is breaking a test:
> >>> >>>
> >>> >>> 2025-09-04 15:28:11,112 - oe-selftest - INFO -
> >>> wic.Wic.test_no_fstab_update (subunit.RemotedTestCase)
> >>> >>> 2025-09-04 15:28:11,113 - oe-selftest - INFO -  ... FAIL
> >>> >>> ...
> >>> >>> 2025-09-04 15:28:11,114 - oe-selftest - INFO -
> >>> testtools.testresult.real._StringException: Traceback (most recent ca=
ll
> >>> last):
> >>> >>>   File
> >>>
> "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/self=
test/cases/wic.py",
> >>> line 859, in test_no_fstab_update
> >>> >>>     self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
> >>> >>>   File "/usr/lib/python3.12/unittest/case.py", line 885, in
> assertEqual
> >>> >>>     assertion_func(first, second, msg=3Dmsg)
> >>> >>>   File "/usr/lib/python3.12/unittest/case.py", line 1251, in
> >>> assertMultiLineEqual
> >>> >>>     self.fail(self._formatMessage(msg, standardMsg))
> >>> >>>   File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
> >>> >>>     raise self.failureException(msg)
> >>> >>> AssertionError: 'af3c087d6c9131735c8d1f270a226892' !=3D
> >>> '9edb8255abd217fdb20e118833afb856'
> >>> >>> - af3c087d6c9131735c8d1f270a226892
> >>> >>> + 9edb8255abd217fdb20e118833afb856
> >>> >>>
> >>>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2412ht=
tps://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2268
> >>> >>>
> >>> >>> Can you fix it please?
> >>> >>>
> >>> >>> Ping?
> >>> >>>
> >>> >>> I think this is being tracked by:
> >>> >>>
> >>> >>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15947
> >>> >>>
> >>> >>> "WIC does not preserve metadata when updating fstab"
> >>> >>>
> >>> >>> Btw, we were just following the "Need Info" process during the bu=
g
> >>> review
> >>> >>> meeting
> >>> >>> so that's why I'm sending this email.
> >>> >>>
> >>> >>> ../Randy
> >>> >>>
> >>> >>> Thanks,
> >>> >>> Mathieu
> >>> >>>
> >>> >>>
> >>> >>>
> >>> >>>=20
> >>> >>>
> >>> >>>
> >>> >>>
> >>> >>> --
> >>> >>> # Randy MacLeod
> >>> >>> # Wind River Linux
> >>> >>>
> >>> >>>
> >>>
> >>>
> >>>
> >>>
> >>> --
> >>> Mathieu Dubois-Briand, Bootlin
> >>> Embedded Linux and Kernel engineering
> >>> https://bootlin.com
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

--00000000000032380e063f9ea52a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Trevor and Mathieu,<div><br><div>If, by any chance, you=
 need more information, goal or objective with what I am trying to accompli=
sh, or any other thing you might find useful, please let me know.</div><div=
>I am available to provide more explanation, either via this thread or via =
a separate email or meeting.</div><div>For the moment I will halt the resea=
rch/fixing I was looking/doing until you provide further confirmation on th=
e behaviour of that mechanism.</div><div><br></div><div>Have a nice day,</d=
iv><div>Daniel</div></div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">Mathieu Dubois-Briand &lt;<=
a href=3D"mailto:mathieu.dubois-briand@bootlin.com">mathieu.dubois-briand@b=
ootlin.com</a>&gt; escreveu (quinta, 25/09/2025 =C3=A0(s) 12:11):<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Trevor,<br>
<br>
I&#39;m not sure you have seen the following mail thread. It was suggested<=
br>
we seek for your advices during today patch review call.<br>
<br>
Do you have any opinion about this test, and if the behaviour we are<br>
seeing is expected?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
On Thu Sep 25, 2025 at 10:57 AM CEST, Mathieu Dubois-Briand wrote:<br>
&gt; OK! So I misunderstood your previous mail.<br>
&gt;<br>
&gt; I confirm that on master branch the test succeed, but fails if I chang=
e<br>
&gt; the filesystem to squashfs or btrfs.<br>
&gt;<br>
&gt; On a first glance, it looks like you are right, but I can&#39;t say I =
am<br>
&gt; experienced with wic internals. We might want a second opinion here.<b=
r>
&gt;<br>
&gt; If the test is wrong, it has to be fixed. And so probably the tested<b=
r>
&gt; code also have to be fixed. I this something you can do?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Mathieu<br>
&gt;<br>
&gt; On Wed Sep 24, 2025 at 6:04 PM CEST, Daniel Andrade wrote:<br>
&gt;&gt; Hello Mathieu,<br>
&gt;&gt;<br>
&gt;&gt; Thank you for the quick answer.<br>
&gt;&gt; Ok, I will start from the beginning.<br>
&gt;&gt;<br>
&gt;&gt; The failing test is supposed to test `--no-fstab-update` flags on =
wks file.<br>
&gt;&gt; According to the understanding of the code, the flag is being pass=
ed across<br>
&gt;&gt; python scripts either as `self.no_fstab_update`, like in<br>
&gt;&gt; scripts/lib/wic/partition.py, or `part.no_fstab_update`, on<br>
&gt;&gt; scripts/lib/wic/plugins/source/rootfs.py.<br>
&gt;&gt; The issue that is arising from the `oe-selftest -r<br>
&gt;&gt; wic.Wic.test_no_fstab_update` is that it is not actually testing i=
t,<br>
&gt;&gt; because somehow the assigning of the previous variables is not cor=
rect,<br>
&gt;&gt; which leads to a later assumption.<br>
&gt;&gt; The thing that is really doing the &quot;no update&quot; is the li=
ne 134 of<br>
&gt;&gt; `scripts/lib/wic/partition.py` where it excludes ext* and msdos pa=
rtitions<br>
&gt;&gt; from falling in the common plugin for Rootfs.<br>
&gt;&gt; Because of this, I suggested someone to, in a clean and a differen=
t<br>
&gt;&gt; environment compared to mine, change the wks file used to `squashf=
s` fstype<br>
&gt;&gt; (or any other supported wic fstype) instead of `ext4` which indeed=
 also<br>
&gt;&gt; made the test fail.<br>
&gt;&gt; In summary, the test is failing not because of the patch (even tho=
ugh maybe<br>
&gt;&gt; something can be improved or fixed later), but because it is just =
checking<br>
&gt;&gt; for ext4 partitions that fall in a different way of approaching fs=
tab while<br>
&gt;&gt; the real mechanism is not behaving as desired.<br>
&gt;&gt;<br>
&gt;&gt; TLDR: The test is getting passed not because it is enforcing<br>
&gt;&gt; `--no-fstab-update` but because the partition is ext* or msdos. Ch=
anging it<br>
&gt;&gt; to squashfs, btrfs or any other wic supported partition, with or w=
ithout<br>
&gt;&gt; the patch, will cause this to fail. This is an extra thing non-rel=
ated with<br>
&gt;&gt; the proposed patch but that is preventing it to behave correctly a=
s<br>
&gt;&gt; intended by the test.<br>
&gt;&gt;<br>
&gt;&gt; Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@=
bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt; es=
creveu (ter=C3=A7a,<br>
&gt;&gt; 23/09/2025 =C3=A0(s) 19:44):<br>
&gt;&gt;<br>
&gt;&gt;&gt; Hi Daniel,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Sorry, but I&#39;m not sure to get your point.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I ran the test locally, and it does fail. It also fails if I m=
odify it<br>
&gt;&gt;&gt; to use squashfs instead of ext4.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; My reproduction procedure:<br>
&gt;&gt;&gt; git clone <a href=3D"https://git.yoctoproject.org/poky-ci-arch=
ive" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky=
-ci-archive</a> -b<br>
&gt;&gt;&gt; <a href=3D"http://autobuilder.yoctoproject.org/valkyrie/a-full=
-2320" rel=3D"noreferrer" target=3D"_blank">autobuilder.yoctoproject.org/va=
lkyrie/a-full-2320</a><br>
&gt;&gt;&gt; . oe-init-build-env<br>
&gt;&gt;&gt; echo &#39;SANITY_TESTED_DISTROS =3D &quot;&quot;&#39; &gt;&gt;=
 conf/local.conf<br>
&gt;&gt;&gt; oe-selftest -r wic.Wic.test_no_fstab_update<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; Mathieu<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue Sep 23, 2025 at 5:05 PM CEST, Daniel Andrade wrote:<br>
&gt;&gt;&gt; &gt; Good Afternoon,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; I have been trying to figure it out and something seems o=
ff.<br>
&gt;&gt;&gt; &gt; The specific test you refer to may be hiding a problem or=
 maybe I have my<br>
&gt;&gt;&gt; &gt; testbench compromised and I would like your help to test.=
<br>
&gt;&gt;&gt; &gt; The test `test_no_fstab_update ` verifies if the fstab wa=
s updated or not<br>
&gt;&gt;&gt; &gt; because on the wks file used to do it there is a --no-fst=
ab-update. The<br>
&gt;&gt;&gt; &gt; thing is, I think this test is passing because what is fo=
rcing it to not<br>
&gt;&gt;&gt; &gt; update is a constraint that I removed previously on the p=
atch (the one<br>
&gt;&gt;&gt; that<br>
&gt;&gt;&gt; &gt; checks if the system is ext* or msdos) and not because th=
e flag is<br>
&gt;&gt;&gt; &gt; triggering its intended functionality.<br>
&gt;&gt;&gt; &gt; The crosscheck I did was modifying the fstype from ext4 t=
o squashfs and<br>
&gt;&gt;&gt; &gt; indeed the test failed.<br>
&gt;&gt;&gt; &gt; Can someone also verify this?<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Daniel<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Daniel Andrade &lt;<a href=3D"mailto:dani.barra25@gmail.c=
om" target=3D"_blank">dani.barra25@gmail.com</a>&gt; escreveu (s=C3=A1bado,=
 13/09/2025<br>
&gt;&gt;&gt; =C3=A0(s)<br>
&gt;&gt;&gt; &gt; 11:02):<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; Hello guys, sorry for the delay.<br>
&gt;&gt;&gt; &gt;&gt; I have been busy, but I hope to provide you with a fi=
x in the next few<br>
&gt;&gt;&gt; &gt;&gt; days.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; Sorry about that,<br>
&gt;&gt;&gt; &gt;&gt; Daniel<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@win=
driver.com" target=3D"_blank">randy.macleod@windriver.com</a>&gt; escreveu =
(quinta,<br>
&gt;&gt;&gt; 11/09/2025<br>
&gt;&gt;&gt; &gt;&gt; =C3=A0(s) 17:56):<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; On 2025-09-04 11:58 a.m., Mathieu Dubois-Briand v=
ia<br>
&gt;&gt;&gt; &gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"=
noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 =
via<br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; From: Daniel Andrade &lt;<a href=3D"mailto:dani.b=
arra25@gmail.com" target=3D"_blank">dani.barra25@gmail.com</a>&gt; &lt;<a h=
ref=3D"mailto:dani.barra25@gmail.com" target=3D"_blank">dani.barra25@gmail.=
com</a>&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; Using `install` in the rootfs plugin forces fstab=
 to be replaced<br>
&gt;&gt;&gt; entirely, meaning that even its Inodes will change, leading xa=
ttrs and<br>
&gt;&gt;&gt; SELinux context stored by pseudo not to be applied.<br>
&gt;&gt;&gt; &gt;&gt;&gt; The fix just uses `cp` without preserving attribu=
tes from the<br>
&gt;&gt;&gt; temporary fstab since none of them are needed, just the conten=
t.<br>
&gt;&gt;&gt; &gt;&gt;&gt; Same thing happens with the predefined mechanisms=
 for ext4 and msdos.<br>
&gt;&gt;&gt; Using debugfs there is no way to replace contents while mainta=
ining<br>
&gt;&gt;&gt; metadata, so the approach taken on the path was to remove the =
different<br>
&gt;&gt;&gt; fstab logic for those fstypes and also use the same modified c=
p command.<br>
&gt;&gt;&gt; Reviewing the builds I did it seems to work for all of the fst=
ypes.<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; Another problem is that the timestamp applied to =
fstab is not the same<br>
&gt;&gt;&gt; as every other file. It seems like the `SOURCE_DATE_EPOCH` var=
iable goes to<br>
&gt;&gt;&gt; the fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).<br>
&gt;&gt;&gt; &gt;&gt;&gt; Since you are using that variable everywhere, it =
is not the same value<br>
&gt;&gt;&gt; as ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitb=
ake.conf`<br>
&gt;&gt;&gt; that is applied in every other file.<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; Daniel Andrade (1):<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0wic: Content of the temporary updated=
 fstab should be copied into the<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0original not replacing it enti=
rely.<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++-<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 scripts/lib/wic/partition.py=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +--------------<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 scripts/lib/wic/plugins/source/rootfs.py |=
=C2=A0 4 ++--<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 3 files changed, 6 insertions(+), 17 deleti=
ons(-)<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; Hi Daniel,<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; Thanks for your patch.<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; It looks like it is breaking a test:<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; 2025-09-04 15:28:11,112 - oe-selftest - INFO -<br=
>
&gt;&gt;&gt; wic.Wic.test_no_fstab_update (subunit.RemotedTestCase)<br>
&gt;&gt;&gt; &gt;&gt;&gt; 2025-09-04 15:28:11,113 - oe-selftest - INFO -=C2=
=A0 ... FAIL<br>
&gt;&gt;&gt; &gt;&gt;&gt; ...<br>
&gt;&gt;&gt; &gt;&gt;&gt; 2025-09-04 15:28:11,114 - oe-selftest - INFO -<br=
>
&gt;&gt;&gt; testtools.testresult.real._StringException: Traceback (most re=
cent call<br>
&gt;&gt;&gt; last):<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0File<br>
&gt;&gt;&gt; &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/me=
ta/lib/oeqa/selftest/cases/wic.py&quot;,<br>
&gt;&gt;&gt; line 859, in test_no_fstab_update<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0self.assertEqual(bf_fstab_md5s=
um, part_fstab_md5sum[1])<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.12/unitte=
st/case.py&quot;, line 885, in assertEqual<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0assertion_func(first, second, =
msg=3Dmsg)<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.12/unitte=
st/case.py&quot;, line 1251, in<br>
&gt;&gt;&gt; assertMultiLineEqual<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0self.fail(self._formatMessage(=
msg, standardMsg))<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.12/unitte=
st/case.py&quot;, line 715, in fail<br>
&gt;&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0raise self.failureException(ms=
g)<br>
&gt;&gt;&gt; &gt;&gt;&gt; AssertionError: &#39;af3c087d6c9131735c8d1f270a22=
6892&#39; !=3D<br>
&gt;&gt;&gt; &#39;9edb8255abd217fdb20e118833afb856&#39;<br>
&gt;&gt;&gt; &gt;&gt;&gt; - af3c087d6c9131735c8d1f270a226892<br>
&gt;&gt;&gt; &gt;&gt;&gt; + 9edb8255abd217fdb20e118833afb856<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/bui=
lders/23/builds/2412https://autobuilder.yoctoproject.org/valkyrie/%23/build=
ers/35/builds/2268" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/23/builds/2412https://autobuilder.yo=
ctoproject.org/valkyrie/#/builders/35/builds/2268</a><br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; Can you fix it please?<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; Ping?<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; I think this is being tracked by:<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; <a href=3D"https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D15947" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.=
yoctoproject.org/show_bug.cgi?id=3D15947</a><br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; &quot;WIC does not preserve metadata when updatin=
g fstab&quot;<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; Btw, we were just following the &quot;Need Info&q=
uot; process during the bug<br>
&gt;&gt;&gt; review<br>
&gt;&gt;&gt; &gt;&gt;&gt; meeting<br>
&gt;&gt;&gt; &gt;&gt;&gt; so that&#39;s why I&#39;m sending this email.<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; ../Randy<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; &gt;&gt;&gt; Mathieu<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; <br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt; --<br>
&gt;&gt;&gt; &gt;&gt;&gt; # Randy MacLeod<br>
&gt;&gt;&gt; &gt;&gt;&gt; # Wind River Linux<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Mathieu Dubois-Briand, Bootlin<br>
&gt;&gt;&gt; Embedded Linux and Kernel engineering<br>
&gt;&gt;&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_=
blank">https://bootlin.com</a><br>
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

--00000000000032380e063f9ea52a--

