Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1279678384
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 06:48:05 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id l75so1907183ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 23:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=kNHr2TuI/SbqKlvGPK95RrZoeXn/fUXSjbHi3wVgEWE=;
	b=Xk3qkQDu1Jl0vHilA9xkgyRY9QyV9eet0EkpTW+6E7Y0DLfy91DD03/Hxhf8bZLMfS
	/DVvHF3wF5CnqFp7KY6N/faviKp6Ht4xYTc0dPmeQUa8veqBZvShAhHTT03lKgOSF6Xh
	Xy+4Id7i7UxTWn0wSznYu6ABFidNGvjBASCvBpn7WwjM53fB7tKUnZRbD42p3eNYZxqB
	iVfHN4+vii0Zw9+b7xqWoaMXdsbYiXP8dWLyHq0dL7t+/QrclCmBe3/kzL53iwbPT0B4
	N91WAv1Ho+ixkbXR0Sc7NgEL9ipBkiUgblTXz58Bn0/g89EvaJQ/1nV8ydHGZGQzNetm
	yL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=kNHr2TuI/SbqKlvGPK95RrZoeXn/fUXSjbHi3wVgEWE=;
	b=uR/2hNqLsJ/ZaHLvo0i57PLGwLUuJEiZhyPxQfhcXM40ciMj0VVer0jj332A8N3V4s
	7+lNdIc2tzyMiQXly/PttL/8aII1CChrvcC0U8ZU08ttoGql08WILruZIbCRtrvgwe/4
	tXZxbnw2qfunbGJAnKDp+ivt0uCuEptgb08bPP4RyySU5hvIlbMZYbubCfNSFQfhjVa6
	tAq5XrF/IG1Or7CoIP4V51Y4nxTjAbXv0OR0S+lw2X+ZLpgC6yZ3fTGnBYDxu/5ud0I+
	y2yeETg21LxyaTclv6uD8DPW2mEdlO7InfSIBBrkd862RU5AIdsAmWIJ+X4soMb3Sm25
	GAxA==
X-Gm-Message-State: AKS2vOzPOMy0QQgCcBcmTc8KaSE5fO4SJ5utQ/mGV8t+uaqsBJ+M8JC8
	TYEznSqxkys4y71HUH+nPIkL1E4Amkq0
X-Received: by 10.13.200.135 with SMTP id k129mr3092211ywd.243.1497509286893; 
	Wed, 14 Jun 2017 23:48:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Wed, 14 Jun 2017 23:48:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Jun 2017 08:48:06 +0200
Message-ID: <CA+chaQcmksz0eGEwb9RZ9B_7JFaB7e97iNCoWCp84zJEkqpHoA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Never ending stream of bitbake exceptions when the builder runs out of disk space
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
X-List-Received-Date: Thu, 15 Jun 2017 06:48:06 -0000
Content-Type: multipart/alternative; boundary="001a114dbd90181b490551fa0db4"

--001a114dbd90181b490551fa0db4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This issue exists for very long time.

I know that when the builder runs out of disk space there are multiple
things which might go wrong (I've seen bad archives on premirrors, bad
sstate archives caused by this), so this issue isn't the main problem, but
still would be nice to fail faster.

In last build which was running for some 9 hours, it was first building for
maybe 2 hours before it run out of disk space and this morning there is
50MB log just from bitbake output stored on the jenkins master. Repeating
following message very quickly

# grep -c "Errno 28" consoleText.txt
42986

ERROR: Running command [['world'], 'build']
Traceback (most recent call last):
  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line 211,
in fire(event=3D<bb.event.HeartbeatEvent object at 0x7fcfed3e96a0>,
d=3D<bb.data_smart.DataSmart object at 0x7fd00330b198>):

    >    fire_class_handlers(event, d)
         if worker_fire:
  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line 134,
in fire_class_handlers(event=3D<bb.event.HeartbeatEvent object at
0x7fcfed3e96a0>, d=3D<bb.data_smart.DataSmart object at 0x7fd00330b198>):
                         continue
    >            execute_handler(name, handler, event, d)

  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line 106,
in execute_handler(name=3D'runqueue_stats', handler=3D<function runqueue_st=
ats
at 0x7fd0020c6158>, event=3D<bb.event.HeartbeatEvent object at
0x7fcfed3e96a0>, d=3D<bb.data_smart.DataSmart object at 0x7fd00330b198>):
         try:
    >        ret =3D handler(event)
         except (bb.parse.SkipRecipe, bb.BBHandledException):
  File
