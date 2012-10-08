Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TLHSX-0003UR-Ql
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 19:49:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q98HaYxa012760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Oct 2012 10:36:34 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 8 Oct 2012 10:36:33 -0700
Message-ID: <50730F21.3040401@windriver.com>
Date: Mon, 8 Oct 2012 12:36:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1349711421.15658.121.camel@ted>
In-Reply-To: <1349711421.15658.121.camel@ted>
Subject: Re: [PATCH RFC] pkgconfig: Drop automatic pkgconfig RDEPENDS
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
X-List-Received-Date: Mon, 08 Oct 2012 17:49:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/12 10:50 AM, Richard Purdie wrote:
> Just because a recipe uses pkgconfig, it doesn't mean that it's -dev
> package should RDEPENDS on pkgconfig. I can understand the thinking
> that lead to this but it makes sense to be able to install the package
> when pkgconfig hasn't been built.
>
> Currently you can also get failures where pkgconfig wasn't built yet
> a -dev package is included that depends on it leading to rootfs failures.
>
> I considered making this a RRECOMMENDS but it should probably be an
> RSUGGESTS at best given the tenuous pkgconfig requirement any given
> -dev package has. In the end I decided we might as well just remove it.

I believe the rpmdeps stuff will also add a runtime pkgconfig dependency if it 
encounters a .pc file during processing.

I know this was debated in the past on various workstation/server distros and 
the end result came about because it was cheaper to include pkgconfig when a 
-dev package had a .pc file in it, then support users who couldn't figure out 
how to properly compiler the stuff on their own.

If we want to change that behavior, then we'll likely have to filter it later as 
well.

--Mark

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/pkgconfig.bbclass b/meta/classes/pkgconfig.bbclass
> index 5908b7f..ad1f84f 100644
> --- a/meta/classes/pkgconfig.bbclass
> +++ b/meta/classes/pkgconfig.bbclass
> @@ -1,7 +1,2 @@
>   DEPENDS_prepend = "pkgconfig-native "
>
> -PKGCONFIGRDEP = "pkgconfig"
> -PKGCONFIGRDEP_virtclass-native = ""
> -PKGCONFIGRDEP_virtclass-nativesdk = "nativesdk-pkgconfig"
> -
> -RDEPENDS_${PN}-dev += "${PKGCONFIGRDEP}"
> --
> cgit 0.9.0.1
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



