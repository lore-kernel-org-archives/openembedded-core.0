Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 465 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 May 2016 16:58:17 UTC
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id EB762601D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 16:58:17 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id wGqL1s0020BmcFC01GqMqw; Thu, 19 May 2016 17:50:21 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=yrkiwgmsf1kA:10 a=56WTo13cMYjJQGTQ5TIA:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>) id 1b3R9Q-0002Gv-73
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2016 17:50:20 +0100
Date: Thu, 19 May 2016 17:50:20 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160519165020.GA4863@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: nss postinst requires nss-native during rootfs generation
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
X-List-Received-Date: Thu, 19 May 2016 16:58:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We've recently added nss to our image and have started to see rootfs
generation anomalies. We use IMAGE_FEATURES = "read-only-rootfs" so
postinsts run at rootfs generation time.

nss's postinst calls shlibsign. Under normal circumstances with
read-only-rootfs, this appears to come from nss-native being in the native
sysroot during the build.

We're finding that nss-native isn't in the native sysroot at the time the
postinst runs if nss and nss-native come from the sstate cache.

I've simplied the problem enough to reproduce it with stock oe-core and
core-image-minimal. Add "nss" to IMAGE_INSTALL and "read-only-rootfs" to
IMAGE_FEATURES and then run:

 # First populate the sstate cache
 bitbake core-image-minimal

 # Then build again using the sstate cache
 rm -rf tmp-glibc
 bitbake -c rootfs core-image-minimal

I get:

 ERROR: core-image-minimal-1.0-r0 do_rootfs: The following packages could
 not be configured offline and rootfs is read-only: ['nss']

This could be because the image dependencies are incorrectly expressed.
task-depends.dot contains:

 "core-image-minimal.do_build" -> "nss-native.do_build"

Since I'm explicitly running do_rootfs this dependency is never taken into
account. I believe that a better dependency would be:

 "core-image-minimal.do_rootfs" -> "nss-native.do_build"

I can avoid the problem by running core-image-minimal.do_build rather than
core-image-minimal.do_rootfs but I'm worried that this opens the
possibility of a race since there's no guarantee that all of
core-image-minimal.do_build's dependencies have been satisfied before
core-image-minimal.do_rootfs runs.

Alternatively, perhaps nss's postinst isn't supposed to be relying on
nss-native at all in its postinst?

Any ideas?

Thanks.

Mike.