"/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/buildstats.=
bbclass",
line 212, in runqueue_stats(e=3D<bb.event.HeartbeatEvent object at
0x7fcfed3e96a0>):
             done =3D isinstance(e, bb.event.BuildCompleted)
    >        system_stats.sample(e, force=3Ddone)
             if done:
  File
"/home/jenkins/oe/world/shr-core/openembedded-core/meta/lib/buildstats.py",
line 148, in SystemStats.sample(event=3D<bb.event.HeartbeatEvent object at
0x7fcfed3e96a0>, force=3DFalse):
                                      data +
    >                                 b'\n')
                 self.last_proc =3D now
OSError: [Errno 28] No space left on device

=EF=BF=BCIt would be better to exit completely when something as bad as Err=
no 28
happens.

--001a114dbd90181b490551fa0db4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This issue exists for very long time.</div><div><br><=
/div><div>I know that when the builder runs out of disk space there are mul=
tiple things which might go wrong (I&#39;ve seen bad archives on premirrors=
, bad sstate archives caused by this), so this issue isn&#39;t the main pro=
blem, but still would be nice to fail faster.</div><div><br></div><div>In l=
ast build which was running for some 9 hours, it was first building for may=
be 2 hours before it run out of disk space and this morning there is 50MB l=
og just from bitbake output stored on the jenkins master. Repeating followi=
ng message very quickly</div><div><br></div><div><div># grep -c &quot;Errno=
 28&quot; consoleText.txt=C2=A0</div><div>42986</div></div><div><br></div><=
div>ERROR: Running command [[&#39;world&#39;], &#39;build&#39;]</div><div>T=
raceback (most recent call last):</div><div>=C2=A0 File &quot;/home/jenkins=
/oe/world/shr-core/bitbake/lib/bb/event.py&quot;, line 211, in fire(event=
=3D&lt;bb.event.HeartbeatEvent object at 0x7fcfed3e96a0&gt;, d=3D&lt;bb.dat=
a_smart.DataSmart object at 0x7fd00330b198&gt;):</div><div>=C2=A0 =C2=A0 =
=C2=A0</div><div>=C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0fire_class_handlers(event,=
 d)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if worker_fire:</div><div>=
=C2=A0 File &quot;/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py&q=
uot;, line 134, in fire_class_handlers(event=3D&lt;bb.event.HeartbeatEvent =
object at 0x7fcfed3e96a0&gt;, d=3D&lt;bb.data_smart.DataSmart object at 0x7=
fd00330b198&gt;):</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue</div><div>=C2=A0 =C2=
=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execute_handler(name, han=
dler, event, d)</div><div>=C2=A0 =C2=A0 =C2=A0</div><div>=C2=A0 File &quot;=
/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py&quot;, line 106, in=
 execute_handler(name=3D&#39;runqueue_stats&#39;, handler=3D&lt;function ru=
nqueue_stats at 0x7fd0020c6158&gt;, event=3D&lt;bb.event.HeartbeatEvent obj=
ect at 0x7fcfed3e96a0&gt;, d=3D&lt;bb.data_smart.DataSmart object at 0x7fd0=
0330b198&gt;):</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:</div><div>=
=C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D handler(event)</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except (bb.parse.SkipRecipe, bb.BBHan=
dledException):</div><div>=C2=A0 File &quot;/home/jenkins/oe/world/shr-core=
/openembedded-core/meta/classes/buildstats.bbclass&quot;, line 212, in runq=
ueue_stats(e=3D&lt;bb.event.HeartbeatEvent object at 0x7fcfed3e96a0&gt;):</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done =3D isinstanc=
e(e, bb.event.BuildCompleted)</div><div>=C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0system_stats.sample(e, force=3Ddone)</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if done:</div><div>=C2=A0 File &quot;/hom=
e/jenkins/oe/world/shr-core/openembedded-core/meta/lib/buildstats.py&quot;,=
 line 148, in SystemStats.sample(event=3D&lt;bb.event.HeartbeatEvent object=
 at 0x7fcfed3e96a0&gt;, force=3DFalse):</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data +</div><div>=C2=A0 =C2=A0 &gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b&#39;\n&#39;)</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.last_proc =3D now</div=
><div>OSError: [Errno 28] No space left on device</div><div><br></div><div>=
=EF=BF=BCIt would be better to exit completely when something as bad as Err=
no 28 happens.</div></div>

--001a114dbd90181b490551fa0db4--
