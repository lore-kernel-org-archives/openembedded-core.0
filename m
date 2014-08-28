Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4491A71171
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 14:09:46 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id j107so772825qga.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 07:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aPzVHZeqvxaDa4Am0LhuxkdlBNcUciW9i35Tp3i6tvQ=;
	b=iPGL3p0KDCEjLigt8vxX42X9hcNVgFLG9rXd2BpYPAlDDSFe174+BuWw/AOPymEw1v
	SVd4DpDQZ0iEvn81cLZw+A4ssUsOd9Z1rrOQMwH0OURYi2FbE738vj8p4LFzY9ay4VwL
	2lN0rjRkDMr1fqsg15HlW9bmcEjEhaU/7Nn/zjYZULpOSqP6UyCTFvLrK5pLSZZquqpq
	GlJDOV53j8KlUrhVzFwkc9BzZaV/siwGr1UtZdcWM0p3iNZb/fJyFx+vqTLzDfWnIh4V
	OwCJOBnedKhbKfYCsqjaWuI7SkHZmCW9OXWzDlNUXQ43MJeBVL61ni++PzsWOQTOVwDq
	7/mA==
X-Gm-Message-State: ALoCoQnk+8zlUT/R7RVo8lzYa6tTt7xr1iHqn1dIaCd0CCKnCWU2ucrR/akv49EdGonh2h2nissV
X-Received: by 10.229.137.131 with SMTP id w3mr6899312qct.23.1409234987617;
	Thu, 28 Aug 2014 07:09:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 28 Aug 2014 07:09:27 -0700 (PDT)
In-Reply-To: <d03fddc6174a0fefe406c4dae2daffcca218ce70.1408340319.git.Chong.Lu@windriver.com>
References: <cover.1408340319.git.Chong.Lu@windriver.com>
	<d03fddc6174a0fefe406c4dae2daffcca218ce70.1408340319.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Aug 2014 15:09:27 +0100
Message-ID: <CAJTo0LZ89Wg1QfzYheNO0u2YWVTQFo58je1KqYPnKzJeKK+UGA@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] piglit: enable ptest support
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
X-List-Received-Date: Thu, 28 Aug 2014 14:09:47 -0000
Content-Type: text/plain; charset=UTF-8

On 18 August 2014 06:39, Chong Lu <Chong.Lu@windriver.com> wrote:
> +env PIGLIT_BUILD_DIR=`pwd`/.. piglit-run.py `pwd`/tests/sanity.tests `pwd`/results/sanity.results 2>&1

You shouldn't need to set PIGLIT_BUILD_DIR.

The sanity tests are very basic so this won't count as "running
piglit" in any meaningful QA sense.

> @@ -36,7 +37,6 @@ do_install() {
>         cp -Pr lib/ ${D}${libdir}/piglit/
>         cp -Pr framework/ ${D}${libdir}/piglit/
>         cp -Pr generated_tests/ ${D}${libdir}/piglit/
> -       cp -Pr tests/ ${D}${libdir}/piglit/
>         cp -Pr templates/ ${D}${libdir}/piglit/
>
>         sed -i -e 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|' ${D}${bindir}/piglit-*.py
> @@ -46,3 +46,7 @@ do_install() {
>  FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
>
>  RDEPENDS_${PN} = "python waffle python-json python-subprocess python-multiprocessing python-textutils python-netserver python-shell mesa-demos"
> +
> +do_install_ptest() {
> +       cp -Pr tests/ ${D}${PTEST_PATH}/
> +}

Why move the tests directory to the -ptests package?  That makes
piglit unusable without installing piglit-ptest.

I agree that piglit should be ptest-enabled, but the piglit-ptest
package should simply depend on piglit and contain the runner script.

Ross

