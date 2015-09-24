Return-Path: <sdliyong@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 18B607404E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 08:24:53 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so26883555qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:to:subject:date:importance:content-type
	:content-transfer-encoding:mime-version;
	bh=ae3E+5f14aSUmdc5TJhxBm9X/KSgl2ZEKQzS9NZ1weI=;
	b=elQ2I3mxyUOHwP3/iHw0AnCUIx+PBI9Vf0ZC+HiMGgXRwRai8A5VrODhROd5XLbl85
	eL8jC57gnTIyZUNEoMVCqkcEPNvQwEK9BgWKU7s0X3JIHBaLYRyEcunIewg5pI9YwAUv
	JIKAqmqTdPcxyDHD4e8YO+yO60nRw7xMMDWwTM+3nGSboAsNwOrv/VMHXw1kHCBgfeuL
	s71btg8t+i82VqhfCDYB2TISvwmRgGXYzmWs0LfNLS/P3N2Cp1hvlrqu+OAeHsnm5Q/3
	8jkX50Z9n5OFg5aKEiH56+KZtyyWtu/jjFpvmgXMA4DAMLSf1wljCdknRp/ms617AIm1
	voPg==
X-Received: by 10.55.48.67 with SMTP id w64mr41404549qkw.32.1443083093114;
	Thu, 24 Sep 2015 01:24:53 -0700 (PDT)
Received: from mail.hotmail.com (blu004-wss1s1.hotmail.com. [134.170.2.216])
	by smtp.gmail.com with ESMTPSA id
	t77sm3033446qgt.24.2015.09.24.01.24.52
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Sep 2015 01:24:52 -0700 (PDT)
Received: from BLU168-W92 ([134.170.2.215]) by BLU004-WSS1S1.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Thu, 24 Sep 2015 01:24:51 -0700
X-TMN: [PZGVCZBkeuhdod66/jkjivRDep9pjkeg]
Message-ID: <BLU168-W92359AA4E562353441C3D7D6430@phx.gbl>
From: LIYONG <sdliyong@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Li Yong <sdliyong@gmail.com>
Date: Thu, 24 Sep 2015 16:24:51 +0800
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 24 Sep 2015 08:24:51.0548 (UTC)
	FILETIME=[7BC669C0:01D0F6A2]
Subject: Cannot apply patches out of meta bsp after applied a kern-tool patch
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
X-List-Received-Date: Thu, 24 Sep 2015 08:24:54 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all=2C=0A=
=0A=
After applied the below patch=2C bitbake cannot apply these patches in my a=
pp layer. For example=2C there is a kernel patch in meta-app/recipes-kernel=
/linux-yocto/linux-yocto=2C I add the file in linux-yocto_%.bbappend file. =
bitbake yocto-linux will fail with "do patch error". If I revert the patch=
=2C the build is okay.=A0=0A=
=0A=
Any suggestions/comments?=0A=
=0A=
commit a03c100e813b1b5041bfc17c97f5bd4e72b795ad=0A=
Author: Bruce Ashfield <bruce.ashfield@windriver.com>=0A=
Date:=A0=A0 Mon Aug 31 15:55:33 2015 -0400=0A=
=A0=0A=
=A0=A0=A0 patching: only validate user supplied patches by default=0A=
=A0=0A=
=A0=A0=A0 Previously the patching tools would consider both system and user=
=0A=
=A0=A0=A0 supplied patches in the same manner .. they are simply a series o=
f=0A=
=A0=A0=A0 patches to be applied to a branch=2C and that the scripts should =
determine=0A=
=A0=A0=A0 where in the series to start (based on what is already on the bra=
nch).=0A=
=A0=0A=
=A0=A0=A0 This detection was causing a few problems:=0A=
=A0=0A=
=A0=A0=A0=A0=A0 - time consuming=0A=
=A0=A0=A0=A0=A0 - starting in the middle of a series when intermediate patc=
hes were=0A=
=A0=A0=A0=A0=A0=A0=A0 merged to a branch.=0A=
=A0=0A=
=A0=A0=A0 To solve both the performance and start detection=2C we instead s=
imply=0A=
=A0=A0=A0 note the transition from system (i.e. already defined features an=
d=0A=
=A0=A0=A0 series) and user/recipe supplied patches. When the transition is =
noted=2C=0A=
=A0=A0=A0 the system will start pushing ALL patches without doing autoresum=
e=0A=
=A0=A0=A0 detection.=0A=
=A0=0A=
=A0=A0=A0 Control in keeping the series up to date is passed to the user=2C=
 and=0A=
consistent behaviour/performance is achieved.=0A=
=A0=0A=
Signed-off-by: Bruce Ashfield bruce.ashfield@windriver.com=0A=
=A0=0A=
=0A=
Thanks=2C=0A=
Yong=A0 		 	   		  =

