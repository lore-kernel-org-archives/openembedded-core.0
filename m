Return-Path: <alan.kozlay@ves.solutions>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 283027DC12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 13:23:23 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id z5so5166762pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ves-solutions-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=70vkXpQFUeGXIhih/MjoTyXkVssQHLzRQnZNMGq33tU=;
	b=Mn42zO9xhU03ehfW0n2NYva3sOdQc95OA2+YYGMwhfcx5SPHdgCb+BjL61qUasLDNL
	gMN4geY/avkG8KbKSvyYm2aio9Y3qExBh2OVrpoa8gNIIomo7ax9q0CMgGBEMPGiH+sv
	TommR40HAFDo7YROi0juPUbMJi8ulhLgq+Y8euQGzQ633kK55IefA3pXmO8RUPSg19bI
	3q3mruZE/SXl4fgGGsfFmYqNnpQvisSXUnaBsr/o8u0X520UbIAGRAaRPIM5XMDMmhDq
	qQ1kBje3zQlce7XmmXGCvGQpKnRQMtryF05lLBgJ7R2qC7xgYpDgqSiCZpF39p0Q/wTW
	S9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=70vkXpQFUeGXIhih/MjoTyXkVssQHLzRQnZNMGq33tU=;
	b=lCH69oJT6I6gz3jBb15H/y9ruImgF43CVlWOdl0vd1g0lBmFsB/sLkCH4GUojbcIik
	gsGkCBcrV4/je92YCjUDIGrqWc614qfBJte7Jd/jaZdvloD25+ejPvzfCXdnEK6Y/Urx
	SckDN6lQvjNPuddJhh+ruOAAlT5yGS59RQ4YgNtBKDzLWPZivct6oPdDY+uEoY7bCXbt
	F7AoQIBsMFaTQ5LpRppfZa1oyPhbklR7uZrgMQx6GimPvrZujGJwxSDaUY8szGmrwnXY
	T1eWk+48WVj8jOOT0871C0RUnDFS61AN0BiVoa+EthuMn5D0abkxetmFpc1W2QfYzzMo
	WlyA==
X-Gm-Message-State: APjAAAVdLyEfIO+UuAFFTnCD7HpYjG+/r4vrkd90D1dtwVkLYtMj4irf
	JctanCWAJ8gyausq7OWiNKW1wQmjY6YHACh/l9ltmMadD7U=
X-Google-Smtp-Source: APXvYqxBxYZNqw8Akc4vGHVPsn83D9TrlmCmoLeQ6HZRtPP5/OfZaRYtAyvfDd75QjnP76YwygVJs5b5zX1Npxf65Yo=
X-Received: by 2002:a62:19c3:: with SMTP id 186mr57753840pfz.172.1555075403669;
	Fri, 12 Apr 2019 06:23:23 -0700 (PDT)
MIME-Version: 1.0
From: Alan Kozlay <alan.kozlay@ves-solutions.com>
Date: Fri, 12 Apr 2019 09:22:47 -0400
Message-ID: <CAJE9sGkSBxjwAr2yr2NQy=k78yvOGY1hpEKDhE4acmxsCLZdxg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: xserver-xorg.inc and sysconfdir setting
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
X-List-Received-Date: Fri, 12 Apr 2019 13:23:23 -0000
Content-Type: multipart/alternative; boundary="00000000000008f91c0586553533"

--00000000000008f91c0586553533
Content-Type: text/plain; charset="UTF-8"

Maintainers,

I needed Xorg to run as non-root from a non-console user on a machine which
needed the intel chipset drivers.

Eventually, I made a bbappend for xserver-xorg and added
"--enable-suid-wrapper" to EXTRA_OECONF.

This was supposed to allow me to provide an /etc/X11/Xwrapper.config in
which I could let Xorg know that the user is not a "console" user (not a
logged-in user).  But my Xwrapper.config was ignored.

Upon strace of Xorg, I found that Xorg was looking for the existence of
such a config file in /etc/X11/X11/Xwrapper.config.  This is because the
xserver-xorg.inc file adds "--sysconfdir=/etc/X11" to EXTRA_OECONF.

Xorg source code already appends "/X11/" to ${sysconfdir} when looking for
this file.
I wonder what other files Xorg might be not finding because of that setting.
I wonder why sysconfdir was set, at all.

-Alan

--00000000000008f91c0586553533
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Maintainers,</div><div><br></div><div>I needed X=
org to run as non-root from a non-console user on a machine which needed th=
e intel chipset drivers.</div><div><br></div><div>Eventually, I made a bbap=
pend for xserver-xorg and added &quot;--enable-suid-wrapper&quot; to EXTRA_=
OECONF.</div><div><br></div><div>This was supposed to allow me to provide a=
n /etc/X11/Xwrapper.config in which I could let Xorg know that the user is =
not a &quot;console&quot; user (not a logged-in user).=C2=A0 But my Xwrappe=
r.config was ignored.</div><div><br></div><div>Upon strace of Xorg, I found=
 that Xorg was looking for the existence of such a config file in /etc/X11/=
X11/Xwrapper.config.=C2=A0 This is because the xserver-xorg.inc file adds &=
quot;--sysconfdir=3D/etc/X11&quot; to EXTRA_OECONF.</div><div><br></div><di=
v>Xorg source code already appends &quot;/X11/&quot; to ${sysconfdir} when =
looking for this file.</div><div>I wonder what other files Xorg might be no=
t finding because of that setting.</div><div>I wonder why sysconfdir was se=
t, at all.</div></div><div><br></div><div>-Alan</div><div><br></div><input =
name=3D"virtru-metadata" type=3D"hidden" value=3D"{&quot;email-policy&quot;=
:{&quot;state&quot;:&quot;closed&quot;,&quot;expirationUnit&quot;:&quot;day=
s&quot;,&quot;disableCopyPaste&quot;:false,&quot;disablePrint&quot;:false,&=
quot;disableForwarding&quot;:false,&quot;enableNoauth&quot;:false,&quot;exp=
ires&quot;:false,&quot;isManaged&quot;:false},&quot;attachments&quot;:{},&q=
uot;compose-id&quot;:&quot;1&quot;,&quot;compose-window&quot;:{&quot;secure=
&quot;:false}}"></div>

--00000000000008f91c0586553533--
