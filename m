Return-Path: <Lauren.Post@freescale.com>
X-Greylist: delayed 96223 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Oct 2014 15:50:17 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0136.outbound.protection.outlook.com [157.56.111.136])
	by mail.openembedded.org (Postfix) with ESMTP id 650D56A9D4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 15:50:17 +0000 (UTC)
Received: from CY1PR0301MB0700.namprd03.prod.outlook.com (25.160.159.142) by
	CY1PR0301MB0699.namprd03.prod.outlook.com (25.160.159.141) with
	Microsoft
	SMTP Server (TLS) id 15.0.1049.19; Thu, 9 Oct 2014 15:50:16 +0000
Received: from CY1PR0301MB0700.namprd03.prod.outlook.com ([25.160.159.142]) by
	CY1PR0301MB0700.namprd03.prod.outlook.com ([25.160.159.142]) with
	mapi id 15.00.1044.008; Thu, 9 Oct 2014 15:50:16 +0000
From: Lauren Post <Lauren.Post@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Multiple issues building from dizzy or master
Thread-Index: Ac/iQsvC7/qyE+FWQruCM8wynhzxgQAso0UAADUAKVA=
Date: Thu, 9 Oct 2014 15:50:16 +0000
Message-ID: <dd407026864c45e6b6fa6f6071469a83@CY1PR0301MB0700.namprd03.prod.outlook.com>
References: <e777247650f44526919fb4737b79b0a6@CY1PR0301MB0700.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.88.168.50]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0699;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(377454003)(52034003)(189002)(13464003)(51694002)(76482002)(120916001)(66066001)(31966008)(15975445006)(19580395003)(86362001)(92566001)(108616004)(76576001)(64706001)(110136001)(20776003)(85852003)(19580405001)(575784001)(85306004)(33646002)(101416001)(50986999)(2351001)(77096002)(15202345003)(107046002)(107886001)(74316001)(21056001)(2656002)(99286002)(40100002)(122556002)(95666004)(97736003)(99396003)(80022003)(87936001)(106356001)(46102003)(76176999)(105586002)(54356999)(4396001)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0699;
	H:CY1PR0301MB0700.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Multiple issues building from dizzy or master
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
X-List-Received-Date: Thu, 09 Oct 2014 15:50:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've narrowed down that 1 or 2 updates on poky from 9/16 are causing my pro=
blems.     If I revert only these 2 commits my build problems are resolved.

In our build script on Jenkins we always build kernel, then uboot with a fo=
rce deploy then our image then we build the image.  I see the errors when w=
e build the  image.  I believe the force deploy might be part of the proble=
m.  We do that so in case of dirty builds we always guarantee the kernel an=
d uboot in the images directory (although I hit this with clean builds ever=
y time).  On local machine if I only build image I never see the problem, o=
nly when I build locally with our build script.

This gcc revision I believe is causing the db and gcc runtime issues.
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Ddizzy&id=3D14ace=
86d508a5bdbb8139ce6af09de4d89b44595=20

I also think this poky revision might be causing the fetch/unpack issues.  =
In this issue we fetch works based on log output, unpack fails and when I l=
ook at downloads I see the <package>.lock in the downloads directory.  Happ=
ens randomly on many components.  I'm doing a build with only gcc patch abo=
ve to confirm if the unpack failures come back without this commit below re=
verted.
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Ddizzy&id=3D7d80f=
8e9468253496a7097685aac8f468940a9c5

Unfortunately to verify this I've had to do several clean builds all over p=
oky to narrow this down.  I'll further narrow down the 2 patches mentioned =
above.

All our builds set to the 9/16 commit before these patches work fine with n=
o problems.  I've been using one Jenkins machine to narrow this down.

Lauren

-----Original Message-----
From: Post Lauren-RAA013=20
Sent: Wednesday, October 08, 2014 7:52 AM
To: openembedded-core@lists.openembedded.org
Subject: RE: Multiple issues building from dizzy or master

Last night I moved poky back to 9/16  "0db15bb0626b16201d0767d87e91c61828a4=
49ef" before the sstate commit and my builds are working now.  Before that =
I tried reverting some of the earlier patches such as (533a852eddb9a5e77a15=
001756f03b929a1d0a0b ) brought in on 10/6 but that did not work so somethin=
g that came in last few weeks is also  causing problems.

My biggest problems is the fetch/unpack.  With tip of poky the task fetch i=
s working but before unpack the package disappears and task unpack fails.  =
It happens on many random components and always in downloads I see a lock o=
n the component but no package.  I see this with dirty and clean builds.

It will take me time to figure out which poky commit is causing the problem=
s but my team has been waiting on these builds to proceed with testing so I=
 can only try on one machine.  It is much harder to hit locally - I see it =
more readily on Jenkins build machines.

I just wanted to verify first it was a poky problem  On all 4 jenkins machi=
nes building last night none with the reverted poky back to 9/16 had the fe=
tch/unpack issues I was seeing with the tip of dizzy branch in poky yesterd=
ay.

Lauren Post
i.MX Freescale

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Lauren Post
Sent: Tuesday, October 07, 2014 10:25 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] Multiple issues building from dizzy or master

We've been trying for a few weeks to move all our builds to master (yesterd=
ay dizzy for poky which is the same) and been having random strange problem=
s on multiple jenkins machines we do our daily builds on.  I talked to Otav=
io about it but wonder if we are missing something.    I'd appreciate any i=
deas.   We can build our kernel and uboot fine but when we try to build a m=
ore complex image with qt5 we have not succeeded any build since yesterday.

As of today we are now getting errors in db compilation On both locally and=
 on Jenkins we keep getting a db compile error as of today.
./db_cxx.h:59:22: fatal error: iostream.h: No such file or directory  #incl=
ude <iostream.h>
                      ^
---------------------------------------------------------------------
For last week we've been battling random gcc_runtime configure errors only =
on Jenkins machines. =20

This is the configure error.
checking dynamic linker characteristics... configure: error: Link tests are=
 not allowed after GCC_NO_EXECUTABLES.

---------------------------------------------------------------------------=
----------------------------
As of yesterday morning, we are also having many unpack errors on many file=
s that are disappearing from our downloads before unpack.  The fetch is wor=
king but then when it unpacks the package has disappeared from downloads.  =
I've seen this on multiple components (libx11, xproto, inputproto, util-lin=
ux).  Seems to happen more often with rm_work set but I've seen it without =
it set.

I'd appreciate any ideas.  The only one I can reproduce locally is the db e=
rror above but the others seem to only happen on Jenkins machines.  We have=
 4 different Jenkins machines all of which can't build on the master branch=
 but have built fine for months on daisy and dora branches. =20

By the way you can't set your gcc to 4.8.2 - liburcu breaks if you try to u=
se the older compiler.  So not sure if any of the gcc runtime issues are re=
lated to the new gcc version.   Not sure if we should keep gcc 4.8.2 in diz=
zy if it can't be used.

Thanks for any ideas.  I've tried everything I can think of.

Lauren Post
i.MX Freescale
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

