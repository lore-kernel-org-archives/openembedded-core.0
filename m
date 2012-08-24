Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4ylu-0002pA-4l
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:38:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2012 11:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="210738565"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2012 11:26:09 -0700
Message-ID: <5037C741.4070107@linux.intel.com>
Date: Fri, 24 Aug 2012 11:26:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1345468841-12320-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1345468841-12320-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libiconv: skip recipe if using eglibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 18:38:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2012 06:20 AM, Paul Eggleton wrote:
> libiconv is provided for use with uClibc - if you build it together with
> eglibc (which already PROVIDES virtual/libiconv) you can end up with
> dependency problems during do_rootfs.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/recipes-support/libiconv/libiconv_1.11.1.bb |    5 +++++
>   meta/recipes-support/libiconv/libiconv_1.14.bb   |    5 +++++
>   2 files changed, 10 insertions(+)
>
> diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
> index 186a5a1..055e20d 100644
> --- a/meta/recipes-support/libiconv/libiconv_1.11.1.bb
> +++ b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
> @@ -20,6 +20,11 @@ S = "${WORKDIR}/libiconv-${PV}"
>
>   inherit autotools pkgconfig gettext
>
> +python __anonymous() {
> +    if d.getVar("TCLIBC", True) == "eglibc":
> +        raise bb.parse.SkipPackage("libiconv is provided for use with uClibc only - eglibc already provides iconv")
> +}
> +
>   EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
>
>   LEAD_SONAME = "libiconv.so"
> diff --git a/meta/recipes-support/libiconv/libiconv_1.14.bb b/meta/recipes-support/libiconv/libiconv_1.14.bb
> index af33d6b..6666866 100644
> --- a/meta/recipes-support/libiconv/libiconv_1.14.bb
> +++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
> @@ -21,6 +21,11 @@ S = "${WORKDIR}/libiconv-${PV}"
>
>   inherit autotools pkgconfig gettext
>
> +python __anonymous() {
> +    if d.getVar("TCLIBC", True) == "eglibc":
> +        raise bb.parse.SkipPackage("libiconv is provided for use with uClibc only - eglibc already provides iconv")
> +}
> +
>   EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
>
>   LEAD_SONAME = "libiconv.so"
>

Merged into OE-Core

Thanks
	Sau!



