Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB1760F86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 16:14:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2013 08:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,521,1384329600"; d="scan'208";a="455532628"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 20 Dec 2013 08:14:21 -0800
Message-ID: <52B46CDC.40003@linux.intel.com>
Date: Fri, 20 Dec 2013 08:14:20 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Fahad Arslan <fahad_arslan@mentor.com>, 
	openembedded-core@lists.openembedded.org
References: <1387555576-9567-1-git-send-email-fahad_arslan@mentor.com>
In-Reply-To: <1387555576-9567-1-git-send-email-fahad_arslan@mentor.com>
Subject: Re: [PATCH] speex: Scale float input when FIXED_POINT is defined
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
X-List-Received-Date: Fri, 20 Dec 2013 16:14:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/2013 08:06 AM, Fahad Arslan wrote:
> From: Fahad Arslan <Fahad_Arslan@mentor.com>
>
> When Speex is compiled with FIXED_POINT defined, it scales float
> input to +/-32768 instead of +/-1. This was being missed at one
> point causing the input to the resampler to be zeroed. As a result
> there was no audio output.
>
> Signed-off-by: Fahad Arslan <Fahad_Arslan@mentor.com>
> ---
>   .../speex/speex/scaling_fix.patch                  |   12 ++++++++++++
>   meta/recipes-multimedia/speex/speex_1.2rc1.bb      |    3 ++-
>   2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/speex/speex/scaling_fix.patch b/meta/recipes-multimedia/speex/speex/scaling_fix.patch
> new file mode 100644
> index 0000000..a6340d7
> --- /dev/null
> +++ b/meta/recipes-multimedia/speex/speex/scaling_fix.patch

The patch needs Upstream-Status: and Signed-off-by: tags please

Sau!

> @@ -0,0 +1,12 @@
> +diff -NaurbB a/libspeex/resample.c b/libspeex/resample.c
> +--- a/libspeex/resample.c	2013-12-20 19:47:49.154454769 +0500
> ++++ b/libspeex/resample.c	2013-12-20 19:48:16.558454331 +0500
> +@@ -915,7 +915,7 @@
> +        if (in) {
> +          for(j=0;j<ichunk;++j)
> + #ifdef FIXED_POINT
> +-           x[j+st->filt_len-1]=WORD2INT(in[j*istride_save]);
> ++           x[j+st->filt_len-1]=WORD2INT(32768.*in[j*istride_save]);
> + #else
> +            x[j+st->filt_len-1]=in[j*istride_save];
> + #endif
> diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> index faf63b0..0fea51e 100644
> --- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> +++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> @@ -9,7 +9,8 @@ DEPENDS = "libogg"
>
>   PR = "r2"
>
> -SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.tar.gz"
> +SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.tar.gz \
> +           file://scaling_fix.patch"
>
>   SRC_URI[md5sum] = "c4438b22c08e5811ff10e2b06ee9b9ae"
>   SRC_URI[sha256sum] = "342f30dc57bd4a6dad41398365baaa690429660b10d866b7d508e8f1179cb7a6"
>

