Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id BFA6D7F30F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 20:59:17 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id r6so81851387qtt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 13:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gFQSo8H0YGqfiE8bWaMtlObgkSx8l7W8YJF53AO6MK0=;
	b=O2kJBBVdSWtIvUuyhEMVewTzTRkqnzyiX8dPuEboVJ8879aFnYkg9bX2cSrfRLwiSn
	Exn0V/vGIi4dRdNXDj17bJgGXr4ST0XqlHne4ms+zt+gewZ/faoD81jn0mGvEpsv1C/H
	TjwUQreSZOPBNp+PK+xStvJIANCyyu9U3IQ8OZy+2lnzpzi6BPytzPNlrUzsZuXREp6m
	kJ+oee8P8gAEbpdNBN39hWbilhWSp0mu3Ztseb6do5+WBxTxMb3LDgUD2p6602w4d74c
	sGP1fGLIAUoCYk7Ou3qXGnqXXRpnRX1U/1sqH+J/bQ/SUdPDLGCyUaKVj8MMvaFocttb
	F5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gFQSo8H0YGqfiE8bWaMtlObgkSx8l7W8YJF53AO6MK0=;
	b=NiAVCJyjfMaeYwQAIvyL7na+aDNjV85ShE+f+HF2CGJYpJXkWSn0Wv3N+Wn6KqlB/f
	MBoZuBmpLKzWrT4mMOWbdYcfFemeiFe61SdbAwwF+kvEkNKnykh5S7Trk9DZMWLcAVUo
	H8z3aLrpfm9/CfnamLpgZuiOwD+MNDcBzu7hykwb+lekxIvyn0x7KVgLM221e0vh5kk0
	JZFudm5jAGRF0bQDOcFJ5apRQHhvperreawAfjb4v7E78G2WjhvvaOOGVEbtUB2yLoYk
	uxrxRvh0xbLp4u29gxgtC+OpsnSV8JS7pVqp6Rd/LpKpPxpC0pBEVA4hXf+Iy7wSxtqC
	GajA==
X-Gm-Message-State: APjAAAXxkgu+vLMo5ju7LU4Zm2v3+okFVrx9Oev65kOXDB+3vDfQKPd+
	25iGn57rBEbLKpw//YcxKz1pox/RjcupIduJmiI=
X-Google-Smtp-Source: APXvYqzc7J9Ay1HTeGVcy7XxFoYPDJrJb2RC/MUpibfxPeQXqqVJCupQ+jVqN6QsyVFs4sa4Q+9R9wzA+qhtZb4oqqU=
X-Received: by 2002:a0c:b115:: with SMTP id q21mr5040604qvc.68.1565125158279; 
	Tue, 06 Aug 2019 13:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190806205716.12240-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190806205716.12240-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2019 13:58:52 -0700
Message-ID: <CAMKF1sqqXUDKM6gULavO49mbQk68xboaH1AcBTc5VR7fsH0KYw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3: Fix zlib determinism problem
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
X-List-Received-Date: Tue, 06 Aug 2019 20:59:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 6, 2019 at 1:57 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> sqlite3-native in particular was finding zlib from the host if zlib-devel
> was installed. This could lead to races where pseudo-native may or may not
> fail to build.
>
> We don't need/use compressed page support with sqlite so disable the dependency
> (it doesn't have a configure option so use a autoconf cache variable).
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-support/sqlite/sqlite3.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> index daf3db5e9fb..2ad621503cd 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -21,6 +21,10 @@ CVE_PRODUCT = "sqlite"
>
>  inherit autotools pkgconfig
>
> +# disable compressed page support as we don't need it
> +# we can see non-deterministic floating zlib dependencies otherwise
> +CACHED_CONFIGUREVARS += "ac_cv_search_deflate=no"
> +

should this be done for native only ?

>  # enable those which are enabled by default in configure
>  PACKAGECONFIG ?= "fts4 fts5 json1 rtree dyn_ext"
>  PACKAGECONFIG_class-native ?= "fts4 fts5 json1 rtree dyn_ext"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

