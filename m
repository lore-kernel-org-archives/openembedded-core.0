Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 796E3731D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 13:07:24 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id 100so5748947ioh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AZ8dfiU1zC/XaGHbxZ9QDP4YFDj1BVgn995dzESO6oo=;
	b=Sz6zlJAaei2O7Wl3A05JcM21RcnffpLaRRc9Vf9hcfkExMOjeltK8kvFuN/Det+G1Z
	fPGeM8vkfqfCJ6Sx4bfoTCk4f8c7laUh6PbF1FaxwOfFL0ZYUUoJYtpk9HbY7yZgNe/R
	hD8luiRWhvetgZjQuDsutpy/APJwlFew1j5pe6Jw7wKCBp7D/jC18hCkCqVEz40LFJOf
	4TcEirODycSa26gJS5oCGqI2WtRyQTJpR1YKL/I3dsMAkXHt0Q6tShCpgKLK1XkE0w8G
	I5dK4E6zq4nfFPp4mxjc0lfI7YLaBrdLFXVWGyGGlcsfoirWU+XystNzHPzLlnzVAEq2
	CD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AZ8dfiU1zC/XaGHbxZ9QDP4YFDj1BVgn995dzESO6oo=;
	b=eFlZrxvkAE8zURXSB1Mn0WmhUvjqBoiqbAde7CSBr7rPAROXL9zFosAuMoasptrNB3
	Ls4bYXWCjYQpx8C0c5Wrk+lR2/W6WvXwieq18cW4HMWTsMtWh95yvh2xdjPkT5sVK/1Q
	/gsgqyyyDAnJd8JCsHImGfKCOvntPP9EItdzqR4d9Iyon+X70I+VOLTZVWHvpP+lpGw2
	68Y1uGKuvzbCJTbjkCU0dnLdi83K6etzd4MKnHK88AVH4cUJ8OazXCkxuH2HU6jj10fF
	mioMAqvu12YlVCqPF04YCm5u/n6HI1TIvskIQD8e94u75LOlTcj4KRvR4VouCLfR9fx2
	BShA==
X-Gm-Message-State: ALyK8tLgKNY5WwMhOv0asy/81Y3Zifb1DLCPUcAvoPejyjUKrtDpbFsRerjgqIJ3MgqnlW4Gm4xYvaHUx4obIA==
X-Received: by 10.107.3.84 with SMTP id 81mr7512953iod.156.1466082445645; Thu,
	16 Jun 2016 06:07:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.120.11 with HTTP; Thu, 16 Jun 2016 06:07:25 -0700 (PDT)
In-Reply-To: <d4e799a4e5f83291df990e6871f111dafc043062.1465513580.git.pkj@axis.com>
References: <cover.1465513580.git.pkj@axis.com>
	<d4e799a4e5f83291df990e6871f111dafc043062.1465513580.git.pkj@axis.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Thu, 16 Jun 2016 08:07:25 -0500
Message-ID: <CAFSKS=PkWum0KySHE7GR6LJCuOWgJicExZRTg3Yv5SyS9GKLFA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] useradd-staticids.bbclass: Make sure opened files are closed
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
X-List-Received-Date: Thu, 16 Jun 2016 13:07:25 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2016 at 6:07 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> This avoids warnings about unclosed files with Python 3.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/useradd-staticids.bbclass | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
> index a9b506d..440c0e3 100644
> --- a/meta/classes/useradd-staticids.bbclass
> +++ b/meta/classes/useradd-staticids.bbclass
> @@ -4,6 +4,7 @@ def update_useradd_static_config(d):
>      import argparse
>      import itertools
>      import re
> +    import errno
>
>      class myArgumentParser( argparse.ArgumentParser ):
>          def _print_message(self, message, file=None):
> @@ -30,19 +31,22 @@ def update_useradd_static_config(d):
>          are set)."""
>          id_table = dict()
>          for conf in file_list.split():
> -            if os.path.exists(conf):
> -                f = open(conf, "r")
> -                for line in f:
> -                    if line.startswith('#'):
> -                        continue
> -                    # Make sure there always are at least exp_fields elements in
> -                    # the field list. This allows for leaving out trailing
> -                    # colons in the files.
> -                    fields = list_extend(line.rstrip().split(":"), exp_fields)
> -                    if fields[0] not in id_table:
> -                        id_table[fields[0]] = fields
> -                    else:
> -                        id_table[fields[0]] = list(itertools.imap(lambda x, y: x or y, fields, id_table[fields[0]]))
> +            try:
> +                with open(conf, "r") as f:
> +                    for line in f:
> +                        if line.startswith('#'):
> +                            continue
> +                        # Make sure there always are at least exp_fields
> +                        # elements in the field list. This allows for leaving
> +                        # out trailing colons in the files.
> +                        fields = list_extend(line.rstrip().split(":"), exp_fields)
> +                        if fields[0] not in id_table:
> +                            id_table[fields[0]] = fields
> +                        else:
> +                            id_table[fields[0]] = list(itertools.imap(lambda x, y: x or y, fields, id_table[fields[0]]))
This is still broken for me. As far as I can tell itertools.imap
doesn't exist in Python 3.

> +            except IOError as e:
> +                if e.errno == errno.ENOENT:
> +                    pass
>
>          return id_table
>
> --
> 2.8.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

