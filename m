Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FEB76FFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 02:18:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0D2IPjs014098
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Jan 2016 18:18:26 -0800 (PST)
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Jan 2016 18:18:24 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1452264916.git.alexander.kanavin@linux.intel.com>
	<548fe6538063b3021c1dc46b1d710c495f5d67d8.1452264916.git.alexander.kanavin@linux.intel.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
Message-ID: <5695B3EB.8040504@windriver.com>
Date: Wed, 13 Jan 2016 10:18:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <548fe6538063b3021c1dc46b1d710c495f5d67d8.1452264916.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 2/3] valgrind: don't restrict to armv7a
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
X-List-Received-Date: Wed, 13 Jan 2016 02:18:26 -0000
Content-Type: multipart/alternative;
	boundary="------------010002090700040802070409"

--------------010002090700040802070409
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alexander

I got valgrind do_compile error:

MACHINE = "qemuarm"
$ bitbake valgrind

warning: switch -mcpu=cortex-a8 conflicts with -march=armv5e switch
| {standard input}:25: Error: selected processor does not support ARM 
mode `movw r3,#:lower16:primary_map'
| {standard input}:28: Error: selected processor does not support ARM 
mode `movt r3,#:upper16:primary_map'
| {standard input}:30: Error: selected processor does not support ARM 
mode `uxth r1,r0'
| {standard input}:31: Error: selected processor does not support ARM 
mode `movw r3,#0xAAAA'
| {standard input}:40: Error: selected processor does not support ARM 
mode `movw r3,#0x5555'
| {standard input}:61: Error: selected processor does not support ARM 
mode `movw r3,#:lower16:primary_map'
| {standard input}:64: Error: selected processor does not support ARM 
mode `movt r3,#:upper16:primary_map'
| {standard input}:66: Error: selected processor does not support ARM 
mode `uxth r1,r0'
| {standard input}:94: Error: selected processor does not support ARM 
mode `movw r3,#:lower16:primary_map'
| {standard input}:95: Error: selected processor does not support ARM 
mode `uxth r1,r0'
| {standard input}:96: Error: selected processor does not support ARM 
mode `movt r3,#:upper16:primary_map'
| {standard input}:135: Error: selected processor does not support ARM 
mode `movw r3,#:lower16:primary_map'
| {standard input}:136: Error: selected processor does not support ARM 
mode `uxth r1,r0'
| {standard input}:137: Error: selected processor does not support ARM 
mode `movt r3,#:upper16:primary_map'

Thanks!

//dengke

On 2016年01月08日 22:57, Alexander Kanavin wrote:
> From: Andre McCurdy <armccurdy@gmail.com>
>
> Valgrind has been tested on armv5te/qemuarm, so it seems
> that valgrind's configure check for armv7 is over cautious.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> index 0823144..575db35 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> @@ -27,14 +27,16 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>   SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
>   SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
>   
> -COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
> -COMPATIBLE_HOST_armv7a = 'arm.*-linux'
> +COMPATIBLE_HOST = '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
>   
>   inherit autotools ptest
>   
>   EXTRA_OECONF = "--enable-tls --without-mpicc"
> -EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
>   EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', True) != '32']}"
> +
> +# valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
> +EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
> +
>   EXTRA_OEMAKE = "-w"
>   
>   CFLAGS_append_libc-uclibc = " -D__UCLIBC__ "


--------------010002090700040802070409
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Alexander<br>
    <br>
    I got valgrind do_compile error:<br>
    <br>
    MACHINE = "qemuarm" <br>
    $ bitbake valgrind<br>
    <br>
    <font color="#3333ff">warning: switch -mcpu=cortex-a8 conflicts with
      -march=armv5e switch</font><br>
    <font color="#3333ff">| {standard input}:25: Error: selected
      processor does not support ARM mode `movw
      r3,#:lower16:primary_map'<br>
      | {standard input}:28: Error: selected processor does not support
      ARM mode `movt r3,#:upper16:primary_map'<br>
      | {standard input}:30: Error: selected processor does not support
      ARM mode `uxth r1,r0'<br>
      | {standard input}:31: Error: selected processor does not support
      ARM mode `movw r3,#0xAAAA'<br>
      | {standard input}:40: Error: selected processor does not support
      ARM mode `movw r3,#0x5555'<br>
      | {standard input}:61: Error: selected processor does not support
      ARM mode `movw r3,#:lower16:primary_map'<br>
      | {standard input}:64: Error: selected processor does not support
      ARM mode `movt r3,#:upper16:primary_map'<br>
      | {standard input}:66: Error: selected processor does not support
      ARM mode `uxth r1,r0'<br>
      | {standard input}:94: Error: selected processor does not support
      ARM mode `movw r3,#:lower16:primary_map'<br>
      | {standard input}:95: Error: selected processor does not support
      ARM mode `uxth r1,r0'<br>
      | {standard input}:96: Error: selected processor does not support
      ARM mode `movt r3,#:upper16:primary_map'<br>
      | {standard input}:135: Error: selected processor does not support
      ARM mode `movw r3,#:lower16:primary_map'<br>
      | {standard input}:136: Error: selected processor does not support
      ARM mode `uxth r1,r0'<br>
      | {standard input}:137: Error: selected processor does not support
      ARM mode `movt r3,#:upper16:primary_map'</font><br>
    <br>
    Thanks!<br>
    <br>
    //dengke<br>
    <br>
    <div class="moz-cite-prefix">On 2016年01月08日 22:57, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote
cite="mid:548fe6538063b3021c1dc46b1d710c495f5d67d8.1452264916.git.alexander.kanavin@linux.intel.com"
      type="cite">
      <pre wrap="">From: Andre McCurdy <a class="moz-txt-link-rfc2396E" href="mailto:armccurdy@gmail.com">&lt;armccurdy@gmail.com&gt;</a>

Valgrind has been tested on armv5te/qemuarm, so it seems
that valgrind's configure check for armv7 is over cautious.

Signed-off-by: Andre McCurdy <a class="moz-txt-link-rfc2396E" href="mailto:armccurdy@gmail.com">&lt;armccurdy@gmail.com&gt;</a>
Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alexander.kanavin@linux.intel.com">&lt;alexander.kanavin@linux.intel.com&gt;</a>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 0823144..575db35 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -27,14 +27,16 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2\SRC_URI[md5sum]=">"http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "</a>4ea62074da73ae82e0162d6550d3f129"
 SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
 
-COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
-COMPATIBLE_HOST_armv7a = 'arm.*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
 
 inherit autotools ptest
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
-EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
 EXTRA_OECONF += <a class="moz-txt-link-rfc2396E" href="mailto:${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS',True)!='32']}">"${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', True) != '32']}"</a>
+
+# valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
+EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
+
 EXTRA_OEMAKE = "-w"
 
 CFLAGS_append_libc-uclibc = " -D__UCLIBC__ "
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------010002090700040802070409--
