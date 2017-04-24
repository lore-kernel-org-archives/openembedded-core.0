Return-Path: <minipada@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id C26D877A65
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 13:36:34 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id j127so38425311vkh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=bGHWq9SqkvvHgc+sMFKV53RCVQCa45Xwgzv4yDn26Pg=;
	b=p+/8ZInbeCvDtBfgBnjXZEo/+TSeD61Gg/1O8FIoUwcUPXButejRkjkCNAsqCYyi/M
	TK+eRX2LKKEow2FigC9P5BMsqsabvlwyKAb4GouYXLShrwQ4LrFsAASjaD9nWAsWSsdn
	lDrekgH3AYWeQXlHlzHhc9We1ohMhilwxjlTlVZlkB6p1JgVfH46o/8YfkgOaMNd7iRD
	xZgJjfQJsKzkUqvMpW8pUaX3VT4wgYVUWttgoxxxhcrEpgL28SzTvtv5fynLvIjjJ8XI
	/f/sjIPk+U04xV624iOZCpjAA0xEHNPPUzfKRzWhRWNceIU2vUjVrOv69XU5QLAMGoMT
	q5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=bGHWq9SqkvvHgc+sMFKV53RCVQCa45Xwgzv4yDn26Pg=;
	b=GJ4/vY91MWEx5UKf8X3fg0NhQTgEEHVK9X7IbWVO1msidz7iBZ0fMzaBkoVgElYW2G
	wnYNMau1x7/gxzxIXFdZHDs3qukF9Tx/C9p45oz7lqDiLRKP6iUj8CARAOuI6yD2iPAs
	H+OljM713Fo4TnNo8JfMksnXK9xrpNasjAepAe2RRK0zC82OUoqPw/e1mZQMK/CYa085
	kzXTNW54i+rirIfi1OZCsqb6GjYUH0k1S2hej8tvaXaLTllZ/Z020wI2U6CoQI5WeWuT
	GIRq7TXYwyNPIOdGUalilkDxnSAU+9mBswjbz5CUyYGgQxDPU2t5+3GppEuK3zCdMnE5
	WMPw==
X-Gm-Message-State: AN3rC/5sylLyWE04Cwn/qAz6zyfNHNVRIseAQ8ZAg8B0ZMcWnnPFz5sq
	X6MVJBSrvTnGyyvkJIyNIszVzJXtYHUf
X-Received: by 10.31.181.141 with SMTP id e135mr2245794vkf.23.1493040995963;
	Mon, 24 Apr 2017 06:36:35 -0700 (PDT)
MIME-Version: 1.0
From: david bensoussan <minipada@gmail.com>
Date: Mon, 24 Apr 2017 13:36:25 +0000
Message-ID: <CALxi_JEEcpVbqSuaUbqd-GrNw7jdn2JU196tofw3jYHtowhMGw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Add LAPACK/ATLAS/BLAS library to OE-CORE
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
X-List-Received-Date: Mon, 24 Apr 2017 13:36:43 -0000
Content-Type: multipart/alternative; boundary=001a11439e3e331928054de9b2a3

--001a11439e3e331928054de9b2a3
Content-Type: text/plain; charset=UTF-8

Hello,
Sorry for the long mail, it is my first one to the mailing list.
I am working with a raspberrypi 3 since some time and some packages I work
with on ROS (e.g cartographer) need ATLAS library and its dependencies.

This library cannot be cross compiled as precised in Q3 here
<http://www.vesperix.com/arm/atlas-arm/faq/index.html>.
I was thinking of creating recipes for all of them and make a PR in meta-oe.

Since the .a and .so cannot be compiled by Yocto and varies for each
architecture, I can compile them on the target hardware and provide them in
the recipe afterwards. I was thinking of including them as:
libblas-raspberrypi3.a, libatlas-raspberrypi3.a etc.

And in the recipe, having empty configure and compile steps and in the
install, lines as:
install -m 0644 ${WORKDIR}/libblas-${MACHINE}.a ${D}${libdir}/libblas.a

