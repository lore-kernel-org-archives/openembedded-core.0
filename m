Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 05E4F6CBAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 17:57:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Oct 2013 10:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,493,1378882800"; d="scan'208";a="410744114"
Received: from unknown (HELO [10.255.15.234]) ([10.255.15.234])
	by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2013 10:57:51 -0700
Message-ID: <525C309F.8080306@linux.intel.com>
Date: Mon, 14 Oct 2013 10:57:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: JC <jc@vtkloud.com>
References: <1379429376-30184-1-git-send-email-jc@vtkloud.com>
In-Reply-To: <1379429376-30184-1-git-send-email-jc@vtkloud.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libao: add version 1.1.0
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
X-List-Received-Date: Mon, 14 Oct 2013 17:57:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2013 07:49 AM, JC wrote:
> This is basically a 99% import of Peter Tworek's recipe from tworaz666@gmail.com found in https://github.com/tworaz/oe-tworaz/blob/master/meta-jlime/recipes-support/libao/libao_1.1.0.bb
>

Can you give some details as to why we should included it in core vs 
meta-oe?


Thanks
	Sau!


> Signed-off-by: JC <jc@vtkloud.com>
> ---
>   .../recipes-multimedia/libao/libao_1.1.0.bb        | 23 ++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>   create mode 100644 meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
> new file mode 100644
> index 0000000..08950b5
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
> @@ -0,0 +1,23 @@
> +SECTION = "multimedia"
> +SUMMARY = "Libao is a cross-platform audio library that allows programs to output audio using a simple API on a wide variety of platforms"
> +HOMEPAGE = "https://www.xiph.org/ao/"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +SRC_URI="http://downloads.xiph.org/releases/ao/${BP}.tar.gz"
> +SRC_URI[md5sum] = "2b2508c29bc97e4dc218fa162cf883c8"
> +SRC_URI[sha256sum] = "29de5bb9b1726ba890455ef7e562d877df87811febb0d99ee69164b88c171bd4"
> +
> +inherit autotools
> +
> +do_install_append () {
> +    find "${D}" -name '*.la' -exec rm -f {} +
> +}
> +
> +python populate_packages_prepend () {
> +    rootdir = bb.data.expand('${libdir}/ao/plugins-4', d)
> +    rootdir_dbg = bb.data.expand('${libdir}/ao/plugins-4/.debug', d)
> +    do_split_packages(d, rootdir, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s', description='AO %s plugin')
> +    do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s-dbg', description='AO %s plugin debug data')
> +}
>

