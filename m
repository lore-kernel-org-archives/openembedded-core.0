Return-Path: <charles.wh.chan@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5C277154
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 05:04:37 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id e6so44624687vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2016 22:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=c9MVViodNbeg9u4IjhzcDohJ6a2wQMze6E+8wLKmALo=;
	b=wIC1P/WNzOz4MeCzXE7iGLRQPGM2M5d4nyoMDZSSJfmHMW+teQ9J57Eo2XWygsKuNB
	YRpxC3pSwOTUKT0S6QOP5Uk/Ifq0bK6L6ctTsYNseDuDCmcnC180OwkND3ov8fy3jVLU
	fwa+5ldDlhyOCm8cgbAeaMbT+sm6ADDvSJR2fERj2ig5RVYQXlCJdzNRVm79lDFzbpOc
	NBadbMVHO/vOyxH7P1s8L1Dthcq+rHXCY2T2ElyPdFAHmB0K/0lUSSFG4e6bkKphvdkm
	h6z64QZqlbsxP2KjfBw96N6ZCyiri79F8v5xJfywY3WWudIeEpx4gfhyIdtRRqb+Fzdt
	IsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=c9MVViodNbeg9u4IjhzcDohJ6a2wQMze6E+8wLKmALo=;
	b=J1j9HjfdOQnygQAEO9gGkEhoNTsYmgWQ36QouSwVakFrwqadLPqhAuixm6PFwdFX28
	ER2q85t7sM78GA/N6KTak3ndkQZJO3dw1NQiQ+lTHurOmgJz/zurtASXilunpxGN+qEB
	sRRueG8yWz5V7Vrqdl3NQ3DR1RjVfc1XSdzy51ISpY+mBvUM8RB4+Dc0GwxWrVcsjDct
	F/8CGOIG/6Nljel/msauwBimdfk9w2VrVlbsAUgM+9gkInNSesYy23PJ3UDKSrtLYzxv
	AZcK6rZN3I9n9qBGZZ4ntL/Lj2epDCF6/13uXlIM9TBobWeRrjap//Qzfg1sItdHKJJ4
	wxZg==
X-Gm-Message-State: AD7BkJKqxvIfajTVxBuykR5EurYJuJUlTOimb7o/SKkiac8JT7rimsk/q1//C3EgI9Xiych4mgJXiY/0Njxi+Q==
X-Received: by 10.31.129.211 with SMTP id c202mr4761250vkd.52.1459919078704;
	Tue, 05 Apr 2016 22:04:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.33.213 with HTTP; Tue, 5 Apr 2016 22:03:59 -0700 (PDT)
From: Charles Chan <charles.wh.chan@gmail.com>
Date: Tue, 5 Apr 2016 22:03:59 -0700
Message-ID: <CAEDY82g1SD-4C1BVH6X2OJFkG9-KiqKSkRZzTKMUwu38dphvuw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Security question: base-files_3.0.14.bb and ${ROOT_HOME} directory permission
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
X-List-Received-Date: Wed, 06 Apr 2016 05:04:38 -0000
Content-Type: multipart/alternative; boundary=001a114582621650a6052fc9e6d1

--001a114582621650a6052fc9e6d1
Content-Type: text/plain; charset=UTF-8

(This is my first post to OE list, hopefully I am posting to the right
mailing list.)

Background: During the process of trying to configure SSH keys for root
user login via dropbear, we realized the permission for /home/root
directory is set too loose for group and other members [1]. As a result,
dropbears fails when we try to put the key under /home/root/.ssh

---------

In the image, /home/root directory is set to 0755:

$ stat /home/root
  File: /home/root
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: b302h/45826d    Inode: 13268       Links: 4
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2016-04-05 22:21:13.000000000
Modify: 2016-04-05 22:08:57.000000000
Change: 2016-04-05 22:08:57.000000000


After some debugging, we believe the permission (0755) is initialized in
base-files_3.0.14.bb (in line 35) [2].

A few questions:
1. I tried looking at the git log for the history, but wasn't able to find
any background on why the permission was set this way. eg. on a desktop
Linux (Ubuntu), /root is set to 0700:

