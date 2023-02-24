Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F322C7EE2D
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:09:51 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.21690.1677254987369699647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:09:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1 header.b=tsb3wIUs;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.29, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id AFEB75C01F2;
	Fri, 24 Feb 2023 11:09:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 24 Feb 2023 11:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1677254986; x=1677341386; bh=+2
	HYhZzD/h1tpgcMCOPpdlbYjIzJHEcXBG2ISPavKDk=; b=tsb3wIUsVkZHtevLZC
	TgceKzmA5/z0tVKWVQqb5n6q+p8nJS86aFDvWT/Qvkwb9gdw+lQFbn7XnxmAiz6X
	0usNv3vfZYK3/ZY9v5k5ye8hqlfIMtriqm2I6IV1nbXtWcvc8IsxL6WoB46agCsF
	pCkxy3azc+rDGtnw4kuUKVvtpiaTwKbHHRF4jj/oBfSjrFoVS1CaGF8tHF6HsTMp
	RMMV60WH7VRaXj/Y8wAlxsbcfB3h0YFkfMwcKH+UNLz2VGlNiyQPk8yQvTJ1w94Z
	g/aJv8ishJm4arRDihvMK7FxLGjWtykCbkpMQBSKC7cY6aGCozJQJyN5inzYTU9j
	r83A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677254986; x=1677341386; bh=+2HYhZzD/h1tp
	gcMCOPpdlbYjIzJHEcXBG2ISPavKDk=; b=PSrfFckrfTjbHK41BIRAFtMH3eeDK
	QtPWtoR9VLe2ROhtQEdf5Nnkx1e/7fh2X5spAAreginy6eI7dh80rs+NfZTSTMzP
	xLLJ9EDxp+o0w7hK7b2ln45YM148WsjAuLJlFu2KpCsa0oqkEhZ1b5LWerO+lUNf
	hHEFCEfKN2D9cbOLHPwhuNEufLGQB9BKameYZ2LKRBqCmDQAzMu60chS4UpvnYIB
	fg6XhzbzkUSgiqFwFQlob0/L3lcjFGkcvWOBuF4WNAHoCTOvlJrWJ/YMpxP/wrA7
	IGi13m1TLh8cv7cXNU7RbtJFOsLmmfNc++4MSPHKBayVoj2W47ABsdmqQ==
X-ME-Sender: <xms:SuH4Y1PC2G9o-54reOMiqeLYOhYQzl9poQXrw-ZTGi3M-c3Y0DEVOA>
    <xme:SuH4Y39rW8TONZGS92U203ADmZUH_EhNkqQOKXbsjZYc2rJoJm8r-3m-cYuF7uU4Z
    VGOLjuQnAxer0QZjCY>
X-ME-Received: <xmr:SuH4Y0Q39e-VdrKSs_k8yyM9lCobii86y3UQIqy34SDBrOONujIbnKznAi-hRQ4cf5nuefHM3jVfwOQsVK8i7edU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekfedgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfhgfhffvvefuffhorhgjkfggtgesthdtredttdertdenucfhrhhomheprfgr
    vhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhffhdrnhgvtheqnecuggftrf
    grthhtvghrnhepveethfffleduueehtdfgveeufeefkeduveeiteffjefhkeehveffuefg
    tddvtedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:SuH4YxsMo6rbEMyVPHoV4Plfqx1CS97EtTkl4q5OU7QfWJdwD4V2BA>
    <xmx:SuH4Y9ctdPOAb1uWVBTtGQYfCvGLBeOJKsSeuf9l8qc8fKS57iVTUw>
    <xmx:SuH4Y91KwT40jLKEWlkoMhqM3XiT6j9PXKq6IPH10aZ26MsYFEc0eQ>
    <xmx:SuH4Y-p-UHCG9d3Mr4aBJ_vS-ds6ykZZIszR0y1ruXqa3S6fZXYb4g>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Feb 2023 11:09:45 -0500 (EST)
References: <20230224143717.2669400-1-kareem.zarka@huawei.com>
 <20230224143717.2669400-3-kareem.zarka@huawei.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Pavel Zhukov <pavel@zhukoff.net>
To: Kareem Zarka <zarkakareem@gmail.com>
Cc: Stefan Schmidt <stefan.schmidt@huawei.com>, Kareem Zarka
 <kareem.zarka@huawei.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] meta/recipes-core/images/core-image-minimal:
 add mtools to IMAGE_INSTALL
Date: Fri, 24 Feb 2023 17:07:01 +0100
Organization: Linux Private Site
Reply-To: pavel@zhukoff.net
In-reply-to: <20230224143717.2669400-3-kareem.zarka@huawei.com>
Message-ID: <875ybrxcxj.fsf@desktop.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177691

"Kareem Zarka" <zarkakareem@gmail.com> writes:

> The wic.py selftest cases test_skip_kernel_install and
> test_kernel_install for OpenEmbedded were failing on autobuilders due
> to a missing dependency on the mtools package, which provides a set of
> tools for working with MS-DOS file systems, including mcopy.
probably you want to add mtools-native dependency to the test itself
instead of installing into the image.
maybe even simple bitbake("mtools-native") will help?

> To address this issue, we added mtools to the IMAGE_INSTALL variable in
> the core-image-minimal.bb recipe. This ensures that the package is
> included in the core-image-minimal image, which enables the
> test_skip_kernel_install and test_kernel_install selftest cases
> to run correctly on autobuilders.
>
> Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
> ---
>  meta/recipes-core/images/core-image-minimal.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
> index 84343adcd8..5d626898f0 100644
> --- a/meta/recipes-core/images/core-image-minimal.bb
> +++ b/meta/recipes-core/images/core-image-minimal.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "A small image just capable of allowing a device to boot."
>  
> -IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"
> +IMAGE_INSTALL = "mtools packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"
>  
>  IMAGE_LINGUAS = " "


