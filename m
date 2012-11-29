Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeDVW-0006N5-7q
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 00:27:14 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5816566eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 15:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=5UdzYM6Jc8lEA0c3moQnSsYL22hBQe4yba6ImLA1KMY=;
	b=Eq6Y7Tz/zPE8mS4MLZGYnsilie8Xz01ialCMdOxbYeL06771c/nUne5uofmjBTaVPe
	SAA6kL1nEcerMP77VkNCh5xyGM4te+wH8BO8aUJSCzMfKOipfYQ/sikHfn5r7svDOJM5
	vXlmWE5GI3WVChI7kIRg/4ul5sCrRRCYX29vPN47+fZiHUTv34SDC3JVuT3jALEHi5nj
	b4dntt8apSz6uz8I6396jjH4iCSaG1zklCJ7IJwD44eM8hDYHxmDK3deY8s391BUEQ44
	dOGb6i9DsH2WwCpdNjlhZaWVRoFfVxna2SPdIJPDzd2iuNn17Wa55k/bR+dj5u/i12Up
	Kihw==
Received: by 10.14.203.132 with SMTP id f4mr87476094eeo.11.1354230765833;
	Thu, 29 Nov 2012 15:12:45 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g47sm6716205eeo.6.2012.11.29.15.12.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 15:12:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 00:12:31 +0100
Message-Id: <cover.1354230112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
MIME-Version: 1.0
Subject: [PATCH 0/8] Fixes for ARM tune files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 23:27:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Here is couple of fixes for ARM tune files: 
* 1st and 2nd fix issues caused by my last tune patchset.
* 3rd and 4th are fixing issues which were there for long time, just overlooked
* 5th is just formal change which makes it easier to spot copy&paste issues
* 6th is fix for SIGILL on armv4t and higher
* 7th and 8th add more possible DEFAULTTUNE values for cortexa* and armv6 without vfp

To make sure there are no issues I've tested not only few selected tune/machine 
combinations, but all of them with simple script
http://git.openembedded.org/openembedded-core-contrib/tree/scripts/tune/test.sh?h=jansa/tune2-test

You can see available tunes in:
http://git.openembedded.org/openembedded-core-contrib/tree/scripts/tune/availtunes?h=jansa/tune2-test

And available PACKAGE_ARCHS in:
http://git.openembedded.org/openembedded-core-contrib/tree/scripts/tune/packagearchs?h=jansa/tune2-test

Or all bitbake -e logs in
http://git.openembedded.org/openembedded-core-contrib/tree/scripts/tune?h=jansa/tune2-test

The following changes since commit 99f003356be43bb361634359a5d3c520f72f0a08:

  local.conf.sample: Enable disk space monitoring by default (2012-11-28 15:25:14 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/tune-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/tune-fix

Martin Jansa (7):
  tune-cortexa*, tune-xscale: fix ARMPKGARCH
  tune-*: add PACKAGE_EXTRA_ARCHS entries starting with specific
    ARMPKGARCH
  arch-armv5: fix missing thumb TUNE_FEATURE in armv5t-vfp and
    following tunes
  arch-armv[457]*: fix PACKAGE_EXTRA_ARCHS for bigendian TUNEs
  arch-arm*: unify appending to TUNE_FEATURES
  arch-armv4.inc: add --fix-v4bx to TARGET_LD_KERNEL_ARCH only for
    armv4 and strongarm1100
  tune-cortexa*: add another TUNE which allows to enable cortexa*
    together with thumb and neon

Víctor Enríquez (1):
  arch-armv6: add tunes without vfp enabled

 meta/conf/machine/include/arm/arch-armv4.inc     | 13 +++++++---
 meta/conf/machine/include/arm/arch-armv5-dsp.inc | 13 +++++-----
 meta/conf/machine/include/arm/arch-armv5.inc     | 20 +++++++-------
 meta/conf/machine/include/arm/arch-armv6.inc     | 33 ++++++++++++++++--------
 meta/conf/machine/include/arm/arch-armv7a.inc    | 23 ++++++++---------
 meta/conf/machine/include/tune-arm1136jf-s.inc   |  2 +-
 meta/conf/machine/include/tune-arm920t.inc       |  3 +--
 meta/conf/machine/include/tune-arm926ejs.inc     |  2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc      |  3 +--
 meta/conf/machine/include/tune-cortexa8.inc      | 32 +++++++++++++----------
 meta/conf/machine/include/tune-cortexa9.inc      | 32 +++++++++++++----------
 meta/conf/machine/include/tune-cortexm1.inc      |  3 +--
 meta/conf/machine/include/tune-cortexm3.inc      |  1 -
 meta/conf/machine/include/tune-ep9312.inc        |  1 +
 meta/conf/machine/include/tune-iwmmxt.inc        |  2 +-
 meta/conf/machine/include/tune-strongarm1100.inc |  4 +--
 meta/conf/machine/include/tune-xscale.inc        |  6 ++---
 17 files changed, 106 insertions(+), 87 deletions(-)

-- 
1.8.0



