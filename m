Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5CECA6C216
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 23:03:45 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f14so1566184wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 15:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LseHIIdhHYFy5aWCx09kUe0fzNweWQNEQLGFFIiYDJ0=;
	b=VzCgrrcfg5Ehm4AmJgxM/W65tGez4bHoc7IhSTBzd8XJPQzwh0IriLjN+cA59jz/Oa
	+inLDhoKw0Q/bzbA2pi9pQyvwnC+kFF9u912pusEXagrJ/6617y/okMlfg2ENt4x0hYb
	jk80eIR7RGy1Ff2llxcEqRrfvswWwpUda/Adw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LseHIIdhHYFy5aWCx09kUe0fzNweWQNEQLGFFIiYDJ0=;
	b=HHAPpAYewExDxfndvq1gVoA2nru7lCu3rUCJx3exauaktIrMk1fMcUjeSkzVtaqxrX
	B4PV/c8W6D8PX+lTGLQ+s2s/neqMDGmLIUYfXcjEWCxqK2jZR15z8UIQYsb5tWOmr+VI
	apBNyr6YNtc+/B54lGTJpb/8NNTD6Wp1kFImizwCDKAyHJV8tEssPOMMPYlQyZXCS985
	zqdQXvESarN6ODM1SUFfA2FYt15/XpSVY0SUSsHjHGe/4wpUlrfzLk4yXiNUFhNRXIz7
	UP0UnGylQtlfNt1maWTamx+yDw1bDK1VEDjr7tIiUp4LhU6bfzirS4jOrdXU53T9JyD9
	cZGQ==
X-Gm-Message-State: APjAAAWrIS0eToMAFOFYlXcbJqeFbNxPs28FFKmwFgtdgkNUrOEz4/mQ
	Hqm32DPcbvmoPvh+VEk/ECynVA==
X-Google-Smtp-Source: APXvYqzFoMRudtuO5eYnPKoaKkUldZXJZAsRXLbgfkPlu0ktjwaKs7QPEmzkpXTN6onkqD18GFrQew==
X-Received: by 2002:adf:ee8e:: with SMTP id b14mr7568834wro.71.1551567825970; 
	Sat, 02 Mar 2019 15:03:45 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id j41sm7747976wre.9.2019.03.02.15.03.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 02 Mar 2019 15:03:44 -0800 (PST)
Message-ID: <5a3c4372a14a9c21b3b598e3662324681c7f0862.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 02 Mar 2019 23:03:43 +0000
In-Reply-To: <c77e986f7f1db21123fa9f0eed5392b2562d2ce4.camel@linuxfoundation.org>
References: <20190228142745.23630-1-luca.boccassi@gmail.com>
	<20190301163639.26436-1-luca.boccassi@gmail.com>
	<c77e986f7f1db21123fa9f0eed5392b2562d2ce4.camel@linuxfoundation.org>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] swig: fix build with musl
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
X-List-Received-Date: Sat, 02 Mar 2019 23:03:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-03-02 at 18:12 +0000, Richard Purdie wrote:
> On Fri, 2019-03-01 at 16:36 +0000, luca.boccassi@gmail.com wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > Building with musl currently fails. The fix has been committed
> > upstream, so backport it.
> > Note that it requires the recent change to use autoconf's
> > do_configure
> > as it modifies a bison file which is used at make-dist time, so it
> > triggers an autoconf rerun which was not working previously due to
> > the
> > custom do_configure step that was removed recently by:
> > a9b1f9eca963 ("swig: Fix configure failure")
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v2: fixed upstream metadata format in patch header
> 
> Fails in testing:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/585
> 
> May need a bison-native DEPENDS?

I tried that, it fails with other problems :(

For example:
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/353

Cheers,

Richard


