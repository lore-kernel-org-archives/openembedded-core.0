Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16C8FCC9AE
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 02:14:31 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31316.1773108863247439226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 19:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=PrE0aTwF;
 spf=pass (domain: limonsoftware.com, ip: 74.125.224.44, mailfrom: anibal@limonsoftware.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso11766699d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 19:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773108862; cv=none;
        d=google.com; s=arc-20240605;
        b=WPp4X8JgJxAZPZqqrXo9GXZjLJdDm57wWTDI4DC6yg13jxKNKkenqPy/F9V4u2bsvj
         uouZ5H8nNFJhixknkUJ8vu6kQgUfMcgtdO1xrrV0nj5zvaQgFjDilygf/gERO8aMCE7p
         p1dnce9PDhcZO393HJjQY/otfGvyL2k4gFpgIW9U6Af47aEijl7WysM1fXED4uHdRnaf
         3sPBK6g5Fs1GSwMKj9MROQxp9+scUUh1EBt5UR4A36qH0t7zs23OfiH/Gf5NMmB8qCfr
         ZJvYneW6yGANdXYRGgfl6Dq5xVPrzwmLn9dc8NenjeiwCr43jrEGgavRr8EtAKiRu1fI
         sFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FCT71BxSt3KY/cKnc/NA5kOybV6SPPgdkyON+ig6pxU=;
        fh=WWoWIOy4wFZP2hbfLunPvh6OdN0gfMIoWX56HdMQagk=;
        b=gMV8hC2PKVqHBp7XGMxhPfBCirNgHuhNvr0hVs3P+7qYwnC95jqP5C6i+k6rnDW9bT
         6vYNEMcAKz5buB/cACmqRVZdVxRkCnehco0CWkwVEobpsRk+QxRos8wujFe+fNBj6Ppw
         KwTuyXfInx4l/GACFCgJNrrPClNNdxcT3tZR6ndB0w9GzawYK2cU5MbeI6ItbEInIX9u
         FHiWOEdHDAy+R+FtJnEIkjaiQL/ZgmJ3ioZ6sdSj+RRWC+dqpDwbYsxvIQLDzR3X97UI
         Qqru4UFGbLPIlomD3V+IgaIhvHEgBvPmJVoKWtlBiVriQCq7mBoeRWWOpw5/vMRaFMuK
         wXnQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1773108862; x=1773713662; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FCT71BxSt3KY/cKnc/NA5kOybV6SPPgdkyON+ig6pxU=;
        b=PrE0aTwFxnz3OOJeybi2dCiymLp6+BAoWPbkxq9A/RR6p830I8CTlyFwekPdvORmqr
         dfZFJIgS7ps7ex54od80Ob0Vp+UGQWIeEIqwmN9DuxjUhARhBssKRgMKPG0eAw0Dwyv3
         VEKHbH7FoXr+mk65AilWFc4d/Sr1lp4k2mfzSzrdNRaFN0oorjpTgYxWJgnNjd8sSjSA
         vv27jXVppkVUA3Tv5wQm/PwlvhLVwZ+CwA7jI0DkJA5SImmpjB2gkV00zJrr9Dn4xlZS
         0zl08SFzdDBVCK/xibmzbJo0hgpQPvvvsXyET03bQG+dg5cpFijV+g/9AB9hjmgW7+BE
         eoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773108862; x=1773713662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCT71BxSt3KY/cKnc/NA5kOybV6SPPgdkyON+ig6pxU=;
        b=wIpYKcLG1A2SVYWjBLfAWAqDPq8zpz6SuVZ9+4v8PuXzAmCzkLqkVelgsp6sNd2eix
         a9PdC6RcGmbzUk6PlabTw57FMjwXLTo+L8GNiqwlaju/uhk2hTGoHO/ZT6JBckYdFG7m
         7wiWG0BodssVun8RDWWp8Bwt4D7n73Alw6NF9626Bsz6BEqOZ/LG7t/nMFheWO6zy3Im
         NQqk+Q9oYm/jWIvEfJfcQe7gVHY1QR+5BCV1B3AMcm+ExJfb97eo+PhygqCzarDvDz9E
         m9C0T+1zsKGs2+vJveWGE3cv13XuTHtvJ59LKmRUM1cyT5wTZn8eNoX71RcM/bUJn5wT
         SPxw==
X-Gm-Message-State: AOJu0YzZPsnCQfhxIL/oxPufF3u/aR6/xaEcgTjbSRZxrletTI+9leS8
	+MGBD3txHPF3E/Rq4ETunhx2OG40ojrDHfx0xCHuheeStdHDTZE09nZjio+QyTLe0o0PnFKFjhy
	lmAZ5CVhknXbKCxSBikbdvSPwuygduPwYroSHaEOWCw==
X-Gm-Gg: ATEYQzw13CuWogoMoYyiBYX8m6dDmNPpb+/9qXIuYI7P50VOn1IMqWapTdo4yHAhZWZ
	ZMRhVcmeD4G7ycogOIR7fVkPfzerp/MQp2GrZ1iSsDuEmYicftte9ekOfWN8hCH25pBMyUZu1rr
	PUeM27aq8SUUXCMdnclLPjsrO3CGUNrmLF4Z2E5ovHdcbKJtUss3Hv0F7BHxkVYrbV9SBBmMuYe
	baC0038F3WRjj0EnTlXKprIP7aNeW2XU++bIM+TCaV/P/8I0Z0Z5YKqnkGdJOUOZ4gjf2JT2yFP
	mbAwQxrvXVqnEhxs+CDD2WSZ+3drxMMQ+CkTpyezMrm3Jke5EZJ6VjVcGx5zz7oB54+AkA==
X-Received: by 2002:a05:690e:1186:b0:64a:db39:f010 with SMTP id
 956f58d0204a3-64d13e0e10dmr14617980d50.0.1773108862238; Mon, 09 Mar 2026
 19:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260304184156.2025539-1-richard.purdie@linuxfoundation.org>
 <DGVOBJODEHCK.15P1KY3F0CAFC@bootlin.com> <3ffcb3c8167d44ef76d9c4f633fe17b93ae2e15c.camel@linuxfoundation.org>
In-Reply-To: <3ffcb3c8167d44ef76d9c4f633fe17b93ae2e15c.camel@linuxfoundation.org>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Mon, 9 Mar 2026 20:14:11 -0600
X-Gm-Features: AaiRm516TPDlC7MlTww5utpnln1e45R6CoIYF_G8bjjyvyzrDan8HfEunFGLFmQ
Message-ID: <CAOU5ZMvVSf_Rvt1Ab_PtHd1RLST366YMA8h=FSsJV6XkuymvAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] oeqa/runtime/ptest: Use a timeout with
 command, remove disabling
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: multipart/alternative; boundary="000000000000e1cfc9064ca21337"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 02:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232758

