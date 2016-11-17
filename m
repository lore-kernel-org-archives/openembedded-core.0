Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id A6D1D719A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 17:31:22 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id w33so138511671qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 09:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=q0VuxJi4sI7t9GESRTOjgMTr3rY8IcUWo+TTzBoaSWk=;
	b=n+3mMVCXvD4f167CAb0Bp79ffPRyeK73jZfEzQJs85zkrowlOCW5oRCcw1/Ed2CNLh
	eSs4BbR8jsRcLr97PCCqwQ4Knx4YEMtPeecL3agrdULOWTvOFvtHBq3HXT6c1W5ycPPW
	OqF3M6e9o0EvhEDiehowgswmdESnANGLU43OUJYt6oLBGNwnPgEbAJY8G6rzHQbW5dWw
	GwDrXdaa1O/1nW7RMD2qSRgjItev5wVz+cpje+I8LNzNdqo7MlNBcODE8CF/rKXoVrjg
	gEdJgaFZG20E/TisBwI774Jp/oGTvOtG6VdItd9Hos9KCy0QoMaO5qGOeDO7Rbtss9Sf
	Avcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=q0VuxJi4sI7t9GESRTOjgMTr3rY8IcUWo+TTzBoaSWk=;
	b=eHks+oMSWou5adpeX933N7iwI+pyD4nvGsCLvKH90l03Myrjc8xKWhHlONicI9LtQe
	x5SQL2yfbuGncderMHE3+u9+5Imwl7uMmXCmsTBYF9Kp6gaiOhOh1/2BR7lv3oo6DAk8
	4YeHnnRR7Jto1nYkzUHwCqi/iKtpkhrVphFO+0D897JQIN3DStWCMoiK/1MV7rjL78Ox
	2IzPjTJgh4iSH2mUHO0lfjNLhcu4f9BUHIFTj7q/GBTn0I9Gfsym6UmTGbk9WibFxKgm
	cD7+fTWB2iGvfyHUtWGy7ekOB/ybMyTUhPQ0iCR4LPXkIfnmhzuQMA5ecXBPkRDF3Kam
	nzxQ==
X-Gm-Message-State: AKaTC00bFyL8SGGloc43pa6W2Y4ycbUc65CDVw8v0Uo+NR4uCNBjQ/wcLKdGBeqLYizMYYJkD4W+oeHmQJ129zwd
X-Received: by 10.237.61.42 with SMTP id g39mr3151896qtf.65.1479403883628;
	Thu, 17 Nov 2016 09:31:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 17 Nov 2016 09:31:03 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Nov 2016 17:31:03 +0000
Message-ID: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Enabling uninative by default in oe-core?
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
X-List-Received-Date: Thu, 17 Nov 2016 17:31:22 -0000
Content-Type: multipart/alternative; boundary=001a1142a3eaf695ce0541828ea1

--001a1142a3eaf695ce0541828ea1
Content-Type: text/plain; charset=UTF-8

Hi,

Background: uninative is a class that downloads a precompiled host glibc
for use in the sysroot, thus isolating the native sysroot from the host
environment.  This means greater sstate reuse, as instead of native builds
being dependent on the host system they're able to be shared between all
hosts.  There is a reference tarball hosted on www.yoctoproject.org, and
the URL can be overridden by distros if you would prefer to build your own.

We enable this in Poky so that we get greater reuse on the autobuilders,
and due to some issues with the C++ ABI the eSDK generation in master now
requires uninative to be enabled.  The question is: do we now enable
uninative by default in oe-core's nodistro (pointing at the yoctoproject
tarball), or do we keep it disabled by default and require the user to
enable uninative if they wish to build an eSDK?

Personally I'm torn: I don't like eSDK not working out of the box, but I
don't really like oe-core nodistro depending on uninative.  Though enabling
uninative globally does mean everything works out of the box, so following
the principle of Least Surprise that's what we should do.

Ross

--001a1142a3eaf695ce0541828ea1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Background: uninative is a class th=
at downloads a precompiled host glibc for use in the sysroot, thus isolatin=
g the native sysroot from the host environment.=C2=A0 This means greater ss=
tate reuse, as instead of native builds being dependent on the host system =
they&#39;re able to be shared between all hosts.=C2=A0 There is a reference=
 tarball hosted on <a href=3D"http://www.yoctoproject.org">www.yoctoproject=
.org</a>, and the URL can be overridden by distros if you would prefer to b=
uild your own.</div><div><br></div><div>We enable this in Poky so that we g=
et greater reuse on the autobuilders, and due to some issues with the C++ A=
BI the eSDK generation in master now requires uninative to be enabled.=C2=
=A0 The question is: do we now enable uninative by default in oe-core&#39;s=
 nodistro (pointing at the yoctoproject tarball), or do we keep it disabled=
 by default and require the user to enable uninative if they wish to build =
an eSDK?</div><div><br></div><div>Personally I&#39;m torn: I don&#39;t like=
 eSDK not working out of the box, but I don&#39;t really like oe-core nodis=
tro depending on uninative.=C2=A0 Though enabling uninative globally does m=
ean everything works out of the box, so following the principle of Least Su=
rprise that&#39;s what we should do.</div><div><br></div><div>Ross</div></d=
iv>

--001a1142a3eaf695ce0541828ea1--
