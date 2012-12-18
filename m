Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tl2tv-0001sc-C3
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 20:32:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Dec 2012 11:17:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,310,1355126400"; d="scan'208";a="233460458"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.212])
	by azsmga001.ch.intel.com with ESMTP; 18 Dec 2012 11:17:43 -0800
Message-ID: <50D0C156.9050500@linux.intel.com>
Date: Tue, 18 Dec 2012 11:17:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <1355821397-23458-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1355821397-23458-2-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1355821397-23458-2-git-send-email-marcin.juszkiewicz@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] slang: added gnu-configize for AArch64 support
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
X-List-Received-Date: Tue, 18 Dec 2012 19:32:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/2012 01:03 AM, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   meta/recipes-extended/slang/slang_2.2.4.bb | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
> index 60aac66..946e9f6 100644
> --- a/meta/recipes-extended/slang/slang_2.2.4.bb
> +++ b/meta/recipes-extended/slang/slang_2.2.4.bb
> @@ -29,6 +29,14 @@ SRC_URI[sha256sum] = "9a8257a9a2a55099af858b13338dc8f3a06dd2069f46f0df2c9c3bb84a
>
>   EXTRA_OECONF += " --without-z --without-png --without-onig --x-includes=${STAGING_DIR_HOST}/usr/include/X11 --x-libraries=${STAGING_DIR_HOST}/usr/lib"
>
> +do_configure_prepend() {
> +    # slang keeps configure.ac and rest of autoconf files in autoconf/ directory
> +    # we have to go there to be able to run gnu-configize cause it expects configure.{in,ac}
> +    # to be present. Resulting files land in autoconf/autoconf/ so we need to move them.
> +    cd ${S}/autoconf && gnu-configize --force && mv autoconf/config.* .
> +    cd ${S}
> +}
Should these be ${S} or ${B} (or some combination), I believe we are 
trying to allow for builds to be in a different dir where ${S} != ${B}?

Sau!

> +
>   do_install() {
>   	oe_runmake install DESTDIR=${D} -e 'INST_LIB_DIR=${STAGING_DIR_HOST}/usr/lib'
>   }
>


