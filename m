Return-Path: <Jef.Driesen@niko.eu>
Received: from relay04.secure-mail.be (relay04.secure-mail.be [195.13.7.7])
	by mail.openembedded.org (Postfix) with ESMTP id E0FD377D04
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 11:56:35 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AuBwD8edNZ/7lOx1RcHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBgmYfLVSBLJ10mjQKhTsChExCFQEBAQEBAQEBAQEBaiiCMyKCRAM?=
	=?us-ascii?q?DOjQbAgEIIhQQMiUCBAEaE4oWAwGnZ4syAQEBAQEFAQEBAQEjCQGDI4ExUYZjh?=
	=?us-ascii?q?QaDQIIyAQSKC4kejgmLPgWLNoVviwaVVIE5NSKBDntbhx2JOoEQAQEB?=
X-IPAS-Result: =?us-ascii?q?A2AuBwD8edNZ/7lOx1RcHAEBBAEBCgEBFwEBBAEBCgEBgmY?=
	=?us-ascii?q?fLVSBLJ10mjQKhTsChExCFQEBAQEBAQEBAQEBaiiCMyKCRAMDOjQbAgEIIhQQM?=
	=?us-ascii?q?iUCBAEaE4oWAwGnZ4syAQEBAQEFAQEBAQEjCQGDI4ExUYZjhQaDQIIyAQSKC4k?=
	=?us-ascii?q?ejgmLPgWLNoVviwaVVIE5NSKBDntbhx2JOoEQAQEB?=
Received: from edge.nikogroup.be ([84.199.78.185])
	by relay04.secure-mail.be with ESMTP; 03 Oct 2017 13:56:35 +0200
Received: from HUB.NIKO.LAN (172.22.10.201) by EDGE.nikogroup.be
	(192.168.22.31) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 3 Oct 2017 13:56:26 +0200
Received: from MBX.NIKO.LAN ([::1]) by HUB.NIKO.LAN ([::1]) with mapi id
	14.03.0224.002; Tue, 3 Oct 2017 12:03:02 +0200
From: <Jef.Driesen@niko.eu>
To: <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Small improvement for the initscripts package
Thread-Index: AQHTOPkyug4RbXCTlkS3EIoEWRxT86LLnS2AgAZNSQg=
Date: Tue, 3 Oct 2017 10:03:02 +0000
Message-ID: <FAB9E48578194042BE5C63B8BE4761033969175B@MBX.NIKO.LAN>
References: <FAB9E48578194042BE5C63B8BE47610339682897@MBX.NIKO.LAN>,
	<d0e88e18-0540-2d7f-abe4-11f677d5af4e@linux.intel.com>
In-Reply-To: <d0e88e18-0540-2d7f-abe4-11f677d5af4e@linux.intel.com>
Accept-Language: en-US, nl-BE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.10.222]
x-exclaimer-md-config: ea9a6d46-d5fe-4ddc-9ba9-49fab8e88ad4
MIME-Version: 1.0
Subject: Re: [PATCH] Small improvement for the initscripts package
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
X-List-Received-Date: Tue, 03 Oct 2017 11:56:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin:
> You can use bbappend to instead replace the standard files with the ones
> that you want installed. Or you can add PROVIDES =3D "initscripts" to you=
r
> recipe with the 'custom' initscripts, and set
> PREFERRED_PROVIDER_initscripts =3D "my-custom-initscripts" to have that
> installed.

If I try that, I get a different error:

ERROR: The recipe base-files-emperor is trying to install files into a shar=
ed area when those files already exist. Those files and their manifest loca=
tion are:
   /home/jdi/develop/yocto/build/tmp/sysroots/emperor/sysroot-providers/ini=
tscripts
 Matched in manifest-emperor-initscripts.populate_sysroot
Please verify which recipe should provide the above files.
The build has stopped as continuing in this scenario WILL break things, if =
not now, possibly in the future (we've seen builds fail several months late=
r). If the system knew how to recover from this automatically it would howe=
ver there are several different scenarios which can result in this and we d=
on't know which one this is. It may be you have switched providers of somet=
hing like virtual/kernel (e.g. from linux-yocto to linux-yocto-dev), in tha=
t case you need to execute the clean task for both recipes and it will reso=
lve this error. It may be you changed DISTRO_FEATURES from systemd to udev =
or vice versa. Cleaning those recipes should again resolve this error howev=
er switching DISTRO_FEATURES on an existing build directory is not supporte=
d, you should really clean out tmp and rebuild (reusing sstate should be sa=
fe). It could be the overlapping files detected are harmless in which case =
adding them to SSTATE_DUPWHITELIST may be the correct solution. It could al=
so be your build is including two different conflicting versions of things =
(e.g. bluez 4 and bluez 5 and the correct solution for that would be to res=
olve the conflict. If in doubt, please ask on the mailing list, sharing the=
 error and filelist above.
ERROR: If the above message is too much, the simpler version is you're advi=
sed to wipe out tmp and rebuild (reusing sstate is fine). That will likely =
fix things in most (but not all) cases.
ERROR: Function failed: sstate_task_postfunc
ERROR: Logfile of failure stored in: /home/jdi/develop/yocto/build/tmp/work=
/armv7a-vfp-neon-poky-linux-gnueabi/base-files-emperor/1.0-r0/temp/log.do_p=
opulate_sysroot.8244
ERROR: Task 676 (/home/jdi/develop/yocto/meta-fifthplay-bsp/recipes-fifthpl=
ay-bsp/base-files-emperor/base-files-emperor.bb, do_populate_sysroot) faile=
d with exit code '1'

Note: base-files-emperor is the package with the custom init scripts. I add=
ed:

PROVIDES =3D "initscripts"

And in conf/machine/emperor.conf, I added:

PREFERRED_PROVIDER_initscripts =3D "base-files-emperor"

Jef
Disclaimer

This e-mail and its attachments is intended only for the person(s) or entit=
y to which it is addressed. If you receive this e-mail by mistake, please d=
elete this e-mail from your system and destroy all copies of it. It may con=
tain confidential and/or privileged information. You should not copy it or =
use it for any purpose nor disclose its contents to any person unless allow=
ed by a written document between the sender and the addressee.

