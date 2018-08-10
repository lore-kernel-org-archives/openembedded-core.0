Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BA8C878C10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 09:01:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w7A91AIj015848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 10 Aug 2018 10:01:12 +0100
Message-ID: <42c71326fe10606f527a0a21ba8fb863bd1d05af.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2018 10:01:10 +0100
In-Reply-To: <20180810073139.89868-2-zhixiong.chi@windriver.com>
References: <20180810073139.89868-1-zhixiong.chi@windriver.com>
	<20180810073139.89868-2-zhixiong.chi@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/6] libcheck: fix the multilib header conflict
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
X-List-Received-Date: Fri, 10 Aug 2018 09:01:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-10 at 00:31 -0700, Zhixiong Chi wrote:
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  meta/recipes-support/libcheck/libcheck_0.12.0.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
> b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
> index e646d43968..cb97201580 100644
> --- a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
> +++ b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
> @@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/libcheck/c
> heck/releases/"
>  
>  S = "${WORKDIR}/check-${PV}"
>  
> -inherit autotools pkgconfig texinfo
> +inherit autotools pkgconfig texinfo multilib_header
>  
>  CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
>  
> @@ -20,4 +20,8 @@ RREPLACES_${PN} = "check (<= 0.9.5)"
>  RDEPENDS_${PN} += "gawk"
>  RDEPENDS_${PN}_class-native = ""
>  
> +do_install_append() {
> +        oe_multilib_header check_stdint.h
> +}
> +
>  BBCLASSEXTEND = "native nativesdk"

I'd like to understand the difference between the different headers, do
you have an example diff? 

Is there no way we can make them the same for the different multilibs?
oe_multilib_header should only be used when there is no other way...

The same applies to your other patches, an example of the differences
in the headers would be useful for review please.

Cheers,

Richard




