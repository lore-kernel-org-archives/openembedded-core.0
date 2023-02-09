Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B412EC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 11:32:31 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12188.1675942343139217314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 03:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ed52OjDd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 84F24FF804;
	Thu,  9 Feb 2023 11:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675942341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j1oFRqaiPPRzadyhyYW8OTvJA7NYaWo91V63XfZq+KQ=;
	b=ed52OjDdBTEoN1fUOlfp245XOf5XJ7G2HMjJSCNKAM9uh9Vuo88/qPd09UNyZYsj2SHZIv
	5r5xa4sPHcML9kcqtn0KlzlKYXHJRsBRm3IwssSqbma9ut1gbMXyGRjxJz94iFe1y4cYPE
	pZJauUOUAnpwbP/eMU+xqo+X3V6WGSHx0yA5z4UqBErWul6AU7DKg+PMbd6D2JSF1N15xa
	EvyHRkLHXmnI4jibba8kbIO0lfM+Yeqvi9/qzctcL6K3y5Vv793nCWM1jIqYX4hH/kuAM2
	9494h1WiiJjnZJBGyk1CK1mlQs4qvE0dVbSW6tIpoFpBYa267rje5/ndefQOUw==
Date: Thu, 9 Feb 2023 12:32:18 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "mv" <sdoshi@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [[master][PATCH]] Upgrade OpenSSL 3.0.7 -> 3.0.8
Message-ID: <20230209123218.3075a5b1@booty>
In-Reply-To: <20230209111605.153112-1-sdoshi@mvista.com>
References: <20230209111605.153112-1-sdoshi@mvista.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 11:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176947

Hi Siddharth,

thank you for our patch!

There are a couple issues you should fix though.

First, the subject line of your mail is non-standard as it has square
brackets around other square brackets: "[[master][PATCH]]". When
applying the patch with 'git am' this results in a commit message
starting with a closed square bracket: "] Upgrade OpenSSL 3.0.7 ->
3.0.8".

I recommend you to read the guidelines at
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
in order to prepare a good commit message and to send your patch
in a way that makes it more easily reviewed, applied and tested.

Before sending it again to the list I suggest you try to send it to
yourself and check whether it looks correct, or to send it to a
colleague or friend who can try to apply it on  a local tree.

See below for another remark.

On Thu,  9 Feb 2023 16:46:05 +0530
"mv" <sdoshi@mvista.com> wrote:

> From: Siddharth Doshi <sdoshi@mvista.com>
> 
> OpenSSL 3.0.8 fixes 1 HIGH level security vulnerability and 7 MODERATE level security vulnerability [1].
> 
> Upgrade the recipe to point to 3.0.8.
> 
> CVE-2022-3996 is reported fixed in 3.0.8, so drop the patch for that as
> well.
> 
> [1] https://www.openssl.org/news/vulnerabilities.html
> 
> CVEs Fixed:
> https://www.openssl.org/news/secadv/20230207.txt
> 
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>

Your name here is different from the one in the e-mail. I'm sure we
require the e-mail addresses to be identical (and they are), not sure
we do for the name as well, but it would be a good practice anyway.

> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> deleted file mode 100644
> index 6d70b323d1..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 2001
> -From: Pauli <pauli@openssl.org>
> -Date: Fri, 11 Nov 2022 09:40:19 +1100
> -Subject: [PATCH] x509: fix double locking problem
> -
> -This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and removed the
> -redundant flag setting.
> -
> -Fixes #19643
> -
> -Fixes LOW CVE-2022-3996
> -
> -Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
> -Reviewed-by: Tomas Mraz <tomas@openssl.org>
> -(Merged from https://github.com/openssl/openssl/pull/19652)
> -
> -(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)
> -
> -Upstream-Status: Backport [https://github.com/openssl/openssl/commit/7725e7bfe6f2ce8146b6552b44e0d226be7638e7]
> -CVE: CVE-2022-3996
> -Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ----
> - crypto/x509/pcy_map.c | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c
> -index 05406c6493..60dfd1e320 100644
> ---- a/crypto/x509/pcy_map.c
> -+++ b/crypto/x509/pcy_map.c
> -@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x, POLICY_MAPPINGS *maps)
> - 
> -     ret = 1;
> -  bad_mapping:
> --    if (ret == -1 && CRYPTO_THREAD_write_lock(x->lock)) {
> --        x->ex_flags |= EXFLAG_INVALID_POLICY;
> --        CRYPTO_THREAD_unlock(x->lock);
> --    }
> -     sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_free);
> -     return ret;
> - 
> --- 
> -2.30.2
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> index 1842148592..c80df7b2ae 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> @@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>  
> -SRC_URI[sha256sum] = "83049d042a260e696f62406ac5c08bf706fd84383f945cf21bd61e9ed95c396e"
> +SRC_URI[sha256sum] = "6c13d2bf38fdf31eac3ce2a347073673f5d63263398f1f69d0df4a41253e4b3e"
>  
>  inherit lib_package multilib_header multilib_script ptest perlnative
>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

You removed a patch but you didn't delete it from SRC_URI. As a result,
bitbake will error out very early:

ERROR: .../openssl_3.0.8.bb: Unable to get checksum for nativesdk-openssl SRC_URI entry CVE-2022-3996.patch: file could not be found

Assuming you have tested your changes, maybe you didn't commit them
entirely?

Once you have fixed your commit, don't forget to pass '-v2' to 'git
format-patch' to clarify that the next patch you send is the 2nd
version.

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

