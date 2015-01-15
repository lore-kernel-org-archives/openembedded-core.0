Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9531372BC3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 15:49:01 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id n8so11617371qaq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 07:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=wkuE7WCVWjVB88vJaxzTBR8Ebm0JVXhu3jtUft6Glk0=;
	b=xA6C4LiFcY0JMEz3qM+CT1TwneMMtvSIeXtSlAX19bXPAmRLhRQi9Y1J+rpuSDkORX
	xmtYR1g+iTv7MqCfqpxLilqxafMF+3fJA+JddOsdDb3OaIjiRnBSjK66IDUTFDQFvCbO
	DrDF7e5avv4gkuvz134Yv0Hat5BD52yknpu+9ATskpKH51pewRyt3Y3N8rQvgY34ojWy
	2GE2Wd9fFyym8r75V/hdmB/tZnDf76EbBTzuOVuOCc0DaBsxxyPbRIcNmYS1fKARCr5A
	NQBOYht+8ULGWNp8A/CX2A5tLTZMyhAdCcUA4WzFKzd0Gfa5VDTN6T+VqzJ7v/wQfTey
	vKWA==
MIME-Version: 1.0
X-Received: by 10.140.41.169 with SMTP id z38mr16109504qgz.56.1421336942256;
	Thu, 15 Jan 2015 07:49:02 -0800 (PST)
Received: by 10.96.35.34 with HTTP; Thu, 15 Jan 2015 07:49:02 -0800 (PST)
Date: Thu, 15 Jan 2015 09:49:02 -0600
Message-ID: <CACS+7ZTrO7HSOhuYWpj+qtK93cmz=8CFkbuY2rJzHvzpuFNGFA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] dpkg: fix host contamination
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
X-List-Received-Date: Thu, 15 Jan 2015 15:49:04 -0000
Content-Type: text/plain; charset=UTF-8

On 15 January 2015 at 09:41, Dan McGregor <danismostlikely@gmail.com> wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> Force dpkg to use "tar" on the target.
>
> The dpkg configure script looks for gnutar, gtar, and
> tar in order. If it finds gnutar or gtar on the host
> it expects to use that as its tar program on the target.
> Without this, if gtar exists (as it does on my system) then
> dpkg will consistently fail on the target with an error about
> gtar not being found.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-devtools/dpkg/dpkg.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc
> b/meta/recipes-devtools/dpkg/dpkg.inc
> index c3c51eb..11d0eea 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -36,6 +36,8 @@ EXTRA_OECONF = "\
>   --without-selinux \
>   "
>
> +EXTRA_OECONF_append_class-target = " TAR=tar"
> +
>  do_configure () {
>      echo >> ${S}/m4/compiler.m4
>      sed -i -e 's#PERL_LIBDIR=.*$#PERL_LIBDIR="${libdir}/perl"#' ${S}/configure
> --
> 2.1.0


And of course I forgot to mark this a v2. Forgive me.

