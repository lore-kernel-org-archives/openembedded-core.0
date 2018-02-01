Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id AC0B878635
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 11:32:36 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1ehD6d-0002iu-DU; Thu, 01 Feb 2018 12:32:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0ugeAWX0DOWEn7CaHE8u+XfMeeuoT72cXzCSv5Pz+1c=;
	b=OEd1gMB6a6Z8iyMWOGVQSDPXjv
	VtZZU0YoUEZSgNuugM/wQrR1l4474B4Q8M5hORysrPOwpNdHV+oB7Cz9pf0AT3B8nx0rnXEuoTyNX
	d/nq4ynkfamL+utMj0J3w6IUyNB4j6Pl54jzIY5Afm2aV1LOn13iQZSjCBH1t47i05W2f8PH6bzxU
	oN1Y97t5IUx4t6fYxlRfehOIlczCWwxx3E2ofCYrwFK/E4pg36Q5ckA/BUY/Sok4QxzPBFmzGKacU
	1JesfymYkwmYJxwacXTwbOgeFTxtjl9r5UVipkcPDLZ7U8hbYHVstgWTH5eylQsSpSehnP7u7uwLj
	3TV9vAxg==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1ehD6X-0000Ct-Do; Thu, 01 Feb 2018 12:32:35 +0100
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <20180201102819.14994-1-otavio@ossystems.com.br>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <cd674a9b-40ab-6433-c0ad-0566d4c4faa0@pr.hu>
Date: Thu, 1 Feb 2018 12:32:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180201102819.14994-1-otavio@ossystems.com.br>
X-Spam-Score: -0.4 (/)
X-Scan-Signature: 3da8dd007c9bc004c124c5756b0fc9e5
X-Spam-Tracer: backend.mail.pr.hu -0.4 20180201113235Z
Subject: Duplicate package names, was Re: [PATCH v1] glide: Add 0.13.1 version
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
X-List-Received-Date: Thu, 01 Feb 2018 11:32:37 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Of course, this package should not be confused with the old
3D library from Voodoo Graphics.

But, this and another case that popped up today for me out of
the blue makes it necessary to talk about the issue duplicate
package names from completely different software.

My case is a Node.js module, one that is called nanomsg that
depends on the real nanomsg library.

You can see where this leads, two different software would be
using the same recipe name and we cannot add the second one,
because the name conflict would not cause the one with the
smaller version not built.

The node modules that are built with the help of "inherit npm"
may want to use a "node-" prefix in their names but it would not
work as is because npm.bbclass is using ${PN}.

I have a patch against npm.bbclass that I am testing at the moment
but it may be necessary to talk about this issue in general.

Best regards,
Zoltán Böszörményi

2018-02-01 11:28 keltezéssel, Otavio Salvador írta:
> Glide is a widely used Vendor Package Management for Golang,
> especially in private projects as it allows for internal repositories
> clone and other fancy things.
> 
> This recipe has been originally done as part of updatehub development.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
> Changes in v2:
>   - Add bash runtime dependency on ${PN}-ptest
> 
>   meta/recipes-devtools/glide/glide_0.13.1.bb | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 meta/recipes-devtools/glide/glide_0.13.1.bb
> 
> diff --git a/meta/recipes-devtools/glide/glide_0.13.1.bb b/meta/recipes-devtools/glide/glide_0.13.1.bb
> new file mode 100644
> index 00000000000..1a5b145cf36
> --- /dev/null
> +++ b/meta/recipes-devtools/glide/glide_0.13.1.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Vendor Package Management for Golang"
> +HOMEPAGE = "https://glide.sh"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=54905cf894f8cc416a92f4fc350c35b2"
> +
> +GO_IMPORT = "github.com/Masterminds/glide"
> +SRC_URI = "git://${GO_IMPORT}"
> +SRCREV = "67790b3dbede72cfdc54aa53be4706322c9499e0"
> +
> +inherit go
> +
> +RDEPENDS_${PN}-dev += "bash"
> +RDEPENDS_${PN}-ptest += "bash"
> +
> +BBCLASSEXTEND = "native nativesdk"
> 


