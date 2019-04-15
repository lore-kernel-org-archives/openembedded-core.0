Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id E3E827D9CE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 11:08:16 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id h18so19883170wml.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ffNmSTWJ8I6yuG3N0WswRrtwIJpbXip6SvWYKYRtvKY=;
	b=aag6I2/69qeBq614SuCKTkV2laJtf4AfuNg7ut6LpGpiVizv0uQDeaNlPvEd8RzGEZ
	CzHArMv2vwpimGci2w2cP/Qm2qJSVwAeG35CEZi+cjVybzEx2jKVXtmhz+67SWwxpQ1l
	5OKLj4nVMETcLUoshm8fIXMewLpGIcJf9CFGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ffNmSTWJ8I6yuG3N0WswRrtwIJpbXip6SvWYKYRtvKY=;
	b=I6vsDUpcV4rwasQj578+wf630ASIy8TfNFqJ7TegJEHMOpbJtAzgPWOWjlqfzwPyqy
	rkeeo3OnR3pR60AQy0PL8qeY4GXk2iXQ2RM96nygjy5WKb+2eCIX8O0oBzLIIM22sU4D
	ZqdrgZLJb4Ri+2tDmzPeyyfjrkWB8sgOV6tijbX82A/nTO0dOJXzrTd38lHnkGUQzn3C
	9ncATDUvZK8Ug00KdM0kSn8fX1qa4gDaQynONUHrJHT7EyDldS0Dr9I9T/cBxFq2ePvY
	kJ/3rbQfIkH40Yc7vYykUuNpvKxx70NRVXeTOv+oswTpoaejz/syjxiMPeDRLRfU2DMn
	9SIA==
X-Gm-Message-State: APjAAAXf0uZ4Uvv0XSBvhGK1g4cxIZfuFNLgx7nUcPTVVrjUaUof3yno
	+vEoz+v5WREBimvLTnxDvyzOXQ==
X-Google-Smtp-Source: APXvYqxCaYrkfcRdyjzipYfy7TEKjtvJp1hCPyEW06JhOBpD5zGus/fFwE/mv1kzPtEt3BWUwbWpPQ==
X-Received: by 2002:a1c:cf0b:: with SMTP id f11mr21191100wmg.26.1555326497648; 
	Mon, 15 Apr 2019 04:08:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z17sm21037295wmc.7.2019.04.15.04.08.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Apr 2019 04:08:16 -0700 (PDT)
Message-ID: <b7f0fbbdfd6b0523e521cdd7ff84d6b59554abeb.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:08:15 +0100
In-Reply-To: <1555319122-215657-1-git-send-email-mingli.yu@windriver.com>
References: <21cc3e7248d8e702f49de8818f26e2e53a001ed1.camel@linuxfoundation.org>
	<1555319122-215657-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v3] nettle: fix ptest failure
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
X-List-Received-Date: Mon, 15 Apr 2019 11:08:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-15 at 17:05 +0800, mingli.yu@windriver.com wrote:
> @@ -33,6 +29,8 @@ EXTRA_OECONF = "--disable-openssl"
>  CFLAGS_append = " -std=c99"
>  
>  do_compile_ptest() {
> +        # fix dlopen-test failure as cannot locate libnettle.so
> +        sed -i 's;dlopen ("../libnettle.so", RTLD_NOW);dlopen
> ("${libdir}/libnettle.so", RTLD_NOW);g' ${S}/testsuite/dlopen-test.c
>          oe_runmake buildtest
>  }
>  
> @@ -49,4 +47,7 @@ do_install_ptest() {
>          install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
>  }
>  
> +RDEPENDS_${PN}-ptest += "${PN}-dev"
> +INSANE_SKIP_${PN}-ptest += "dev-deps"
> +
>  BBCLASSEXTEND = "native nativesdk"

Does Adrian's suggestion of removing the "../" work? Also, can we
install a symlink in do_install_ptest which this code would find? That
would be less invasive and we could potentially remove the -dev package
dependency which would be good from an image perspective.

Cheers,

Richard


