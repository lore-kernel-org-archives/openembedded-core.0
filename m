Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 6F33B6E951
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 11:40:07 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C6971F811F9; Wed, 26 Feb 2014 04:40:08 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id B2E6DF811F8;
	Wed, 26 Feb 2014 04:40:07 -0700 (MST)
Message-ID: <530DD29A.9030807@mlbassoc.com>
Date: Wed, 26 Feb 2014 04:40:10 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1393414543.31769.110.camel@ted>
In-Reply-To: <1393414543.31769.110.camel@ted>
X-Enigmail-Version: 1.5.2
Subject: Re: [PATCH] security-flags: Deal with powerpc build issues
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
X-List-Received-Date: Wed, 26 Feb 2014 11:40:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2014-02-26 04:35, Richard Purdie wrote:
> 
> 
> Building powerpc machines with the standard security flags generated numerous
> build failures. Use a reduced set of flags for now to avoid linker issues
> and other compile failures.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index e7d4933a..b5489d8 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -2,6 +2,14 @@ SECURITY_CFLAGS ?= "-fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=2"
>  SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-all -D_FORTIFY_SOURCE=2"
>  SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
>  
> +# powerpc does not get on with pie for reasons not looked into as yet
> +SECURITY_CFLAGS_powerpc = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +# Deal with ppc specific linker failures when using the cflags
> +SECURITY_CFLAGS_pn-dbus_powerpc = ""
> +SECURITY_CFLAGS_pn-dbus-ptest_powerpc = ""
> +SECURITY_CFLAGS_pn-libmatchbox_powerpc = ""
> +SECURITY_CFLAGS_pn-webkit-gtk = ""

The change for webkit doesn't seem to be PowerPC specific?  If it needs
to be here, shouldn't it be in a separate change, or at least documented
in the change log?

> +
>  SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
>  # Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

