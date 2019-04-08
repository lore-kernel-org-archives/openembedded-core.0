Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25A0B7D43F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 01:59:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x381xNZF003129
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Apr 2019 18:59:33 -0700
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 7 Apr 2019 18:59:12 -0700
To: <raj.khem@gmail.com>
References: <20190404075205.108547-1-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <d7797aa9-4b8d-9bb9-536e-f4bfa5ab906e@windriver.com>
Date: Mon, 8 Apr 2019 09:58:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190404075205.108547-1-kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] virglrenderer: remove link option -Bsymbolic
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
X-List-Received-Date: Mon, 08 Apr 2019 01:59:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/4/4 下午3:52, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> When gcc compile options '-O2 -fvisibility=default' are applied, it
> fails to compile virglrenderer for x86:
>
> | ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
>    R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be used
>    when making a shared object
> | ld: final link failed: bad value
> | collect2: error: ld returned 1 exit status
>
> Remove link option '-Bsymbolic' to fix the failure.


Any comments on this patch? Thank.

Kai


>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../0001-Remove-link-option-Bsymbolic.patch   | 34 +++++++++++++++++++
>   .../virglrenderer/virglrenderer_0.7.0.bb      |  1 +
>   2 files changed, 35 insertions(+)
>   create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-Remove-link-option-Bsymbolic.patch
>
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Remove-link-option-Bsymbolic.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Remove-link-option-Bsymbolic.patch
> new file mode 100644
> index 0000000000..faefa16aae
> --- /dev/null
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Remove-link-option-Bsymbolic.patch
> @@ -0,0 +1,34 @@
> +When gcc compile options '-O2 -fvisibility=default' are applied, it fails to
> +compile virglrenderer for x86:
> +
> +| ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
> +  R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be used
> +  when making a shared object
> +| ld: final link failed: bad value
> +| collect2: error: ld returned 1 exit status
> +
> +Remove link option '-Bsymbolic' to fix the failure.
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/213]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + src/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 9b668c8..7a421b8 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -48,7 +49,7 @@ endif
> + lib_LTLIBRARIES = libvirglrenderer.la
> + noinst_LTLIBRARIES = libvrend.la
> +
> +-GM_LDFLAGS = -Wl,-Bsymbolic -version-number 0:2 -no-undefined
> ++GM_LDFLAGS = -version-number 0:2 -no-undefined
> +
> + libvirglrenderer_la_SOURCES = virglrenderer.c
> + libvirglrenderer_ladir = $(libdir)
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> index 225a0b8b0c..afc709bc48 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> @@ -9,6 +9,7 @@ SRCREV = "402c228861c9893f64cffbbcb4cb23044b8c721c"
>   SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
>              file://0001-vtest-add-missing-includes.patch \
>              file://0001-Makefile.am-explicitly-link-with-libdrm.patch \
> +           file://0001-Remove-link-option-Bsymbolic.patch \
>              "
>   
>   S = "${WORKDIR}/git"


-- 
Kai Kang


