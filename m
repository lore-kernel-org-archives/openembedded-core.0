Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 541F56CDAC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 08:18:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9B8IM6q031387; Fri, 11 Oct 2013 09:18:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xPLs0Lqxc3um; Fri, 11 Oct 2013 09:18:22 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9B8IJ1K031374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 11 Oct 2013 09:18:20 +0100
Message-ID: <1381479495.29912.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 11 Oct 2013 09:18:15 +0100
In-Reply-To: <1381428927-7057-1-git-send-email-otavio@ossystems.com.br>
References: <1381428927-7057-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uboot-config.bbclass; Raise an error for unknown configs
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
X-List-Received-Date: Fri, 11 Oct 2013 08:18:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-10-10 at 15:15 -0300, Otavio Salvador wrote:
> When passing the wrong value for UBOOT_CONFIG it ought to raise an
> error otherwise it is quite difficult for user to notice it didn't
> behave as expected.
> 
> Reported-by: Lauren Post <lauren.post@freescale.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/uboot-config.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
> index ba01bff..ff226a1 100644
> --- a/meta/classes/uboot-config.bbclass
> +++ b/meta/classes/uboot-config.bbclass
> @@ -51,4 +51,9 @@ python () {
>              if len(items) > 1 and items[1]:
>                  bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
>                  d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
> +
> +            # Go out as we found a match!
> +            break
> +    else:
> +        raise bb.parse.SkipPackage("UBOOT_CONFIG %s is not supported" % ubootconfig)
>  }

Shouldn't this be an exception such as ValueError rather than
SkipPackage?

Cheers,

Richard


