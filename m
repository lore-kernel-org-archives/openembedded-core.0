Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCA56612C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:44:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3Q9iiSL018440
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 02:44:45 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Apr 2016 02:44:43 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1461304177.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <571F388A.4050307@windriver.com>
Date: Tue, 26 Apr 2016 17:44:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1461304177.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/4] set COMPATIBLE_HOST for several recipes
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
X-List-Received-Date: Tue, 26 Apr 2016 09:44:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/22/2016 01:50 PM, Robert Yang wrote:
> The following changes since commit 9838f8d077d16e52ad592879d65a9e8350b93075:
>
>    build-appliance-image: Update to krogoth head revision (2016-04-19 21:25:53 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/arm

Updated patch 2/4 in the repo again according to bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
Bug 9474 - epiphany doesn't work on ARM

So also turn off JIT on armv7a.

Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Wed Apr 20 23:16:47 2016 -0700

     webkitgtk: turn off JIT on armv4 and armv7a

     * It doesn't build on armv4:
     {standard input}: Assembler messages:
     {standard input}:52: Error: selected processor does not support `blx 
llint_throw_stack_overflow_error' in ARM mode
     {standard input}:126: Error: selected processor does not support `bkpt #0' 
in ARM mode
     {standard input}:128: Error: selected processor does not support `blx r0' 
in ARM mode
     {standard input}:134: Error: selected processor does not support `bkpt #0' 
in ARM mode
     {standard input}:185: Error: selected processor does not support `blx 
llint_throw_stack_overflow_error' in ARM mode
     {standard input}:256: Error: selected processor does not support `blx r4' 
in ARM mode
     {standard input}:310: Error: selected processor does not support `movw 
r2,#:lower16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
     {standard input}:311: Error: selected processor does not support `movt 
r2,#:upper16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
     {standard input}:315: Error: selected processor does not support `movw 
r2,#:lower16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
     {standard input}:316: Error: selected processor does not support `movt 
r2,#:upper16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
     [snip]

     * It can build on armv7a, but doesn't work on runtime, cause
       displaying problems or ephiphany hang.

     [YOCTO #9474]

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb 
b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
index d4f1d3b..d089851 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
@@ -63,9 +63,14 @@ EXTRA_OECMAKE = " \
  EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
  EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=OFF "

-# ARM JIT code does not build on ARMv5/6 anymore, apparently they test only on 
v7 onwards
+# ARM JIT code does not build on ARMv4/5/6 anymore
  EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
  EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
+EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
+
+# ARM JIT can build on armv7a, but doesnt' work on runtime, cause
+# displaying problems or ephiphany hang.
+EXTRA_OECMAKE_append_armv7a = " -DENABLE_JIT=OFF "

  # binutils 2.25.1 has a bug on aarch64:
  # https://sourceware.org/bugzilla/show_bug.cgi?id=18430

// Robert

>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/arm
>
> Robert Yang (4):
>    grub_git: set COMPATIBLE_HOST_armv7a to null
>    webkitgtk: set COMPATIBLE_HOST_armv4 to null
>    gnu-efi: set COMPATIBLE_HOST_armv4 to null
>    cogl-1.0: set COMPATIBLE_HOST_armv4 to null
>
>   meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb    | 1 +
>   meta/recipes-bsp/grub/grub_git.bb            | 1 +
>   meta/recipes-graphics/cogl/cogl-1.0.inc      | 2 ++
>   meta/recipes-sato/webkit/webkitgtk_2.10.7.bb | 1 +
>   4 files changed, 5 insertions(+)
>

