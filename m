Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DD9ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 19:10:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.1483.1666897848746534845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 12:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XwZdWXmA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7EBD5240004;
	Thu, 27 Oct 2022 19:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666897846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojzC2mr6ZHFIK4O+7D+aWOqjU/Mn1rpk8LwPefRvxeQ=;
	b=XwZdWXmAgk+pb9n3q5d4SFmtaKf4NtM/tFcSXJSBfrcWZgvNypGgok5sNEkg4FhUCaQgj2
	AxnFrUKDxtn6l5qNDslnXK92K3NHjHZ49JUxVEzZXEJOCpzraDl4VWudE6Pr5p6gJ49ong
	WecRJsxi3fZOaevjh/POVxD50wvQaLdH/ftiDCGpSeI6Q9r8+bqUoAjExRtAvAeLk3ZgHY
	uEIDFLNpb9Nx76+Hg3KD2RvwgwUoAm3onsAJV0eRKKZ8TKCb+mbecpPGG9TYkd9lzoXgyh
	mlkbBmEGxQGGk+i/TeDxW4XEalDvclDGFtIYjZiJqF0ulhkhXazAKDSoMtIVBQ==
Message-ID: <c78c90b7-5a11-45ed-66cf-8dd0dea08b5c@bootlin.com>
Date: Thu, 27 Oct 2022 21:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Subject: Re: [OE-core] [kirkstone][PATCH 1/1] cmake-native: Fix host tool
 contamination (Bug: 14951)
Content-Language: en-US
To: bero@lindev.ch, openembedded-core@lists.openembedded.org
References: <20221027185853.2005941-1-bero@baylibre.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221027185853.2005941-1-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 19:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172201

Hi Bero

Thanks for the patch!

On 10/27/22 20:58, Bernhard Rosenkränzer via lists.openembedded.org wrote:
> Trying to build cmake-native on a host system where curl was built with cmake
> (resulting in CURLConfig.cmake and friends, which do not use the same naming
> schemes expected by cmake-native's build process, being installed to a system
> wide cmake directory like /usr/lib64/cmake/CURL) results in undefined
> references to all libcurl symbols.
>
> The problem is that cmake-native sees and uses the system wide
> /usr/lib64/cmake/CURL/CURLConfig.cmake, which defines CURL::libcurl and
> CURL::curl as opposed to setting ${CURL_LIBRARIES} as expected by
> cmake-native.
>
> find_package(CURL) (cmake-native's CMakeLists.txt, line 478) succeeds, but
> incorrectly uses the system wide CURLConfig.cmake, resulting
> CMAKE_CURL_LIBRARIES to be set to an empty string (cmake-native's
> CMakeLists.txt, line 484), causing the cmake-native build to miss -lcurl.
>
> The simplest fix is to let cmake know the right value for
> CURL_LIBRARIES. Making it -lcurl should always work with libcurl-native
> in recipe-sysroot-native.
>
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>   meta/recipes-devtools/cmake/cmake-native_3.22.3.bb | 1 +
>   1 file changed, 1 insertion(+)


There's a problem with the way your patches are received on the Yocto 
Project mailing lists. I used to have it too.

If I apply your patch through "git am", the author of the commit will be:
Bernhard Rosenkränzer via lists.openembedded.org 
<bero=lindev.ch@lists.openembedded.org>
instead of
Bernhard Rosenkränzer <bero@baylibre.com>

That's because of the configuration of the Yocto Project mailing lists, 
if I understood correctly.

Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You should be able to fix this by running:
git config --global sendemail.from "bero@baylibre.com"

This should add a "From" field to the sent patch which "git am" should 
be able to match with your name.
At least this worked for me. See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Could you try to send an update?

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


