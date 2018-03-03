Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 452 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 03 Mar 2018 21:34:23 UTC
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 393227882D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 21:34:23 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id sEg4exprWVXf7sEg5eE0VN; Sat, 03 Mar 2018 21:26:51 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=QohwI26d c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=v2DPQv5-lfwA:10 a=CdFY5-eK-0FOOr9COkUA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>) id 1esEg4-0006Nv-3r
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2018 21:26:48 +0000
Date: Sat, 3 Mar 2018 21:26:48 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180303212648.6fnwlntm6je3hw7c@mcrowe.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfCOUzmsdzc6Ej3ynlWFI7QMW5l8tOMgiUO/2h9uUmNMDAKxuV88Ubk4DrrAwL72UncmmS9CVdBbw+YpGJ39hfnC1tCGVXfjIvb/Y+4MPbb90drjzClm0
	v6g6nmuN/E8cNicNPAcKVGJwn2RSU39mEXqNCbAARqVRN9C1gNB8+dhg
Subject: coreutils-native and util-linux-native conflicting with meta-micro
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
X-List-Received-Date: Sat, 03 Mar 2018 21:34:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I have a recipe which uses both base64 from coreutils-native and hexdump
from util-linux-native so I've put both in my recipe DEPENDS.

Unfortunately do_prepare_sysroot is failing with:

Exception: FileExistsError: [Errno 17] File exists: '/home/mac/src/oe2/build-bcm7425/tmp-glibc/sysroots-components/x86_64/coreutils-native/bin/kill' -> '/home/mac/src/oe2/build-bcm7425/tmp-glibc/work/impala-oe-linux-gnueabi/verify-rootfs/1.0-r3/recipe-sysroot-native/bin/kill'

since both coreutils and util-linux provide /bin/kill.

This doesn't cause a problem in a standard oe-core build since coreutils
installs all its binaries in ${bindir} whereas util-linux puts kill in
${base_bindir}.

Unfortunately, with meta-micro ${bindir} and ${base_bindir} are the same
directory. :(

Both coreutils and util-linux already appear to use the alternatives
mechanism for kill, but that doesn't seem to help for -native.

I can easily locally nobble kill in one of the recipes to solve this
problem, but that doesn't seem very elegant.

What's the correct way to solve this problem?

Thanks.

Mike.

