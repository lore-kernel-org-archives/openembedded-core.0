Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20130C27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 10:45:46 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.6417.1718102741458234125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 03:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=duucW59X;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso2892828e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718102739; x=1718707539; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c//eS0oLrSFQLTrsPZfD8XuABqImnESKLVa46cjBN/g=;
        b=duucW59XcvCjdUFCVyLbEYT3NoSg6g5GXG2TpZwb+9DtI21ODtYqvRq2EFggm0T6x0
         lZn1d4/gJ2J/hW2KajD1SKlbTC3GEh5XuRTym+WSM8QiEdpG4qjXmaVgPsR3qeJ6e6ij
         RHQSJ1PecfGyKtE8XLIqwHhwbwlLwM+gfkXoYyowfVWCD/TtljlRXJSM9x2zZ9UybkRL
         DbVzuT2iUeTEmWZQeJmLAm3LmS/tIdVP+8e0nMJReuMtbRgUpYRqxIirprEdBFWdJlTT
         2t9cXztSo7FUlndkeaUYHJtcYCppCOJqoPvSNrFV5OavsIHs2gnKyaga83enNlj3osyi
         GH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718102739; x=1718707539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c//eS0oLrSFQLTrsPZfD8XuABqImnESKLVa46cjBN/g=;
        b=faoU+5HdsSlAX/EcFvHLhZwBJWNNAyUyvDz75F40yDnXh0KxE3RnRxMP64PGoShyD2
         A2t1Dw2vhnyxTbS0/ys797jGJi+YRKD7mb+eRs0lXKd+tHvotZUa3gxP7Qu1GuIq9ry+
         OmZfTi4XVR3f3m9pLwBjllIyuDTTBDs23ZEQ7f5fs8WXI94tC2enEGxUySQF8TO2zKaa
         kiCXU+3lN6bPdEUjvms3ikSuu5njDcXCq3org28voZ2yNU0NoH0UKZ2Curink5fFOxzW
         0iz/fTp9/i0rDkO93BnJMe7/mwH3cTpKllpnNwLdphJCzsWi02L6CmmQxPng1fD84JfW
         m2xQ==
X-Gm-Message-State: AOJu0Ywml3itpxzYFDNt/mp29shq0SQJpSTwv6JrP6GP3j4zIK4GWlUF
	XyUTqnh3wGZp00353kyWgz4kDrC74GWPeDJIixQ9r7iV5SQyT9D5uZ2PbkljvVqVmMJpYujrICf
	p4BvvESM+l3hOumsMTXvGoXT47Nzoinex
X-Google-Smtp-Source: AGHT+IFrrr+3HHhAK9JaGWxmYDncGmVVjeM5SCbSCuvqpI8wx/ehervtbiNFX/VhkBzYwmaGcYSdXJ/PSavkvyIXzjo=
X-Received: by 2002:a05:6512:28a:b0:52c:7a2d:5d5d with SMTP id
 2adb3069b0e04-52c7a2d5f56mr5321405e87.3.1718102739194; Tue, 11 Jun 2024
 03:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240509160843.3283186-1-alex.kanavin@gmail.com>
 <39d85fcd4e6a1b4bd439fdd7654b64ff69d4e646.camel@linuxfoundation.org>
 <CANNYZj9Y=TjdofvxL32rWqPVZ9xLyryA9ic=FFeq+XveJcx7mg@mail.gmail.com> <43d73fb614b0d43974169a0f01f8837e08afcf5d.camel@linuxfoundation.org>
In-Reply-To: <43d73fb614b0d43974169a0f01f8837e08afcf5d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jun 2024 12:45:39 +0200
Message-ID: <CANNYZj-Qfaw6OPSoxLqv2HKa3ZTNozcfNnTfqyDqwtz0Epgh5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake-config-build: add a plugin for config fragments
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 10:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200503

On Mon, 10 Jun 2024 at 16:51, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > I don't quite follow. If BB_CONF_FRAGMENTS value is a space separated
> > list of fragments, then how would the tooling
> >
> > - add to it?
> > - remove from it?
>
> bb.utils.edit_metadata()/bb.utils.edit_metadata_file() ?

Right, I had no idea this exists :)

> I'm wondering about whether having a variable makes it easier to users
> to understand/edit.

I think there's benefit in having a variable that makes it separate
and distinct from regular 'require' statements, but I can't form a
clear preference for either option. Should this be taken to some kind
of decision forum, e.g. oe-architecture or TSC?

> I meant to also mention that I'm a bit concerned about using local.conf
> specifically in the tool, I'd prefer not to require a specific conf
> file.

I agree that local.conf should be left alone. It's something coming
from templates and I would rather never touch it with tools after the
fact.

But either the 'require' statements or the variable containing the
fragment list has to be written into something that bitbake can see.
Should they go to build/conf/fragments.conf ?

> > Another option is to copy/symlink the fragments into
> > build/conf/fragments/ and have bitbake pick them up with a glob.
>
> I don't like the copy idea, the symlink approach is interesting. The
> main downside there is capturing the give config and ordering.

'give config'?

> That seems reasonable but I wanted to avoid every layer needing to nest
> by a directory level to make it clear where the fragments come from. I
> think some kind of naming standard might ultimately make things clearer
> to the user?
>
> Requiring the first entry be a layer name doesn't preclude the rest...

Okay, I'll rework to include the layer name upfront.

> I ask the questions since we have been trapped by choices in the past
> and it since these are likely things which will arise, we might want to
> at least consider them now.

Hopefully the current code makes no choices for these things. It just
adds/removes requested fragments, nothing else. But it can be extended
to read fragment metadata, and armed with that (and the list of
fragments already enabled) make decisions about what the new list
should be, or whether the request should be declined.

> We do have our parser which can easily handle:
>
> CONFFRAG[summary] = "some summary"
> CONFFRAG[description] = "Longer description with \
>     multiple \
>     lines \
> "

I must be missing something here. If this is defined in two different
fragments and both are included, how would one not step on the other
with these assignments?

> or
>
> CONFFRAGS += "myfragment_name"
>
> myfragment_name[summary] = "some summary"
> myfragment_name[description] = "Longer description with \
>     multiple \
>     lines \
> "

Okay, this one in my opinion is a big readability (and write-ability)
regression compared to #-comments. For extended metadata (such as
dependencies/conflicts) something like this would be needed, but I'd
rather not use it for summary/description.

Alex

