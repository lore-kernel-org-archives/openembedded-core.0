Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.448.1620237840970964660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 11:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.25] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E766D1C0009
	for <openembedded-core@lists.openembedded.org>; Wed,  5 May 2021 18:03:58 +0000 (UTC)
Subject: Re: [OE-core] [PATCH] sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure message
To: openembedded-core@lists.openembedded.org
References: <167C3D553755CCE6.2490@lists.openembedded.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <53809387-0c3b-11b4-cca8-e61d5a1abe71@bootlin.com>
Date: Wed, 5 May 2021 20:03:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <167C3D553755CCE6.2490@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

On 5/5/21 7:56 PM, Michael Opdenacker wrote:
> This expands the error message when a network failure is detected.
> It happens that some ISPs or networks block the default example.com
> domain. Therefore, instead of disabling network access, it
> lets the user know how to modify the test URL.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  meta/classes/sanity.bbclass | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index a377917f2a..e907a3566f 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -392,9 +392,12 @@ def check_connectivity(d):
>              msg = data.getVar('CONNECTIVITY_CHECK_MSG') or ""
>              if len(msg) == 0:
>                  msg = "%s.\n" % err
> -                msg += "    Please ensure your host's network is configured correctly,\n"
> -                msg += "    or set BB_NO_NETWORK = \"1\" to disable network access if\n"
> -                msg += "    all required sources are on local disk.\n"
> +                msg += "    Please ensure your host's network is configured correctly.\n"
> +                msg += "    If your ISP or network is blocking the above URL,\n"
> +                msg += "    try with another domain name, for example by setting:\n"
> +                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.yoctoproject.org/\""
> +                msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
> +                msg += "    access if all required sources are on local disk.\n"
>              retval = msg


I just had the issue today, https://www.example.com/ being blocked on my
local network.

I'll also submit a documentation patch, as CONNECTIVITY_CHECK_URIS
doesn't appear in the documentation at all.

But who needs documentation with helpful error messages ;-) ?

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

