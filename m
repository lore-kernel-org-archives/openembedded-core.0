Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-10.prod.phx3.secureserver.net
	(p3plsmtpa09-10.prod.phx3.secureserver.net [173.201.193.239])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED5060CE6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 07:56:27 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-10.prod.phx3.secureserver.net with 
	id QXwT1m00B1mTNtu01XwU55; Fri, 13 Sep 2013 00:56:29 -0700
Message-ID: <5232C52D.5090005@pabigot.com>
Date: Fri, 13 Sep 2013 02:56:29 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1379049723.git.hongxu.jia@windriver.com>
	<772c186481bec298466fe249f6be7a661e7c6c7b.1379049723.git.hongxu.jia@windriver.com>
In-Reply-To: <772c186481bec298466fe249f6be7a661e7c6c7b.1379049723.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/4] LSB Command Check: fix install_initd and remove_initd not found
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
X-List-Received-Date: Fri, 13 Sep 2013 07:56:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2013 12:33 AM, Hongxu Jia wrote:
> The install_initd and remove_initd are linked to /sbin/chkconfig for lsb
> core test, and chkconfig has been moved from /sbin to /usr/sbin in order
> to fix QA warning about unsafe references in binaries.
> (In commit e486242db83297701803866bea971a2f1a1135fe)
>
> Let install_initd and remove_initd link to /usr/sbin/chkconfig could fix
> this issue.
>
> [YOCTO #5152]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb | 4 ++--
>   meta/recipes-extended/lsb/lsb_4.1.bb                | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> index c6f8b1d..38c3cdf 100644
> --- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> +++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> @@ -50,8 +50,8 @@ do_install() {
>   
>   do_install_append_linuxstdbase() {
>   	install -d ${D}${libdir}/lsb/
> -	ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
> -	ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
> +	ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
> +	ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
>   }
>   

Your repository appears to be out of date; this append was removed in 
oe-core 77a0b904e18688ecf81a35544f3a5d6ba0aa61a8

>   PACKAGES =+ "${PN}-alternatives ${PN}-alternatives-doc"
> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
> index 59d5bca..c80ff59 100644
> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
> @@ -79,8 +79,8 @@ do_install_append(){
>   
>          # creat links for LSB test
>          install -d ${D}/${libdir}/lsb
> -       ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
> -       ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
> +       ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
> +       ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
>          ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
>   
>          if [ "${TARGET_ARCH}" = "x86_64" ];then


