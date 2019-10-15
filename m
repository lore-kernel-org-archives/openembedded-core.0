Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 38AF07D084
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 08:27:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id i16so19797747wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 01:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=av0grmyx4CfB2bw/e87ZPI8EqGIgnUiHi0MbKEOwf6k=;
	b=EXoZZz8uLP9ZAt4+0SNbvMcAzZ9lJkvvM++1kOTZK0sEuiUKDl4mXdGa2Y3vEoTikx
	BGXL2reKHVwc+HUE3GwfElq1UgHpqUzGC/iOGCTChMYkfFMkBYSSLfrwdyoFI9kh6eXK
	xiIFijQeqz9DZXRSmTJwByq3VmZQHBnJOlLW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=av0grmyx4CfB2bw/e87ZPI8EqGIgnUiHi0MbKEOwf6k=;
	b=oAKELoy5WKGB1Z060T/Nn7cBq6hGtpDR3VLyhVamWuHDUzSWhEL78yVQP5RM5agZQq
	tT/kZ5SltQi/vGC2UrE8HwnKBtiphxW/Yzpmj/1zKoQo0vVhAQnJmmMsgUKNmynwEy/Q
	v+2GzVAUyUMmX/il8g9pMv5qfkAbxCwwJ/NiId3MXlIG96H8VDb7WVkz/38mIuZziQ5r
	LeMY2NM2a5OAWxojzDKUDM5J62hwQkRD9q7E3zbjDwHThby8cjFV53ogf8S5CCajFfaQ
	09pGm8RAIS+OQ8mRs9KdvB3ABXkZyZIp+zFfgm0rr5ebn5OGOM18JHQ+mqMaqYFFfEok
	x51A==
X-Gm-Message-State: APjAAAWucQyCF2mVNg46DMTukBFuBX8BkL1CiA37S7YaM5VtbzX8Yo/4
	TF+MKKYkYUzcBXfJ9z5CognHgg==
X-Google-Smtp-Source: APXvYqybya/u9iYpYginEdA5lv/gzhLyt7yxUv/eFTTjl3hN/HUsc09v11IWUBJHMO+oN0lyiOs9gw==
X-Received: by 2002:a7b:cab1:: with SMTP id r17mr17873911wml.106.1571128049837;
	Tue, 15 Oct 2019 01:27:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	74sm14295100wrm.92.2019.10.15.01.27.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Oct 2019 01:27:28 -0700 (PDT)
Message-ID: <1d2a14032ca81a0e9acee21ba66c8e4cb7d5c950.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mattias Hansson <mattias.hansson@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2019 09:27:27 +0100
In-Reply-To: <20191015080015.1574-1-mattihn@axis.com>
References: <20191015080015.1574-1-mattihn@axis.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Mattias Hansson <mattihn@axis.com>
Subject: Re: [PATCH] base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot
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
X-List-Received-Date: Tue, 15 Oct 2019 08:27:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-10-15 at 10:00 +0200, Mattias Hansson wrote:
> do_prepare_recipe_sysroot may perform groupadd, which requires pseudo.
> However, do_prepare_recipe_sysroot does not depend on pseudo explicitly,
> which sometimes causes a build error when building a recipe that adds
> groups.
> 
> This issue only occurs when executing do_prepare_recipe_sysroot for a
> recipe that adds groups before finishing a task that depends on pseudo
> for a recipe that doesn't add groups.
> 
> Signed-off-by: Mattias Hansson <mattihn@axis.com>
> ---
>  meta/classes/base.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index d3184ecf7b..1cea3a2213 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -482,6 +482,7 @@ python () {
>      # If we're building a target package we need to use fakeroot (pseudo)
>      # in order to capture permissions, owners, groups and special files
>      if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
> +        d.appendVarFlag('do_prepare_recipe_sysroot', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
>          d.setVarFlag('do_unpack', 'umask', '022')
>          d.setVarFlag('do_configure', 'umask', '022')
>          d.setVarFlag('do_compile', 'umask', '022')

This was posted once already and the answer is still no, we do not want
to add pseudo as a dependency for all sysroot construction. IO under
pseudo is much slower and this is a very IO intensive task so it would
hurt performance and isn't necessary in most cases.

I appreciate its harder but we need to find a better more targeted way
to solve this and some of the other related pseudo issues for inter
dependent user/groups.

Cheers,

RIchard


