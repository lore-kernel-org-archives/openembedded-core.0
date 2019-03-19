Return-Path: <robert.joslyn@redrectangle.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2F46BC88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 04:21:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 3427D3AE76D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 04:12:11 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 72421FF802;
	Tue, 19 Mar 2019 04:12:07 +0000 (UTC)
Message-ID: <1552968724.1646.9.camel@redrectangle.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2019 21:12:04 -0700
In-Reply-To: <BYAPR02MB6005A0C47997F4B9327F2EE0B9470@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <20190313040344.11803-1-robert.joslyn@redrectangle.org>
	<BYAPR02MB6005A0C47997F4B9327F2EE0B9470@BYAPR02MB6005.namprd02.prod.outlook.com>
X-Mailer: Evolution 3.24.6 
Mime-Version: 1.0
Subject: Re: [thud][PATCH] yocto-uninative: Correct sha256sum for aarch64
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
X-List-Received-Date: Tue, 19 Mar 2019 04:21:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-18 at 16:53 +0000, Manjukumar Harthikote Matha wrote:
> Hi,
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > Robert Joslyn
> > Sent: Tuesday, March 12, 2019 9:04 PM
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [thud][PATCH] yocto-uninative: Correct sha256sum
> > for aarch64
> > 
> > From: Michael Halstead <mhalstead@linuxfoundation.org>
> > 
> > Avoid uninative checksum warnings when building on aarch64
> > hardware.
> > 
> 
> On what machines does it fail? Should be backport this to thud
> v2.6.1?

It fails when building on an aarch64 build machine when uninative is
enabled. I realize that building on ARM hardware is probably uncommon,
but it'd be nice to fix the wrong checksum for the few of us that do.
For reference, the patch is a backport from master: https://git.openemb
edded.org/openembedded-
core/commit/meta/conf/distro/include?id=3ccc2de5f08fb2023abeeed39e23c68
dbc75725b

This is the error:

Build Configuration:
BB_VERSION           = "1.40.0"
BUILD_SYS            = "aarch64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "2.6.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "thud:f5a57e939e626a5b7c6de5b51799ca602ed355ed"

NOTE: Fetching uninative binary shim from http://downloads.yoctoproject
.org/releases/uninative/2.3/aarch64-nativesdk-
libc.tar.bz2;sha256sum=b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685ea
ed
WARNING: Checksum mismatch for local file
/home/robert/yocto/downloads/uninative/b7fbbaad1ec86d76eca84d83098f5052
5b8a4124cc8685eaed/aarch64-nativesdk-libc.tar.bz2
Cleaning and trying again.
WARNING: Renaming
/home/robert/yocto/downloads/uninative/b7fbbaad1ec86d76eca84d83098f5052
5b8a4124cc8685eaed/aarch64-nativesdk-libc.tar.bz2 to
/home/robert/yocto/downloads/uninative/b7fbbaad1ec86d76eca84d83098f5052
5b8a4124cc8685eaed/aarch64-nativesdk-libc.tar.bz2_bad-
checksum_69c5fd8458995457e9f655b8548b242c
WARNING: Checksum failure encountered with download of http://downloads
.yoctoproject.org/releases/uninative/2.3/aarch64-nativesdk-
libc.tar.bz2;sha256sum=b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685ea
ed - will attempt other sources if available
ERROR: Fetcher failure for URL: 'http://downloads.yoctoproject.org/rele
ases/uninative/2.3/aarch64-nativesdk-
libc.tar.bz2;sha256sum=b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685ea
ed'. Checksum mismatch!
File:
'/home/robert/yocto/downloads/uninative/b7fbbaad1ec86d76eca84d83098f505
25b8a4124cc8685eaed/aarch64-nativesdk-libc.tar.bz2' has sha256 checksum
e495046969c796b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed when
b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed was expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within the
recipe:
SRC_URI[md5sum] = "69c5fd8458995457e9f655b8548b242c"
SRC_URI[sha256sum] =
"e495046969c796b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise unexpectedly
modified.


Thanks,
Robert

> 
> Thanks,
> Manju
> 
> 
> > Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/conf/distro/include/yocto-uninative.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/distro/include/yocto-uninative.inc
> > b/meta/conf/distro/include/yocto-uninative.inc
> > index c9d502ba4f..0d484f6c3c 100644
> > --- a/meta/conf/distro/include/yocto-uninative.inc
> > +++ b/meta/conf/distro/include/yocto-uninative.inc
> > @@ -9,7 +9,7 @@
> >  UNINATIVE_MAXGLIBCVERSION = "2.28"
> > 
> >  UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/unina
> > tive/2.3/"
> > -UNINATIVE_CHECKSUM[aarch64] ?=
> > "b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
> > +UNINATIVE_CHECKSUM[aarch64] ?=
> > "e495046969c796b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
> >  UNINATIVE_CHECKSUM[i686] ?=
> > "44253cddbf629082568cea4fff59419106871a0cf81b4845b5d34e7014887b20"
> >  UNINATIVE_CHECKSUM[x86_64] ?=
> > "c6954563dad3c95608117c6fc328099036c832bbd924ebf5fdccb622fc0a8684"
> > 
> > --
> > 2.19.2
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


