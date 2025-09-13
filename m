Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DF4CA0EE8
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 15:11:09 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web10.2339.1757758107839575388
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Sep 2025 03:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HbZ00+fG;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: dani.barra25@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5570a77eabcso1114080137.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Sep 2025 03:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757758107; x=1758362907; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TislKcdU6TK74h4fx9acivvolr3BEeK6zgx3g/mG2ng=;
        b=HbZ00+fG4dPK2hwSNLn0yRwQ3Yka4w2t+M78RwXTQ4eiO/UpB0uvHloN4BSJYaZSJl
         F7/GCFF/hAshF+mvv9QSeZtq4VM/ZzuzYj/fWljln2abeMYnLLVYhKSPIZW5K0Q4sXHb
         Xt+wvz8l0NAkTYGozBV2bDLZeW0CLQiNSIAU5Is0bLOMp2i2i6O6y7FYGOyG4NMmcvAj
         Y46mDBjIJwc/xqTNoeL+UxMEvODhl0BPnlNtlTzuQaazcm6Qj3GHy5tsr9llXh6KBF+4
         N+bmTvPjngV8kRqNRg8opy7zllDBTiYUaURLdV2KnkHAWgDP+1X7AmZFWtK4NNfsWzYd
         /rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757758107; x=1758362907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TislKcdU6TK74h4fx9acivvolr3BEeK6zgx3g/mG2ng=;
        b=jzVCUlcXauxt70lh37ExIwnvdr5BjvTNNYZlK/JZmguxYYSPsqnfNEXe5fdxq+ydb1
         Z3iF+Tb/fcefzYqbDHUrlO/Ql4/ssZynJHModmQzVqDIlPzXXuIfkOGl49ktFnkbMuMr
         GeJ9xm0Hg2aUwLnWp9FvNaxYpXoQjenapNoU3TbMG4cT18qYUQBx6kE8ysZW0CkeULJy
         MU+mOHDrW5QJTGkwJyT2+O219eWHxu8x+cwW+pU63F1N7xclQC24mo7gyteSOPhuj2Ox
         g9JwtXYSWFqFvd4u6/PORpiw27nF6xaNGRQWJ1UyV0BJYqDa4ndnDbSMEMVdNJR16jQO
         WZeA==
X-Forwarded-Encrypted: i=1; AJvYcCWQlBMm3D9UiZwZZ0YKtwU9pACXuJ8611bofUFV+k9qcxLMpLlNxGMk5jNlRkuKqJp75mlUTEWCRp0mwQRE2DZiyg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy0n3l48hM51+Fuwnxgkumx9GgEqcubaQy6IjTMfHk584cXwf2y
	sfu/4iyINSMC/0biQMICHDmkAAojP3mDV5sq5HSqgP1dcwIpV/Y2Vf+zQCZyBy4XYnpnngDutJI
	bLvxbdTE+E9ePywvk/MxWqIs5ONPXq11p4bRwqjg=
X-Gm-Gg: ASbGncs7kcZLvBOFifNdm9FzgzCtPlIGSRkVLa1rBGRCXhKlZxwj0uroo3Q5SdhSWLo
	1SSjrQqE8xEIiwRVSDYOPjnmsDzMvxQ0VNjCF0RuF3WL/EeefT2vNXzH0C74JknY4NBL/F4mxUR
	c+HHd7HXfybjiWsv0MnYJYwUvaPWWYgV9bZ3OLUn5tbtEqa9GGAt/MVj+gS9ii239nK0ZGBrDWG
	KW5Z00XI8OE8HfYWtM=
X-Google-Smtp-Source: AGHT+IFHAXqsQvOje9zdIuN9JqvWXi6wbk+6PD4pQkzsGS87eW0lM2mmF4TC5kY4zmZONjtZar2VlZvR1Ppm3SyxgX8=
X-Received: by 2002:a05:6122:8287:b0:539:5cff:8070 with SMTP id
 71dfb90a1353d-54a16c6db5bmr2336374e0c.9.1757757738012; Sat, 13 Sep 2025
 03:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250902190555.7929-1-dani.barra25@gmail.com> <DCK51OC59LCA.XXERUU1OP7Y@bootlin.com>
 <16907d6c-a28d-4369-95fd-199fcccba105@windriver.com>
