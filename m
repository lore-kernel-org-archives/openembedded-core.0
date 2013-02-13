Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U5QRs-0002An-7u
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 01:43:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1D0Riqw007967
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 16:27:44 -0800 (PST)
Received: from msp-dhcp44.wrs.com (172.25.34.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 16:27:42 -0800
Message-ID: <511ADDF0.9040703@windriver.com>
Date: Tue, 12 Feb 2013 18:27:28 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1360714913.11225.24.camel@ted>
In-Reply-To: <1360714913.11225.24.camel@ted>
Subject: Re: [PATCH] multilib: Fix an OVERRIDES expansion order issue
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
X-List-Received-Date: Wed, 13 Feb 2013 00:43:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/13 6:21 PM, Richard Purdie wrote:

Please add:

[ YOCTO #3874 ]

to the commit message.  (The problem is complex enough, that the bugzilla entry 
is helpful in understanding why this is needed.)


> There were problems where a SRC_URI with:
>
> SRC_URI_append_powerpc = " xxx"
> SRC_URI_append_powerpc64 = " xxx2"
>
> would end up with *both* xxx and xxx2 being added when using a multilib
> which is clearly incorrect and undesirable.
>
> The issue is that OVERRIDES has virtclass-multilib-xxxx added to it,
> this eventually changed DEFAULTTUNE which then changes
> TRANSLATED_TARGET_ARCH which is in OVERRIDES meaning we then need to
> re-evaluate the overides and the TRANSLATED_TARGET_ARCH gets applied
> twice since once you apply an override, it doesn't get undone.
>
> Expanding DEFAULTTUNE to the correct value in advance avoids the issue
> and means only the correct overrides get applied.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index 5454b4c..d52f721 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -51,6 +51,11 @@ python multilib_virtclass_handler () {
>       e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
>       e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHL
>       e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
> +
> +    # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
> +    newtune = e.data.getVar("DEFAULTTUNE_" + "virtclass-multilib-" + variant)
> +    if newtune:
> +        e.data.setVar("DEFAULTTUNE", newtune)
>   }
>
>   addhandler multilib_virtclass_handler
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



