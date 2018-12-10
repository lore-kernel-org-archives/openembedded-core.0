Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF9C6BE3C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 11:02:23 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id a6so17388770itl.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 03:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ETqwqBCs2YVaONJUDbD5b9n7OTK/hBlMG7goTEtcWsc=;
	b=aO9V+u5AItBIqqPFnLaJaLVQKdS3Wbq/qemZkLPUIuVbc2dKaujsfLmAO80eeKeQru
	bEVkvP8H38RxurUl18w+YsgV8lV8Y2cfg1OucU6NdouBySLhzpcs+ejF5E2Cz5aNQ3Ce
	AdXT0shSkrOKO1Fh2JRcTdWUviUFqIrct5ru+0e2kuloxkJ+DbDqHIqIu3F/YZitkmX8
	RNNXuP9FzoP0YAyq3CD1c/NzvQzMBlnLwb7b/pLQjWDj3ZakEmFpIN9nEMD7JM9CjTau
	+QGqWMs9vGmegNkvjDJdo0Z/7InLLCsZv3l9eFqAS8BEKamd7NxqZ1d6JkoD5pwu8nKb
	PB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ETqwqBCs2YVaONJUDbD5b9n7OTK/hBlMG7goTEtcWsc=;
	b=b+IpaYgQrHSV7rU46we5HwHTG0l7dyE9NLtdDkGvOOCBMH1DE6DTverG5ZiAcQ6IFh
	Idh9rr8EeIEawy06I7CtjqThri1a9h6mDuUXR9iIvORjlYlDhxkkAHYxKkLKsecpuMFT
	P2EYOEi/EHfWfy+DMjzptx0mIoxP5xjtPzO87LIYP12Mp93qcXpNKLDRaBlVbeg1S3cu
	8mqEANRAgLjpXyOITFgjJj1ShWdSP9mcoVM/CeHIcG7QJIoRMd6LhwQY/edWh2ywA799
	Wqmk5kt04ZgwtsO9dhmkbwut769/h8ELAMSfKrfPucKTzy0Cn6MPUmZeoQZmVqCx4x0b
	g4ow==
X-Gm-Message-State: AA+aEWbuwPziTXqHsMqdyn5LCtGbjwKFAIwp1frEfe1+LwIylSApcKkT
	MWj9O4U9KsniVZ+BnAUIKEX3MU5DrjovBseU0vd9kw==
X-Google-Smtp-Source: AFSGD/Vz8Q+gUG54ebJHhcdXr99PZang7HcY4qOgzs01Kvuii4mAvZyvtyLD57mpDWEoJnymhlz7d/ChfC2BENynbIs=
X-Received: by 2002:a24:c601:: with SMTP id j1mr11565382itg.130.1544439745016; 
	Mon, 10 Dec 2018 03:02:25 -0800 (PST)
MIME-Version: 1.0
References: <1544452000-56934-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1544452000-56934-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Dec 2018 11:02:14 +0000
Message-ID: <CAJTo0LYEFJ9CR87ErJUETUmYZjwZFkFfT4XNQ+JXawySuGyAPQ@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] createrepo-c: Fix setup of logging (log domains)
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
X-List-Received-Date: Mon, 10 Dec 2018 11:02:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Dec 2018 at 05:28, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
> +++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-setup-of-logging-log-domains-RhBug-1645897.patch
> @@ -0,0 +1,72 @@
> +From 80810f04f2de6bae6e394f52ad9cdd2189862f74 Mon Sep 17 00:00:00 2001
> +From: Jaroslav Rohel <jrohel@redhat.com>
> +Date: Fri, 9 Nov 2018 07:35:13 +0100
> +Subject: [PATCH] Fix setup of logging (log domains) (RhBug:1645897)
> +
> +New debug messages were added into GLib library. These messages come
> +from the "GLib" log domain and were not hidden in the standard and
> +quiet mode of the application.
> +This fix hides log messages regardless on source log domain.
> +
> +Upstream Status: Backport

Upstream-Status, you need the hyphen.

Also, add a Signed-off-by to the patch.

Ross

