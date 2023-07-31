Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AEAC001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 14:24:07 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.8931.1690813440058961474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 07:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gugHa2d3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fe2048c910so9898295e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690813438; x=1691418238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MklxzJpsxwv96OynCNChE+ZAFX/SdgutiRbkQiirU1I=;
        b=gugHa2d3ZxZ4lBiR0TDSyG843CiaxJBhrRyb33L42nnfiWj4uKBWbjWjEZ1N4Jyhsh
         cyYeG0wHERAzaVdCrbYMrK3YJbn5H3N2o+5uZxskJS2qrH7pmkVFipLtVfLkvo6lGePh
         0wfSaMREcngJEzkVzEXIEp9dPMBeP7Q3jQUv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690813438; x=1691418238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MklxzJpsxwv96OynCNChE+ZAFX/SdgutiRbkQiirU1I=;
        b=TajQSLI/ManSLobigrnA4fCEjwtssrrPpE+NbToeYlW2WyAqzeRisvcFl1xNFZzg3z
         k81xjEAFm5ZJRGqpQpiPxbk6q/r5y7C7v3LpSqnlbwAkgpkYp2NPxePCwrEC1erpNspn
         AoFFJd6hwcTqi8wp2YXNpZrZnhJxM55h4JY4j5HDPl8RVz3NSvsoEMbYzOmpPJnNJsYh
         FBf2JRb0YHwwOhLmh4gDG4IQvUGHx4dojdGguqKzz/FfSF1BaC1YmhTa+p0rC18yoV9P
         jVxG4qFbW35QbI7W6kZipZo2hU/tug0x4e+ct3cre8sH8d4CSk3rzxZuSpm7EnB6dA5V
         TBHg==
X-Gm-Message-State: ABy/qLZPISm/wlm+MkbaO3f+CKqMnQX7KsN6obrTgp3eFuubap6zZ9x+
	YESHDKMF5s3YEKt1WzioNEHaNg==
X-Google-Smtp-Source: APBJJlEBY4pMNG333kKHi+llTHQZQ24srX3cMB5fkeZaj6dXI3+86KBKR8VMlwSDsiRi8xm1S2HJ5g==
X-Received: by 2002:a7b:cd8e:0:b0:3fe:2624:484e with SMTP id y14-20020a7bcd8e000000b003fe2624484emr79063wmj.38.1690813438354;
        Mon, 31 Jul 2023 07:23:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f93:b696:bedd:c076? ([2001:8b0:aba:5f3c:6f93:b696:bedd:c076])
        by smtp.gmail.com with ESMTPSA id e40-20020a5d5968000000b0031431fb40fasm13184841wri.89.2023.07.31.07.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 07:23:57 -0700 (PDT)
Message-ID: <00b2ccaee29163f2cbaafacad2ee85f3b88255ed.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-build: add a tool for
 discovering config templates and setting up builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 31 Jul 2023 15:23:57 +0100
In-Reply-To: <CANNYZj9yxqxMB4NfEpvJnb3KxBXpVTVJZ_dppMjmd5XQRapzUQ@mail.gmail.com>
References: <20230510095726.4090311-1-alex@linutronix.de>
	 <20230510095726.4090311-2-alex@linutronix.de>
	 <ea898c7901735eee11dd07ee5ad3ab976cd44b95.camel@rpsys.net>
	 <CANNYZj95L_pLLeL_-bUrMLSAVaG0NgSWBSNnpF9KjK5wpXYA-A@mail.gmail.com>
	 <2039c55f7149d1a362e324751626fc2f032cdec2.camel@linuxfoundation.org>
	 <CANNYZj9oqW=8zrEsQ5nNPsQo816q3L6gLR=wc82rO1PB18D=Ww@mail.gmail.com>
	 <58e78aac200248a3be371f6ee54c67a66b51013c.camel@linuxfoundation.org>
	 <CANNYZj9yxqxMB4NfEpvJnb3KxBXpVTVJZ_dppMjmd5XQRapzUQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 14:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185144

On Mon, 2023-07-31 at 16:14 +0200, Alexander Kanavin wrote:
> On Mon, 31 Jul 2023 at 14:42, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > > Yes, getting the layer name means parsing but we can likely handle =
that
> > > > at this point as we're in python.
> > >=20
> > > You mean getting BBFILE_COLLECTIONS value out of conf/layer.conf? Tha=
t
> > > should be fairly easy with standard python, yes.
> >=20
> > I think we should be able to use bits of bitbake to help too?
>=20
> But how? To use bitbake a build must be set up first. The script sets
> up the build. When the script executes, bitbake won't yet run.

To use bitbake itself, yes. To use tinfoil, or library code from
lib/bb, it doesn't necessarily need that. You don't want bitbake itself
anyway.

> > The conf-notes.txt has a specific purpose and I don't like the idea of
> > trying to make it to two things badly. We therefore need to put this
> > information into which is likely a new location, probably a new conf
> > file within each template directory?
>=20
> So perhaps:
> conf-description.txt - a short (one line ideally) description of what
> the configuration is for, shown by oe-setup-build to help the users
> choose one configuration from several.
> conf-notes.txt - a kind of freeform 'readme' for the configuration
> explaining how to use it, and which are the key bitbake targets etc,
> shown after the selection is made, when a build is set up from a
> selected template.

I'm still thinking we should try and get away from these text files...

Cheers,

Richard

