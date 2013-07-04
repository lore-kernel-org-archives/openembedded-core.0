Return-Path: <ross.burton@intel.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 663826AFC3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:37:24 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so1459373obq.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 03:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=u8rgkNB9/0Q20rbw3LWlkwrJolLNJkjn/ltJEnwaGQY=;
	b=mk+o2Y2fUPTmSUVOXXEGNk8e1dCd1VifoF04il6xnbvrhUmoLDJJG6reoWQw1Tcizc
	U29zckNTXHmnJoiX3wUczpx+nlV1EOX9FxVgQUcXeOXZJwvK8PrsBZFz4sQ1Rq9Ypze5
	yxbpOtgESt6Ewd2WoYhU5wSQRpFVXOBwlGN1KLk79LAC/mBcppftqcr+vmPpBWZvadOP
	HGUL7qWb6TRvtJxmLKg9ikqzAzdCP7Db01fUI5O/1WSWT9KjGCmC54tZYfDqyQT3xyRE
	B2GMTFQkzTqx3Jtm98J+bi/FqSDiVusQh4NGZmQht/xSvlYOPYrK85lTnl3q5ywVcVW5
	Dv7w==
X-Received: by 10.182.81.233 with SMTP id d9mr5459758oby.43.1372934245055;
	Thu, 04 Jul 2013 03:37:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.160.41 with HTTP; Thu, 4 Jul 2013 03:37:04 -0700 (PDT)
In-Reply-To: <00bec2da9d29234cce3b6c97076812ea400370fe.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
	<00bec2da9d29234cce3b6c97076812ea400370fe.1372890071.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 11:37:04 +0100
Message-ID: <CAJTo0LayixMzPK3sQUgxn-6XdsEFdeHk_hOuFkLF3CJUfufrUw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmeMdF/PWVmRmeiLlOm3y7l+mC5nISepgm9rfZLMfcjw7oPD67soaM3C8enlVOR7j5zaT7V
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] packagegroup-core-basic: Only build libpam if it's enabled
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
X-List-Received-Date: Thu, 04 Jul 2013 10:37:25 -0000
Content-Type: text/plain; charset=UTF-8

On 3 July 2013 23:26, Saul Wold <sgw@linux.intel.com> wrote:
> util-linux will check for the exisitance of pam header files and change what is
> built, so only build libpam when pam is enabled for DISTRO_FEATURES
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-extended/packagegroups/packagegroup-core-basic.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
> index c73d173..03dabbf 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
> @@ -104,7 +104,7 @@ RDEPENDS_packagegroup-core-multiuser = "\
>      cracklib \
>      gzip \
>      libuser \
> -    libpam \
> +    ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
>      shadow \
>      sudo \
>      "

Do we even need to mention libpam in here?  If pam is enabled, shadow
will have a runtime dependency on it.

Ross

