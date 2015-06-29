Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A36BC60670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 05:29:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5T5TWSV013453
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 28 Jun 2015 22:29:32 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 28 Jun 2015 22:29:31 -0700
Message-ID: <5590D7BA.5030306@windriver.com>
Date: Mon, 29 Jun 2015 13:29:30 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
	<1435514866.7287.3.camel@linuxfoundation.org>
In-Reply-To: <1435514866.7287.3.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] perl 5.20.0 -> 5.22.0 and fix test cases
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
X-List-Received-Date: Mon, 29 Jun 2015 05:29:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/29/2015 02:07 AM, Richard Purdie wrote:
> On Tue, 2015-06-23 at 23:26 -0700, Robert Yang wrote:
>> * Upgrade perl 5.20.0 -> 5.22.0
>> * Tested on qemux86, qemuarm, qemuarm64, qemuppc, qemumips, qemux86-64.
>> * Fix for test cases, the test result:
>>    Failed 9 tests out of 2269, 99.60% okay.
>
> This series seems to cause:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/367/steps/BuildImages/logs/stdio
>
> on non-gplv3 builds.

Yes, it would fail when non-gplv3 build, here is a patch to fix
the problem:

   git://git.openembedded.org/openembedded-core-contrib rbt/gdbm
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/gdbm

Robert Yang (1):
   gdbm 1.8.3: install ndbm.h and dbm.h

  meta/recipes-support/gdbm/gdbm_1.8.3.bb |   10 ++++++++++
  1 file changed, 10 insertions(+)


Subject: [PATCH 1/1] gdbm 1.8.3: install ndbm.h and dbm.h

There are gdbm 1.8.3 and gdbm 1.11, while 1.8.3 is GPLv2, it should
install ndbm.h and dbm.h as what 1.11 does, to make perl build OK when
non-gplv3 build.

Fixed when perl build: (non-gplv3 buld)
| NDBM_File.xs:18:60: fatal error: gdbm/ndbm.h: No such file or directory
|  #  include <gdbm/ndbm.h> /* RedHat compatibility version */
|                                                             ^
| compilation terminated.

And:
| ODBM_File.xs:8:19: fatal error: dbm.h: No such file or directory
|  #  include <dbm.h>
|                    ^
| compilation terminated.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
  meta/recipes-support/gdbm/gdbm_1.8.3.bb |   10 ++++++++++
  1 file changed, 10 insertions(+)

diff --git a/meta/recipes-support/gdbm/gdbm_1.8.3.bb 
b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
index 2331d1d..af01b6c 100644
--- a/meta/recipes-support/gdbm/gdbm_1.8.3.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
@@ -17,3 +17,13 @@ SRC_URI[sha256sum] = 
"cc340338a2e28b40058ab9eb5354a21d53f88a1582ea21ba0bb185c37a
  inherit autotools texinfo

  BBCLASSEXTEND = "native nativesdk"
+
+do_install_append () {
+    install -d ${D}${includedir}/gdbm
+    install -m 0644 ${S}/dbm.h ${D}${includedir}/
+    install -m 0644 ${S}/ndbm.h ${D}${includedir}/
+    # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let other 
packages to find
+    # these headers
+    ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
+    ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
+}
-- 
1.7.9.5

// Robert

>
> Cheers,
>
> Richard
>
>
>

