Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1C89674AE6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 23:24:49 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x66-v6so7797551vka.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 16:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GDfcFw+j9kJWZGRvk4vzowRuSYDn/PR0w9aWEavk6Yk=;
	b=Ln1vVNVdbBPYQjP6LkrqPnlcArLWKRp09SNQXp2QJ+whrBSHnaDU3lj9eydFpIiD3w
	s5C17IQzLaJlqVZN8CIEouPHMoiR2SXun+rj2krdFQCPxuQaSxgsCiC9ojoAQyu8Shxv
	SwdixonZtWF7dv7q8doE4qx5IF8Acuew0pugeiZFArIqleo4PbZ/4dDdB6elBSgSRUZT
	0cykWYhH7Wgyt61AG02pUOSB9FINQUVoEvKhB9AZNg9gp1Fb42K6zB0IgTcoqt7rPAn1
	4nqzwDeiYBm+393hL91+FdNAVelSku7B9RqtfPf12jzBEBDzXsz3Dnli1lKP+yiOjlxz
	gYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GDfcFw+j9kJWZGRvk4vzowRuSYDn/PR0w9aWEavk6Yk=;
	b=ft97UIAj0c1MOL48UyU/J9BBpPBbQV44dEvYMb/3FPg16unv95H2pLC+0Abpj3kv/a
	t7Jmj1tEhsc2fgPu6kwhib5orbArloJJFfiZWRusNh4NIvLsI5q7Hj/x0NXcqVip4pE0
	zYovhAKQPTtFqEiUcDcb0p15vy0UbReq1OyrTn2aJhIb6CM7p83Yi5DCRxF+GFURKA6O
	mzg2Lu/o3ryeFY7oGQByUO5FoG5BR5QrKFJPB+6wx12n/U4ZoQZi2T8KV5J9j7yUW9kl
	A75ywuIe4H92o2mVVfgH/UxnBmDJNCfNvWTipz9Mn720KsdXQL5md1i/PiZWFTAycV92
	zSgA==
X-Gm-Message-State: ALQs6tCb2oaxTBjyeWykgwCNMu7FCoe5rSPlmNH9I0Za7vhUdjlG34SC
	rDoHkp+a/DdmZexO8iRjPioSRFl1OtTYmi+IItM=
X-Google-Smtp-Source: AB8JxZoEVo9JF/cEwMZwRrkEk8Hp4YL+a6EiEYb5WKmoYca19oF2RsOamcM/xQbzMJvdTVBclLRMzfj4bgBe02cWTG4=
X-Received: by 2002:a1f:1551:: with SMTP id
	78-v6mr9890329vkv.174.1525389890542; 
	Thu, 03 May 2018 16:24:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Thu, 3 May 2018 16:24:50 -0700 (PDT)
In-Reply-To: <20180416193251.17223-1-mark.hatle@windriver.com>
References: <20180416193251.17223-1-mark.hatle@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 3 May 2018 16:24:50 -0700
Message-ID: <CAJ86T=UO-ZaEOdAqGu_yUMir4eqd4dFjFDcPEZ_4cmkJT8sdbQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>, akuster808 <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] package.bbclass: Add '-b' option to file call in isELF
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
X-List-Received-Date: Thu, 03 May 2018 23:24:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 16, 2018 at 12:32 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> The isELF function works by running:
>
>    result = file <pathname>
>    if 'ELF' in result
>
> By default 'file' will prepend the result with the path name of the file
> that is being checked.  This usually works fine, such as:
>
> $ file /home/foo/openembedded-core/meta/classes/package.bbclass
> /home/foo/openembedded-core/meta/classes/package.bbclass: Python script, ASCII text executable, with very long lines
>
> However, if the path includes 'ELF', ELF will end up in the result, and then
> the check will return positive.
>
> $ file /home/ELF/openembedded-core/meta/classes/package.bbclass
> /home/ELF/openembedded-core/meta/classes/package.bbclass: Python script, ASCII text executable, with very long lines
>
> This will then result in the isELF coming back true, and possibly causing the
> checks that use isELF, such as the 'is it already stripped' check, to do the
> incorrect thing.
>
> Adding the '-b' option to file will result in the path being omitted in the
> result:
>
> $ file /home/ELF/openembedded-core/meta/classes/package.bbclass
> Python script, ASCII text executable, with very long lines
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package.bbclass | 2 +-
>  meta/classes/staging.bbclass | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index a03c05b9f7..0844fd5065 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -898,7 +898,7 @@ python split_and_strip_files () {
>      # 16 - kernel module
>      def isELF(path):
>          type = 0
> -        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
> +        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path.replace("\"", "\\\""))

Sorry this feedback is a little late, but now the change has landed in
rocko I noticed that the backports for this patch appear to be wrong.

Either the path passed to file should be quoted using double quotes
with any " chars in the path being escaped (ie the original code) or
the path should be quoted using single quotes and then any " chars in
the path should NOT be escaped (ie the version now in master - which
also handles paths containing special characters such as $ etc).

The best approach for rocko and pyro would probably be (err... have
been) to cherry pick from master in the following order:

  http://git.openembedded.org/openembedded-core/commit/?id=7877761534b0c2492da6289e9f2269d41b6ed464
  http://git.openembedded.org/openembedded-core/commit/?id=5a324e9b2cf6378f8eaa4e394f9cb36d4e2680ac
  http://git.openembedded.org/openembedded-core/commit/?id=ab056c7f6065f310be4dd256ceb45f85ff981f69

>
>          if ret:
>              msg = "split_and_strip_files: 'file %s' failed" % path
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index 984051d6aa..bff04373dc 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -84,7 +84,7 @@ python sysroot_strip () {
>      # 16 - kernel module
>      def isELF(path):
>          type = 0
> -        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
> +        ret, result = oe.utils.getstatusoutput("file -b \"%s\"" % path.replace("\"", "\\\""))
>
>          if ret:
>              bb.error("split_and_strip_files: 'file %s' failed" % path)
> --
> 2.16.0.rc2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

