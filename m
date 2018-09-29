Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B6FB879982
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:30:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8TCUCrj026212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 29 Sep 2018 13:30:13 +0100
Message-ID: <f7670593f1d04dfe9e212a4b86d766fa3cdb60cb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
Date: Sat, 29 Sep 2018 13:30:12 +0100
In-Reply-To: <1538190383-31405-1-git-send-email-hongxu.jia@windriver.com>
References: <1538190383-31405-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] libidn2: improve reproducibility
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
X-List-Received-Date: Sat, 29 Sep 2018 12:30:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-09-29 at 11:06 +0800, Hongxu Jia wrote:
> Remoe prefix ${RECIPE_SYSROOT} in libidn2.pc
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-extended/libidn/libidn2_2.0.5.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> index 0daf7a6..7a06ed3 100644
> --- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> +++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> @@ -27,3 +27,9 @@ LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
>  LICENSE_${PN}-bin = "GPLv3+"
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +PACKAGE_PREPROCESS_FUNCS += "libidn2_package_preprocess"
> +libidn2_package_preprocess () {
> +    sed -e 's@${RECIPE_SYSROOT}@@g' \
> +       -i ${PKGD}${libdir}/pkgconfig/libidn2.pc
> +}

Why is RECIPE_SYSROOT in here in the first place? Can you include the
exact issue in the commit message?

I suspect there is probably a better fix than this.

On reason I hate sed expressions like this is that the sed expression
will sit there forever as its very hard to tell if it still applies
anymore. So more detail needed and it really probably should be a patch
 of some sort.

Cheers,

Richard



