Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.30157.1595455291817637780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 15:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PLfonsFF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id f1so2752595wro.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 15:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=WwBdPAC4AZj1jHjeRptrnKhX15gW6By2ZDix1jnroz4=;
        b=PLfonsFFICWAbW4mWFIbg33SsSrVnjezmYG51rD/IIY9kMmy1GE6Mab0Icvy9TDZyf
         fJKiT3H6u3MfVjBUQIClrmRCnlL5B1e07dwfCQ2OID2pkeNqoIxItvP9Zi/PnSfbK2ih
         xbdjJKeokUeu8kavBYXmJGFmcBb5KbJ5j2QPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WwBdPAC4AZj1jHjeRptrnKhX15gW6By2ZDix1jnroz4=;
        b=IxZ44hlxjQpPlpYrnV/R06SQpwg3YuSvYrbM3cfHmWYB9yw3KWTv0E6C/B5CR2Z8M6
         XLuxwTCZ1dbProxEMWMKJ4q3N1NnxepY7O4wXfsXQR37dKsiUJE+SKDux5oXm73C/+VS
         /J9CVJsL3lP8z665jRFwtVvfoTlUPEgyboatfxdwiGSRtOiMGN+KreYBCF+gE6cPwcIf
         vvcJhmW9csWRwyw7h35OOl+YKSCpu5V6Od7rDEp+OE045jen7C2fVkpzdG06kUdgtPeN
         EQBaXBwRmOhrb1CkXPK8aNCJiH5jMCdfc0WET3xK0w9folz65+Fa+Ib0wWdD78jUw/zS
         Y7vw==
X-Gm-Message-State: AOAM530wc+epQw11ErlQJssfMyO8sXXqUimPQ4vLrxEln5gyBl1rJlhz
	F081FXNH2wp/Vtt+PjawOtx6SCNO+PrrGw==
X-Google-Smtp-Source: ABdhPJxoK7a3NTRYtzJJfo+Bd2qqaFptAt6yRdi94i+Dpqa0QG3Pf9RONubY3LpdITrMmCuapNKz6w==
X-Received: by 2002:adf:9ed1:: with SMTP id b17mr1280169wrf.140.1595455290185;
        Wed, 22 Jul 2020 15:01:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.a.5.c.a.d.d.d.3.0.d.d.c.1.8.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.a.5.c.a.d.d.d.3.0.d.d.c.1.8.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:981c:dd03:ddda:c5af])
        by smtp.gmail.com with ESMTPSA id x11sm1273567wrl.28.2020.07.22.15.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 15:01:29 -0700 (PDT)
Message-ID: <b840115e67395ab5a1ba2848acc48639d75921c9.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1] libdnf: allow reproducible binary builds
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Wed, 22 Jul 2020 23:01:27 +0100
In-Reply-To: <20200722203111.140237-1-joe.slater@windriver.com>
References: <20200722203111.140237-1-joe.slater@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-22 at 13:31 -0700, Joe Slater wrote:
> Use a static TESTDATADIR if tests are disabled.  Allow
> override of TESTDATADIR if tests are enabled since the
> default will be wrong for target builds.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../libdnf/libdnf/enable_test_data_dir_set.patch   | 26 ++++++++++++++++++++++
>  meta/recipes-devtools/libdnf/libdnf_0.48.0.bb      |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644 meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
> 
> diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
> new file mode 100644
> index 0000000..e3784cc
> --- /dev/null
> +++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
> @@ -0,0 +1,26 @@
> +libdnf: allow reproducible binary builds
> +
> +Use a dummy directory for test data if not built WITH_TESTS.  Allow for overriding
> +TESTDATADIR, since the default is guaranteed to be wrong for target builds.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -133,7 +133,12 @@ add_definitions(-DG_LOG_DOMAIN=\\"libdnf
> + add_definitions(-D_FILE_OFFSET_BITS=64)
> + 
> + # tests
> +-add_definitions(-DTESTDATADIR=\\"${CMAKE_SOURCE_DIR}/data/tests\\")
> ++if(NOT WITH_TESTS)
> ++  set(TEST_DATA_DIR "/notests")
> ++elseif(NOT DEFINED TEST_DATA_DIR)
> ++  set(TEST_DATA_DIR "${CMAKE_SOURCE_DIR}/data/tests")
> ++endif()
> ++add_definitions(-DTESTDATADIR=\\"${TEST_DATA_DIR}\\")

Do we need to set a value in the build or do we never enable the tests?

Cheers,

Richard

