Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5ABDB75CF1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:27:54 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so119129719igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 04:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=OZJCDYqexrwITqNVhOK8dweLvds6Ie7zbfXLBtitkwE=;
	b=ArLWTsOdNsB17ob7D1362+G3iRuEfyNZ6FNoMQYJRWV2A/jc6wCQEiUl31XFzwViW9
	oduSi1dpuXx026RU3+gGr9HshDOcVdS+FIAtv6ymlfv11IqAZ0r6u3MLF/dwXURKJ81X
	44Z/oEsK2kV+CCL9BKq5Rip8cFWd+TT8vAIq3NzUaGPZAeCdCINJ1/BuuUD9tifBXeda
	OCRgcqtz4Q0EBALQIYcqmEJsWdkuTnRfdXGDlwtajjE0z4TKq289FyacXKDcMrsmjp9M
	zh2xSL4UrdLecunIGNVVc6pf3rf237DHUAj5O9UMyjZO6HQH5C9MCQ9WXFDdw0wzMSiV
	NUDg==
X-Gm-Message-State: ALoCoQkiO9F158fFLb3xJQR5MopsENtUlue61sdv76yARScIXLxl8EjSZSupZg3hiSdMsyvyaQHe
X-Received: by 10.50.64.146 with SMTP id o18mr28780185igs.81.1443094074956;
	Thu, 24 Sep 2015 04:27:54 -0700 (PDT)
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com.
	[209.85.213.177]) by smtp.gmail.com with ESMTPSA id
	v98sm5586566ioi.24.2015.09.24.04.27.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Sep 2015 04:27:54 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcpb10 with SMTP id pb10so12471766igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 04:27:53 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.77.15 with SMTP id o15mr30344285igw.5.1443094073715; Thu,
	24 Sep 2015 04:27:53 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 24 Sep 2015 04:27:53 -0700 (PDT)
In-Reply-To: <1443047565.19044.44.camel@linuxfoundation.org>
References: <1443047565.19044.44.camel@linuxfoundation.org>
Date: Thu, 24 Sep 2015 08:27:53 -0300
Message-ID: <CAP9ODKrBa6oiFm2Fj1XxtH5m2gx=6nSg4OhEs+s_KjgvAgFaFg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: Avoid rebuild failures
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
X-List-Received-Date: Thu, 24 Sep 2015 11:27:55 -0000
Content-Type: text/plain; charset=UTF-8

Hello Richard,

Thanks for hunting this bug, this was very annoying and hard to
figure. It does seem to address the issue in our builder.

On Wed, Sep 23, 2015 at 7:32 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> If gdkpixbuf-native rebuilds and there are stale (broken) modules lying around,
> it can fail to run the postinst. E.g. svg links to harfbuzz and if harfbuzz is
> removed from the sysroot but the svg loader isn't, we get a symbol linking issue.
>
> The reproducer is along the lines of build gdk-pixbuf-native along
> with harfbuzz-native and librsvg-native, then make a small change to the
> gdk-pixbuf recipe that would cause it to rebuild, clean harfbuzz-native
> and then build gdk-pixbuf.
>
> To fix this, when we install gdk-pixbuf, we wipe out any previous loaders.
> The idea is that gdk would always come first and anything else installing
> itself will come later and rerun the postinst if needed. We can therefore
> just remove any other loaders.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

