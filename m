Return-Path: <avery.brian@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1930777040
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 21:20:40 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id m101so282653795ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 14:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=IDu/CE4eyTIMbhchAELKzJKA78e7ZQPICHouUdtWhy8=;
	b=ZHfTbwZvDEeQpONjXGv4ExOgRXUb7DAIFwwMKDa6CqTq9OW5fHhCKWHgH97+l9I7nc
	H5/+zeio5phGrYRwWwjHuSEaLFXIASWVcnSJU2VOFtYAm9ATGVmrfUgGEzensIez1J+C
	Z7KiXFJ1B+eYe7h7uP6rQZ0EsM2akNf/6qL/25ZHLmqLMweHBR255CqXvvzjjX21TCjg
	EKZwY8PK2BlWb5kwFD7EC0ivogihs4Oy1UEe+0IWxgzrWeyUt7vA0hKlSjxSyJwNgH3n
	mTOdvA6PXPz678EZj8v9ukHPKwjm7ar2VRWr8jnr/1zqZty7W4/6Jh5xxu7Fzn7+7WOe
	6uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=IDu/CE4eyTIMbhchAELKzJKA78e7ZQPICHouUdtWhy8=;
	b=XTs+KoJRlpCDM2Dac86lwMEIUPVifwu6fjuDFyAVFTVEn0LxrXQY2ZoV6maiG/ggrJ
	0YukPHy4LGdiiPyP17od6yroRnL0T+0rXqkBd6TVahQS1icwVPIqCAU5uH3n8qW4BKgO
	t4IgebNqChQ3QHzxpXE8oJeX7C8VIqgqwF2ieszL17Q3TlsOuEyxrGRI2+NUG/jJ6MJH
	23gwralIQsC9NpSYx2mHW1/gmaEUSpfD3yAIiOC4Da/LNob71dDKfL9tlassDbKXlbFx
	ahdaHX/xR0v3zIHpPEZwoIG3Le/VUOq6pMrcSMw7CJnUZlXq1Ye1ualdaMFNXD2c1bpa
	rIpQ==
X-Gm-Message-State: AEkoouvdHWfHuipU79TOD9wolsR6+hUpUp38ZD+ELe/80b+MdHLjlqS9eNWp7Fy4SsaZERpdpazqW30PbIk9Nw==
X-Received: by 10.107.151.143 with SMTP id z137mr73094242iod.191.1470345641105;
	Thu, 04 Aug 2016 14:20:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.35 with HTTP; Thu, 4 Aug 2016 14:20:40 -0700 (PDT)
From: Brian Avery <avery.brian@gmail.com>
Date: Thu, 4 Aug 2016 14:20:40 -0700
Message-ID: <CAKV_0einF1siokeL5FFx2jLbwAk6xYSnb42fCZ75wpfQ3MbqRw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: RFC: eclipse debug functionality issue
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
X-List-Received-Date: Thu, 04 Aug 2016 21:20:41 -0000
Content-Type: multipart/alternative; boundary=001a11402c90a29e9105394585d0

--001a11402c90a29e9105394585d0
Content-Type: text/plain; charset=UTF-8

The core issue:
The busybox resize command breaks the eclipse ssh debug stream.  This is
because the resize command for busybox sends a set of cursor control escape
sequences to stderr. The resize cfg was added to Krogoth and is still in
master.  The point of resize is to set the environment and terminal
settings to the current xterm window size.

Additional complexity:
eclipse-debug is an IMAGE_FEATURE.  If it is turned on by a user in
local.conf via EXTRA_IMAGE_FEATURES then I can conditionally turn off
busybox/resize in the cfg file.  Unfortunately, if a user makes a new image
with IMAGE_FEATURES += " eclipse-debug " in it, I do not see this from the
scope of the busybox##.bb recipe.

So, there are a couple of ways to solve this and I'm not sure which is the
best one.

1) conditionally turn off the resize.cfg if eclipse-debug is in
extra-image-features.  Also, make a rm_resize.bbclass to rm the
usr/bin/resize from the rootfs in a do_rootfs[postfuncs] which can be
inherited by the various sdk images we build.

This is problematic since if a user makes a new image recipe of their own
and includes eclipse-debug but doesn't inherit the rm_resize.bbclass
eclipse debug will fail.

2) elevate eclipse-debug to a distro feature which would make it visible to
the busybox###.bb recipe.  Unfortunately, it is really an image specific
set of packages to be included so elevating it doesn't seem reasonable.

3)   use the update-alternatives method (busybox is currently doing this
for syslog) to make a separate busybox-resize package and make an eclipse
friendly resize package that is empty and add the eclipse one to the
eclipse-debug packagegroup.

4) Just turn off resize or patch it so it doesn't try to control the cursor
via escape sequences sent to stderr but still sets up the environment.
It's worth noting that the ubuntu  resize doesn't send escape sequences to
any of the streams.

5) Something else?

Thanks,
Brian
an Intel employee

--001a11402c90a29e9105394585d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The core issue:<div>The busybox resize command breaks the =
eclipse ssh debug stream.=C2=A0 This is because the resize command for busy=
box sends a set of cursor control escape sequences to stderr. The resize cf=
g was added to Krogoth and is still in master.=C2=A0 The point of resize is=
 to set the environment and terminal settings to the current xterm window s=
ize.</div><div><br></div><div>Additional complexity:</div><div>eclipse-debu=
g is an IMAGE_FEATURE.=C2=A0 If it is turned on by a user in local.conf via=
 EXTRA_IMAGE_FEATURES then I can conditionally turn off busybox/resize in t=
he cfg file.=C2=A0 Unfortunately, if a user makes a new image with IMAGE_FE=
ATURES +=3D &quot; eclipse-debug &quot; in it, I do not see this from the s=
cope of the busybox##.bb recipe.</div><div><br></div><div>So, there are a c=
ouple of ways to solve this and I&#39;m not sure which is the best one.</di=
v><div><br></div><div>1) conditionally turn off the resize.cfg if eclipse-d=
ebug is in extra-image-features.=C2=A0 Also, make a rm_resize.bbclass to rm=
 the usr/bin/resize from the rootfs in a do_rootfs[postfuncs] which can be =
inherited by the various sdk images we build.</div><div><br></div><div>This=
 is problematic since if a user makes a new image recipe of their own and i=
ncludes eclipse-debug but doesn&#39;t inherit the rm_resize.bbclass eclipse=
 debug will fail.</div><div><br></div><div>2) elevate eclipse-debug to a di=
stro feature which would make it visible to the busybox###.bb recipe.=C2=A0=
 Unfortunately, it is really an image specific set of packages to be includ=
ed so elevating it doesn&#39;t seem reasonable.</div><div><br></div><div>3)=
 =C2=A0 use the update-alternatives method (busybox is currently doing this=
 for syslog) to make a separate busybox-resize package and make an eclipse =
friendly resize package that is empty and add the eclipse one to the eclips=
e-debug packagegroup.</div><div><br></div><div>4) Just turn off resize or p=
atch it so it doesn&#39;t try to control the cursor via escape sequences se=
nt to stderr but still sets up the environment.=C2=A0 It&#39;s worth noting=
 that the ubuntu =C2=A0resize doesn&#39;t send escape sequences to any of t=
he streams.</div><div><br></div><div>5) Something else?</div><div><br></div=
><div>Thanks,</div><div>Brian</div><div>an Intel employee</div><div><br></d=
iv><div>=C2=A0</div></div>

--001a11402c90a29e9105394585d0--
