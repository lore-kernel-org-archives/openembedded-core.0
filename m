Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 854B06013D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 17:57:10 +0000 (UTC)
Received: by labgq15 with SMTP id gq15so39279831lab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 09:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WlmI5yQzLiKKpePTYcO3sHVqVx5p2AzNLlNrCDrKPtk=;
	b=S1T8S/vpAhTT66lIcOY2Hqm0nDNhnKzkAes0boaT0r0ZT5qubmxoFrDScPUdcIC3g8
	a8iuG6ieENoh37mFswNoJUXTFNMh0o2uZs1sRgBdhoz07jLl4AUY+oVS2qMvRvYFoy0m
	GJv+T2ydzQsAPPkehJdJ6UHkLI9SxvkiO3+SrKdoShw+0kS25pGLX3Cf1SL5b2yy1zhS
	TMlu1bXwcARZGyYesmnHzwR5epyygtm2N8iyaeL1XWHqSXWLxiapax3LsHKQhTNR36D2
	iyC7GRhxLdvZWzoXk/9b9PPgN2vaInw0WzngvQpPW3/6AhxHjg7MbSnQxRxjDQxzG3YV
	PVJA==
MIME-Version: 1.0
X-Received: by 10.152.28.73 with SMTP id z9mr141755lag.28.1425405430841; Tue,
	03 Mar 2015 09:57:10 -0800 (PST)
Received: by 10.152.111.200 with HTTP; Tue, 3 Mar 2015 09:57:10 -0800 (PST)
In-Reply-To: <1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
Date: Tue, 3 Mar 2015 18:57:10 +0100
Message-ID: <CAC1BbcSv-o_=GD9LJkZJyX38TbAmyXkmtJY+NBZ0-xqSDNeUBA@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Naresh Bhat <naresh.bhat@linaro.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 3/4] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Tue, 03 Mar 2015 17:57:11 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 16:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
> Build iso image required syslinux package.  We have already skip the syslinux
> package.  Hence just skip the iso image build too.
>
> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> Reviewed-by: Matt Fleming <matt.fleming@intel.com>
> ---
>  meta/classes/bootimg.bbclass |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index a8e0c19..2edba3a 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -266,7 +266,11 @@ python do_bootimg() {
>      if d.getVar("EFI", True) == "1":
>          bb.build.exec_func('build_efi_cfg', d)
>      bb.build.exec_func('build_hddimg', d)
> -    bb.build.exec_func('build_iso', d)
> +
> +    if [ "${TARGET_ARCH}" == "aarch64" ]:
> +             return

erm is this shell-code or python-code?

For the former there is no "==" operator for POSIX-compliant test(1)
implementations, for the latter the "[" looks suspicious.

What am i missing?
thanks,
> +    else:
> +            bb.build.exec_func('build_iso', d)
>  }
>
>  IMAGE_TYPEDEP_iso = "ext3"

