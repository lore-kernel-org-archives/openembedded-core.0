Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B9D67619B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 16:08:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id j1so1981788wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 08:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=hclBgPOXUg1rr1ONFFxUnbPe7wtooZr6xKyMS8Mk+6Q=;
	b=URWZAaeTIKT5RpUPog6elGga8wvJ1H9jeBOBv/zuVB2UcAgVyWfXgBCBHrS1Mbx3LJ
	4kjC11b8+Y9+E/4Zd7ppHSPRymOsgo+bykR/ysZnvVjRVPXcNRdxSm8lgSwxndAofjhg
	oYmQ8HSrM9V7cywCvTt1UtDB1RmbxBDP5UTeWPXvu0nfBm2Gcs/GrIORd9awuGlGR6zS
	M5sgMW+l18MKC3+G9bivQbomGRf3Nm9+QFF9xw1Stb+2GGMcoSIFi85MvI0xzxb9iJC6
	jn72sLgDBj47pAUEkZDIrZnKVXVcTMUyoukkZFPdJLZ7MpYx8DUnJ2jLsK6GsWIlXWzo
	MKSg==
X-Gm-Message-State: ANhLgQ3DK9IxfhY+13VO5tKef9IsytyM3kVsVA3AA5QMcfnJxTsYswSO
	fDwYId6oABiT4+KGWVVJHejwXUpk
X-Google-Smtp-Source: ADFU+vvMCWwLJySPvkcrseu8ARJqhZW6x+CRyXN8x1fVlq3eMzVaaVNwQjri5j7SQBookMP9+ugOTg==
X-Received: by 2002:a1c:7f8e:: with SMTP id a136mr4980222wmd.143.1583251684271;
	Tue, 03 Mar 2020 08:08:04 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id l4sm5056620wmf.38.2020.03.03.08.08.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 08:08:03 -0800 (PST)
Message-ID: <aec561f0ad71112c5a86a826653123369a0ef647.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 03 Mar 2020 16:08:03 +0000
In-Reply-To: <20200303160513.17645-4-git@andred.net>
References: <20200303160513.17645-1-git@andred.net>
	<20200303160513.17645-4-git@andred.net>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] reproducible: try to ensure reproducible xz archives
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
X-List-Received-Date: Tue, 03 Mar 2020 16:08:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-03-03 at 16:05 +0000, André Draszik wrote:
> xz suffers from a reproducibility problem when not using multi-
> threaded mode:
> a) archives are created differently in single- vs multi-threaded
>    modes
> b) xz will scale down the compression level so as to be able to
>    work within any memory limit given to it when being launched
>   in single-threaded mode.
> 
> Thus, for reproducible xz archives we need to launch xz with
> at least two threads.
> 
> Add a little sanity test, and error out otherwise, so as to
> guarantee no difference due this fact.
> 
> Assumptions:
> * The thread limit should be set via XZ_THREADS, not via
>   modifying XZ_DEFAULTS or XZ_OPTS, or any other way
> * The thread limit should not be set to xz's magic value
>   zero (0), as that will lead to single-threaded mode on
>   single-core systems
> 
> This patch here doesn't prevent people from shooting themselves
> into the foot by changing XZ_DEFAULTS to change the number
> of threads directly, but it's can serve as a hint at least.

I don't know if this patch is useful, feel free to drop it.

In an ideal world, it'd parse the output of xz --verbose --verbose, to catch
all possible ways people might be adjusting the thread limit, but that's
non-trivial.


Cheers,
Andre'

> 
> Signed-off-by: André Draszik <git@andred.net>
> ---
>  meta/classes/reproducible_build.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
> index 750eb950f2..e07bef87d8 100644
> --- a/meta/classes/reproducible_build.bbclass
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -35,6 +35,7 @@
>  # SOURCE_DATE_EPOCH is set for all tasks that might use it (do_configure, do_compile, do_package, ...)
>  
>  BUILD_REPRODUCIBLE_BINARIES ??= '1'
> +BUILD_REPRODUCIBLE_XZ_ARCHIVES ??= '1'
>  inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'reproducible_build_simple', '')}
>  
>  SDE_DIR ="${WORKDIR}/source-date-epoch"
> @@ -198,4 +199,8 @@ BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
>  python () {
>      if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
>          d.appendVarFlag("do_unpack", "postfuncs", " do_create_source_date_epoch_stamp")
> +
> +        if d.getVar('BUILD_REPRODUCIBLE_XZ_ARCHIVES') == '1':
> +            if int(d.getVar('XZ_THREADS')) < 2:
> +                bb.fatal("Can not build reproducible XZ archives without threading")
>  }


