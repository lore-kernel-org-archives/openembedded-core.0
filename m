Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 71DAF6AF54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 16:54:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Dec 2013 08:50:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,544,1384329600"; d="scan'208";a="457206980"
Received: from unknown (HELO [10.255.12.16]) ([10.255.12.16])
	by orsmga002.jf.intel.com with ESMTP; 24 Dec 2013 08:54:04 -0800
Message-ID: <52B9BC2C.7080709@linux.intel.com>
Date: Tue, 24 Dec 2013 08:54:04 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Fahad Arslan <fahad_arslan@mentor.com>, 
	openembedded-core@lists.openembedded.org
References: <1387895862-15110-1-git-send-email-fahad_arslan@mentor.com>
In-Reply-To: <1387895862-15110-1-git-send-email-fahad_arslan@mentor.com>
Subject: Re: [PATCH] pulseaudio: rescale input being passed to float method of speex
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
X-List-Received-Date: Tue, 24 Dec 2013 16:54:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/2013 06:37 AM, Fahad Arslan wrote:
> From: Fahad Arslan <Fahad_Arslan@mentor.com>
>
> Pulseaudio uses Speex to do resampling. Default Pulseaudio resampler
> is speex-float-1. However, Speex recipe in poky configures speex in
> fixed point. This scenario creates a situation in which audio streams
> that need to be resampled are not playedback since input to speex is
> zeroed out when flaot input in range of +/-1 is converted to int.
> So we are rescaling the input before invoking speex flaot method.
>
> Upstream-Status: Submitted [pulseaudio-discuss@lists.freedesktop.org]
>
> Signed-off-by: Fahad Arslan <Fahad_Arslan@mentor.com>
> ---
>   .../pulseaudio/rescale_input_to_speex_float.patch  |   24 ++++++++++++++++++++
>   .../pulseaudio/pulseaudio_4.0.bb                   |    3 ++-
>   2 files changed, 26 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_float.patch
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_float.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_float.patch
> new file mode 100644
> index 0000000..fe5e6a7
> --- /dev/null
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_float.patch

Fahad,

The patch itself is missing the Upstream-Status: and Signed-off-by: 
Tags, I know you included them in the commit message above, but they 
need to be in this patch file also.

Thanks
	Sau!

> @@ -0,0 +1,24 @@
> +diff -Naur a/src/pulsecore/resampler.c b/src/pulsecore/resampler.c
> +--- a/src/pulsecore/resampler.c	2013-12-24 18:25:08.164787401 +0500
> ++++ b/src/pulsecore/resampler.c	2013-12-24 18:24:43.056787026 +0500
> +@@ -1347,7 +1347,7 @@
> +
> + static void speex_resample_float(pa_resampler *r, const pa_memchunk *input, unsigned in_n_frames, pa_memchunk *output, unsigned *out_n_frames) {
> +     float *in, *out;
> +-    uint32_t inf = in_n_frames, outf = *out_n_frames;
> ++    uint32_t inf = in_n_frames, outf = *out_n_frames, i;
> +
> +     pa_assert(r);
> +     pa_assert(input);
> +@@ -1357,6 +1357,11 @@
> +     in = pa_memblock_acquire_chunk(input);
> +     out = pa_memblock_acquire_chunk(output);
> +
> ++    /* Speex float API scale range is +/-32768 instead of +/-1.
> ++       So rescale input before passing it to Speex. */
> ++    for (i = 0; i < inf; i++)
> ++        in[i] = 32768.*in[i];
> ++
> +     pa_assert_se(speex_resampler_process_interleaved_float(r->speex.state, in, &inf, out, &outf) == 0);
> +
> +     pa_memblock_release(input->memblock);
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
> index b419c54..5afa20b 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
> @@ -1,7 +1,8 @@
>   require pulseaudio.inc
>
>   SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
> -           file://volatiles.04_pulse"
> +           file://volatiles.04_pulse \
> +           file://rescale_input_to_speex_float.patch"
>
>   SRC_URI[md5sum] = "591f211db2790a7e4d222f2dc6858db3"
>   SRC_URI[sha256sum] = "35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae"
>

