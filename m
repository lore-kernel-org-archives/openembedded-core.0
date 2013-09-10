Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C57956161F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 07:33:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8A7XiqM025206
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Sep 2013 00:33:44 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 10 Sep 2013 00:33:42 -0700
Message-ID: <522ECB4B.2070209@windriver.com>
Date: Tue, 10 Sep 2013 15:33:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1378736079.3484.117.camel@ted>
In-Reply-To: <1378736079.3484.117.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] bitbake.conf: Stop providing ${P} and ${PF} by default
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
X-List-Received-Date: Tue, 10 Sep 2013 07:33:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi RP,

Thanks, Can we provide a replacement for the "bitbake PN-PV" since it is
useful, for example, can we support the PREFERRED_VERSION_${PN} in the env
in the future ? There is a similar bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4965

// Robert


On 09/09/2013 10:14 PM, Richard Purdie wrote:
> For a long time we've provided PN-PV and PN-PV-PR by tweaking PROVIDES. This looks
> nice at first glance however it turns out to be a bit problematic. Taking make as an
> example where there are two versions, 3.81 and 3.82, what should "bitbake make-3.81" do?
>
> Currently it builds make-3.81 and make-3.82 and breaks in interesting ways. Is that
> a bitbake bug? Well, it certainly shouldn't try and run the build. Why is it building
> 3.82 though? Its due to finding a dependency on "make-dev" and then trying to figure
> out what provides it? The answer is "make" and the default version of "make" is 3.82.
>
> So arguably, finding "make-3.81" should infer PREFERRED_VERSION_make = "3.81". Doing
> so resolved the above problem since now "make" resolves to "make-3.81".
>
> So what about if we have Recipe A:
> DEPENDS = "make-3.81"
> and Recipe B:
> DEPENDS = "make-3.82"
>
> That is clearly an error, easy. So finally what about if we have Recipe A:
> DEPENDS = "make-3.81"
> and Recipe B:
> DEPENDS = "make"
>
> The first recipe infers the PREFERRED_VERSION_make = "3.81" and then forces that
> version on everything else. Is that desired? Probably not in most cases, at least not
> silently.
>
> As mitigation, we could print a WARNING about this happening. The final part of the problem
> is that we can ony figure this out within bitbake itself. That means we'd have to teach bitbake
> about the PN-PV format of PROVIDES which is breaking the separation between bitbake and the
> metadata. We can't win :(.
>
> Nobody that I know of is using or relying on this functionality so perhaps we should
> just remove it instead which is what this patch does. Opinions?
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 2d19d86..578c7d0 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -253,7 +253,7 @@ DEPCHAIN_POST = "-dev -dbg"
>   DEPENDS = ""
>   RDEPENDS = ""
>   PROVIDES = ""
> -PROVIDES_prepend = "${P} ${PF} ${PN} "
> +PROVIDES_prepend = "${PN} "
>   RPROVIDES = ""
>
>   MULTI_PROVIDER_WHITELIST = "virtual/libintl virtual/libintl-native virtual/nativesdk-libintl virtual/xserver virtual/update-alternatives-native virtual/update-alternatives"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

