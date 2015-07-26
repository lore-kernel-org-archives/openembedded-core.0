Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C2EC7736B6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 16:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6QGFDZ5013861; Sun, 26 Jul 2015 17:15:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mHRmDuShG9nO; Sun, 26 Jul 2015 17:15:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6QGExdB013842
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 26 Jul 2015 17:15:11 +0100
Message-ID: <1437927299.821.198.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Jul 2015 17:14:59 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "Witt, Randy E" <randy.e.witt@intel.com>
Subject: Weekend build status (master, fido, dizzy and -next)
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
X-List-Received-Date: Sun, 26 Jul 2015 16:15:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Over the weekend I've tried to establish where we're at with the various
branches. I've run builds of master, fido and dizzy. I have fixed
various things:

* dizzy gcc5 backports
* mysterious updated-rc.d license file missing failure
* linux-yocto 4.1 perf issues

Despite these, sadly the builds were not very successful :(.

Master - Last build showed 4 failures:
======================================

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/402/steps/BuildImages/logs/stdio
nativesdk-update-rc.d missing, fix pushed

https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/400/steps/BuildImages/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/400/steps/BuildImages_1/logs/stdio
meta-intel linux-yocto issue (fix pending merging)
nativesdk-update-rc.d missing, fix pushed

https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/413/steps/Running%20Sanity%20Tests/logs/stdio
mips sanity test failure, unknown cause

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/96/steps/Running%20oe-selftest/logs/stdio
3 failures from runqemu issues (Paul working on this)
2 failures from meta-intel linux-yocto issues (fix pending merging)

Fido - Last build showed 5 failures:
====================================

https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/409/steps/Running%20Sanity%20Tests/logs/stdio
qemuarm kernel panic during sanity tests

https://autobuilder.yoctoproject.org/main/builders/nightly-deb/builds/394/steps/BuildImages/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/68/steps/BuildImages/logs/stdio
looks like http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ba07a69f3dc8fb798e372130bf665d059fed9d42, backport needed?

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/94/steps/Running%20oe-selftest/logs/stdio
"Only one copy of bitbake should be run against a build directory" -
Bitbake shutdown race. Fix in master but risky backport, torn on this.

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/405/steps/Running%20Sanity%20Tests/logs/stdio
xorg/vnc systemd issue - Ross has open bug for master

Dizzy - Last Build showed ? failures:
=====================================

Managed to push most gcc5 fixes to the branch which has things building
much better than the first time.

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/97/steps/Running%20oe-selftest/logs/stdio
two different selftest sanity failures

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/407/steps/Running%20Sanity%20Tests/logs/stdio
Systemd login prompt failure issue (Ross also has open bug for this in
master)

https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/413/steps/CheckForGPLv3/logs/stdio
GPLv3 check failing?

https://autobuilder.yoctoproject.org/main/builders/nightly-mips64/builds/60/steps/Running%20Sanity%20Tests/logs/stdio
mips64 sanity test failed - do we support this on dizzy?

https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/68
arm64 build failed - do we support this on dizzy? (machine doesn't exist
so no?)

grub-efi gcc5 issue:
http://errors.yoctoproject.org/Errors/Details/13781/

[build is still ongoing so this is not a complete list]

So all things considered we're not in a good way for the point releases
or M2 :(.

With regard to master-next, my experimental SDK toolchain fixes are
causing issues on armeabi and x32. Whenever I add in Chris' recipetool
changes, the selftest gives odd results too :(. Build is also ongoing.

Cheers,

Richard



