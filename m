Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5AEDB7841C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 02:54:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB62sbsv006389
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 5 Dec 2017 18:54:37 -0800
Received: from [128.224.162.151] (128.224.162.151) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 5 Dec 2017 18:54:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <1512528404-110242-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <0bc94a28-0fda-49ed-f8c8-76f314efb6de@windriver.com>
Date: Wed, 6 Dec 2017 10:57:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1512528404-110242-1-git-send-email-hongxu.jia@windriver.com>
Cc: bruce.ashfield@windriver.com
Subject: Re: [PATCH 1/2] scripts/runqemu: qemumips support up to 2GiB RAM
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
X-List-Received-Date: Wed, 06 Dec 2017 02:54:37 -0000
Content-Type: multipart/alternative;
	boundary="------------604FB0418E7D788569A6D4FB"
Content-Language: en-US

--------------604FB0418E7D788569A6D4FB
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年12月06日 10:46, Hongxu Jia wrote:
> OE uses qemumips to simulate a Malta board by default.
>
> As upstream qemu introduced:
> https://git.qemu.org/?p=qemu.git;a=commit;h=94c2b6aff43cdfcfdfb552773a6b6b973a72ef0b
>
> The Malta board can support up to 2GiB of RAM which should
> be able to boot a Linux kernel built with CONFIG_HIGHMEM
> enabled and passing "-m 2048" to QEMU and appending the
> following kernel parameters:

Hi Ross,

I have sent another fix to linux-yocto to enable CONFIG_HIGHMEM
for qemumips (mti-malta32).

//Hongxu

> ...
> mem=256M@0x0 mem=256M@0x90000000 mem=1536M@0x20000000
> ...
>
> But the following commit in kernel broke above mem=X@Y setting
> which added the memory as reserved memory area.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411
> ...
> commit 73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411
> Author: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Date:   Wed Nov 23 14:43:49 2016 +0100
>
>      MIPS: fix mem=X@Y commandline processing
> ...
>
> So remove `mem=*' to disable user-defined physical RAM map
> which let kernel itself caculates memory ranges.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   scripts/runqemu | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index f2b4b3c..0ae2f85 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -658,7 +658,10 @@ class BaseConfig(object):
>               logger.info('QB_MEM is not set, use 512M by default')
>               self.set('QB_MEM', '-m 512')
>   
> -        self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
> +        mach = self.get('MACHINE')
> +        if mach != 'qemumips':
> +            self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
> +
>           self.qemu_opt_script += ' %s' % self.get('QB_MEM')
>   
>       def check_tcpserial(self):



--------------604FB0418E7D788569A6D4FB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017年12月06日 10:46, Hongxu Jia wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1512528404-110242-1-git-send-email-hongxu.jia@windriver.com">
      <pre wrap="">OE uses qemumips to simulate a Malta board by default.

As upstream qemu introduced:
<a class="moz-txt-link-freetext" href="https://git.qemu.org/?p=qemu.git;a=commit;h=94c2b6aff43cdfcfdfb552773a6b6b973a72ef0b">https://git.qemu.org/?p=qemu.git;a=commit;h=94c2b6aff43cdfcfdfb552773a6b6b973a72ef0b</a>

The Malta board can support up to 2GiB of RAM which should
be able to boot a Linux kernel built with CONFIG_HIGHMEM
enabled and passing "-m 2048" to QEMU and appending the
following kernel parameters:</pre>
    </blockquote>
    <br>
    Hi Ross, <br>
    <br>
    I have sent another fix to linux-yocto to enable CONFIG_HIGHMEM<br>
    for qemumips (<span style="color: rgb(51, 51, 51); font-family:
      Arial, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">mti-malta32</span>).<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
      cite="mid:1512528404-110242-1-git-send-email-hongxu.jia@windriver.com">
      <pre wrap="">
...
mem=256M@0x0 mem=256M@0x90000000 mem=1536M@0x20000000
...

But the following commit in kernel broke above mem=X@Y setting
which added the memory as reserved memory area.
<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411</a>
...
commit 73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411
Author: Marcin Nowakowski <a class="moz-txt-link-rfc2396E" href="mailto:marcin.nowakowski@imgtec.com">&lt;marcin.nowakowski@imgtec.com&gt;</a>
Date:   Wed Nov 23 14:43:49 2016 +0100

    MIPS: fix mem=X@Y commandline processing
...

So remove `mem=*' to disable user-defined physical RAM map
which let kernel itself caculates memory ranges.

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 scripts/runqemu | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index f2b4b3c..0ae2f85 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -658,7 +658,10 @@ class BaseConfig(object):
             logger.info('QB_MEM is not set, use 512M by default')
             self.set('QB_MEM', '-m 512')
 
-        self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
+        mach = self.get('MACHINE')
+        if mach != 'qemumips':
+            self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
+
         self.qemu_opt_script += ' %s' % self.get('QB_MEM')
 
     def check_tcpserial(self):
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------604FB0418E7D788569A6D4FB--