In-Reply-To: <16907d6c-a28d-4369-95fd-199fcccba105@windriver.com>
From: Daniel Andrade <dani.barra25@gmail.com>
Date: Sat, 13 Sep 2025 11:02:07 +0100
X-Gm-Features: AS18NWD5tSQB6ar-7WuUuC6yeiU-gxmIn5jrdhJCwYUx57vJzgDP2bUyc6mC8Nw
Message-ID: <CA+-=zY2PzZ3RqtzLbFzd6TxSdBVft2KrSvzKQqP2oxZZUMnWhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] wic: updated fstab does not preserve metadata of the original file
To: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com
Cc: hongxu.jia@windriver.com, trevor.woerner@linaro.org
Content-Type: multipart/alternative; boundary="00000000000093552a063eabddb4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 15:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223358

--00000000000093552a063eabddb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello guys, sorry for the delay.
I have been busy, but I hope to provide you with a fix in the next few days=
.

Sorry about that,
Daniel

Randy MacLeod <randy.macleod@windriver.com> escreveu (quinta, 11/09/2025
=C3=A0(s) 17:56):

> On 2025-09-04 11:58 a.m., Mathieu Dubois-Briand via lists.openembedded.or=
g
> wrote:
>
> On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via lists.openembedded.o=
rg wrote:
>
> From: Daniel Andrade <dani.barra25@gmail.com> <dani.barra25@gmail.com>
>
> Using `install` in the rootfs plugin forces fstab to be replaced entirely=
, meaning that even its Inodes will change, leading xattrs and SELinux cont=
ext stored by pseudo not to be applied.
> The fix just uses `cp` without preserving attributes from the temporary f=
stab since none of them are needed, just the content.
> Same thing happens with the predefined mechanisms for ext4 and msdos. Usi=
ng debugfs there is no way to replace contents while maintaining metadata, =
so the approach taken on the path was to remove the different fstab logic f=
or those fstypes and also use the same modified cp command. Reviewing the b=
uilds I did it seems to work for all of the fstypes.
>
> Another problem is that the timestamp applied to fstab is not the same as=
 every other file. It seems like the `SOURCE_DATE_EPOCH` variable goes to t=
he fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
> Since you are using that variable everywhere, it is not the same value as=
 ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.conf` that =
is applied in every other file.
>
> Daniel Andrade (1):
>   wic: Content of the temporary updated fstab should be copied into the
>     original not replacing it entirely.
>
>  meta/conf/bitbake.conf                   |  4 +++-
>  scripts/lib/wic/partition.py             | 15 +--------------
>  scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
>  3 files changed, 6 insertions(+), 17 deletions(-)
>
> Hi Daniel,
>
> Thanks for your patch.
>
> It looks like it is breaking a test:
>
> 2025-09-04 15:28:11,112 - oe-selftest - INFO - wic.Wic.test_no_fstab_upda=
te (subunit.RemotedTestCase)
> 2025-09-04 15:28:11,113 - oe-selftest - INFO -  ... FAIL
> ...
> 2025-09-04 15:28:11,114 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oe=
qa/selftest/cases/wic.py", line 859, in test_no_fstab_update
>     self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
>   File "/usr/lib/python3.12/unittest/case.py", line 885, in assertEqual
>     assertion_func(first, second, msg=3Dmsg)
>   File "/usr/lib/python3.12/unittest/case.py", line 1251, in assertMultiL=
ineEqual
>     self.fail(self._formatMessage(msg, standardMsg))
>   File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
>     raise self.failureException(msg)
> AssertionError: 'af3c087d6c9131735c8d1f270a226892' !=3D '9edb8255abd217fd=
b20e118833afb856'
> - af3c087d6c9131735c8d1f270a226892
> + 9edb8255abd217fdb20e118833afb856
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2412ht=
tps://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2268
>
> Can you fix it please?
>
> Ping?
>
> I think this is being tracked by:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15947
>
> "WIC does not preserve metadata when updating fstab"
>
> Btw, we were just following the "Need Info" process during the bug review
> meeting
> so that's why I'm sending this email.
>
> ../Randy
>
> Thanks,
> Mathieu
>
>
>
>=20
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>

--00000000000093552a063eabddb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello guys, sorry for the delay.=C2=A0<div>I have been bus=
y, but I hope to provide you with a fix in the next few days.</div><div><br=
><div>Sorry about that,</div><div>Daniel</div></div></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">R=
andy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macle=
od@windriver.com</a>&gt; escreveu (quinta, 11/09/2025 =C3=A0(s) 17:56):<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <div>On 2025-09-04 11:58 a.m., Mathieu
      Dubois-Briand via <a href=3D"http://lists.openembedded.org" target=3D=
"_blank">lists.openembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via <a href=3D"=
http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a>=
 wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>From: Daniel Andrade <a href=3D"mailto:dani.barra25@gmail.com"=
 target=3D"_blank">&lt;dani.barra25@gmail.com&gt;</a>

Using `install` in the rootfs plugin forces fstab to be replaced entirely, =
meaning that even its Inodes will change, leading xattrs and SELinux contex=
t stored by pseudo not to be applied.
The fix just uses `cp` without preserving attributes from the temporary fst=
ab since none of them are needed, just the content.
Same thing happens with the predefined mechanisms for ext4 and msdos. Using=
 debugfs there is no way to replace contents while maintaining metadata, so=
 the approach taken on the path was to remove the different fstab logic for=
 those fstypes and also use the same modified cp command. Reviewing the bui=
lds I did it seems to work for all of the fstypes.

Another problem is that the timestamp applied to fstab is not the same as e=
very other file. It seems like the `SOURCE_DATE_EPOCH` variable goes to the=
 fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
Since you are using that variable everywhere, it is not the same value as `=
 REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.conf` that is=
 applied in every other file.

Daniel Andrade (1):
  wic: Content of the temporary updated fstab should be copied into the
    original not replacing it entirely.

 meta/conf/bitbake.conf                   |  4 +++-
 scripts/lib/wic/partition.py             | 15 +--------------
 scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
 3 files changed, 6 insertions(+), 17 deletions(-)
</pre>
      </blockquote>
      <pre>Hi Daniel,

Thanks for your patch.

It looks like it is breaking a test:

2025-09-04 15:28:11,112 - oe-selftest - INFO - wic.Wic.test_no_fstab_update=
 (subunit.RemotedTestCase)
2025-09-04 15:28:11,113 - oe-selftest - INFO -  ... FAIL
...
2025-09-04 15:28:11,114 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib=
/oeqa/selftest/cases/wic.py&quot;, line 859, in test_no_fstab_update
    self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
  File &quot;/usr/lib/python3.12/unittest/case.py&quot;, line 885, in asser=
tEqual
    assertion_func(first, second, msg=3Dmsg)
  File &quot;/usr/lib/python3.12/unittest/case.py&quot;, line 1251, in asse=
rtMultiLineEqual
    self.fail(self._formatMessage(msg, standardMsg))
  File &quot;/usr/lib/python3.12/unittest/case.py&quot;, line 715, in fail
    raise self.failureException(msg)
AssertionError: &#39;af3c087d6c9131735c8d1f270a226892&#39; !=3D &#39;9edb82=
55abd217fdb20e118833afb856&#39;
- af3c087d6c9131735c8d1f270a226892
+ 9edb8255abd217fdb20e118833afb856

<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/2412" target=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie/#/=
builders/23/builds/2412</a>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/2268" target=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie/#/=
builders/35/builds/2268</a>

Can you fix it please?</pre>
    </blockquote>
    Ping?<br>
    <br>
    I think this is being tracked by:<br>
    <br>
    <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15947" t=
arget=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15947<=
/a><br>
    <p><span id=3D"m_3677165041292214476summary_container"><span id=3D"m_36=
77165041292214476short_desc_nonedit_display">&quot;WIC does not preserve
          metadata when updating fstab&quot;</span></span></p>
    <p><span id=3D"m_3677165041292214476summary_container"><span id=3D"m_36=
77165041292214476short_desc_nonedit_display">Btw, we were just following
          the &quot;Need Info&quot; process during the bug review meeting<b=
r>
          so that&#39;s why I&#39;m sending this email.</span></span></p>
    <p><span id=3D"m_3677165041292214476summary_container"><span id=3D"m_36=
77165041292214476short_desc_nonedit_display">../Randy<br>
        </span></span></p>
    <br>
    <blockquote type=3D"cite">
      <pre>Thanks,
Mathieu

</pre>
      <br>
      <fieldset></fieldset>
      <pre>

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

</blockquote></div>

--00000000000093552a063eabddb4--

