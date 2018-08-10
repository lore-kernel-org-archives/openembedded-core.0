Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3633F78C10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 09:03:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w7A93kjO016032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 10 Aug 2018 10:03:47 +0100
Message-ID: <c68310f2a56a13e0f0a0e30071ec30dd1d65854b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2018 10:03:46 +0100
In-Reply-To: <20180810073139.89868-6-zhixiong.chi@windriver.com>
References: <20180810073139.89868-1-zhixiong.chi@windriver.com>
	<20180810073139.89868-6-zhixiong.chi@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 6/6] nss: fix multilib file conflict
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
X-List-Received-Date: Fri, 10 Aug 2018 09:03:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-10 at 00:31 -0700, Zhixiong Chi wrote:
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  meta/recipes-support/nss/nss_3.38.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/nss/nss_3.38.bb b/meta/recipes-
> support/nss/nss_3.38.bb
> index f3e5170a89..4f53b55f05 100644
> --- a/meta/recipes-support/nss/nss_3.38.bb
> +++ b/meta/recipes-support/nss/nss_3.38.bb
> @@ -33,7 +33,9 @@ SRC_URI[sha256sum] = "2c643d3c08d6935f4d325f40743719b6990aa25a79ec2f8f712c99d086
>  UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
>  UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
>  
> -inherit siteinfo
> +inherit siteinfo multilib_script
> +
> +MULTILIB_SCRIPTS = "${PN}:${sysconfdir}/pki/nssdb/secmod.db ${PN}:${sysconfdir}/pki/nssdb/key3.db"

Shouldn't those files be architecture independent given the files are
in sysconfdir? Isn't this really a determinism problem and we should
fix the builds to be deterministic instead?

Cheers,

Richard

