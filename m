Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1AECFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 07:25:04 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11052.1764401102738903778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 23:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+lKEGhl;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso13175255e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 23:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764401101; x=1765005901; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yPVJPUjXwboO/Ztf4ukdvF+pIWs3E+FIaHAm6FH8wK4=;
        b=C+lKEGhl3sKgvmecAdhY11JxewHgsjtwYYj0sO07zTPB8wpMjtUHTfYmbKLFz3qKbA
         5+aJZcSrufv1cCcwGRPobYnHixk7B23HQbBH31THJ91xB81z3W7r7USTc7DK4OVKF9xj
         /PJ858pB4RqT9M5I//8pxrZ6H8HxMroWN3nzRmWUQ3ICVlIgwLERJJ5UAtGb1nDpCNhl
         LEclhgAkDOx0epSHKG2OFSN55hbhzyfdhhZyffAXM/ILV0RB5WkZJqMb+LvZ/fONwZum
         XxCg+U7ilB/nsxf/fNXAMUtUOX2t+HYgSOlqGCuy8NJ8OAdEO6IO+keYMduA1FV+2VzL
         Azbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764401101; x=1765005901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPVJPUjXwboO/Ztf4ukdvF+pIWs3E+FIaHAm6FH8wK4=;
        b=gc/y+tUZQh07RY6SxNG9hB25vnVjycQN37vwPOayiAtRNRbVeryrrJXXCu0uJU7OEy
         GQvu/YU+4LbVtjT+9umgODbRj8IDBTq/tlEQ579njZyXLF5MXUBcHrMG024tIbCEZdxz
         q+6SM+rRKUwxff4ZDiNbf3MnIkMCduxpDKIDeFeYLivy97igQgBGibylwOcq8Ur17zpN
         3DNE1xjJ99dC5I00QyDPIrOv3ialNK0cu9aKDuEAu77bToUQ90IxQV1gxRhbS4rm+Dkf
         mAOkMsNhVyj4tRfrLgVdqZ4VKkU8WMo3gLojbGcuLKOp/RdVrqjtvJYWs6L2x89MclwV
         YHbw==
X-Forwarded-Encrypted: i=1; AJvYcCV/XlgXsccEB7xBzqp1THxCWCxb6UIbMHvkhF5CNExw+p+9a0k0wi6hkJ5tqXWK3EUkZtisx+DnFPbue2XLQUFf3A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwdwfCTL0cIMFOIuKpv+lrN0yQpAmr5qgNFVfiOe5eijBxooTDo
	SnSxWrsfLADlNl6IaoK3jE5v7CeZr47pVGQPhspSm7NPxCtA5O+bfzco
X-Gm-Gg: ASbGncshexAi/seUVqcVPWSvIo09C3PyWGaK68p/42hEXHa3Rq84SfRvqzR89wucAlP
	jKehUKJyvNbiv/jR5OWZlDU91h9b38XJqqzJ4dwXp+SIe9Rj/n307kB+N4K2gczn2kWq0FSxcwq
	y0ofAcIwkqrC19wv9Q/E02gJtdEsLfq9fNutyAPi2heyinPYoclBYRsXmwnXOlzC/tAPPOqoaEY
	UG1EPfdxiB7Vb0nGZ9pA0dRuSR0NBQkI2qOt72AEN3QOZA9tLzzORxaFQ6Tt+sJSZodiBTFuHvg
	uWZ+5cU3R2s4ObMAkWZYsczDN72aKzwdBG19P7nnN6XqmUTJl52Y7VBZuRKDmn+lSp5ypAqj9X7
	SFlv01fm0gDW88qlx83Lm6f+KnnRLlSg2buCqgxDQzFxtht+lkBz/aBLTLZFMmnhOv+W8QUmpoG
	xh5QGB+Dk2MnkU66YaOk4=
X-Google-Smtp-Source: AGHT+IE2fvt74l8yeQeEAhURdAIKiK1Em2A6jrsyQbI8eBsdassvOiwBrc1qyCMyIBrSSrHPzEyfFw==
X-Received: by 2002:a05:600c:1f94:b0:471:1765:839c with SMTP id 5b1f17b1804b1-477c1117949mr246538645e9.20.1764401100812;
        Fri, 28 Nov 2025 23:25:00 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca9aea3sm13351754f8f.35.2025.11.28.23.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 23:25:00 -0800 (PST)
Message-ID: <247791bb-e71b-402a-b14c-0f51a0bc709f@gmail.com>
Date: Sat, 29 Nov 2025 08:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] lib/configfragments: match fragment prefixes
 rather than full fragment names when disabling fragments
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20251128182713.4148461-1-alex.kanavin@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251128182713.4148461-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 07:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226930

On 11/28/25 19:27, Alexander Kanavin via lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> This allows disabling classes of fragments without knowing their full names, e.g.
> instead of
>
> $ bitbake-config-build disable-fragment machine/qemuarm
>
> one can issue
>
> $ bitbake-config-build disable-fragment machine
>
> to match and disable everything that starts with 'machine'.
>
> Add an --exact option to preserve exact maching (e.g. when
> theres some/feature and some/feature-with-foobar both enabled
> and only the first needs to be disabled).

Why not add a --wildcard option instead, and keep the default behavior
backwards compatible?

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/bbconfigbuild/configfragments.py | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
> index de521f0c149..f5b4dfe1ec2 100644
> --- a/meta/lib/bbconfigbuild/configfragments.py
> +++ b/meta/lib/bbconfigbuild/configfragments.py
> @@ -161,16 +161,19 @@ class ConfigFragmentsPlugin(LayerPlugin):
>          def disable_helper(varname, origvalue, op, newlines):
>              enabled_fragments = origvalue.split()
>              for f in args.fragmentname:
> -                if f in enabled_fragments:
> -                    enabled_fragments.remove(f)
> -                else:
> -                    print("Fragment {} not currently enabled in {}".format(f, args.confpath))
> +                for e in enabled_fragments[:]:
> +                    if (not args.exact and e.startswith(f)) or f==e:
> +                        print("Removing fragment {} from {}".format(e, args.confpath))
> +                        enabled_fragments.remove(e)
>              return " ".join(enabled_fragments), None, 0, True
>  
>          self.create_conf(args.confpath)
>          modified = bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGMENTS"], disable_helper)
> -        if modified:
> -            print("Fragment {} removed from {}.".format(", ".join(args.fragmentname), args.confpath))
> +        if not modified:
> +            if args.exact:
> +                print("Fragment names {} matched nothing in {}.".format(", ".join(args.fragmentname), args.confpath))
> +            else:
> +                print("Fragment prefixes {} matched nothing in {}.".format(", ".join(args.fragmentname), args.confpath))
>  
>      def do_show_fragment(self, args):
>          """ Show the content of a fragment """
> @@ -210,7 +213,8 @@ class ConfigFragmentsPlugin(LayerPlugin):
>  
>          parser_disable_fragment = self.add_command(sp, 'disable-fragment', self.do_disable_fragment, parserecipes=False)
>          parser_disable_fragment.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
> -        parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment', nargs='+')
> +        parser_disable_fragment.add_argument('--exact', action='store_true', help='Match fragment names exactly')
> +        parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment, or a name prefix to match', nargs='+')
>  
>          parser_show_fragment = self.add_command(sp, 'show-fragment', self.do_show_fragment, parserecipes=False)
>          parser_show_fragment.add_argument('fragmentname', help='The name of the fragment')
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226921): https://lists.openembedded.org/g/openembedded-core/message/226921
> Mute This Topic: https://lists.openembedded.org/mt/116517046/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


