Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B79916010D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 14:20:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tANEK7e2003628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 06:20:07 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 23 Nov 2015 06:20:06 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1448285591.git.liezhi.yang@windriver.com>
	<991915823dfa6b4cabe990272b246cf4bad05038.1448285591.git.liezhi.yang@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56532095.5090301@windriver.com>
Date: Mon, 23 Nov 2015 08:20:05 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <991915823dfa6b4cabe990272b246cf4bad05038.1448285591.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] package_manager.py: fix RPM_PREFER_ELF_ARCH for mips
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
X-List-Received-Date: Mon, 23 Nov 2015 14:20:06 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/23/15 7:41 AM, Robert Yang wrote:
> We can install 64 bit pkg to 32 bit pkg, so the previous checking is
> incorrect, it should not only check mips64 or mips64el, the "mips"
> should work, and 64bit ELF can also use mips as TUNE_ARCH, and there
> are other mips varieties, so only check whether TUNE_ARCH starts with
> mips or not.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/lib/oe/package_manager.py |    9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 964fddc..5e7bb66 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -954,12 +954,11 @@ class RpmPM(PackageManager):
>                  bb.fatal("Invalid RPM_PREFER_ELF_ARCH: %s, it should be one of:\n"
>                          "\t1: ELF32 wins\n"
>                          "\t2: ELF64 wins\n"
> -                        "\t4: ELF64 N32 wins (mips64 or mips64el only)" %
> +                        "\t4: ELF64 N32 wins (mips only)" %

N32 is only available on a MIPS64 platform.  It requires MIPS64 instructions,
which is why it is documented as such above.

>                          prefer_color)
> -            if prefer_color == "4" and self.d.getVar("TUNE_ARCH", True) not in \
> -                                    ['mips64', 'mips64el']:
> -                bb.fatal("RPM_PREFER_ELF_ARCH = \"4\" is for mips64 or mips64el "
> -                         "only.")
> +            if prefer_color == "4" and not \
> +                    self.d.getVar("TUNE_ARCH", True).startswith('mips'):
> +                bb.fatal("RPM_PREFER_ELF_ARCH = \"4\" is for mips only.")

The bug is that it's looking for TUNE_ARCH, it should be MACHINE_ARCH in this
case.  Since the overall MACHINE Is what defined if it can be used or not.

--Mark

>              self._invoke_smart('config --set rpm-extra-macros._prefer_color=%s'
>                          % prefer_color)
>  
> 


