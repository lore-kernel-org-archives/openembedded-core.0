Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <d7ec24b683844c38a85c14ed2d0595390ded0ee0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ruby: disable libruby.so
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 20 Jan 2022 22:55:34 +0000
In-Reply-To: <20220120222256.1697929-1-alex@linutronix.de>
References: <20220120222256.1697929-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

On Thu, 2022-01-20 at 23:22 +0100, Alexander Kanavin wrote:
> It was found to cause races in make install, as observed in
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14695
> 
> [YOCTO #14695]
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/ruby/ruby_3.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/ruby/ruby_3.1.0.bb b/meta/recipes-devtools/ruby/ruby_3.1.0.bb
> index 7183c93d45..128e4527e1 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.1.0.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.1.0.bb
> @@ -29,7 +29,7 @@ EXTRA_OECONF = "\
>      --disable-versioned-paths \
>      --disable-rpath \
>      --disable-dtrace \
> -    --enable-shared \
> +    --disable-shared \
>      --enable-load-relative \
>      --with-pkg-config=pkg-config \
>      --with-static-linked-ext \

Disabling shared libraries because there is a makefile bug doesn't seem like the
right solution :(. 

Better might be disabling parallelism in make install. It raises questions about
why it is linking/relinking a library in the install step too of course...

Cheers,

Richard

