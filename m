Return-Path: <nathan@nathanrossi.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 172F6724B9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 02:11:54 +0000 (UTC)
Received: by wibg7 with SMTP id g7so84665777wib.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Mar 2015 19:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ogi72VVqXTNYPgZM2z/7SXn81poPm8zZJLgrmuP7pjw=;
	b=VaCXyqjXPZoc/ocDKE5Bt7YeaNNRqIMirp1XPNOA+hdslpZL7kY82gq/4gNhvzY71Q
	dT7ka1eHGZCsqEJj0WN8CM3HEFP/afXBLXbfqncg9dEl62nD8gwmpUMrG0DW/4YyTNm4
	XL0SsO6ja3pbRoX1cY3tqhNCEyfnBIkiB4tHX4jzCLryLUU2WXG0XZ4MZDLtX8bRMXZo
	0LkbSQIy+XHNAzPf9CIoHJlRvlxHnlZFD+z6bSUwooyYNlOaBOYZm2+kHHiQ2s/vtIjy
	xgx+UQUBnD08Lm3C8QNveUsOI8yhnd4A/5v2VCVh8xbgVOhzbyGyA5MSSOzoDfGvk6c2
	IKhQ==
X-Gm-Message-State: ALoCoQlzKYURv4OSafaVJzYMurvNpuipnoDN1aetIuD4aUgY2/qT3kdg35vRI0om6nWtie4wsc8W
MIME-Version: 1.0
X-Received: by 10.180.83.136 with SMTP id q8mr796303wiy.39.1427681515426; Sun,
	29 Mar 2015 19:11:55 -0700 (PDT)
Received: by 10.25.205.207 with HTTP; Sun, 29 Mar 2015 19:11:55 -0700 (PDT)
In-Reply-To: <1427656660-8637-1-git-send-email-peteasa@gmail.com>
References: <1427656660-8637-1-git-send-email-peteasa@gmail.com>
Date: Mon, 30 Mar 2015 12:11:55 +1000
Message-ID: <CA+aJhH252qR4YePVWDoXVJ3Qrjsi_QUTxde-czT25QoaHTX3gQ@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: Peter Saunderson <peteasa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] insane.bbclass: Added Epiphany machine definitions
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
X-List-Received-Date: Mon, 30 Mar 2015 02:11:55 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 30, 2015 at 5:17 AM, Peter Saunderson <peteasa@gmail.com> wrote:
>

You have [meta-oe] in your subject, I believe you are after just
oe-core with this patch correct?

> Adding machine definitions for the epiphany (http://www.adapteva.com/) chip.
> using https://github.com/adapteva/epiphany-binutils-gdb.
> For binutils implementation that defines TARGET_ARCH MACHINE "epiphany": 4643 See https://github.com/adapteva/epiphany-binutils-gdb/blob/epiphany-binutils-2.24/bfd/elf32-epiphany.c

Epiphany is in upstream binutils with the matching ID,
https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=include/elf/common.h;h=25cfef2d6b1ae8e3f976f1e55576d0fbaff79027;hb=HEAD#l408

> For example layer that uses these defines see https://github.com/peteasa/meta-epiphany.git
>
> Epiphany cross compile is confused by package_qa_check_arch so this check is also skipped.
> ---
>  meta/classes/insane.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index c6dea22..9cdb382 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -52,6 +52,9 @@ def package_qa_get_machine_dict():
>              "darwin9" : {
>                          "arm" :       (40,     0,    0,          True,          32),
>                        },
> +            "e-os" :  {

I assume 'e-os' is short hand for 'epiphany-os'?

Is there are reason for using e-os? I noticed in your layer that your
toolchains are actually target os 'elf' (e.g. epiphany-elf-gcc), in
which case it should be 'elf' that goes into the TARGET_OS variable.
This might be the reason for the issues that you see when compiling?

Regards,
Nathan

> +                        "epiphany":   ( 4643,  0,    0,          True,          32),
> +                      },
>              "linux" : {
>                          "aarch64" :   (183,    0,    0,          True,          64),
>                          "aarch64_be" :(183,    0,    0,          False,         64),
> @@ -445,6 +448,10 @@ def package_qa_check_arch(path,name,d, elf, messages):
>      provides = d.getVar('PROVIDES', True)
>      bpn = d.getVar('BPN', True)
>
> +    # FIXME: epiphany cross compile confuses this check
> +    if (target_os == 'e-os'):
> +        return
> +
>      # FIXME: Cross package confuse this check, so just skip them
>      for s in ['cross', 'nativesdk', 'cross-canadian']:
>          if bb.data.inherits_class(s, d):
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

