Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qp7Fz-0008Ej-9A
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 01:23:15 +0200
Received: by iyf13 with SMTP id 13so3766102iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 16:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=qQASPGRGAgRxQvStrVyvdzJ0yWC9mJsWDIS8Z5GBvlQ=;
	b=bR4A4s5A5H0GraVoVmROXAIwEW3hpSTZszY3E4k14xMXloBey+eg207MWOvjlXmr8Z
	ODbMf2SDE32kYfuGFy8/RbUaHc0DSropB2cu8HlM2koX9i8PMh+uKUaumZRrR/WTLWtP
	XYBYugTqVBAiGiHN/WBZABUczOfHM7sqzRR2w=
Received: by 10.42.149.199 with SMTP id x7mr1306742icv.246.1312499930893;
	Thu, 04 Aug 2011 16:18:50 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v16sm1553070ibf.42.2011.08.04.16.18.49
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 16:18:49 -0700 (PDT)
Message-ID: <4E3B28D7.8030208@gmail.com>
Date: Thu, 04 Aug 2011 16:18:47 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110627 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
In-Reply-To: <03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 04/10] glibc: bring back the needed support for glibc recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2011 23:23:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 08:01 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>   meta/conf/distro/include/tclibc-glibc.inc   |   32 +++++++++++++++++++++++++++
>   meta/conf/distro/include/tcmode-default.inc |    5 ++++
>   2 files changed, 37 insertions(+), 0 deletions(-)
>   create mode 100644 meta/conf/distro/include/tclibc-glibc.inc
>
> diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
> new file mode 100644
> index 0000000..823195c
> --- /dev/null
> +++ b/meta/conf/distro/include/tclibc-glibc.inc
> @@ -0,0 +1,32 @@
> +#
> +# glibc specific configuration
> +#
> +
> +LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"

why is this specific to glibc and not eglibc ?
since glibc is deleted from metadata this file should go away too
if its for external toolchains then they could use tclibc-eglibc.inc
or tclibc-uclibc.inc as needed.

I am in favour of generally using linux-gnu extention for eglibc/glibc
based systems.

> +
> +# Add glibc to the overrides.
> +OVERRIDES =. "libc-glibc:"
> +
> +PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
> +PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "glibc-nativesdk"
> +PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
> +PREFERRED_PROVIDER_virtual/libc ?= "glibc"
> +PREFERRED_PROVIDER_virtual/libc-nativesdk ?= "glibc-nativesdk"
> +PREFERRED_PROVIDER_virtual/libc-locale ?= "glibc-locale"
> +
> +CXXFLAGS += "-fvisibility-inlines-hidden"
> +
> +LIBC_DEPENDENCIES = "\
> +    libsegfault \
> +    glibc \
> +    glibc-dbg \
> +    glibc-dev \
> +    glibc-utils \
> +    glibc-thread-db \
> +    glibc-localedata-i18n \
> +    glibc-gconv-ibm850 \
> +    glibc-gconv-cp1252 \
> +    glibc-gconv-iso8859-1 \
> +    glibc-gconv-iso8859-15 \
> +    locale-base-en-gb \
> +    "
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 0d0af38..5f66c9e 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -48,6 +48,11 @@ PREFERRED_VERSION_binutils-crosssdk ?= "${BINUVERSION}"
>   PREFERRED_VERSION_binutils-cross-canadian ?= "${BINUVERSION}"
>   PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
>   PREFERRED_VERSION_linux-libc-headers-nativesdk ?= "${LINUXLIBCVERSION}"
> +PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
> +PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
> +PREFERRED_VERSION_glibc-nativesdk ?= "${GLIBCVERSION}"
> +PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
> +PREFERRED_VERSION_glibc-initial-nativesdk ?= "${GLIBCVERSION}"
>   PREFERRED_VERSION_eglibc                   ?= "${EGLIBCVERSION}"
>   PREFERRED_VERSION_eglibc-locale            ?= "${EGLIBCVERSION}"
>   PREFERRED_VERSION_eglibc-nativesdk         ?= "${EGLIBCVERSION}"



