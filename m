Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 81BB762252
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 11:04:14 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id v10so1219610qac.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jul 2014 04:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sVxG0PSSE+LMUlbAFLNwKeSGWkJB6sk/WXokoS8g9NY=;
	b=DShtNGSkqHTneEWKaTdRajA1bJ85xOWY7gEVs49C5eqlAHJ1YO1/CyJTTuz2ghs1pa
	RuoeReIkgXEJGwHeDFROczcny8HprWI1gk56XsZvY7NzW7dM8TaaZekl5Y8inY7CZjDL
	8LyF4wQsjhiOMuabD7ZofjTg1Va0oqWdb+UUN/6RQimamZE+ED64zvTE5+G+DmxZlFir
	VQp2Ti2S1Di3UPwysAMkJ7N+hpZPRlDqV9QWKAK+9402C6h6rZ/Al2ydKIDY7uoduyMe
	gn6PZ2ExH+NCXHRrMVp+iLAfRrQPtIbAYA7Ml2toHT0nC8Do99E07w+fhZ0s2Blkgc0D
	yOIw==
X-Gm-Message-State: ALoCoQkiMU5iDYd1aAa6zuQnWB0IGTZupEUSDkwJcvyecIFlbEmD8IOCNuZ5pQjHNkvHK24bfACI
X-Received: by 10.224.25.206 with SMTP id a14mr6317522qac.35.1404471855248;
	Fri, 04 Jul 2014 04:04:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Fri, 4 Jul 2014 04:03:54 -0700 (PDT)
In-Reply-To: <1404471270-1536-1-git-send-email-ming.liu@windriver.com>
References: <1404471270-1536-1-git-send-email-ming.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Jul 2014 12:03:54 +0100
Message-ID: <CAJTo0LZYGaHdzEdf_MYV0bre72gD6y6ma0qqs-ZZCTX_kgmL0A@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libcroco: dont package /usr/bin/croco-0.6-config
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
X-List-Received-Date: Fri, 04 Jul 2014 11:04:21 -0000
Content-Type: text/plain; charset=UTF-8

On 4 July 2014 11:54, Ming Liu <ming.liu@windriver.com> wrote:
> +PACKAGE_PREPROCESS_FUNCS += "croco_package_preprocess"
> +croco_package_preprocess () {
> +       if [ -f ${PKGD}/${bindir}/croco-0.6-config ]; then
> +               rm -f ${PKGD}/${bindir}/croco-0.6-config
> +       fi
> +}

Erm, this is wrong.

So croco-config is broken because the recipe doesn't inherit
binconfig, to fix the paths and install the binary into libcroco-dev,
where it belongs.  By not installing it into the package, you've
broken anything that wants to build using croco-config inside a
Yocto-generated image, such as the Build Appliance.

Considering that the only recipe to depend on libcroco is librsvg, and
that uses pkg-config instead of croco-config, then this recipe should
also inherit binconfig-disabled to turn the config script into a "exit
1" no-op.

Ross

