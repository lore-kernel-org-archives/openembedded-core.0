Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6AC77D11
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 19:02:37 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g15so13579529wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 12:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WVMEcEMpNEyoWVxqH3k15/9XpFN0VxKN4QBaTI542ZU=;
	b=gLccYMDsU87TpWgSTAyIzn6g+Nbj88C1EMu+MnF6KrnFzWmVGsfcYQNkuIP3qMIi+2
	7HAbkUA+kTxvRTTKwJVJ7W6cIcKzd/8yRcfaapZKGdkIREx+YGl41XhKb9JjWD+29Y7m
	kv1NhXkbZRt3I7VzAccdzq5JP1uCNuxGeOltPucH7FTUQNLXWyX4jCopWTexUL5f7imV
	zG7p8k+s65w22IpbvgYGZwSM98E7JXE75OI3EMYj7hUu0TZ8uKxCrJGuXj+ZtDwXa0uW
	8rORUxSxruFOKxTfNGXgcnnkt9QjPU5yvq1xUUWOwJq0USWsEfEBKlNKmPJlhhhpxGGr
	71SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WVMEcEMpNEyoWVxqH3k15/9XpFN0VxKN4QBaTI542ZU=;
	b=TXVJHQ6tzxLplJKVVXF65AKBMrttz5ywexaUJXngA/gqcwLL/+5Nx9yrpxYY+x5Uki
	Tg8hJge/TJGEWe6i9oz55gnTJgnvB7e+yhaqim2sfXcD9BaQ5Yuk5xsSZbdmGyzmWnuO
	DU8zULqnxkjXhNuOpA4PouFfuT+rkJRJNeHBDe142g56vJpiAaqocuhSQkzFpeJyBdKt
	17oSHYkR8ZNh8qbduncAz0q6pRj2LgAHsA+7fBZ3i9k82GAwQrZkQIj0V5UsOSbO6SID
	K45cBw6nIZA7Xwo26kGDxiC8hfVOMUbZJUranuLSq+t0W/rgIeaNJPBSei85bWFMAlR1
	5k3g==
X-Gm-Message-State: AODbwcAV+STyN1V/SRUsv6HDLWaRSzoItvyOfI8ROJKKV3Ydt1lMR6Ah
	WhiWXHt/OC6mf2vH2rhm2F5quoNd0g==
X-Received: by 10.28.74.1 with SMTP id x1mr436406wma.95.1496343759022; Thu, 01
	Jun 2017 12:02:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.148 with HTTP; Thu, 1 Jun 2017 12:02:38 -0700 (PDT)
In-Reply-To: <dc21b6be8d46f824831ff9bf4a5055dec3895b6b.1496329361.git.alexander.kanavin@linux.intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<dc21b6be8d46f824831ff9bf4a5055dec3895b6b.1496329361.git.alexander.kanavin@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 1 Jun 2017 12:02:38 -0700
Message-ID: <CAJ86T=Vgkosu=ubwF62dp8mHhaL7n1nKfSQXi4G1Si5F3J6TfA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] package_rpm.bbclass: use multithreaded xz compression
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
X-List-Received-Date: Thu, 01 Jun 2017 19:02:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 1, 2017 at 8:15 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> RPM's default is single-threaded gz; the change greatly helps with
> both buildtimes (when there is a small number of large-sized packages)
> and disk space taken by resulting rpms.

Do you have any test results for that? Obviously build times will be
longer when building with a single CPU since xz compression needs more
CPU than gzip, but I'm curious how many CPUs are required before the
multiple threads win over and build times actually get shorter. 4? 8?

One other concern with parallel xz compression is memory usage. Single
threaded xz needs more memory than gzip and running multiple xz
compression threads together will push the memory usage up again.
Maybe not an issue if the peak is still acceptable, but something to
be aware of (I've given up trying to build in 4GB, but hopefully 8GB
build machines still have some life left in them...).

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/package_rpm.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index a844c4d4360..dc241975c3b 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -644,6 +644,8 @@ python do_package_rpm () {
>      cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
>      cmd = cmd + " --define '_use_internal_dependency_generator 0'"
>      cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
> +    cmd = cmd + " --define '_binary_payload w6T.xzdio'"
> +    cmd = cmd + " --define '_source_payload w6T.xzdio'"
>      if perfiledeps:
>          cmd = cmd + " --define '__find_requires " + outdepends + "'"
>          cmd = cmd + " --define '__find_provides " + outprovides + "'"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

