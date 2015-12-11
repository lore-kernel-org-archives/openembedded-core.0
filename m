Return-Path: <stefan@agner.ch>
X-Greylist: delayed 541 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Dec 2015 22:19:12 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 8C98E6E665
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 22:19:12 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9C5E75C0ECD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 23:09:54 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 11 Dec 2015 14:08:29 -0800
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Message-ID: <dea7a8e1c1cc91c74d853ba340906164@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1449871794; bh=GdSM95VEqi63RFZ8jHhb7xiRV6dPgqmnnUQbUzwz3C8=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Subject:Message-ID;
	b=0F3Zh3FGAhURJ57i4cN903mAcWcC79Paoxp9VKTvNpwNpbmGPl7DAXUQeucS2/OcB1s96xDNAcJrCk+iec+rwoqR104EARou6ETNMjbY0z0ZbATarEBj5v3T2VIrSLDhyn5o+rmXpZiXjl78V8QaNQUvZw64BayO9RD32C/4lhs=
Subject: Compiling Python in a path which contains $BUILD_SYS
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
X-List-Received-Date: Fri, 11 Dec 2015 22:19:15 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

When compiling Python in a path which contains $BUILD_SYS (typically
"x86_64-linux"), then Python fails to build with the following error:

| x86_64-angstromsdk-linux-gcc 
--sysroot=/home/ags/localbin/toradex/bsp/linux/x86_64-linux/bsp/oe-core/build/out-glibc/sysroots/x86_64-nativesdk-angstromsdk-linux
-L/home/ags/localbin/toradex/bsp/linux/x86_64-linux/bsp/oe-core/build/out-glibc/sysroots/x86_64-nativesdk-angstromsdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/lib
-Wl,-rpath-link,/home/ags/localbin/toradex/bsp/linux/x86_64-linux/bsp/oe-core/build/out-glibc/sysroots/x86_64-nativesdk-angstromsdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/lib
-Wl,-rpath,/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/lib
-Wl,-O1
-L/home/ags/localbin/toradex/bsp/linux/x86_64-linux/bsp/oe-core/build/out-glibc/sysroots/x86_64-nativesdk-angstromsdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib
-Wl,-rpath-link,/home/ags/localbin/toradex/bsp/linux/x86_64-linux/bsp/oe-core/build/out-glibc/sysroots/x86_64-nativesdk-angstromsdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib
-Wl,-rpath,/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib
-Wl,-O1 -L.
-L/home/ags/localbin/toradex/bsp/linux/x86_64-linux/bsp/oe-core/build/out-glibc/sysroots/x86_64-nativesdk-angstromsdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/lib
-Xlinker -export-dynamic -o python \
| 		Modules/python.o \
| 		-L. -lpython2.7 -lpthread -ldl  -lpthread -lutil   -lm
| error: invalid Python installation: unable to open
/home/ags/localbin/toradex/bsp/linux/x86_64-angstromsdk-linux/bsp/oe-core/build/out-glibc/work/x86_64-nativesdk-angstromsdk-linux/nativesdk-python/2.7.3-r0.3/Python-2.7.3/pyconfig.h
(No such file or directory)
| make: *** [sharedmods] Error 1
| ERROR: oe_runmake failed
| WARNING:
/home/ags/localbin/toradex/bsp/linux/x86_64-linux/bsp/oe-core/build/out-glibc/work/x86_64-nativesdk-angstromsdk-linux/nativesdk-python/2.7.3-r0.3/temp/run.do_compile.5641:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at
/home/ags/localbin/toradex/bsp/linux/x86_64-linux/bsp/oe-core/build/out-glibc/work/x86_64-nativesdk-angstromsdk-linux/nativesdk-python/2.7.3-r0.3/temp/log.do_compile.5641)


My builddir is in
/home/ags/localbin/toradex/bsp/linux/x86_64-linux/bsp/oe-core/build/

But Python suddenly searches in
/home/ags/localbin/toradex/bsp/linux/x86_64-angstromsdk-linux/bsp/oe-core/build/

I think the issue comes from the patch
12-distutils-prefix-is-inside-staging-area.patch, which replaces
BUILD_SYS with HOST_SYS in the whole absolute path, even outside of the
build directory... Is there a easy fix for this? As a workaround, making
sure that the user does not build in a directory which contains
$BUILD_SYS would already be helpful, e.g.
# Check if $BUILDDIR contains the string $BUILD_SYS
if [ "${BUILDDIR/${BUILD_SYS}//}" != "$BUILDDIR" ]; then
        bberror "Python can not be built in a directory which contains
the BUILD_SYS string."
fi

--
Stefan

