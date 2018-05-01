Return-Path: <mgloff@emacinc.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 87C26745D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 23:05:00 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id c2-v6so16242769qtn.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2018 16:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emacinc-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=MKh8yD05bE1Duv0bTZrBWqALubJl2EgaehvOh2ERKFQ=;
	b=il9qxDhsHjhecT/BjbfOL+CVtS4TcloPkQzwSWDzxGe26YuVF6HA1sPkBFJVx4iIyU
	A2DUS6FhksmwkjrmMAP5Y+/vGzOw2RrLucOJc/xF8f+l6b2Tso79mBhwmVoxwJaSJ42g
	KqDEL7MZ96DMnR4IFeryo3t/WS7O6tsz0HQg9bSJnYfpG6Gaj4TaqDeWJxv/V7fMvj1l
	qgXjAbXko+ExStcMaKmdUf6vSiUO/YmRnRW88FopmDy8XNm/lkYkUrVGD1K6kpAFUpV1
	qbrWCx4eg4IqrxKP0gmAlKXIO4IIPz8vIkYwFycg+E294/zqjJ1vTvQeWIGn1peA2mwK
	rXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MKh8yD05bE1Duv0bTZrBWqALubJl2EgaehvOh2ERKFQ=;
	b=AcT9v97wrE9H6ywfAFG8l1kKnh0ZPzWC9buv2GsisX5lZdMcIHgnBVjDaINn5giflu
	mpLnLpDQ15u/tzAm1+b/kdBFxUil6LKsIQEn8m6bAIdlTGvIEeVc4MA5u7AvL/sDo1o2
	w3zDYFatEAdejbStLzdshkFoCPQ4CZBSUMtGkO3a/usz0+78GcKTpibdDuFeNtvDLzEg
	157D39I4TjJGbwK1jFrtwoZO5rQynm2ANrR2Dmhdazv5k5biuc1lwm7WZtcO0x7wzf9G
	HKVouJNxYg53apkout351J4LQyl+o9cX8VcTMFq9Kt87Cc3eETt5qoS63BAiNeCsD9Dg
	XGQQ==
X-Gm-Message-State: ALQs6tCUCt7ZxGUy/SDXbjhUBcRFZoT88DOKvVo96r0SVNvoOmw3SZbY
	diVjThR+u0m/vUy8eMVG2ki33kj/emA4iHiXyEPRVhW9
X-Google-Smtp-Source: AB8JxZou61tfe2kjcWNQBkcIxzfw6PmAt0RX2zKKqEp3fqs11vguNEhPodMnKu4B2/2JMKOc5Vv0gQmwgJ0C/S2xwac=
X-Received: by 2002:a0c:e0ca:: with SMTP id
	x10-v6mr14491269qvk.8.1525215900695; 
	Tue, 01 May 2018 16:05:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.113 with HTTP; Tue, 1 May 2018 16:04:20 -0700 (PDT)
From: Michael Gloff <mgloff@emacinc.com>
Date: Tue, 1 May 2018 18:04:20 -0500
Message-ID: <CALXw4G7RyVriubnC6PrcfU8uE=7hj2EYgqq0Egbqn3svRQOAGw@mail.gmail.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: Sumo/Master Busybox post install
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
X-List-Received-Date: Tue, 01 May 2018 23:05:00 -0000
Content-Type: multipart/alternative; boundary="000000000000f79d38056b2cffc1"

--000000000000f79d38056b2cffc1
Content-Type: text/plain; charset="UTF-8"

I am seeing with the latest in Sumo/Master that the busybox post install
with ipk packages is failing to create all of the applet symlinks if there
is already a package installed from another provider. This can be seen, for
example, when enabling lsattr applet and having e2fsprogs installed into an
image.

The error is:
update-alternatives: Error: not linking
/home/developer/oe-test/build_master/tmp/work/somimx6-emac-linux-gnueabi/emac-image/1.0-r0/rootfs/usr/bin/lsattr
to /usr/bin/busybox.nosuid since
/home/developer/oe-test/build_master/tmp/work/somimx6-emac-linux-gnueabi/emac-image/1.0-r0/rootfs/usr/bin/lsattr
exists and is not a link

In Rocko and before, this error is present, but the script continues
creating the rest of the symlinks and exits with success.

Does anyone have any idea why the failure is now causing the script to stop
executing?

Michael Gloff
mgloff@emacinc.com

--000000000000f79d38056b2cffc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>I am seeing with the latest in Su=
mo/Master that the busybox post install with ipk packages is failing to cre=
ate all of the applet symlinks if there is already a package installed from=
 another provider. This can be seen, for example, when enabling lsattr appl=
et and having e2fsprogs installed into an image.<br><br></div>The error is:=
<br>update-alternatives: Error: not linking /home/developer/oe-test/build_m=
aster/tmp/work/somimx6-emac-linux-gnueabi/emac-image/1.0-r0/rootfs/usr/bin/=
lsattr to /usr/bin/busybox.nosuid since /home/developer/oe-test/build_maste=
r/tmp/work/somimx6-emac-linux-gnueabi/emac-image/1.0-r0/rootfs/usr/bin/lsat=
tr exists and is not a link<br><br></div>In Rocko and before, this error is=
 present, but the script continues creating the rest of the symlinks and ex=
its with success.<br><br></div>Does anyone have any idea why the failure is=
 now causing the script to stop executing?<br><br></div>Michael Gloff<br></=
div><a href=3D"mailto:mgloff@emacinc.com">mgloff@emacinc.com</a><br></div>

--000000000000f79d38056b2cffc1--
