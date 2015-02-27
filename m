Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 88772718DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 17:20:04 +0000 (UTC)
Received: by igkb16 with SMTP id b16so2088494igk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 09:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rFUd/+76YBjvo5vzz4RMOSJIJRTPWJcblMH4UopceJA=;
	b=XT+4sogvM9yBfza4/o2hyst4mjXw5jy0tQmuVxfQdbZZhXL2FgW/cZJ88l9PCONqDe
	71LJlyQ1ZRHlRPE1t5fHaTgVYaN2HOfHiA2PFKqFbg6cWa9sW+xTltn1kmpgteeKkqGM
	OBoQBZltdgix5qof3oD0F9VTAqEdoURVmQYLXYrUOcXQzAJ/ndYISfJV/w2/AlVJ2/eE
	MsZrA8+YDk8gO4Kgc6y/8oeUMYEyMkYcWhl9BXOZ/0H1FI8wpKwTxy3Jt7Kvh3fet4n/
	NxmE3wNC/mqxC5Y9OVRTruF3d3SqbfqhNGfTYfTlyo1wTuwX5QwQLU7TuL0yNpmHAMIs
	NuJQ==
X-Received: by 10.43.67.3 with SMTP id xs3mr16484102icb.39.1425057605739;
	Fri, 27 Feb 2015 09:20:05 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id r78sm2594257ioi.22.2015.02.27.09.20.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Feb 2015 09:20:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 17:19:53 +0000
Message-Id: <1425057596-28243-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
References: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/6] libgpg-error: Add -P option to CPPFLAGS
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
X-List-Received-Date: Fri, 27 Feb 2015 17:20:04 -0000

Fixes https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg1301822.html

libgpg-error FTBFS when built with gcc-5. Here is the relevant excerpt:

| Making all in src
| make[4]: Entering directory '/tmp/buildd/libgpg-error/libgpg-error-1.17/src'
| gawk -f ./mkstrtable.awk -v textidx=3 \
|         ./err-sources.h.in >err-sources.h
| gawk -f ./mkstrtable.awk -v textidx=3 \
|         ./err-codes.h.in >err-codes.h
| gawk -f ./mkerrnos.awk ./errnos.in >code-to-errno.h
| gawk -f ./mkerrcodes1.awk ./errnos.in >_mkerrcodes.h
| gcc -E -D_FORTIFY_SOURCE=2  _mkerrcodes.h | grep GPG_ERR_ | \
|                gawk -f ./mkerrcodes.awk >mkerrcodes.h
| rm _mkerrcodes.h
| gcc -I. -I. -o mkerrcodes ./mkerrcodes.c
| In file included from ./mkerrcodes.c:26:0:
| ./mkerrcodes.h:9:5: error: expected expression before ',' token
|    { , "GPG_ERR_E2BIG" },
|      ^

It makes invalid assumptions on undefined behaviour of gcc. To see why,
let us look at the contents of the intermediate steps:

_mkerrcodes.h (deleted):
| ...
| #ifdef E2BIG
| E2BIG   GPG_ERR_E2BIG
| #endif
| #ifdef WSAE2BIG
| WSAE2BIG        GPG_ERR_E2BIG
| #endif
| ...

gcc -E -D_FORTIFY_SOURCE=2  _mkerrcodes.h | grep -v '^$':
| ...
| # 26 "_mkerrcodes.h" 2
| 7
| # 31 "_mkerrcodes.h"
|      GPG_ERR_E2BIG
| # 37 "_mkerrcodes.h" 3 4
| 13
| # 37 "_mkerrcodes.h"
|       GPG_ERR_EACCES
| ...

As can be seen here, the cpp from gcc-5 can split lines and "grep
GPG_ERR_" fails to account for that.

Change-Id: I6f1476e4afc7163ebc3a05106ceaa3b83e3fab3e
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
index 9501b67..6d11605 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "9ff1d6e61d4cef7c1d0607ceef6d40dc33f3da7a3094170c3718c00153
 BINCONFIG = "${bindir}/gpg-error-config"
 
 inherit autotools binconfig-disabled pkgconfig gettext
-
+CPPFLAGS += "-P"
 do_compile_prepend() {
 	TARGET_FILE=linux-gnu
 	if [ ${TARGET_OS} != "linux" ]; then
-- 
2.1.4


