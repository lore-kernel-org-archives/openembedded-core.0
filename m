Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF6FC001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 12:42:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.6573.1690807365267682345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 05:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AhSZU/LE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3178dd81ac4so3040494f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690807364; x=1691412164;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eB22UepS6rK+I25S7Ah23pSiF+kqc6fNE8m5wyUXLDs=;
        b=AhSZU/LEZvJSnbcVg58X4S8yRz64BkGfEdjB6o2NHUGLUqyy2WbY8iuUf3ddDoHwpf
         DlCddSjgrTHrkdw31bAMAV07j3k+IiNfln8x5zay2jhnSUw5Lz+nwv0sLw69HNtFigRr
         aohreis8ZWAZaQS6B+FQkOVQPWgltSb6Dxrc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690807364; x=1691412164;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eB22UepS6rK+I25S7Ah23pSiF+kqc6fNE8m5wyUXLDs=;
        b=bw9Of3ngnfyq5BchkK7Rf/4yb8YAhQyFhVit/tCqZlc+ZTzoJVLQlZgeB6Gijg5iM+
         8X09SHUWn0UYYXytDvdTcaKD8bpEQF6oz/WXTj8NOeo/Rn0XyLOXZ5BMhjl3OYnhzmv6
         +95zAkSn2efV5LNABJJ7WZB2XNpkkKOeH27sEpeQO485O8taT0h0ZvBkeigwy7sdbS5t
         sIGIkSYj27nZ5ztTswttcVwsU6RLKCvL2IMkonKqz7lUu0N+8ca1j5l8hjC8QudGp7dE
         LlGIe0/biyn+pD1baZkucKkJwbfqRf0fiEtfHiPUvM9NETeEPHk+1pquVtYk6DlhspF1
         rQKg==
X-Gm-Message-State: ABy/qLbK6ymmXujPkIKMfWoN6GZPoMYS3AhNQR0wXI9aJ1s43CrnX8rP
	4V1qjjh4Qs04ELbbWfSRhouByuJKDfyMJwU6E2A=
X-Google-Smtp-Source: APBJJlEVF31750E3zzTUoivaGdLQDeSwMEgmuRHdXEXH5S8gKMrInBVdNX4qhjHG6wf5RZ1Et3ci9Q==
X-Received: by 2002:a5d:668f:0:b0:317:562d:3f21 with SMTP id l15-20020a5d668f000000b00317562d3f21mr9021424wru.10.1690807363699;
        Mon, 31 Jul 2023 05:42:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f93:b696:bedd:c076? ([2001:8b0:aba:5f3c:6f93:b696:bedd:c076])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d560d000000b00313f9a0c521sm12912459wrv.107.2023.07.31.05.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:42:43 -0700 (PDT)
Message-ID: <58e78aac200248a3be371f6ee54c67a66b51013c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-build: add a tool for
 discovering config templates and setting up builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 31 Jul 2023 13:42:42 +0100
In-Reply-To: <CANNYZj9oqW=8zrEsQ5nNPsQo816q3L6gLR=wc82rO1PB18D=Ww@mail.gmail.com>
References: <20230510095726.4090311-1-alex@linutronix.de>
	 <20230510095726.4090311-2-alex@linutronix.de>
	 <ea898c7901735eee11dd07ee5ad3ab976cd44b95.camel@rpsys.net>
	 <CANNYZj95L_pLLeL_-bUrMLSAVaG0NgSWBSNnpF9KjK5wpXYA-A@mail.gmail.com>
	 <2039c55f7149d1a362e324751626fc2f032cdec2.camel@linuxfoundation.org>
	 <CANNYZj9oqW=8zrEsQ5nNPsQo816q3L6gLR=wc82rO1PB18D=Ww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 12:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185142

On Mon, 2023-07-31 at 14:15 +0200, Alexander Kanavin wrote:
> On Mon, 31 Jul 2023 at 14:04, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > You could think about using the layer name in these contexts as layers
> > should be defining them at this point?
> >=20
> > Yes, getting the layer name means parsing but we can likely handle that
> > at this point as we're in python.
>=20
> You mean getting BBFILE_COLLECTIONS value out of conf/layer.conf? That
> should be fairly easy with standard python, yes.

I think we should be able to use bits of bitbake to help too?

> > > Should we be fine with just conf-notes.txt containing the template
> > > description as a freeform plaintext, or is there a use case for more
> > > structured template metadata?
> >=20
> > Could/should it be a variable in layer.conf?
>=20
> I'm not quite following - what kind of variable would that be, and
> with what kind of value? Each template needs its own set of metadata
> (or freeform description in conf-notes.txt as a minimum), so
> layer.conf is probably not the place?

That indeed doesn't make sense and I'm not thinking clearly. I feel
pressured to get you some reply, long overdue but obviously I didn't
spend enough time working through the details, sorry :(.

The conf-notes.txt has a specific purpose and I don't like the idea of
trying to make it to two things badly. We therefore need to put this
information into which is likely a new location, probably a new conf
file within each template directory?

Ultimately perhaps we put conf-notes into the new config file too as a
separate variable? That text file was good as a quick hack a decade ago
but we probably need to rethink how some of this works now. That can
come in due course though. Establishing a location for new information
about each template is probably the right first step.

Cheers,

Richard



