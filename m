Return-Path: <martin@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id A52BF611E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 11:56:19 +0000 (UTC)
Received: from [192.168.8.20] (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id EB34BAEACB;
	Thu, 20 Feb 2020 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1582199779; bh=iWdcXb1tpLxAfIITshEwic7VZBaLP26D0gADvWBhdYw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=UkJ6gKyRkxQ/YRU5Gt4Mis3UK55nmPtyKRrGbAM/M7B0IazLMJ3C1sN2tU+yO+Bbe
	SqhmkPqBZMopOa/kP08wZ1VZO17wzrb3Dwwr6jT/nOfA10AAA5pOL8KiYlWJLzFzo2
	4VqLrttafGJSx5xpiAxF0PYPl4xKFGTRxuDbTYn9/gL6Sw7hykydvyMm/c6KX9WnaT
	OjAf4Ll8xMS5LJlxeH5gkl27WI4mKMC9WZ/l5Z4UeeY62D+PYVwEeRIfo6B/EollCP
	6oFKku+o31EjhKUCTzRaBMY5PyvIQIWnbkmPqHVjpivwt1y7MQz1hUIBKCFkxEQ8o0
	mBPGqsZkIcahA==
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200219152355.123718-1-richard.purdie@linuxfoundation.org>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <f7970658-f3a4-051c-cd6b-b40d2b72b61c@geanix.com>
Date: Thu, 20 Feb 2020 12:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219152355.123718-1-richard.purdie@linuxfoundation.org>
X-Spam-Status: No, score=-1.2 required=4.0 tests=ALL_TRUSTED,BAYES_40,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on 05ff821c8cf1
Subject: Re: [PATCH] gstreamer: Fix reproducibility issue around libcap
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
X-List-Received-Date: Thu, 20 Feb 2020 11:56:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

Hi,

On 19/02/2020 16.23, Richard Purdie wrote:
> Add an option to avoid builds depending on the presence of setcap
> from the host system.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   .../gstreamer/gstreamer1.0/capfix.patch       | 37 +++++++++++++++++++
>   .../gstreamer/gstreamer1.0_1.16.1.bb          |  2 +
>   2 files changed, 39 insertions(+)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> new file mode 100644
> index 00000000000..7ca3d5ad4a6
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> @@ -0,0 +1,37 @@
> +Currently gstreamer configuration depends on whether setcap is found on the host
> +system. Turn this into a configure option to make builds deterinistic.
> +
> +RP 2020/2/19
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Upstream-Status: Pending
> +
> +Index: gstreamer-1.16.1/libs/gst/helpers/meson.build
> +===================================================================
> +--- gstreamer-1.16.1.orig/libs/gst/helpers/meson.build
> ++++ gstreamer-1.16.1/libs/gst/helpers/meson.build
> +@@ -73,7 +73,12 @@ if have_ptp
> +     endif
> +   endif
> +
> +-  setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
> ++  setcap_feature = get_option('setcap')
> ++  if setcap_feature.disabled()
> ++    setcap = find_program('dontexist', required : false)
> ++  else
> ++    setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
> ++  endif

I think this can be simplified by using get_option() directly for the 
"required" argument:

setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', 
required : get_option('setcap'))

// Martin
> +
> +   # user/group to change to in gst-ptp-helper
> +   ptp_helper_setuid_user = get_option('ptp-helper-setuid-user')
> +Index: gstreamer-1.16.1/meson_options.txt
> +===================================================================
> +--- gstreamer-1.16.1.orig/meson_options.txt
> ++++ gstreamer-1.16.1/meson_options.txt
> +@@ -26,6 +26,7 @@ option('libunwind', type : 'feature', va
> + option('libdw', type : 'feature', value : 'auto', description : 'Use libdw to generate better backtraces from libunwind')
> + option('dbghelp', type : 'feature', value : 'auto', description : 'Use dbghelp to generate backtraces')
> + option('bash-completion', type : 'feature', value : 'auto', description : 'Install bash completion files')
> ++option('setcap', type : 'feature', value : 'auto', description : 'Use setcap')
> +
> + # Common feature options
> + option('examples', type : 'feature', value : 'auto', yield : true)
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
> index 6b8a5a0eb01..68f5ca649fe 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
> @@ -21,6 +21,7 @@ SRC_URI = " \
>       file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
>       file://0003-meson-Add-valgrind-feature.patch \
>       file://0004-meson-Add-option-for-installed-tests.patch \
> +    file://capfix.patch \
>   "
>   SRC_URI[md5sum] = "c505fb818b36988daaa846e9e63eabe8"
>   SRC_URI[sha256sum] = "02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af0639d46f1cf4377d"
> @@ -39,6 +40,7 @@ PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
>   PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils"
>   PACKAGECONFIG[bash-completion] = "-Dbash-completion=enabled,-Dbash-completion=disabled,bash-completion"
>   PACKAGECONFIG[tools] = "-Dtools=enabled,-Dtools=disabled"
> +PACKAGECONFIG[setcap] = "-Dsetcap=enabled,-Dsetcap=disabled,libcap"
>   
>   # TODO: put this in a gettext.bbclass patch
>   def gettext_oemeson(d):
> 

