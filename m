Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 49DE06C0ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 18:07:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y23so3430111wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 10:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=xn6ikVh8j0puZqSM+r/M9ehxeTDFgHyq6RQZYX7yoeo=;
	b=A0aQG4jWXySyuwNMR+irg0R/ay7X3B4oXWakJkyyi0foqFpF5y1o6zSwFpbnXOjhMI
	DpBsW02vBnffN9aoiD/NfHINeTK/B7UOS1qCkHV/TGHi9tc8pO0UbQJxgJeXfYQIwZ6+
	B41fYjvMO072LinJskcEl9siMx5KlI2AlTICA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xn6ikVh8j0puZqSM+r/M9ehxeTDFgHyq6RQZYX7yoeo=;
	b=ujcLtoQkSW2xcghobY2Q6BSlPAsy9jqAEWJCc8x+ZOPwrSsBNJEumdgwS67Iln169g
	HaiMpMHnHPjwpKZapOiOykpzjtSgilAKJqNJikQAaqu/BUt9oJC72e1humF4XBmRlC/M
	rCRBq43IJOWaiSSATsk3XcaqhMHrVTo+JBgOn7l8l3QGkmLK7aapOPt4vGW9lnV6Gmsx
	TT1tLI93zdflWm6jrfbdvV5zkP+Y45GGpMeJXp46bCirtHSnAw5tv4pgTS0gYK0BPoxa
	MtQJ5OS9jy0YTwElzER4r5cu9boiVr0DzQgOAeyQl6oxpSs02fvxJlE3KGfFvQSk9Z38
	WLEg==
X-Gm-Message-State: APjAAAWdb3xnyRacXphOL5tkMin0rZZkOEzSQnnbgiyw765sbfDyKTOB
	trQT61jjQNcvt7svPzs6Ay2GsdUpcN4=
X-Google-Smtp-Source: APXvYqwu3b6OYkvEj9YUvvZH/zT7nowlIoY6pwT3YxjSzZWPBpfSZfsXBakGqwAbOXVWMlrXDRJDLg==
X-Received: by 2002:a1c:2846:: with SMTP id o67mr10979969wmo.7.1574964473961; 
	Thu, 28 Nov 2019 10:07:53 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s82sm11326300wms.28.2019.11.28.10.07.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 28 Nov 2019 10:07:53 -0800 (PST)
Message-ID: <0f7a57a8653678f004b45ed3379f55d27a95ec3b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nathan Rossi <nathan@nathanrossi.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Nov 2019 18:07:52 +0000
In-Reply-To: <20191125065800.332481-1-nathan@nathanrossi.com>
References: <20191125065800.332481-1-nathan@nathanrossi.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] gcc-cross.inc: Prevent native sysroot from leaking into configargs.h
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
X-List-Received-Date: Thu, 28 Nov 2019 18:07:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-25 at 06:58 +0000, Nathan Rossi wrote:
> Prevent the native(sdk) sysroot path from leaking into configargs.h.
> The configargs.h header is intended to be static and unchanged as the
> content is used as a means of determining that a gcc plugin is built
> for the same gcc. This also effects the output of 'gcc --version'.
> Due to per recipe sysroots and staging, the sysroot path would be
> replaced with the sysroot local to the recipe thus changing the
> content of configargs.h.
> 
> The sysroot path is replaced with a generic "/host" prefix which
> represents the host sysroot (e.g. native or nativesdk).
> 
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross.inc   | 7 +++++++
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 4 ----
>  2 files changed, 7 insertions(+), 4 deletions(-)

I think this is causing the reproducibile builds selftest to fail:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/515

Note the:

g++_9.2.0-r0_amd64.deb
cpp_9.2.0-r0_amd64.deb

in the list.

I think there are other patches in master-next contributing to this
too.

Cheers,

Richard


