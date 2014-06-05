Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE466B7F9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 15:21:39 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id q200so335809ykb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jun 2014 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=FOMbpcNzw1SKmJO9ghCDLuBPx1jHpE2w8QhKecAy8mw=;
	b=kx9DSF4J5C8you92BQRRsLb3aUVA4ZNkcBY06pR64V+9P+q93uGzlITOURVbB8ZusV
	+o1HsnqbwtW/NNEYOLhZLxCHQ8SbgworxDXZhsoAC+Ljwz89sCwjUmmZpZxNxaCJsGwR
	PvMYlZG8+jo+JjAF3zxrCP5CAvN6DcvSXQvRZ87QZev0xeZ+mLzNSGzNtJSHz06AmZwA
	mkVkZ9hUu1izUyFk26tDPepa4ybFY275CFxK1ng5A43x5cIlWSdSt+ZoGYSMFfMymqLV
	ANwDExieCT9siZ2EiSWPKD8aXrl+181JgDMkMqi0/PpShn0uOWqcoWC6OHXmTphRu+y2
	rOxQ==
MIME-Version: 1.0
X-Received: by 10.236.124.7 with SMTP id w7mr84389637yhh.33.1401981700271;
	Thu, 05 Jun 2014 08:21:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Thu, 5 Jun 2014 08:21:40 -0700 (PDT)
In-Reply-To: <456ee4334cd0294c3605845d4fceb9c163c86d48.1401957639.git.Chong.Lu@windriver.com>
References: <cover.1401957639.git.Chong.Lu@windriver.com>
	<456ee4334cd0294c3605845d4fceb9c163c86d48.1401957639.git.Chong.Lu@windriver.com>
Date: Thu, 5 Jun 2014 12:21:40 -0300
X-Google-Sender-Auth: jVUTIeciNm5O4-2kIpxOqkALg8w
Message-ID: <CAP9ODKqwiQyGbBB0J2x=WzgDbXwDsnhi1OKR8nwSgNRUHk3_gg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] oprofile: Add PTEST regression testing to oprofile
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
X-List-Received-Date: Thu, 05 Jun 2014 15:21:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 5, 2014 at 5:44 AM, Chong Lu <Chong.Lu@windriver.com> wrote:
> The commit changes the oe-core oprofile recipe by adding the PTEST
> interface, implementing do_compile_ptest() and do_install_ptest().
>
> The install routine adds several files that only the regression tests
> require. Also, a patch is necessary to inhibit executing the tests on
> the build host and to point to the correct target directory for the
> libutil++ test 'file-manip-tests'.
>
> That test requires the recipe to set SRCDIR in the build environment
> instead of determining the value from build-time host paths as for a
> self-hosted build.
>
> Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-kernel/oprofile/oprofile.inc          | 31 ++++++-
>  .../oprofile/oprofile-cross-compile-tests.patch    | 98 ++++++++++++++++++++++
>  meta/recipes-kernel/oprofile/oprofile/run-ptest    | 18 ++++
>  3 files changed, 145 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
>  create mode 100644 meta/recipes-kernel/oprofile/oprofile/run-ptest
>
> diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
> index ccf9f9f..0a7f7fd 100644
> --- a/meta/recipes-kernel/oprofile/oprofile.inc
> +++ b/meta/recipes-kernel/oprofile/oprofile.inc
> @@ -20,9 +20,11 @@ FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
>
>  SRC_URI = "file://opstart.patch \
>             file://oprofile-root.patch \
> -           file://acinclude.m4"
> +           file://acinclude.m4 \
> +           file://oprofile-cross-compile-tests.patch \
> +           file://run-ptest"
>
> -inherit autotools-brokensep pkgconfig
> +inherit autotools-brokensep ptest

You removed pkgconfig, why?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

