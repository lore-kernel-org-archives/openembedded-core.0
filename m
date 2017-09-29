Return-Path: <Jef.Driesen@niko.eu>
Received: from relay06.secure-mail.be (relay06.secure-mail.be [195.13.7.9])
	by mail.openembedded.org (Postfix) with ESMTP id A9CA177805
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 13:21:50 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2D0AQDZR85Z/7lOx1RWCBsBAQEDAQEBC?=
	=?us-ascii?q?QEBARcBAQQBAQoBAYJmS1QQgRUHjhCPYYF2lisOggQKG4UgAoQvPxgBAQEBAQE?=
	=?us-ascii?q?BAQEBAWoogjMigkMBAQEBAgE6TwIBCBgKFBAyJQIEARIIiiEJAwGpQotEAQEBA?=
	=?us-ascii?q?QEBBAEBAQEBAQEBAR8JAYMjgTFRhmOEXw0aKoMWgjEBBIoLiRuFFohwh16DXwW?=
	=?us-ascii?q?LNluFE4UphVyVToE5HziBDnuFdRyBZ3aHKoEQAQEB?=
X-IPAS-Result: =?us-ascii?q?A2D0AQDZR85Z/7lOx1RWCBsBAQEDAQEBCQEBARcBAQQBAQo?=
	=?us-ascii?q?BAYJmS1QQgRUHjhCPYYF2lisOggQKG4UgAoQvPxgBAQEBAQEBAQEBAWoogjMig?=
	=?us-ascii?q?kMBAQEBAgE6TwIBCBgKFBAyJQIEARIIiiEJAwGpQotEAQEBAQEBBAEBAQEBAQE?=
	=?us-ascii?q?BAR8JAYMjgTFRhmOEXw0aKoMWgjEBBIoLiRuFFohwh16DXwWLNluFE4UphVyVT?=
	=?us-ascii?q?oE5HziBDnuFdRyBZ3aHKoEQAQEB?=
Received: from edge.nikogroup.be ([84.199.78.185])
	by relay06.secure-mail.be with ESMTP; 29 Sep 2017 15:21:50 +0200
Received: from HUB.NIKO.LAN (172.22.10.201) by EDGE.nikogroup.be
	(192.168.22.31) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 29 Sep 2017 15:21:54 +0200
Received: from MBX.NIKO.LAN ([::1]) by HUB.NIKO.LAN ([::1]) with mapi id
	14.03.0224.002; Fri, 29 Sep 2017 15:21:50 +0200
From: <Jef.Driesen@niko.eu>
To: <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Small improvement for the initscripts package
Thread-Index: AQHTOPkyug4RbXCTlkS3EIoEWRxT86LLnS2AgAA1t84=
Date: Fri, 29 Sep 2017 13:21:49 +0000
Message-ID: <FAB9E48578194042BE5C63B8BE47610339682926@MBX.NIKO.LAN>
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
X-List-Received-Date: Fri, 29 Sep 2017 13:21:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 09/29/2017 11:38 AM, Jef.Driesen@niko.eu wrote:
>> For our system, we are using some custom initscripts. Because of
>> that, some files conflict with the initscripts package, and thus the
>> initscript package gets removed from our build. But when trying to
>> build an sdk, somehow the initscripts-dev package gets pulled in, and
>> since that has an automatic dependency on initscripts, our build
>> fails.
>
> Please do find out why this happens; that's what you really need to fix.

I tried, but I couldn't figure out where this came from.

>> I've been trying to find out why this happens, but without much
>> success so far. But I did found a simple workaround: remove the
>> initscripts-dev package completely. Since the initscripts recipe
>> contains some shell scripts the initscript-dev is empty anyway.
>>
>> I've fixed this locally with a bbappend, but this is probably
>> something that can be applied upstream.
>
> You can use bbappend to instead replace the standard files with the ones
> that you want installed. Or you can add PROVIDES =3D "initscripts" to you=
r
> recipe with the 'custom' initscripts, and set
> PREFERRED_PROVIDER_initscripts =3D "my-custom-initscripts" to have that
> installed.

Those custom initscripts are not in our own layer. It's in a layer we build=
 upon. So it's a bit more complex.

Anyway, what we have there is the following. In the machine conf file there=
 is:

VIRTUAL-RUNTIME_initscripts =3D ""

This replaces the default meta/recipes-core/packagegroups/packagegroup-core=
-boot.bb:

VIRTUAL-RUNTIME_initscripts ?=3D "initscripts"

So I assume that's how they remove the initscripts package. And then in the=
 image recipe they have:

PACKAGE_EXCLUDE +=3D "initscripts-dev"

But for some reason this doesn't work for us. It fails with this error:

ERROR: Unable to install packages. Command '/home/bob/nhc2/yocto/build/tmp/=
sysroots/x86_64-linux/usr/bin/smart --log-level=3Dwarning --data-dir=3D/hom=
e/bob/nhc2/yocto/build/tmp/work/emperor-poky-linux-gnueabi/image-sdk-niko/1=
.0-r0/sdk/image/opt/yotta/2.0.3/sysroots/armv7a-vfp-neon-poky-linux-gnueabi=
/var/lib/smart install --attempt -y initscripts-dbg@armv7a_vfp_neon initscr=
ipts-dev@armv7a_vfp_neon ...' returned 1:
Loading cache...
Updating cache...               ######################################## [1=
00%
Computing transaction...warning: Can't install initscripts-dev-1.0-r155.0@a=
rmv7a_vfp_neon: it's locked
Traceback (most recent call last):
  File "/home/bob/nhc2/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/smart.=
real", line 200, in <module>
    main(sys.argv[1:])
  File "/home/bob/nhc2/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/smart.=
real", line 173, in main
    exitcode =3D iface.run(opts.command, opts.argv)
  File "/home/bob/nhc2/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/python=
2.7/site-packages/smart/interface.py", line 53, in run
    result =3D _command.main(self._ctrl, opts)
  File "/home/bob/nhc2/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/python=
2.7/site-packages/smart/commands/install.py", line 192, in main
    trans.run()
  File "/home/bob/nhc2/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/python=
2.7/site-packages/smart/transaction.py", line 1235, in run
    del changeset[pkg]
KeyError: initscripts-dev-1.0-r155.0@armv7a_vfp_neon

DEBUG: Python function do_populate_sdk finished
ERROR: Function failed: do_populate_sdk


I'm not even sure whether PACKAGE_EXCLUDE is supposed to be used from an im=
age recipe, because the documentation refers to local.conf. So that might e=
xplain why it doesn't work.

Jef
Disclaimer

This e-mail and its attachments is intended only for the person(s) or entit=
y to which it is addressed. If you receive this e-mail by mistake, please d=
elete this e-mail from your system and destroy all copies of it. It may con=
tain confidential and/or privileged information. You should not copy it or =
use it for any purpose nor disclose its contents to any person unless allow=
ed by a written document between the sender and the addressee.

