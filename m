Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E0B3660227
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 08:32:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a141so275520wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 01:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=RW5Kt9nnRtous9VXEIktHC/Q9NqwfvSk5txDWg1rM60=;
	b=WwAoW4tMFYEKixhjpBmqg+MltJV5p1/7+R40AFAX/bg5HqloBddO6HHzHSHfMMKo1i
	KBe8yQEhcjS3/0bWyiZas0Q2zLuIukjqk1gVEZGMoIsTIIni3aEQ7cuZv2R4xKFGMV1h
	zZeUMShL0Q4XqiIVXExkT2KOA/wWhPzZMyvME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=RW5Kt9nnRtous9VXEIktHC/Q9NqwfvSk5txDWg1rM60=;
	b=ZIAlk7EklF4JVpdXcXO3Lw1x6VmEuB0PYQ9oo0G6hWOGzwYWWD706gUrUYCk6quzyq
	bKVFQGyqUNh47sliDBypAgHGBO0gpkERy1W2IflQIVOiPRkrZTzzUZEA9LXb9+FpLznb
	yCPcfn15e+r34IGhf+NFcAYPLSmtarH2fxsnoQMT4Ri/yFT1fq+T/AOpQexjz21qdqwr
	FtLSpAs27pzS8/UmZ9aTn2gGbd6ESotX08subeE2ZsGurZXuhRcqqvjKoYBw9vYqNwgc
	i5bS0ena9KoYIQWTNDyuUdIP8WWjniRfuVBIIjFhL2RfpHaCqH7+PDkV5f9qAw2JCiNH
	ZKKQ==
X-Gm-Message-State: ANhLgQ0itFsSa+D40LZe3ceXF6PpMfvFyhyxmw7ulF7WcuQr+cSmW58d
	Dfb1/MFZbv+3Z4aagDiwhcbYJQ==
X-Google-Smtp-Source: ADFU+vveIODp2x3UHt5mSMygVsOFeLy9+HQR9NrwoQVqFt6CjELY8MoUM8BV304sJ4pzepI+rL4a6A==
X-Received: by 2002:a7b:c950:: with SMTP id i16mr858548wml.97.1583829176022;
	Tue, 10 Mar 2020 01:32:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q5sm18157477wrc.68.2020.03.10.01.32.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 01:32:54 -0700 (PDT)
Message-ID: <9ed228f70b3728e140aa5a539bab07759d6d9914.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2020 08:32:52 +0000
In-Reply-To: <20200310011544.3022342-3-raj.khem@gmail.com>
References: <20200310011544.3022342-1-raj.khem@gmail.com>
	<20200310011544.3022342-3-raj.khem@gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH V2 3/3] dbus-test: Replace cp -a/-r with portable options
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
X-List-Received-Date: Tue, 10 Mar 2020 08:32:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-09 at 18:15 -0700, Khem Raj wrote:
> -r are not posix defined and -a leaks UID of
> build user into target
> 
> Errors like below are fixed when -a is used
> 
> bus/connection.h is owned by uid 1000, which is the same as t
> he user running bitbake. This may be due to host contamination
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Improve commit message for clear reason for change
> 
>  meta/recipes-core/dbus/dbus-test_1.12.16.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.16.bb b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> index bea0e74ed0..91e2ba69d2 100644
> --- a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> @@ -70,11 +70,11 @@ do_install_ptest() {
>  
>  	install ${B}/test/test-segfault ${D}${PTEST_PATH}/test
>  
> -	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
> +	cp -R --no-dereference --preserve=mode,links ${B}/test/data ${D}${PTEST_PATH}/test
>  	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
>  
>  	install -d ${D}${PTEST_PATH}/test/.libs
> -	cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
> +	cp -R --no-dereference --preserve=mode,links ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
>  
>  	# Remove build host references...
>  	find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf -o -name "*.aaprofile" \) -type f -exec \

I still want to understand why only you are seeing this first.

The implication is that we have to change most uses of "cp -r" for "cp -R --no-dereference --preserve=mode,links
" in OE-Core and every other OE layer.

If we have to do that, fine, but I do want to understand what set of
circumstances triggers the issue first.

Cheers,

Richard