$ sudo stat /root
  File: `/root'
  Size: 4096       Blocks: 8          IO Block: 4096   directory
Device: 801h/2049d Inode: 1441793     Links: 3
Access: (0700/drwx------)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2016-04-05 21:29:17.389725228 -0700
Modify: 2016-03-22 17:11:54.912479000 -0700
Change: 2016-03-22 17:11:54.912479000 -0700
 Birth: -


2. If we would like to override the directory permission for /home/root in
our image, what is the best way to do it? I am not an expert with bitbake,
should I be patching the base-files_3.0.14.bb? using *_append? or I should
be looking at some other recipe altogether?

Sorry for the long email. Thanks in advance.
Charles

[1]
https://wiki.openwrt.org/doc/howto/dropbear.public-key.auth#troubleshooting

[2]
http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/recipes-core/base-files/base-files_3.0.14.bb?h=master#n35

--001a114582621650a6052fc9e6d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>(This is my first post to OE list, hopefully I am pos=
ting to the right mailing list.)</div><div><br></div><div>Background: Durin=
g the process of trying to configure SSH keys for root user login via dropb=
ear, we realized the permission for /home/root directory is set too loose f=
or group and other members [1]. As a result, dropbears fails when we try to=
 put the key under /home/root/.ssh</div><div><br></div><div>---------</div>=
<div><br></div><div>In the image, /home/root directory is set to 0755:</div=
><blockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><div=
><div>$ stat /home/root</div></div><div><div>=C2=A0 File: /home/root</div><=
/div><div><div>=C2=A0 Size: 4096 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0B=
locks: 8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IO Block: 4096 =C2=A0 directory<=
/div></div><div><div>Device: b302h/45826d =C2=A0 =C2=A0Inode: 13268 =C2=A0 =
=C2=A0 =C2=A0 Links: 4</div></div><div><div>Access: (0755/drwxr-xr-x) =C2=
=A0Uid: ( =C2=A0 =C2=A00/ =C2=A0 =C2=A0root) =C2=A0 Gid: ( =C2=A0 =C2=A00/ =
=C2=A0 =C2=A0root)</div></div><div><div>Access: 2016-04-05 22:21:13.0000000=
00</div></div><div><div>Modify: 2016-04-05 22:08:57.000000000</div></div><d=
iv><div>Change: 2016-04-05 22:08:57.000000000</div></div></blockquote><div>=
<br></div><div>After some debugging, we believe the permission (0755) is in=
itialized in =C2=A0<a href=3D"http://base-files_3.0.14.bb">base-files_3.0.1=
4.bb</a>=C2=A0(in=C2=A0line 35) [2].</div><div><br></div><div>A few questio=
ns:</div><div>1. I tried looking at the git log for the history, but wasn&#=
39;t able to find any background on why the permission was set this way. eg=
. on a desktop Linux (Ubuntu), /root is set to 0700:</div><blockquote style=
=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><div><div>$ sudo stat =
/root</div></div><div><div>=C2=A0 File: `/root&#39;</div></div><div><div>=
=C2=A0 Size: 4096 =C2=A0 =C2=A0 =C2=A0<span class=3D"" style=3D"white-space=
:pre">	</span>Blocks: 8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IO Block: 4096 =
=C2=A0 directory</div></div><div><div>Device: 801h/2049d<span class=3D"" st=
yle=3D"white-space:pre">	</span>Inode: 1441793 =C2=A0 =C2=A0 Links: 3</div>=
</div><div><div>Access: (0700/drwx------) =C2=A0Uid: ( =C2=A0 =C2=A00/ =C2=
=A0 =C2=A0root) =C2=A0 Gid: ( =C2=A0 =C2=A00/ =C2=A0 =C2=A0root)</div></div=
><div><div>Access: 2016-04-05 21:29:17.389725228 -0700</div></div><div><div=
>Modify: 2016-03-22 17:11:54.912479000 -0700</div></div><div><div>Change: 2=
016-03-22 17:11:54.912479000 -0700</div></div><div><div>=C2=A0Birth: -</div=
></div></blockquote><div><br></div><div>2. If we would like to override the=
 directory permission for /home/root in our image, what is the best way to =
do it? I am not an expert with bitbake, should I be patching the <a href=3D=
"http://base-files_3.0.14.bb">base-files_3.0.14.bb</a>? using *_append? or =
I should be looking at some other recipe altogether?</div><div><br></div><d=
iv>Sorry for the long email. Thanks in advance.</div><div>Charles</div><div=
><br></div><div>[1]=C2=A0<a href=3D"https://wiki.openwrt.org/doc/howto/drop=
bear.public-key.auth#troubleshooting">https://wiki.openwrt.org/doc/howto/dr=
opbear.public-key.auth#troubleshooting</a></div><div><br></div><div>[2] <a =
href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/r=
ecipes-core/base-files/base-files_3.0.14.bb?h=3Dmaster#n35">http://cgit.ope=
nembedded.org/cgit.cgi/openembedded-core/tree/meta/recipes-core/base-files/=
base-files_3.0.14.bb?h=3Dmaster#n35</a></div></div>

--001a114582621650a6052fc9e6d1--
