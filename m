Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 042BC7E63A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 22:15:33 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r19so1040929wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=75W6kUNgR+0IOiM3fFF9g4A0Z3NsDh7yWb7aHvYfQI8=;
	b=Xp/YIJqmbS3F4wP4LnYsM3ZIpfu7A0yOhSkt0iiufrmsy1J2PQSxYcm69BEpPgv5Hf
	YuMG9XmRxaqbcW9hhZXiwGvPdF/UDFexx8bvgOanmeDsGxUFosOxW9KIIEJq9/m2yAW0
	KTWaeMjif43W4ZsC2/OTeEWgZ4uHdp1IOBtfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=75W6kUNgR+0IOiM3fFF9g4A0Z3NsDh7yWb7aHvYfQI8=;
	b=GUiAliDi4A40d4lYd4jUA2VgxMkgVW5Z3EnuqaweVD5jIe4F3WabdgazdkqRtFMc6t
	ENsc/k5DDCMxDGwkLkCQiWAxNWSMpYb/Cqpqe045vi3i2xps7OijU2E8ezAnTJl+XKT0
	L4ivgTsmtNdIpgmkdiwQ2IWiYN2UMcjAv6W0vGzIor9/sxX/ecOiqxbaM683c/3UmytP
	DaJBT4C0FQrtwWCCtjLtMFzMO4hsG+rrm9TZPHCrlgytog+JCrdJy6GEbMCJ+w0TLF2q
	KdFoMQImdbwQWpyFsv9eHsyfj0qqvRezFAV7DyCN2bUPfmxhBvEv+vwLd/m6TJe3Sdt8
	kNqA==
X-Gm-Message-State: APjAAAXb0sik0QerXJU8XaNj2LSHNz05ikV6ps1RHWKFHy4/deIiVtDf
	JaxJdRbg1VQPFp6HKbPPVMtobg==
X-Google-Smtp-Source: APXvYqwVZBPXtO8CIVS0VONORktGktulbheVYkB/F3xV91Sz96cdgMHiJS92LFfhB0k8wNTDgHbLQA==
X-Received: by 2002:a1c:9c51:: with SMTP id f78mr1055418wme.144.1570486534492; 
	Mon, 07 Oct 2019 15:15:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y14sm26433613wrd.84.2019.10.07.15.15.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 15:15:33 -0700 (PDT)
Message-ID: <72f935872cf5be891f607ba461716e4126f3d2c0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 07 Oct 2019 23:15:32 +0100
In-Reply-To: <20191006154747.7699-1-raj.khem@gmail.com>
References: <20191006154747.7699-1-raj.khem@gmail.com>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] perl: Handle PACKAGES_DYNAMIC for perl-native
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
X-List-Received-Date: Mon, 07 Oct 2019 22:15:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-10-06 at 08:47 -0700, Khem Raj wrote:
> A perl module recipe extending to provide native version causes target
> perl dependencies to be pulled into native build if the module recipe
> has RDEPENDS_${PN} = "perl-module-XXXX" e.g. libxml-sax-base-perl
> recipe.
> 
> The reason is that native bbclass empties out PACKAGES_DYNAMIC and
> perl's PACKAGES_DYNAMIC_class-target is greedy enough to usurp native
> modules as well.
> 
> Eventually we end up with errors like when sstate is used across
> machines
> 
> * ERROR: libxml-sax-base-perl-native different signature for task do_populate_sysroot.sigdata between qemux86copy and qemuarm
> 
> Therefore, to fix this native case needs to handled specially when
> re-assigning module dependencies in split_perl_packages(), where the
> modules are named correctly for native case and have a single dependency
> on perl-native, secondly, PACKAGES_DYNAMIC for target case needs to be
> reined in to spare, -native modules, thirdly, let perl-native take over
> the case for providing native modules
> 
> This will fix several sstate signature errors like above with external
> perl modules providing native variants and having runtime dependencies on
> modules which are provided by perl proper
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/perl/perl_5.30.0.bb | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/perl/perl_5.30.0.bb b/meta/recipes-devtools/perl/perl_5.30.0.bb
> index a221bce52b..9614477982 100644
> --- a/meta/recipes-devtools/perl/perl_5.30.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.30.0.bb
> @@ -265,13 +265,18 @@ python split_perl_packages () {
>      # Read the pre-generated dependency file, and use it to set module dependecies
>      for line in open(d.expand("${WORKDIR}") + '/perl-rdepends.txt').readlines():
>          splitline = line.split()
> -        module = splitline[0].replace("RDEPENDS_perl", "RDEPENDS_${PN}")
> -        depends = splitline[2].strip('"').replace("perl-module", "${PN}-module")
> +        if bb.data.inherits_class('native', d):
> +            module = splitline[0] + '-native'
> +            depends = "perl-native"
> +        else:
> +            module = splitline[0].replace("RDEPENDS_perl", "RDEPENDS_${PN}")
> +            depends = splitline[2].strip('"').replace("perl-module", "${PN}-module")
>          d.appendVar(d.expand(module), " " + depends)
>  }
>  
> -PACKAGES_DYNAMIC_class-target += "^perl-module-.*"
> -PACKAGES_DYNAMIC_class-nativesdk += "^nativesdk-perl-module-.*"
> +PACKAGES_DYNAMIC_class-native_forcevariable = "^perl-module-.*-native$"
> +PACKAGES_DYNAMIC_class-target = "^perl-module-.*(?<!native)$"
> +PACKAGES_DYNAMIC_class-nativesdk = "^nativesdk-perl-module-.*"
>  
>  RDEPENDS_${PN}-misc += "perl perl-modules"
>  RDEPENDS_${PN}-pod += "perl"

We should never be using _forcevariable in public repos, let alone OE-
Core. Its a tool of last resort. I guess this is because native.bbclass
is clearing it but we need to find a better way.

Cheers,

Richard


