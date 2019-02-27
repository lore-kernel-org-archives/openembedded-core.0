Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A37097C8CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 03:35:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1R3ZBO1005259
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2019 19:35:22 -0800
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Tue, 26 Feb 2019 19:35:00 -0800
To: <richard.purdie@linuxfoundation.org>
References: <4367f854b1ff23bc2972294715d3837725ee7c43.1550195817.git.kai.kang@windriver.com>
	<20190219065725.171013-1-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <45f046c5-214c-2bcb-bfd4-0f35c71cba2a@windriver.com>
Date: Wed, 27 Feb 2019 11:34:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190219065725.171013-1-kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] libidn2: fix buildpaths qa issue in .pc file
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
X-List-Received-Date: Wed, 27 Feb 2019 03:35:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/2/19 下午2:57, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> When enable buildpaths qa check, it show warning of libidn2:
>
> | WARNING: libidn2-2.0.5-r0 do_package_qa: QA Issue: File
> /work/armv5e-poky-linux-gnueabi/libidn2/2.0.5-r0/packages-split/libidn2-dev/usr/lib/pkgconfig/libidn2.pc
> in package contained reference to tmpdir [buildpaths]
>
> Fix the issue by substituting @LTLIBUNISTRING@ in the .pc file.

Ping.


>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../fix-host-contamination-in-pc-file.patch   | 22 +++++++++++++++++++
>   meta/recipes-extended/libidn/libidn2_2.0.5.bb |  3 ++-
>   2 files changed, 24 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/libidn/libidn2/fix-host-contamination-in-pc-file.patch
>
> diff --git a/meta/recipes-extended/libidn/libidn2/fix-host-contamination-in-pc-file.patch b/meta/recipes-extended/libidn/libidn2/fix-host-contamination-in-pc-file.patch
> new file mode 100644
> index 0000000000..026312ab0a
> --- /dev/null
> +++ b/meta/recipes-extended/libidn/libidn2/fix-host-contamination-in-pc-file.patch
> @@ -0,0 +1,22 @@
> +Configure option --with-libunistring-prefix is set to fix compile-host-path qa
> +issue. It causes @LTLIBUNISTRING@ in line 'Libs.private' of libidn2.pc replaced
> +with ${STAGING_EXECPREFIXDIR} which causes buildpaths qa issue.
> +
> +libunistring is a dependency of libidn2 and installs libraries to standard
> +library path, so just substitute @LTLIBUNISTRING@ with standard library path
> +and -lunistring in libidn2.pc.in.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> +diff --git a/libidn2.pc.in b/libidn2.pc.in
> +index 0dade23..24cc29d 100644
> +--- a/libidn2.pc.in
> ++++ b/libidn2.pc.in
> +@@ -8,4 +8,4 @@ Description: Library implementing IDNA2008 and TR46
> + Version: @PACKAGE_VERSION@
> + Cflags: -I${includedir}
> + Libs: -L${libdir} -lidn2
> +-Libs.private: @LTLIBICONV@ @LTLIBUNISTRING@
> ++Libs.private: @LTLIBICONV@ -L${libdir} -lunistring
> diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> index 0daf7a6877..a243a9181e 100644
> --- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> +++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ab90e75ef97cc6318ce4f2fbda62fe4d \
>   
>   SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
>              file://Unset-need_charset_alias-when-building-for-musl.patch \
> -          "
> +           file://fix-host-contamination-in-pc-file.patch \
> +           "
>   SRC_URI[md5sum] = "eaf9a5b9d03b0cce3760f34b3124eb36"
>   SRC_URI[sha256sum] = "53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8"
>   


-- 
Kai Kang


