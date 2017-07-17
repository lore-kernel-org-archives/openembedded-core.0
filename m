Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 704B577E93
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 13:47:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 17 Jul 2017 06:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,374,1496127600"; d="scan'208";a="879704543"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Jul 2017 06:47:10 -0700
Message-ID: <1500299820.5349.102.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Zhenbo Gao <zhenbo.gao@windriver.com>
Date: Mon, 17 Jul 2017 08:57:00 -0500
In-Reply-To: <1500282788-218393-1-git-send-email-zhenbo.gao@windriver.com>
References: <1500282788-218393-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lsb: add checking for chkconfig existence when creating the symbolic
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
X-List-Received-Date: Mon, 17 Jul 2017 13:47:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-07-17 at 17:13 +0800, Zhenbo Gao wrote:
> remove_initd and remove_initd will be created as the symbolic file

I believe you mean 'install_initd and remove_initd'...

> of chkconfig, which will be not existed when systemd is configured,
> so adding the check for the existence of chkconfig before creating
> the symbolic.
> 
> Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
> ---
>  meta/recipes-extended/lsb/lsb_4.1.bb | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
> index cedf39e..c8db1a8 100644
> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
> @@ -90,11 +90,13 @@ do_install_append() {
>         install -m 0755 ${WORKDIR}/init-functions ${D}${nonarch_base_libdir}/lsb
>  
>         # create links for LSB test
> -       if [ "${nonarch_base_libdir}" != "${nonarch_libdir}" ] ; then
> -               install -d ${D}${nonarch_libdir}/lsb
> +       if [ -e ${sbindir}/chkconfig ]; then
> +               if [ "${nonarch_base_libdir}" != "${nonarch_libdir}" ] ; then
> +                       install -d ${D}${nonarch_libdir}/lsb
> +               fi
> +               ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/install_initd
> +               ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/remove_initd
>         fi
> -       ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/install_initd
> -       ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/remove_initd
>  
>         if [ "${TARGET_ARCH}" = "x86_64" ]; then
>                 if [ "${base_libdir}" != "${base_prefix}/lib64" ]; then
> -- 
> 1.9.1
> 



