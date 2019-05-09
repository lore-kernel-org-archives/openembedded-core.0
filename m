Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14AE07D3E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 09:53:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x499qvBF005927
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 May 2019 02:53:12 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 9 May 2019 02:53:05 -0700
To: <raj.khem@gmail.com>
References: <20190423101216.188441-1-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <47ad9bdd-b906-1386-1692-fda26a80e301@windriver.com>
Date: Thu, 9 May 2019 17:53:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190423101216.188441-1-kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk: fix compile error for arm64
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
X-List-Received-Date: Thu, 09 May 2019 09:53:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/4/23 下午6:12, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> It removes function JSC::AssemblerBuffer::data() for ARM64 in commit
> https://trac.webkit.org/changeset/236589/webkit. But it is required by
> Cortex A53 from https://trac.webkit.org/changeset/175514/webkit and
> fails to compile for arm64:
>
> | .../tmp/work/aarch64-poky-linux/webkitgtk/2.24.0-r0/webkitgtk-2.24.0/Source/JavaScriptCore/assembler/ARM64Assembler.h:3769:100: error: 'class JSC::AssemblerBuffer' has no member named 'data'
> |     if (UNLIKELY((*reinterpret_cast_ptr<int32_t*>(reinterpret_cast_ptr<char*>(m_buffer.data()) + m_buffer.codeSize() - sizeof(int32_t)) & 0x0a000000) == 0x08000000))
>
> Not set WTF_CPU_ARM64_CORTEXA53 for arm64 to fix the failure.

Any comment please? It still fails even apply the patch to update to 
2.24.1 for qemuarm64.

Regards,
Kai



>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-sato/webkit/webkitgtk_2.24.0.bb | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
> index 4a82dae9ef..54daa217bb 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
> @@ -92,8 +92,6 @@ EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
>   EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
>   EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
>   
> -EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
> -
>   # JIT not supported on MIPS either
>   EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
>   


-- 
Kai Kang


