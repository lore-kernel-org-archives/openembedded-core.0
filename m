Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC946C4A5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 23:15:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p7so14056356wru.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 15:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=XQh/GxoCjvNRdnpWCCleex32vZlqKOXPFTIsxYAAm7U=;
	b=AKPnXondFgxcEixf5DuMJr1xSCyZ5Rb3XZBIZGBXBghjQNTSTdUXygfQkXX1wYE/sl
	LALcCm0jpHMzAzNp7FjAap2X1vfwpo4CCjRAR7keFhntnglOTuuuSxlzUaQVmDbRGAwz
	2moYAbn3GHXyjlw4CqD8+RgY7Zu5b01+owOMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=XQh/GxoCjvNRdnpWCCleex32vZlqKOXPFTIsxYAAm7U=;
	b=H6EJiAY5Tt7zrbyU1El5D4hlvyTKmdYfpwnuBXi++qkOk/+5u/PlncEPCX3m87uWI/
	2YqeGUi1pDMHfr/btJTrAIaN1kk8cLNeMVlX63xe/mPGttbumrE6e7ADgzNPizhp12Gt
	FmmBfb8RdBbSjhCtb91cQA0tJQ/nFZohwnqtUu6eOksQl5RhqQQVVg3eVeocUNt1+gr7
	QnD5a1+yyClJJQ9N2EojY4BucyXo6qfyi0mA0tb4+94E2laHYw2IsQzAreII79wW9PtN
	LkN+JCXJxYVul9yUXRfRkoPs3V1z1fJPC7gLtji9ib8jx1ga0RpFa3zwdx0t4jUnh4sm
	Zrkg==
X-Gm-Message-State: AJcUukcUmAtRTIRoCgIQWHKqlRjKIE+4UxkI/F8xq+Og8bxxZP0EPgOU
	WIlHt72MdQV1T+Qf5pmH70k53w==
X-Google-Smtp-Source: ALg8bN5RHibzIYi54RfI0IHsrW1kkMWZKpq33bepg2gllZZzWtBzH6gnKxDenYw4o80XBViVzy8l6A==
X-Received: by 2002:a5d:63c3:: with SMTP id c3mr16173579wrw.215.1548544531659; 
	Sat, 26 Jan 2019 15:15:31 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h17sm107224504wrt.59.2019.01.26.15.15.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 26 Jan 2019 15:15:30 -0800 (PST)
Message-ID: <96973bd45e71375db51edeabc57c27503feddd9f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Xulin Sun <xulin.sun@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Jan 2019 23:15:27 +0000
In-Reply-To: <1548126237-38328-1-git-send-email-xulin.sun@windriver.com>
References: <20190118022248.17108-1-xulin.sun@windriver.com>
	<1548126237-38328-1-git-send-email-xulin.sun@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH v2] openssl: fix multilib file install conflicts
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
X-List-Received-Date: Sat, 26 Jan 2019 23:15:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-01-22 at 11:03 +0800, Xulin Sun wrote:
> To avoid issue like below if run "bitbake lib32-core-image-minimal"
> with series userspace packages(LAMP,krb5...) added.
> 
> Add multilib_script support for openssl's c_rehash which is a perl
> script.
> 
> Error: Transaction check error:
>   file /usr/bin/c_rehash conflicts between attempted installs of
>   lib32-openssl-bin-1.1.1-r0.armv7at2hf_neon and openssl-bin-1.1.1-
> r0.aarch64
> 
> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> index 5c4e69c..21359fa 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> @@ -206,3 +206,7 @@ RREPLACES_openssl-conf = "openssl10-conf"
>  RCONFLICTS_openssl-conf = "openssl10-conf"
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +inherit multilib_script
> +
> +MULTILIB_SCRIPTS = "${PN}:${bindir}/c_rehash"

Peter's feedback still needs addressing on whether c_rehash is in ${PN}
or ${PN}-bin?

Cheers,

Richard


