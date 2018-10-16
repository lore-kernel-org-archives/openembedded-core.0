Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7F5745F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 10:00:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 193-v6so22530980wme.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=As6bzPx616oLmUF2kjypFnaixb2QUyPkAl57OQX/jNQ=;
	b=BnFmIR4plGxoZIfOTV11E6IhNMQPUZ4DEV4Upr2db/di6+u6K9u55dqpprd9Tn1GwO
	HtcgwrwfgRXzD3HJ/YzhxfpXyyWfLmCZhBFKlewUwXb/RYEDB06K7mT6RhT0Q6tkbWhd
	CQ8aCBTZ4fEGcOIjjoHYA/5xGOsHpSYKsERDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=As6bzPx616oLmUF2kjypFnaixb2QUyPkAl57OQX/jNQ=;
	b=JX8CSJ2gwLKpfkAjzLK8/G31tvCujLDmS8NdXN2hWnz3hluoJ5EyxGnz8BxkvOGWOZ
	kzO744FcGvuvlDwQXcDfsJ2V/ZRa8PRFNIUX5pSEbm5Ya0yA7TdedKasWAMrfiq9JHIW
	RGhZLLtTbDzCyTzBZCsSSit+OzCQJDJVYKWeJl7KZUuvcWBXDo5/TTA0SUdBdHF85P1V
	XDUeamMG819z9ec5pN391J7rDUP2X/LM6h094XlztNMFgZ9K3ALmf3MH4zsRgAUla8zi
	I0/zs3FhYJufnKjz5MEiK1Xn4ekHFcDk8BGnBVztk/CvuxCoTpLzXv2sQcoyx0mHs4/A
	jRxw==
X-Gm-Message-State: ABuFfoiMJ1iADizZ+A7vmkJMBlMqbNDN1JZkQ3QbR2ZJRTlDIKeHbEhe
	vHCVNtMRg2qbBgSqpbu3+J/SMQ==
X-Google-Smtp-Source: ACcGV61xTrxkVak7m+PQjhURF/oD7tZjezckbHzvmmdhk32elntiGSKxP09VSW3aWRKgb6J4K2bVtA==
X-Received: by 2002:a1c:a851:: with SMTP id
	r78-v6mr15986201wme.97.1539684056504; 
	Tue, 16 Oct 2018 03:00:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u76-v6sm21253492wmd.10.2018.10.16.03.00.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Oct 2018 03:00:55 -0700 (PDT)
Message-ID: <fb67373823b7952f1acf022bed6bd40611c74754.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org, 
	ross.burton@intel.com, randy.macleod@windriver.com
Date: Tue, 16 Oct 2018 11:00:54 +0100
In-Reply-To: <20181016090054.122374-1-mingli.yu@windriver.com>
References: <20181016090054.122374-1-mingli.yu@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] boost.inc: make libboost_python3.so available
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
X-List-Received-Date: Tue, 16 Oct 2018 10:00:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-10-16 at 02:00 -0700, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Currently boost provides ${libdir}/libboost_python35.so,
> but there is some logic as below in CMakeLists.txt
> of package cv-bridge under meta-ros layer.
> [snip]
> if(PYTHONLIBS_VERSION_STRING VERSION_LESS 3)
>     find_package(Boost REQUIRED python)
> else()
>     find_package(Boost REQUIRED python3)
> endif()
> [snip]
> 
> And comes below do_configure error for cv-bridge:
> meta-ros/recipes-ros/vision-opencv/cv-bridge_1.11.16.bb:do_configure
> > CMake Error at $Prj/cv-bridge/1.11.16-r0/recipe-sysroot-
> > native/usr/share/cmake-3.12/Modules/FindBoost.cmake:2048 (message):
> >   Unable to find the requested Boost libraries.
> > 
> >   Boost version: 1.68.0
> > 
> >   Boost include path:
> >   $Prj/cv-bridge/1.11.16-r0/recipe-sysroot/usr/include
> > 
> > 
> >   Could not find the following Boost libraries:
> > 
> >           boost_python3
> > 
> >   No Boost libraries were found.  You may need to set
> > BOOST_LIBRARYDIR to the
> >   directory containing Boost libraries or BOOST_ROOT to the
> > location of
> >   Boost.
> > Call Stack (most recent call first):
> >   CMakeLists.txt:11 (find_package)
> 
> Can update CMakeLists.txt of cv-bridge as below
> to remove the configure error:
>  - find_package(Boost REQUIRED python3)
>  + find_package(Boost REQUIRED python35)
> 
> But once the python version changes such as
> python37, it fails again. So make boost provides
> libboost_python3.so to make the fix flexibly.
> 
> [YOCTO #12833]
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-support/boost/boost.inc | 4 ++++
>  1 file changed, 4 insertions(+)

I'm a little worried about why we're having to create these links when
other software seems able to expect these things by default. Is this
some standard packaging most distros do? I'm a little worried we're
creating an ABI here which doesn't exist...

Put another way, why doesn't upstream create this link if its expected
to work?

Cheers,

Richard


