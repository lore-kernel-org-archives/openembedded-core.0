Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D21E74586
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 21:02:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9FL2HWM008797
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Oct 2018 14:02:17 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 15 Oct 2018 14:02:16 -0700
To: Victor Kamensky <kamensky@cisco.com>,
	<openembedded-core@lists.openembedded.org>
References: <20181015182128.13115-1-kamensky@cisco.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <04a92673-1751-7868-5424-1cd00819dd28@windriver.com>
Date: Mon, 15 Oct 2018 17:02:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181015182128.13115-1-kamensky@cisco.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] systemtap: 3.3 -> 4.0
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
X-List-Received-Date: Mon, 15 Oct 2018 21:02:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/15/2018 02:21 PM, Victor Kamensky wrote:
> Upgrade systemtap from 3.3 to 4.0: Removed backported patch.
> 
> Very short summary of major changes from SystemTap 4.0
> announcement by Frank Ch. Eigler <fche@redhat.com>:
> 
>> prometheus exporter network service; ebpf support extensions including
>> strings and implementation of traditional log(), sprintf() functions;
>> rebuilt rich tapset coverage for 4.17+ syscalls and for
>> tracepoint-based syscalls; script language tweaks for supporting
>> machine-generated scripts
> 
> Fixes [YOCTO #12950]
> 
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
> Hi Guys,
> 
> I'll let you to decide whether you want to accept
> it for 2.6 at this point or push it for the next release.
> On one hand after move to 4.18 kernel SystemTap 3.3
> fails to trace any system call on x86_64 - it is major
> functionality breakage. Look at:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1596456

Ouch!

> 
> On other hand it is quite late to do major version
> updates.

It is but nothing depends on systemtap so I think we
don't have much choice and we should do it unless there
are autobuilder tests that regress.


A quick read through the YP mega-manual suggests that
we don't have to change any of the text.
Victor,
Could you take a look and confirm that please?

I noticed that the link in section:
    20.3.3. Documentation
for:
    http://sourceware.org/systemtap/langref/
is dead. There is a pdf:
    http://sourceware.org/systemtap/langref.pdf
Perhaps this is temporary due to the recent release.

> 
> I did go through limited set of tests on all
> supported QEMU targets. As far as these tests
> concerned proposed 4.0 matches 3.3 results.
> 
> Thanks,
> Victor

Thanks Victor.

Talk about hot off the presses, 4.0 was released at:
    13-Oct-2018 18:54

$ git log --oneline release-3.3..release-4.0 | wc -l
252

$ git diff release-3.3..release-4.0 | diffstat | tail -1
  1574 files changed, 50756 insertions(+), 23604 deletions(-)

Lots of changes to docs, testsuite but also quite a bit to core code
and tapsets:

$ git diff release-3.3..release-4.0 | diffstat  | cut -d"/" -f-2 | uniq 
-c |grep -v "   [1-5] "
     770  b/doc
      16  b/httpd
       8  b/man
       9  b/po
      18  b/runtime
      15  b/stap-exporter
       6  b/staprun
     440  b/tapset
     223  b/testsuite


../Randy

> 
>   ...entrypc-avoid-usage-of-uninitialized.patch | 46 -------------------
>   .../systemtap/systemtap_git.inc               |  5 +-
>   2 files changed, 2 insertions(+), 49 deletions(-)
>   delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch
> 
> diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch b/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch
> deleted file mode 100644
> index d0082a1094..0000000000
> --- a/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 8466fca2a074323a235ef38d425f994a2ff7e64f Mon Sep 17 00:00:00 2001
> -From: Victor Kamensky <kamensky@cisco.com>
> -Date: Mon, 9 Jul 2018 09:31:19 -0700
> -Subject: [PATCH] dwflpp::function_entrypc avoid usage of uninitialized memory
> -
> -Failure on 3.3 release was observed. Failure was elusive and
> -disappeared after seemingly random configure option change, or when
> -code was compiled with -O1 or -O0 (vs default -O2). Running failing
> -test case under valgrind memcheck pointed to couple places where
> -'Conditional jump or move depends on uninitialised value(s)' occured.
> -
> -After addressing these in two places in dwflpp::function_entrypc,
> -valgrind memcheck run is clean and original issue got fixed.
> -
> -Upstream-Status: Backport
> -Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ----
> - dwflpp.cxx | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/dwflpp.cxx b/dwflpp.cxx
> -index bfbb6b096..2172e705a 100644
> ---- a/dwflpp.cxx
> -+++ b/dwflpp.cxx
> -@@ -2465,13 +2465,17 @@ bool
> - dwflpp::function_entrypc (Dwarf_Addr * addr)
> - {
> -   assert (function);
> -+
> -+  // assign default value
> -+  *addr = 0;
> -+
> -   // PR10574: reject 0, which tends to be eliminated COMDAT
> -   if (dwarf_entrypc (function, addr) == 0 && *addr != 0)
> -     return true;
> -
> -   /* Assume the entry pc is the base address, or (if zero)
> -      the first address of the ranges covering this DIE.  */
> --  Dwarf_Addr start, end;
> -+  Dwarf_Addr start = 0, end;
> -   if (dwarf_ranges (function, 0, addr, &start, &end) >= 0)
> -     {
> -       if (*addr == 0)
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index 06924fc240..274fcde5c1 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -1,7 +1,7 @@
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -SRCREV = "48867d1cface9445d58e3c6e14497770b7eb77e1"
> -PV = "3.3"
> +SRCREV = "428f84e9e656bce71018e8902e4edb8aacafcc0e"
> +PV = "4.0"
>   
>   SRC_URI = "git://sourceware.org/git/systemtap.git \
>              file://configure-allow-to-disable-libvirt.patch \
> @@ -11,7 +11,6 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
>              file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
>              file://0001-Install-python-modules-to-correct-library-dir.patch \
>              file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
> -           file://0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch \
>              "
>   
>   COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
> 


-- 
# Randy MacLeod
# Wind River Linux

