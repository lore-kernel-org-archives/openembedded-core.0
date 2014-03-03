Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9E266EFC3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 03:25:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s233PgFk014698
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Mar 2014 19:25:42 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Sun, 2 Mar 2014 19:25:41 -0800
Message-ID: <5313F632.60207@windriver.com>
Date: Mon, 3 Mar 2014 11:25:38 +0800
From: Lu Chong <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1393612134-15665-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1393612134-15665-1-git-send-email-ross.burton@intel.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH] ncurses: use ln -r to generate relative symlink
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
X-List-Received-Date: Mon, 03 Mar 2014 03:25:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/01/2014 02:28 AM, Ross Burton wrote:
> Instead of using a Python do_install() and calling
> oe.path.make_relative_symlink, just pass -r to ln to generate a relative symlink
> directly.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-core/ncurses/ncurses.inc |   10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index a94466a..835ecc3 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -147,12 +147,7 @@ _install_cfgs = "\
>     PKG_CONFIG_LIBDIR='${libdir}/pkgconfig' \
>   "
>   
> -python do_install () {
> -    bb.build.exec_func("shell_do_install", d)
> -    oe.path.make_relative_symlink(d.expand("${D}${libdir}/libtinfo.so"))
> -}
> -
> -shell_do_install() {
> +do_install() {
>           # Order of installation is important; widec installs a 'curses.h'
>           # header with more definitions and must be installed last hence.
>           # Compatibility of these headers will be checked in 'do_test()'.
> @@ -226,8 +221,7 @@ shell_do_install() {
>   
>               mv ${D}${libdir}/libtinfo.so.* ${D}${base_libdir}
>               rm ${D}${libdir}/libtinfo.so
> -            # We'll turn this into a relative symlink after do_install returns
> -            ln -sf ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
> +            ln -rsf ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
Hi Ross,

In Ubuntu 12.04, `ln' command doesn't have '-r' option.
we will get following error during building ncurses
     ln: invalid option -- 'r'

Best Regards
Chong
>           fi
>   
>           oe_multilib_header curses.h


