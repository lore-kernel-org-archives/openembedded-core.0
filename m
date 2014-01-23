Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18E1960017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 05:56:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0N5ugWk015905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 21:56:42 -0800 (PST)
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 22 Jan 2014 21:56:41 -0800
Message-ID: <52E0AF15.4060105@windriver.com>
Date: Thu, 23 Jan 2014 13:56:37 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1390455633-26958-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1390455633-26958-1-git-send-email-ming.liu@windriver.com>
X-Originating-IP: [128.224.162.153]
Subject: Re: [PATCH] quilt: add ac_cv_path_BASH to CACHED_CONFIGUREVARS also for native
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
X-List-Received-Date: Thu, 23 Jan 2014 05:56:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this patch, it's not a proper fix, I will send a V2 soon.

//Ming Liu

On 01/23/2014 01:40 PM, Ming Liu wrote:
> A issue was fixed in target recipe with commit: 95893404
>
> [
>      quilt: added ac_cv_path_BASH to CACHED_CONFIGUREVARS
>
>      On Fedora 17, bash has moved to /usr/bin/bash and the configure process finds it
>      on the host machine there, this ensures that it is set correctly for the target.
>
>      [YOCTO #2363]
>
>      Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ]
>
> But it's also impacting native package in the case that the sstate is used
> between Fedora 17(or later) and other hosts.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/recipes-devtools/quilt/quilt-0.61.inc | 2 ++
>   meta/recipes-devtools/quilt/quilt_0.61.bb  | 2 --
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/quilt/quilt-0.61.inc b/meta/recipes-devtools/quilt/quilt-0.61.inc
> index f751ac8..7c8136f 100644
> --- a/meta/recipes-devtools/quilt/quilt-0.61.inc
> +++ b/meta/recipes-devtools/quilt/quilt-0.61.inc
> @@ -31,6 +31,8 @@ RDEPENDS_${PN} = "bash"
>   EXTRA_OE_MAKE_ARGS_darwin ?= ""
>   EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
>   
> +CACHED_CONFIGUREVARS += "ac_cv_path_BASH=${base_bindir}/bash"
> +
>   # quilt ignores DESTDIR
>   do_install () {
>   	oe_runmake ${EXTRA_OE_MAKE_ARGS} install
> diff --git a/meta/recipes-devtools/quilt/quilt_0.61.bb b/meta/recipes-devtools/quilt/quilt_0.61.bb
> index 565e46a..3a08d13 100644
> --- a/meta/recipes-devtools/quilt/quilt_0.61.bb
> +++ b/meta/recipes-devtools/quilt/quilt_0.61.bb
> @@ -5,8 +5,6 @@ SRC_URI += "file://aclocal.patch \
>               file://gnu_patch_test_fix_target.patch \
>              "
>   
> -CACHED_CONFIGUREVARS += "ac_cv_path_BASH=${base_bindir}/bash"
> -
>   # fix build-distro specific perl path in the target perl scripts
>   do_install_append() {
>   	for perlscript in ${D}${datadir}/quilt/scripts/remove-trailing-ws ${D}${datadir}/quilt/scripts/dependency-graph ${D}${datadir}/quilt/scripts/edmail ${D}${bindir}/guards


