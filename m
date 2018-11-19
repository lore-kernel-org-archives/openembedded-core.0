Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED846C0E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 01:33:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAJ1XFRN023802
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Nov 2018 17:33:15 -0800 (PST)
Received: from [128.224.163.157] (128.224.163.157) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 18 Nov 2018 17:33:14 -0800
To: <richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
References: <1541657297-30997-2-git-send-email-mingli.yu@windriver.com>
	<1542188296-116872-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5BF21278.5000503@windriver.com>
Date: Mon, 19 Nov 2018 09:31:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1542188296-116872-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.163.157]
Subject: Re: [PATCH v3] python: add tk support
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
X-List-Received-Date: Mon, 19 Nov 2018 01:33:21 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ping.

Thanks,

On 2018年11月14日 17:38, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Add support to enable tk via PACKGECONFIG.
> before the patch:
>   # python
>   Python 2.7.15 (default, Nov  8 2018, 04:53:50)
>   [GCC 8.2.0] on linux2
>   Type "help", "copyright", "credits" or "license" for more information.
>   >>> import Tkinter
>   Traceback (most recent call last):
>    File "<stdin>", line 1, in <module>
>    File "/usr/lib64/python2.7/lib-tk/Tkinter.py", line 39, in <module>
>      import _tkinter # If this fails your Python may not be configured for Tk
>   ImportError: No module named _tkinter
>   >>>
>
> After the patch, if enable tk in PACKGECONFIG, then
>   # python
>   Python 2.7.15 (default, Oct 25 2018, 08:12:45)
>   [GCC 8.2.0] on linux2
>   Type "help", "copyright", "credits" or "license" for more information.
>   >>> import Tkinter
>   >>>
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   meta/recipes-devtools/python/python/python2-manifest.json | 3 ++-
>   meta/recipes-devtools/python/python_2.7.15.bb             | 5 +++--
>   2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
> index 260fa6f..a9f3924 100644
> --- a/meta/recipes-devtools/python/python/python2-manifest.json
> +++ b/meta/recipes-devtools/python/python/python2-manifest.json
> @@ -966,6 +966,7 @@
>               "core"
>           ],
>           "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.so",
>               "${libdir}/python2.7/lib-tk"
>           ]
>       },
> @@ -1043,4 +1044,4 @@
>               "${libdir}/python2.7/lib-dynload/zlib.so"
>           ]
>       }
> -}
> \ No newline at end of file
> +}
> diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
> index dd969d8..6a60aa7 100644
> --- a/meta/recipes-devtools/python/python_2.7.15.bb
> +++ b/meta/recipes-devtools/python/python_2.7.15.bb
> @@ -21,7 +21,7 @@ SRC_URI += "\
>     file://setuptweaks.patch \
>     file://check-if-target-is-64b-not-host.patch \
>     file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
> -  file://avoid_warning_about_tkinter.patch \
> +  ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
>     file://avoid_warning_for_sunos_specific_module.patch \
>     file://python-2.7.3-remove-bsdb-rpath.patch \
>     file://run-ptest \
> @@ -45,6 +45,7 @@ EXTRA_OECONF += "ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
>
>   PACKAGECONFIG ??= "bdb"
>   PACKAGECONFIG[bdb] = ",,db"
> +PACKAGECONFIG[tk] = ",,tk"
>
>   do_configure_append() {
>   	rm -f ${S}/Makefile.orig
> @@ -172,7 +173,7 @@ RDEPENDS_${PN}-modules += "${PN}-misc"
>
>   # ptest
>   RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip"
> -
> +RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
>   # catch manpage
>   PACKAGES += "${PN}-man"
>   FILES_${PN}-man = "${datadir}/man"
>

