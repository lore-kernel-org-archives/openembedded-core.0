Return-Path: <Arsalan_Awan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E7F3A7017B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 11:07:18 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1fdvux-0003af-At from Arsalan_Awan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2018 04:07:19 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Fri, 13 Jul 2018 12:07:16 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1320.000; Fri, 13 Jul 2018 12:07:16 +0100
From: "Awan, Arsalan" <Arsalan_Awan@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 0/1] fixing initrd mounts w/ spaces fail to move to real
	rootfs
Thread-Index: AQHUDuqdOJloDnifOUichZ9c8Os/taSNFUV1
Date: Fri, 13 Jul 2018 11:07:16 +0000
Message-ID: <1531480035880.91007@mentor.com>
References: <cover.1530195143.git.Arsalan_Awan@mentor.com>
In-Reply-To: <cover.1530195143.git.Arsalan_Awan@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] fixing initrd mounts w/ spaces fail to move to real rootfs
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
X-List-Received-Date: Fri, 13 Jul 2018 11:07:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ping=0A=
=0A=
________________________________________=0A=
From: Awan, Arsalan=0A=
Sent: Thursday, June 28, 2018 7:16 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: Awan, Arsalan=0A=
Subject: [PATCH 0/1] fixing initrd mounts w/ spaces fail to move to real ro=
otfs=0A=
=0A=
From: "Arsalan H. Awan" <Arsalan_Awan@mentor.com>=0A=
=0A=
When there are spaces in the mount points of devices e.g.:=0A=
=0A=
 a partition mounted at "/run/media/My Root Partition-sda1",=0A=
=0A=
the initrd fails to move such mount points over to the=0A=
corresponding directories at /media under the real root filesystem,=0A=
and the mount points would appear at the same location as they were=0A=
mounted on when detected by initrd, for example:=0A=
 here: "/run/media/My Root Partition-sda1"=0A=
 instead of here: "/media/My Root Partition-sda1"=0A=
=0A=
This causes issues such as:=0A=
=0A=
  * The disks/partitions cannot be formated with any filesystem=0A=
    using e.g. mkfs.ext4 or mke2fs in general. When tried to do so=0A=
    by making sure the device is not mounted, it failed with=0A=
    errors such as:=0A=
=0A=
    > /dev/sda1 is apparently in use by the system; will not make a=0A=
      filesystem here!=0A=
    > /dev/sda1: Device or resource busy while setting up superblock=0A=
=0A=
  * The read/write operations become extremely slow. e.g. Under testing,=0A=
    it took approx. 2 hours just to copy 700 MB of data to the partition,=
=0A=
    and it took more than 40 minutes to delete that data from it.=0A=
    Same operations took under 5 minutes on a partition that had no=0A=
    spaces in its mount point (or that was successfully moved to real=0A=
    root by initrd and appeared under /media instead of /run/media).=0A=
=0A=
This commit fixes such issues by quoting the arguments of failing mount=0A=
move commands and by parsing OCT or HEX encoded special characters=0A=
such as spaces to ASCII charecters in the mount points as kernel=0A=
populates the procfs like so.=0A=
=0A=
=0A=
The following changes since commit 40a904bf8bc1279c3da0893c003f740f1d2066c2=
:=0A=
=0A=
  bitbake.conf: Allow BBINCLUDED to be unset (2018-06-28 12:26:33 +0100)=0A=
=0A=
are available in the git repository at:=0A=
=0A=
  git://github.com/ArsalanHAwan/openembedded-core initrdscripts-init-live=
=0A=
  https://github.com/ArsalanHAwan/openembedded-core/tree/initrdscripts-init=
-live=0A=
=0A=
Arsalan H. Awan (1):=0A=
  initrdscripts/init-live.sh: fix mounts w/ spaces fail to move to real=0A=
    rootfs=0A=
=0A=
 meta/recipes-core/initrdscripts/files/init-live.sh | 7 +++++--=0A=
 1 file changed, 5 insertions(+), 2 deletions(-)=0A=
=0A=
--=0A=
2.7.4=0A=
=0A=

