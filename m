Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 77078786B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 19:45:16 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id g38so3050576wrd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 11:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CLBOFDkW9kjy28Dx4ZBlRFbylnqFcWojmZtrzea+tuE=;
	b=iR236OeV2RxvJygdNlcfYc9fnlSSYPMssXcu2IW5EeuAOF+YB63CHpJ5OS0ORpA1nO
	0V9c4e8Oko7i+sVYXBO1XjpLPM/oFtD9QN5oHr+gwLkTranGkPchjo+0YSZvftfkFrbq
	F3dJY5tRQSel9GpOxImx/EPSi4wppQUL3N4WLrNhOsG+MKkVLLV11Cc2UdBmxPmp+yK0
	mEYA1sDluGFx2XYpHCgFUYy5ekYcc2nrmc8ys68HEZFDnwgNZX2cgtXLigM9ZLNYARF0
	td9az9BzLdfyHnEb9SfFz4z6xMg3z05zZzIFuE7pxJbkIfl0wfyUackhSCoJuLCQtg+p
	qmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CLBOFDkW9kjy28Dx4ZBlRFbylnqFcWojmZtrzea+tuE=;
	b=X0y6P/wUJn18UO/fkUI8azgZM4HC9d3gnwdk95Q00updUT0whvjRE8sZdUv1q/JwKA
	4Jph7/t5sQB1lNm2769MBb9I6X7Pg07qv/bSWzhEsO6wD/+SthHJGUYp0CHxyxHzzx1d
	8pmDFkUvQ8jKmUU55xtfW3tIPkKvzCKorWliW/439z6PDQ712XrXnh9yXCSLFGMEqqEv
	rK4lVnyXARToX6sOd1g+EW3uv9k5oK69yFWSOVJdAYwhbGhnBx6r7hCifyo7fnjddZKD
	4lfu8PwuwlIZ8C7XDDgLIliMD497wNUznUT9LmsvJYH56lfE55nICaeOHF3pSZezv2Tn
	5emQ==
X-Gm-Message-State: AKwxytdMD7aq5kjCDag4f091KwV4nq34OIZEh2gzgypcYRj1K3C8J4wE
	QdWIzxhLkLJp9q2GaSVzRGSkz1OLlV/ZOcHvucI=
X-Google-Smtp-Source: ACJfBovc07t/Ow0YDTGiBxXOlWfRDZWIXHa52PtjUFgrm6CoPMk8l5koLeTTKy+1b3CWFyVGqLFjM1SyJuofCXiqn3Y=
X-Received: by 10.223.187.13 with SMTP id r13mr1721928wrg.62.1515786317104;
	Fri, 12 Jan 2018 11:45:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.190.132 with HTTP; Fri, 12 Jan 2018 11:45:16 -0800 (PST)
In-Reply-To: <1515781319-18616-1-git-send-email-ptsneves@gmail.com>
References: <1515781319-18616-1-git-send-email-ptsneves@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 12 Jan 2018 11:45:16 -0800
Message-ID: <CAJ86T=Ud97ZLk1CWduSdbM4HwgVR36pDQkRmh618vk=L4tNNiw@mail.gmail.com>
To: Paulo Neves <ptsneves@gmail.com>
Cc: Paulo Neves <paulo.de_sousa_neves@nokia.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] base.bbclass: Fix COMPATIBLE_MACHINE for -native recipe variants.
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
X-List-Received-Date: Fri, 12 Jan 2018 19:45:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 12, 2018 at 10:21 AM, Paulo Neves <ptsneves@gmail.com> wrote:
> From: Paulo Neves <paulo.de_sousa_neves@nokia.com>
>
> Hello I am having a problem where I want a recipe, along
> with its -native version to only be available when allowed
> by compatible machine.
>
> In the non native case, COMPATIBLE_MACHINE is correctly
> honored. But in the -native version the COMPATIBLE_MACHINE
> is not honored because in the native.bbclass there is:
>
> MACHINEOVERRIDES = ""
>
> This change was introduced in
> d09e6d883042e5d094cd08d829327c4bbbfae135.
> While the explanation provided by the commit is accurate for
> specific case mentioned it also breaks the
> COMPATIBLE_MACHINE mechanism which relies on the
> MACHINEOVERRIDES variable.
>
> Further evidence that this was not intended is that the
> exception text is false:
>
> ERROR: Nothing PROVIDES 'x-filter-native'
> x-filter-native was skipped: incompatible with machine m1
> (not in COMPATIBLE_MACHINE)
>
> And the x-filter-native'.bb recipe header contains:
>
> COMPATIBLE_MACHINE = "^m1$"
>
> So the exception uses ${MACHINE} to report that a
> ${MACHINEOVERRIDE} was not matched with the
> COMPATIBLE_MACHINE, which is a false statement.
>
> This fix attempts to correct the issue with minimal
> changes.
>
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  meta/classes/base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index d95afb7..d1c31c2 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -488,7 +488,7 @@ python () {
>      need_machine = d.getVar('COMPATIBLE_MACHINE')
>      if need_machine:
>          import re
> -        compat_machines = (d.getVar('MACHINEOVERRIDES') or "").split(":")
> +        compat_machines = (d.getVar('MACHINEOVERRIDES') or d.getVar('MACHINE')).split(":")

This test used to be against MACHINE but was changed to
MACHINEOVERRIDES under the assumption that MACHINEOVERRIDES always
contains MACHINE.

  http://git.openembedded.org/openembedded-core/commit/?id=8ceef74dd4f662b4c7e3c170ce486e966ebebeff

Reverting back to the way things were done prior to that commit (ie
explicitly testing both MACHINE and SOC_FAMILY and not relying on
MACHINEOVERRIDES to contain them both) may be the more complete
solution (ie fixes the issue if COMPATIBLE_MACHINE is defined in terms
of SOC_FAMILY).

Forcing COMPATIBLE_MACHINE to "" in native.bbclass might be even better.

>          for m in compat_machines:
>              if re.match(need_machine, m):
>                  break
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