The recipe would also include a COMPABILE_MACHINE tag to warn users of
recipe limitations.
The advantage is everyone would be able to add its own machine and it will
not break.

What do you think of this? Should I go for it this way?

Thanks,
Regards,
David Bensoussan - Synapticon
-- 

*David bensoussan*
Roboticist / Embedded Software Engineer
------------------------------

*Synapticon* | Robotic Control Systems
Mobile: 004915779804515 / 0033659971070

--001a11439e3e331928054de9b2a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br>Sorry for the long mail, it is my first one to t=
he mailing list.<br>I am working with a raspberrypi 3 since some time and s=
ome packages I work with on ROS (e.g cartographer) need ATLAS library and i=
ts dependencies.<br><br>This library cannot be cross compiled as precised i=
n Q3<span class=3D"inbox-inbox-Apple-converted-space">=C2=A0</span><a href=
=3D"http://www.vesperix.com/arm/atlas-arm/faq/index.html">here</a>.<div><di=
v>I was thinking of creating recipes for all of them and make a PR in meta-=
oe.<br><br>Since the .a and .so cannot be compiled by Yocto and varies for =
each architecture, I can compile them on the target hardware and provide th=
em in the recipe afterwards. I was thinking of including them as:<br>libbla=
s-raspberrypi3.a, libatlas-raspberrypi3.a etc.</div><div><br></div><div>And=
 in the recipe, having empty configure and compile steps and in the install=
, lines as:<br>install -m 0644 ${WORKDIR}/libblas-${MACHINE}.a ${D}${libdir=
}/libblas.a<br><br></div><div>The recipe would also include a COMPABILE_MAC=
HINE tag to warn users of recipe limitations.<br>The advantage is everyone =
would be able to add its own machine and it will not break.<br><br>What do =
you think of this? Should I go for it this way?<br><br>Thanks,<br>Regards,<=
br>David Bensoussan - Synapticon</div></div></div><div dir=3D"ltr">-- <br><=
/div><div data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p id=3D"inbo=
x-inbox-inbox-inbox-inbox-person-name" style=3D"box-sizing:border-box;font-=
family:arial,helvetica,sans-serif;font-size:13.3333px;color:rgb(0,0,0);padd=
ing:0px;margin:1em 0px"><strong style=3D"box-sizing:border-box">David benso=
ussan</strong><br style=3D"box-sizing:border-box">Roboticist / Embedded Sof=
tware Engineer</p><hr style=3D"box-sizing:border-box;margin:0px;padding:0px=
;height:1px;background:rgb(229,27,65);border:none;color:rgb(17,17,17);font-=
family:arial,helvetica,sans-serif;font-size:13.3333px"><p id=3D"inbox-inbox=
-inbox-inbox-inbox-tag-line" style=3D"box-sizing:border-box;font-family:ari=
al,helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);padding:0px;margin:=
1em 0px"><strong style=3D"box-sizing:border-box">Synapticon</strong><span c=
lass=3D"inbox-inbox-inbox-inbox-inbox-Apple-converted-space">=C2=A0</span>|=
 Robotic Control Systems</p><table cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"box-sizing:border-box;font-family:arial,helvetica,sans-serif;font-size=
:13.3333px;color:rgb(17,17,17);padding:0px"><tbody style=3D"box-sizing:bord=
er-box"><tr style=3D"box-sizing:border-box"><td style=3D"box-sizing:border-=
box;color:rgb(0,0,0);padding:0px 15px 3px 0px">Mobile:</td><td style=3D"box=
-sizing:border-box;color:rgb(0,0,0);padding:0px 15px 3px 0px">0049157798045=
15 / 0033659971070<br></td></tr><tr style=3D"box-sizing:border-box"><td sty=
le=3D"box-sizing:border-box;color:rgb(0,0,0);padding:0px 15px 3px 0px"><br>=
</td><td style=3D"box-sizing:border-box;color:rgb(0,0,0);padding:0px 15px 3=
px 0px"><br></td></tr></tbody></table></div></div>

--001a11439e3e331928054de9b2a3--
