Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id E0BEB7FC4A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 23:32:07 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id u2so11103102wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 15:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=96Q4P+ASFcfO1ip1Y87ke9bvbiBgaXsabIMLHM3pSw8=;
	b=CBpCBmXY2fWNBdvIzHMBblPTcK0IU+Fv+IyaJGDqjot37ObjJxEhvNpnBWAHJL8qQh
	9JDTvOkbUxZZuPmRygldAg6fwhwFttI+xvig9Y+itpH0AebsQ7w0UratxghCNZtPZNcU
	4NcRJgI69f+Erw6mjbzIX6KgB0bvDGYEzYC7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=96Q4P+ASFcfO1ip1Y87ke9bvbiBgaXsabIMLHM3pSw8=;
	b=AbSxnTOTdhQzqvja3VaLaROITwt5OydfUsuiPnJ/iB1L/FNyJy9g3yNG5Q2niCllmV
	VVEtBM+0Zi5Q1L7v9G4bf8OYtqiZDAEBoohLB/s847wGLmEq57+Si7nlsl35fuQIOvQz
	beb1+MJ6bJslPNLDI6qzlF6tkRX5R4zQ6wiLls8p0C2vqklAO16yLaBaHeLkn73fFzUk
	jOMzHnllpQwq2rO2IfQQLs+xNcuKhSpRXx/sDYBsd/BUFRcny80lrJ1Z0TqStoHr3XSz
	1HNI5fbATENdW0kvUAnPMDzpSl8zo3L8MTRWRMKJ1npe247TWTC9Bhj5OWFL0mfi4H5J
	AZXA==
X-Gm-Message-State: APjAAAUHa55nDukFS4l0WgQeYpcEvxKFrinQD26kYuFcxYUVFMW/V+Gz
	fj1qnTloXEu7gL1TP3+KgmOhPA==
X-Google-Smtp-Source: APXvYqxwMxNOCiIZhQCUDg3cEeRbKp23/FAoIwqBIUZyu8XLrPA32iSLuNZ0VzDPtYpGwk1fSNaTyw==
X-Received: by 2002:a7b:cc98:: with SMTP id p24mr11829981wma.139.1579390328617;
	Sat, 18 Jan 2020 15:32:08 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r62sm18215561wma.32.2020.01.18.15.32.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 15:32:07 -0800 (PST)
Message-ID: <4e7244df21e0c47712976ad72bc53aab51236724.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Sat, 18 Jan 2020 23:32:06 +0000
In-Reply-To: <2aedfee9-2985-e246-6a8c-7ec673039704@prevas.dk>
References: <2aedfee9-2985-e246-6a8c-7ec673039704@prevas.dk>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: glibc and LDFLAGS
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
X-List-Received-Date: Sat, 18 Jan 2020 23:32:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-01-18 at 22:25 +0000, Rasmus Villemoes wrote:
> I've added a custom setting to TARGET_LDFLAGS, but then I noticed
> that
> the glibc build ignored that. The glibc do_compile did
> 
>  LDFLAGS = ""
> 
> for a very long time, with the explanation that "# -Wl,-rpath-link
> <staging>/lib in LDFLAGS can cause breakage if another glibc is in
> staging". Is that actually still relevant with per-recipe staging?

It is obsolete now, correct.

> If that is indeed moot, can we do
> 
>          CPPFLAGS="" oe_runconf
>  }
> 
> +LDFLAGS += "-fuse-ld=bfd"

Its worth a try...

Cheers,

Richard


