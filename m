Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C465372108
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 02:08:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAH28upt020754
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 18:08:57 -0800 (PST)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 16 Nov 2014 18:08:56 -0800
Message-ID: <546958B6.20605@windriver.com>
Date: Mon, 17 Nov 2014 10:08:54 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1415957951.git.wenzong.fan@windriver.com>
	<50ca2bbefd3b432d2ced6e5fdf8fb396636d55c4.1415957951.git.wenzong.fan@windriver.com>
In-Reply-To: <50ca2bbefd3b432d2ced6e5fdf8fb396636d55c4.1415957951.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH v2 4/4] tcl: clean host path in tclConfig.sh
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
X-List-Received-Date: Mon, 17 Nov 2014 02:09:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Oops, the tcl patch will cause "expect 5.45" configure failures, please 
ignore it for now.

// Wenzong

On 11/14/2014 05:44 PM, wenzong.fan@windriver.com wrote:
> From: Shiqun Lin <Shiqun.Lin@windriver.com>
>
> * /usr/bin/crossscripts/tclConfig.sh
>
> Signed-off-by: Shiqun Lin <Shiqun.Lin@windriver.com>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   meta/recipes-devtools/tcltk/tcl_8.6.2.bb |    5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.2.bb b/meta/recipes-devtools/tcltk/tcl_8.6.2.bb
> index 75fef01..34f3e87 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.6.2.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.6.2.bb
> @@ -58,6 +58,11 @@ do_install() {
>   	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
>   	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
>   	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
> +	sed -i "/TCL_CC/s,\(--sysroot=\).*,--sysroot= '," tclConfig.sh
> +	sed -i "/TCL_BUILD_LIB_SPEC/s,-L${STAGING_LIBDIR},-L${libdir}," tclConfig.sh
> +	sed -i "/TCL_SRC_DIR/s,${STAGING_INCDIR},${includedir}," tclConfig.sh
> +	sed -i "/TCL_BUILD_STUB_LIB_SPEC/s,-L${STAGING_LIBDIR},-L${libdir}," tclConfig.sh
> +	sed -i "/TCL_BUILD_STUB_LIB_PATH/s,${STAGING_INCDIR},${includedir}," tclConfig.sh
>   	install -d ${D}${bindir_crossscripts}
>   	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
>   	install -m 0755 tclConfig.sh ${D}${libdir}
>

