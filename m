Return-Path: <mgloff@emacinc.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id AA7CC607AD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 01:20:52 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id a202so12788627qkg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 18:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emacinc-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=tart3eFN0WJ7cSgLtU8GAYen0dmRlsL99w2oZvk7Ps8=;
	b=xy1+saRbsaR0dLFi98GXVMf/HSgHDQ2smSwkH0obiUMZMygV66992Nl98NVW1YuUJL
	pXPdeaorJMhZmM5iUolbOxYc0CNdkXM2o11fIb5C4TY2MbUqjZMzmv+R8Cg7CjbzWYUz
	e+TD0eVGz6TXLMnqxbPtuGnufeRJPfORukGiCDHNEApt5cC5U4YSAiraGz5i+BZaw6yu
	nWdaNu2vm5KC5I6K8xOUjXseSXNnY7T7YTwgX/wvUAfqz4MpxMHAhmz0WA32uG6Iy1Qj
	21es3SJKyWOX4YA7Abln3/NI/E+fXTh3ACl0QaGW/3owHdsWPC11hE1oWxEOGat4QI3r
	aPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=tart3eFN0WJ7cSgLtU8GAYen0dmRlsL99w2oZvk7Ps8=;
	b=Xr341cqGDcRySjFEOOmhf8Ictw6/FrFk2CmCgkqJMRuPLCVxt34rUa4TiU8IoULdIb
	jJx8sZAV3dewPgYiFBwvxQNV5VWmGJjw4kEy+xaY/ltlvxQT4rCyL2bMytTTj8ORTExS
	Hws5T/DpvXvTlZBx17Vb6CsE571rZJUHSm6o+fMIeEyuyAPd48rZK6b5frq5TJvO5Erg
	SsROmFSljDS769pso6kf7d1K3wIPoacWUt0/df9BeWwzrksXen4i0Sm857yggixrq1tF
	IjGpqUjpQrI2v5RBJ5xK5wphq/FlN7J+3md8q4QOISrJxy0FDWzG0G+67qDP8Pi0+GPV
	+4YA==
X-Gm-Message-State: ALQs6tC6nYa7fVEOw2ASzF9Qgxm+/HMOfVbzY8dMzLwDMDJCb0wXa7Ug
	QZSaA5WAuvXVMsWSFN44+Pqr6PO0f083QGev+5LSpxVL
X-Google-Smtp-Source: AB8JxZrRFNsR3KgXhEs0hfD85WXCbCmP4v6R860NGcpSiHo56O+lNHalXnIzK+gAkj301If6xAnovHzMLBGZrxJWpNQ=
X-Received: by 10.233.230.10 with SMTP id z10mr17561284qkf.365.1525310452771; 
	Wed, 02 May 2018 18:20:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.113 with HTTP; Wed, 2 May 2018 18:20:12 -0700 (PDT)
From: Michael Gloff <mgloff@emacinc.com>
Date: Wed, 2 May 2018 20:20:12 -0500
Message-ID: <CALXw4G79a_yJvV1GrMxVEiVRs0b_RU324yGDy+wZwAV-T4Wj_w@mail.gmail.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: Busybox post install
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
X-List-Received-Date: Thu, 03 May 2018 01:20:52 -0000
Content-Type: multipart/alternative; boundary="f403043b3b2cb5bd97056b430341"

--f403043b3b2cb5bd97056b430341
Content-Type: text/plain; charset="UTF-8"

I am seeing with the latest in Sumo/Master that the busybox post install is
failing to create all of the applet symlinks if there is already a package
installed from another provider during do_rootfs. This can be seen, for
example, when enabling lsattr applet and having e2fsprogs installed into an
image.

The error is:
update-alternatives: Error: not linking /home/developer/oe-test/build_
master/tmp/work/somimx6-emac-linux-gnueabi/emac-image/1.0-r0/rootfs/usr/bin/lsattr
to /usr/bin/busybox.nosuid since /home/developer/oe-test/build_
master/tmp/work/somimx6-emac-linux-gnueabi/emac-image/1.0-r0/rootfs/usr/bin/lsattr
exists and is not a link

In Rocko and before, this error is present, but the script continues
creating the rest of the symlinks and exits with success.

Does anyone have any idea why the failure is now causing the script to stop
executing?

Michael Gloff
mgloff@emacinc.com

--f403043b3b2cb5bd97056b430341
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>I am seeing with the latest in Su=
mo/Master that
 the busybox post install is failing to create all of=20
the applet symlinks if there is already a package installed from another
 provider during do_rootfs. This can be seen, for example, when enabling ls=
attr applet=20
and having e2fsprogs installed into an image.<br><br></div>The error is:<br=
>update-alternatives: Error: not linking /home/developer/oe-test/build_<wbr=
>master/tmp/work/somimx6-emac-l<wbr>inux-gnueabi/emac-image/1.0-r0<wbr>/roo=
tfs/usr/bin/lsattr to /usr/bin/busybox.nosuid since /home/developer/oe-test=
/build_<wbr>master/tmp/work/somimx6-emac-l<wbr>inux-gnueabi/emac-image/1.0-=
r0<wbr>/rootfs/usr/bin/lsattr exists and is not a link<br><br></div>In Rock=
o and before, this error is present, but the script continues creating the =
rest of the symlinks and exits with success.<br><br></div>Does anyone have =
any idea why the failure is now causing the script to stop executing?<span =
class=3D"gmail-m_9104236682904143277HOEnZb"><font color=3D"#888888"><br><br=
></font></span></div><span class=3D"gmail-m_9104236682904143277HOEnZb"><fon=
t color=3D"#888888">Michael Gloff<br></font></span></div><span class=3D"gma=
il-m_9104236682904143277HOEnZb"><font color=3D"#888888"><a href=3D"mailto:m=
gloff@emacinc.com" target=3D"_blank">mgloff@emacinc.com</a></font></span><b=
r></div>

--f403043b3b2cb5bd97056b430341--
