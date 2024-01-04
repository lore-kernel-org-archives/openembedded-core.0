Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628A3C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 18:07:30 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.791.1704391642533800844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 10:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ITXuW8hJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50eaabc36bcso911989e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 10:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704391641; x=1704996441; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NjqCi+2OgNx0l4CL3GKGJNiYE1jlziINqYQhzHmHlZU=;
        b=ITXuW8hJWikLh65UDZebX825ujDF2acWUwKW3G01Ben8HVV06YLvmHJCT9EpfWtJpe
         r8K0rnzP99Ku8FUDNucD7S7WIl2pNmVjxaGm1g/37klj1GXD70OeBSuzT+xMAFooeV6B
         Nx8nujMCKMaGHeVdtddiUY3ki0dUl1OX3DTsCYdvhYjIAkCMI7uNw6Q7O9r+P6xDObek
         x/MR4Oa6TV7wk3QXr12xBRafqOGs64JVzUnWpzGYUCLG4t0FFzhnu939WLcqocmh4yOn
         NCpX2CSiKmOyWBWVqo1LscDTloaw2k5wPekkAjfeSiNKV8/wjvhcNJash5VTCE3i1rqA
         qS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704391641; x=1704996441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjqCi+2OgNx0l4CL3GKGJNiYE1jlziINqYQhzHmHlZU=;
        b=gffEj9QyKa97GkyOQEfH9jIkve/mxG73In9Ojol/vnGKrjpA7TTIJ/MEKYn7dUvkJG
         WBdEK8JPpryU8bMNYAijbDb7Q2IhelFXzOYz5inKlgePdR+IJEaAiy60gUZ1+5plgmea
         EQr6jVjrjeYEN3v4uGdmCH5RYM6ooMMhXHZOaYfMPjNHGd7kWu9HaaTSOxg1qIdZFEm6
         H8JJdAWl6gnEy9q+NU18lS9JDz3BQqzjjSw5jlKbxrBBEXJjK5UobbTgg8+xVtfjsfxd
         Ulv+UGkSjEH1gcThvnOoxpMkZ9OKI0gASrqGTLAzE+Q+2rRm09d/14M2ZvhkOtvHJ7Op
         Qd4g==
X-Gm-Message-State: AOJu0YyUZ+iB6aXhm2QgVbmDQMO8v2l0HSwkhQxhbzuuCYqN1gjHLLIr
	S0ir8NLpax7llqqs0Jh3ESICoIUFKI9QKtdT6/7Rwr46
X-Google-Smtp-Source: AGHT+IHtmemDcWUIJF/IcqnGF/ld1aS4OlGalXH/sOG87VcZlJBm64JH91xdzSnrNxW6I57v/jV3/pVN1GMlTEFRnTU=
X-Received: by 2002:a05:6512:3c84:b0:50e:8983:8743 with SMTP id
 h4-20020a0565123c8400b0050e89838743mr678491lfv.87.1704391640410; Thu, 04 Jan
 2024 10:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20240104123420.932-2-jermain.horsman@nedap.com> <20240104123420.932-3-jermain.horsman@nedap.com>
In-Reply-To: <20240104123420.932-3-jermain.horsman@nedap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jan 2024 19:07:08 +0100
Message-ID: <CANNYZj_JVCPUJdTArszbN-kh62q5JVVNz4kRUp7BR5nXQ6K2ig@mail.gmail.com>
Subject: Re: [OE-core] [RFC v2 1/2] bitbake-layers: Add ability to update the
 reference of repositories
To: jermain.horsman@nedap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 18:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193332

On Thu, 4 Jan 2024 at 13:35, Jermain Horsman <jermain.horsman@nedap.com> wrote:
> +        parser_setup_layers.add_argument('--update', '-u',
> +            action='append',
> +            metavar='REPOSITORY',
> +            help='Repository to update, this requires a reference to be specified.\nThis option can be used multiple times.')
> +        parser_setup_layers.add_argument('--reference', '-r',
> +            help="Reference to use when updating repositories.\nThe value can be any git reference, however it is up to the user to provide a valid value.\nThis option is only useful when using '--update'.")
> +
>          self.plugins = []

These options should move to the plugin. If/when we have another
plugin, we can consider making them global, until then we can't assume
all plugins would want to handle these.

>      def do_write(self, parent, args):
>          """ Writes out a python script and a json config that replicate the directory structure and revisions of the layers in a current build. """
> -        if not os.path.exists(args.destdir):
> -            os.makedirs(args.destdir)
> -        repos = parent.make_repo_config(args.destdir)
> -        json = {"version":"1.0","sources":repos}
> -        if not repos:
> -            raise Exception("Could not determine layer sources")
>          output = args.output_prefix or "setup-layers"
> -        output = os.path.join(os.path.abspath(args.destdir),output)
> +        output = os.path.join(os.path.abspath(args.destdir), output)
> +
> +        if args.update is None:
> +            if not os.path.exists(args.destdir):
> +                os.makedirs(args.destdir)
> +            repos = parent.make_repo_config(args.destdir)
> +            json = {"version":"1.0","sources":repos}
> +            if not repos:
> +                raise Exception("Could not determine layer sources")
> +        else:
> +            json = self._read_repo_config(output + ".json")
> +            if not 'sources' in json.keys():
> +                raise Exception("File {}.json does not contain valid layer sources.".format(output))
> +            self._modify_repo_config(json, args)
> +
>          self._write_json(json, output + ".json")
>          logger.info('Created {}.json'.format(output))
>          if not args.json_only:

--update requires that the json file already exists. But why should
it? It's entirely possible to write a new json, but update the
references from command line arguments just before writing the file
out. No?

I also wonder if we can name these two options in a better way. Maybe
'--use-custom-reference repo', instead of --update?

Alex