--000000000000e1cfc9064ca21337
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have pushed the ptest-runner fix with the tag v2.5.1. The Automatic
Upgrade Helper (AUH) should pick it up shortly.

Cheers!,
Anibal

On Sat, Mar 7, 2026 at 4:52=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2026-03-06 at 12:47 +0100, Mathieu Dubois-Briand wrote:
> > On Wed Mar 4, 2026 at 7:41 PM CET, Richard Purdie via
> lists.openembedded.org wrote:
> > > A simple 'which' call doesn't need the timeout disabling. This was
> likely
> > > a copy and paste error and can be removed.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/lib/oeqa/runtime/cases/ptest.py | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/lib/oeqa/runtime/cases/ptest.py
> b/meta/lib/oeqa/runtime/cases/ptest.py
> > > index 1a0782374d0..2887e136719 100644
> > > --- a/meta/lib/oeqa/runtime/cases/ptest.py
> > > +++ b/meta/lib/oeqa/runtime/cases/ptest.py
> > > @@ -35,7 +35,7 @@ class PtestRunnerTest(OERuntimeTestCase):
> > >          self.do_ptestrunner()
> > >
> > >      def do_ptestrunner(self):
> > > -        status, output =3D self.target.run('which ptest-runner', 0)
> > > +        status, output =3D self.target.run('which ptest-runner')
> > >          if status !=3D 0:
> > >              self.skipTest("No -ptest packages are installed in the
> image")
> > >
> >
> > Hi Richard,
> >
> > I believe this is causing some ptest failures on riscv64:
> >
> > Traceback (most recent call last):
> >   File
> "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembedded-=
core/meta/lib/oeqa/core/decorator/__init__.py",
> line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   File
> "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembedded-=
core/meta/lib/oeqa/core/decorator/__init__.py",
> line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   File
> "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembedded-=
core/meta/lib/oeqa/core/decorator/__init__.py",
> line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   File
> "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembedded-=
core/meta/lib/oeqa/runtime/cases/ptest.py",
> line 27, in test_ptestrunner_expectfail
> >     self.do_ptestrunner()
> >   File
> "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembedded-=
core/meta/lib/oeqa/runtime/cases/ptest.py",
> line 63, in do_ptestrunner
> >     status, output =3D self.target.run('ptest-runner -t {} -d
> \"{}\"'.format(ptest_timeout, ' '.join(ptest_dirs)),
> timeout=3Dint(ptest_timeout)+30)
> >
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   File
> "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembedded-=
core/meta/lib/oeqa/core/target/ssh.py",
> line 98, in run
> >     status, output =3D self._run(sshCmd, processTimeout, ignore_status,
> raw, ignore_ssh_fails)
> >
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   File
> "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembedded-=
core/meta/lib/oeqa/core/target/ssh.py",
> line 70, in _run
> >     raise AssertionError("ssh exited with status '255' for command "
> > AssertionError: ssh exited with status '255' for command '['ssh', '-l',
> 'root', '-o', 'ServerAliveCountMax=3D2', '-o', 'ServerAliveInterval=3D30'=
,
> '-o', 'UserKnownHostsFile=3D/dev/null', '-o', 'StrictHostKeyChecking=3Dno=
',
> '-o', 'LogLevel=3DERROR', '192.168.7.14', 'export
> PATH=3D/usr/sbin:/sbin:/usr/bin:/bin; ptest-runner -t 450 -d "/usr/lib"']=
':
> this is likely an SSH failure
> >
> > Process killed - no output for 480 seconds. Total running time: 485
> seconds.
> >
> > Cannot run ptests without @expectedFailure as ptests are expected to fa=
il
> > WARNING: core-image-ptest-dpkg-1.0-r0 do_testimage: Can not retrieve
> artifacts from test target: Error while fetching compressed artifacts
> >
> > And similar errors:
> >
> > WARNING: core-image-ptest-coreutils-1.0-r0 do_testimage: Can not
> retrieve artifacts from test target: Error while fetching compressed
> artifacts
> > Cannot run ptests without @expectedFailure as ptests are expected to fa=
il
> >
> > WARNING: core-image-ptest-gettext-1.0-r0 do_testimage: Can not retrieve
> artifacts from test target: Error while fetching compressed artifacts
> > Cannot run ptests without @expectedFailure as ptests are expected to fa=
il
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1182
>
> Thanks. I think this has lead to an interesting discovery of an
> additional issue in ptest-runner with buffering of logs when used non-
> interactively.
>
> I've sent a patch to ptest-runner which I believe will address this
> issue.
>
> Cheers,
>
> Richard
>
>

--000000000000e1cfc9064ca21337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I have pushed the ptest-=
runner fix with the tag v2.5.1. The Automatic Upgrade Helper (AUH) should p=
ick it up shortly.</div><div><br></div><div>Cheers!,</div><div>Anibal</div>=
</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, Mar 7, 2026 at 4:52=E2=80=AFAM Richard Purdie=
 &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@l=
inuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Fri, 2026-03-06 at 12:47 +0100, Mathieu Dubois-Briand =
wrote:<br>
&gt; On Wed Mar 4, 2026 at 7:41 PM CET, Richard Purdie via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt; &gt; A simple &#39;which&#39; call doesn&#39;t need the timeout disabl=
ing. This was likely<br>
&gt; &gt; a copy and paste error and can be removed.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/lib/oeqa/runtime/cases/ptest.py | 2 +-<br>
&gt; &gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa=
/runtime/cases/ptest.py<br>
&gt; &gt; index 1a0782374d0..2887e136719 100644<br>
&gt; &gt; --- a/meta/lib/oeqa/runtime/cases/ptest.py<br>
&gt; &gt; +++ b/meta/lib/oeqa/runtime/cases/ptest.py<br>
&gt; &gt; @@ -35,7 +35,7 @@ class PtestRunnerTest(OERuntimeTestCase):<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.do_ptestrun=
ner()<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 def do_ptestrunner(self):<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status, output =3D se=
lf.target.run(&#39;which ptest-runner&#39;, 0)<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status, output =3D se=
lf.target.run(&#39;which ptest-runner&#39;)<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if status !=3D 0=
:<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 self.skipTest(&quot;No -ptest packages are installed in the image=
&quot;)<br>
&gt; &gt; =C2=A0<br>
&gt; <br>
&gt; Hi Richard,<br>
&gt; <br>
&gt; I believe this is causing some ptest failures on riscv64:<br>
&gt; <br>
&gt; Traceback (most recent call last):<br>
&gt; =C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/=
layers/openembedded-core/meta/lib/oeqa/core/decorator/__init__.py&quot;, li=
ne 35, in wrapped_f<br>
&gt; =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^=
^^^^^^^^^^^^<br>
&gt; =C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/=
layers/openembedded-core/meta/lib/oeqa/core/decorator/__init__.py&quot;, li=
ne 35, in wrapped_f<br>
&gt; =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^=
^^^^^^^^^^^^<br>
&gt; =C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/=
layers/openembedded-core/meta/lib/oeqa/core/decorator/__init__.py&quot;, li=
ne 35, in wrapped_f<br>
&gt; =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^=
^^^^^^^^^^^^<br>
&gt; =C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/=
layers/openembedded-core/meta/lib/oeqa/runtime/cases/ptest.py&quot;, line 2=
7, in test_ptestrunner_expectfail<br>
&gt; =C2=A0=C2=A0=C2=A0 self.do_ptestrunner()<br>
&gt; =C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/=
layers/openembedded-core/meta/lib/oeqa/runtime/cases/ptest.py&quot;, line 6=
3, in do_ptestrunner<br>
&gt; =C2=A0=C2=A0=C2=A0 status, output =3D self.target.run(&#39;ptest-runne=
r -t {} -d \&quot;{}\&quot;&#39;.format(ptest_timeout, &#39; &#39;.join(pte=
st_dirs)), timeout=3Dint(ptest_timeout)+30)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; =C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/=
layers/openembedded-core/meta/lib/oeqa/core/target/ssh.py&quot;, line 98, i=
n run<br>
&gt; =C2=A0=C2=A0=C2=A0 status, output =3D self._run(sshCmd, processTimeout=
, ignore_status, raw, ignore_ssh_fails)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; =C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/=
layers/openembedded-core/meta/lib/oeqa/core/target/ssh.py&quot;, line 70, i=
n _run<br>
&gt; =C2=A0=C2=A0=C2=A0 raise AssertionError(&quot;ssh exited with status &=
#39;255&#39; for command &quot;<br>
&gt; AssertionError: ssh exited with status &#39;255&#39; for command &#39;=
[&#39;ssh&#39;, &#39;-l&#39;, &#39;root&#39;, &#39;-o&#39;, &#39;ServerAliv=
eCountMax=3D2&#39;, &#39;-o&#39;, &#39;ServerAliveInterval=3D30&#39;, &#39;=
-o&#39;, &#39;UserKnownHostsFile=3D/dev/null&#39;, &#39;-o&#39;, &#39;Stric=
tHostKeyChecking=3Dno&#39;, &#39;-o&#39;, &#39;LogLevel=3DERROR&#39;, &#39;=
192.168.7.14&#39;, &#39;export PATH=3D/usr/sbin:/sbin:/usr/bin:/bin; ptest-=
runner -t 450 -d &quot;/usr/lib&quot;&#39;]&#39;: this is likely an SSH fai=
lure<br>
&gt; <br>
&gt; Process killed - no output for 480 seconds. Total running time: 485 se=
conds.<br>
&gt; <br>
&gt; Cannot run ptests without @expectedFailure as ptests are expected to f=
ail<br>
&gt; WARNING: core-image-ptest-dpkg-1.0-r0 do_testimage: Can not retrieve a=
rtifacts from test target: Error while fetching compressed artifacts<br>
&gt; <br>
&gt; And similar errors:<br>
&gt; <br>
&gt; WARNING: core-image-ptest-coreutils-1.0-r0 do_testimage: Can not retri=
eve artifacts from test target: Error while fetching compressed artifacts<b=
r>
&gt; Cannot run ptests without @expectedFailure as ptests are expected to f=
ail<br>
&gt; <br>
&gt; WARNING: core-image-ptest-gettext-1.0-r0 do_testimage: Can not retriev=
e artifacts from test target: Error while fetching compressed artifacts<br>
&gt; Cannot run ptests without @expectedFailure as ptests are expected to f=
ail<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/56=
/builds/1182" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/56/builds/1182</a><br>
<br>
Thanks. I think this has lead to an interesting discovery of an<br>
additional issue in ptest-runner with buffering of logs when used non-<br>
interactively.<br>
<br>
I&#39;ve sent a patch to ptest-runner which I believe will address this<br>
issue.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000e1cfc9064ca21337--

