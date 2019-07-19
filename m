Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2B2C57F1E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 22:30:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s3so30074196wms.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 15:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=SxdC3lG+2iqeJgW+SX7VNfTXqpwKaVBKB2Mi+IIAuGU=;
	b=QeK4sgDOzRUNFtnES1xnYxJSdFMe18BbuvOrsBnYh10QCznWR1G45YWjmu7PeoqkqE
	u6c1W78sshbL8+0/YSSrzQHxY+lRIH/6aUWaLoJsY0Ul2V/97arvSopptNRC6cR9sB6s
	fYnzGjvqO11A1tsdDjRNVt2+SoWHq9Jq+0jkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=SxdC3lG+2iqeJgW+SX7VNfTXqpwKaVBKB2Mi+IIAuGU=;
	b=FXCBGW/nbRa5YaUf1GrSQ57C7mvz1HkNHIzMYV1rr2Y6z9U0fPgRrkyBbwEI5dmrsp
	MbExVO3YJLWw4yrdOkcE8pGTRX8SsAxFUd0mlPuYy4Byo3XhpeGpNu7hIRZAk3pb6aBW
	shos2546KWBrDX5IXk1V2aITqbLgwmXUvlLW36NNLInG7c1y+tDE5NH9tNq7y/+ObV2I
	XE9i9vpNyEAijWVh3A3XNYDb3bNUEbdCWCNBnaNLI6gEipICKtz8yiCO3hsxh+feAFMq
	cfYh4nH9lXvSOu6IohgpVWjX7SMWMtOl9oluSuI46bXu1Xc5a0gjz/t9F/vupmIoReD+
	5rIg==
X-Gm-Message-State: APjAAAWQUSJLaXYuvqJ216kJyvjKzCV/pHg4QQNwyK9UEbP6KDPCa/J6
	gIA8Aiep1QdxRrEd5iMePOYQ8nIE0tE=
X-Google-Smtp-Source: APXvYqwIDSmUcKYmhRYfNp1PYYjHW/w3yl4wNM7tRKZheRxCkOmbIQlLp+qPMtXAyx+08Q14KIKPEQ==
X-Received: by 2002:a1c:a942:: with SMTP id s63mr49216613wme.76.1563575420825; 
	Fri, 19 Jul 2019 15:30:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e6sm32632598wrw.23.2019.07.19.15.30.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 15:30:20 -0700 (PDT)
Message-ID: <43ed87044aaf0901257c30967085eccd67a608b6.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Stefan Agner <stefan@agner.ch>, openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 23:30:19 +0100
In-Reply-To: <20190719194456.1344-1-stefan@agner.ch>
References: <20190719194456.1344-1-stefan@agner.ch>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] psplash: create psplash tmpfs mount directory in psplash-init
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
X-List-Received-Date: Fri, 19 Jul 2019 22:30:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-07-19 at 21:44 +0200, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> The psplash binary uses TMPDIR as directory to store the FIFO to
> communicate with the psplash tools. This directory can be in any
> location an init system determines to be suitable, psplash-init
> uses /mnt/ for it. Rather than creating the mount directory in
> the recipe, just create it in the init script itself. This allows
> other init scripts to use a different location without having
> an unnecessary .psplash directory in /mnt.
> 
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  meta/recipes-core/psplash/files/psplash-init | 1 +
>  meta/recipes-core/psplash/psplash_git.bb     | 3 ---
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/psplash/files/psplash-init
> b/meta/recipes-core/psplash/files/psplash-init
> index 0bce1de536..7a3902a7e0 100755
> --- a/meta/recipes-core/psplash/files/psplash-init
> +++ b/meta/recipes-core/psplash/files/psplash-init
> @@ -24,6 +24,7 @@ for x in $CMDLINE; do
>  done
>  
>  export TMPDIR=/mnt/.psplash
> +mkdir -p $TMPDIR
>  mount tmpfs -t tmpfs $TMPDIR -o,size=40k
>  
>  rotation=0

The main reason for avoiding this is probably the extra fork overhead
of mkdir. It sounds trivial but the fork/exec calls add up over a boot
process.

Testing whether that directory exists before the mkdir might help with
that.

Cheers,

Richard


