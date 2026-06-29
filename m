Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E1DC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 09:40:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34132.1782726003099689065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 02:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MS7lgTKH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493a613571eso10111335e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1782726001; x=1783330801; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9yszo1vqUGuB8ONl3+fA8ZraywWRKiRc8tNPsLznpy0=;
        b=MS7lgTKHYq1tBIwk6Y2MYzBHXlRT1dqXAn0feAil0p0ihMFa10iQfJhQZRnQJXS/MR
         XxfpAiQgv+YLlb+9A00w8H+uCmtpZjK8k4F8WcE567n9f6BAwwVqDBCGrGiv5FAlAiiJ
         U793zjzTksbWvqW77Hop/NaHxhIvWyxRIOTDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726001; x=1783330801;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9yszo1vqUGuB8ONl3+fA8ZraywWRKiRc8tNPsLznpy0=;
        b=HowdaFINf5NBC7/Qf5f2NmSLIByRQQdB6ksKI+/lRxgke2d72I1bFVeCnPKwLWQTnL
         RGIcko+jfSXtWooUZUvqfq1XcqkANONmv8bpo2LlTvgE9aYnQF4yzAG9zc2zjpazVXYQ
         NotTwVyCqBX8D/NRqsnWOLlU1jQ3E6qFHbSdMg9koOh1CmQVH7BDvt3C1RY9G+ZZH4aE
         nVnRibeyYsOlu5jtsPgGLqtElqMk9mDQzrt7MPbpNtY+mZRLb9iblZ8A/JNIEr8wEZX7
         NkkpjHsnm+A/7By6RhZtE9nQP34W9AhsdkBXYUFJf3dXeBiYJ4QGPIOtuPGzYUP3NQTj
         2Xzg==
X-Forwarded-Encrypted: i=1; AFNElJ/VO61KtvHmQgcEXSXdEtwkwNThgidiBf9TNjCpzzVutOYHHEyPj/c2Y5xDUw9z04nQoCCZAvPL9Zr/iyt2qnYbMA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyYpBlfuFBmfoJtKhvAmP4GmRB+C9N5HYk0QgLXftt2RMKVx7fL
	1uKUIMgpMXK0KMlWeOr2DP2eZVRRW4WQlpRC4P2JSedVOzC52p9GVhyRMRbWS1mruk4=
X-Gm-Gg: AfdE7cmbYbNVElkpQK9OVL4XgerErtIcthho05hS0MTqS35jVkvDsuzfKD2pktnwHm+
	+AQJd3g9ssg1D/glsSNe4w2YkrmcjJvACcW8Yut3ZX+hTyKg6wRFYgSJyqX8P3wooYIa2rixYOV
	hxbd4mxD69rf6m6lGlQ0mp675cN2N3VbwqBhF0P7fipWP5ZSjek26dPfdV5B2wLZPQbSexwdR7P
	llKQvzpYPnQ9H14zJMkZKH3N29rBxeXPy1nMd15PTU+bRNhooYVAFQ9hzcrztVz90Jmm2jjmLgJ
	+QwGTMhC3M5FIjPZB2YgD1k7ldw1SBjaaYu/BDlkUK3XJuvaLu1SDc4d66V+QlC5aS8HJ9ataE7
	L5d3xYKB00lsjsgTNVVg7bz/9zoounXjf8nSza3iUFM/ahX0vNiYAbjlQB7sj/birqb2bgkLbNv
	+ar8eWYS+qeISuUe127weiHM7wdeYEYv50uCWqQTStetB0MmsO7Wig4bcmX/iOqBnmBSbdXsHke
	h/JSNA6mjkZFXzc
X-Received: by 2002:a05:600c:37ca:b0:492:5bc8:5e77 with SMTP id 5b1f17b1804b1-49266894c8cmr231957115e9.29.1782726001026;
        Mon, 29 Jun 2026 02:40:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5a58:86d2:ead6:c8fb? ([2001:8b0:aba:5f3c:5a58:86d2:ead6:c8fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fce5a8sm296381965e9.3.2026.06.29.02.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:40:00 -0700 (PDT)
Message-ID: <9935cbf2c5c2bfc65207cbe157d166453e477fb4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 4/5] llvm-project-source.inc: add vardeps
 to do_preconfigure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, raj.khem@gmail.com
Date: Mon, 29 Jun 2026 10:39:59 +0100
In-Reply-To: <53e5f5cc-f919-4ac1-879d-0d5381bdfc57@bootlin.com>
References: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
	 <20260623120818.110754-5-joaomarcos.costa@bootlin.com>
	 <9ec404ced0ab0f4762d9c4e863ffe67de4baa025.camel@linuxfoundation.org>
	 <53e5f5cc-f919-4ac1-879d-0d5381bdfc57@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 09:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239740

On Mon, 2026-06-29 at 10:09 +0200, Joao Marcos Costa wrote:
> On 6/28/26 12:25, Richard Purdie via lists.openembedded.org wrote:
> > On Tue, 2026-06-23 at 14:08 +0200, Joao Marcos Costa via lists.openembe=
dded.org wrote:
> > > The task's signature should change if CLANG_EXTRA_OE_DISTRO and/or
> > > CLANG_EXTRA_OE_VENDORS, considering the couple of for loops in
> > > do_preconfigure iterate over their values.
> > >=20
> > > By adding them to 'vardeps', bitbake will correctly detect if
> > > do_preconfigure needs to be executed.
> > >=20
> > > Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> > > ---
> > > =C2=A0=C2=A0meta/recipes-devtools/clang/llvm-project-source.inc | 1 +
> > > =C2=A0=C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/me=
ta/recipes-devtools/clang/llvm-project-source.inc
> > > index 85b5ef06dc..84d4bae0ab 100644
> > > --- a/meta/recipes-devtools/clang/llvm-project-source.inc
> > > +++ b/meta/recipes-devtools/clang/llvm-project-source.inc
> > > @@ -90,4 +90,5 @@ python do_preconfigure() {
> > > =C2=A0=20
> > > =C2=A0=C2=A0do_patch[vardepsexclude] +=3D "MULTILIBS MULTILIB_VARIANT=
S"
> > > =C2=A0=C2=A0addtask do_preconfigure after do_patch
> > > +do_preconfigure[vardeps] +=3D "CLANG_EXTRA_OE_DISTRO CLANG_EXTRA_OE_=
VENDORS"
> > > =C2=A0=C2=A0do_create_spdx[depends] +=3D "${PN}:do_preconfigure"
> >=20
> > We require that tasks can run in isolation and that can happen for many
> > different reasons. Your fix does improve things a bit but it doesn't
> > fix the underlying problem.
> >=20
> > Ideally we'd change the search/replace expressions so that they always
> > change/update the required entries. That does sometimes need a bit more
> > thought about how the expressions work and it means you can't use
> > replacement tokens (unless as a comment on the line above?).
> >=20
> > Another less optimal way to improve things is to change do_preconfigure
> > into a postfunc for do_unpack, but it wouldn't be able to change things
> > altered by do_patch. You can't make it a do_patch postfunc as it could
> > still have the current issues with the changes not being updated.
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> I see your point. I'd be more eager to have a reproducible=20
> search/replace strategy than using postfuncs, but this would require=20
> some more time, and I will soon be OOO for a few days.
>=20
> What is the perspective for this series? Does it heavily depend on this=
=20
> last part? I would prefer not to delay this fix any longer, and I could=
=20
> send another series later to add some testing (to avoid regressions in=
=20
> the future), and a more solid search/replace in do_preconfigure.

I've merged the first 3 patches, those makes sense on their own. I'm a
bit more reluctant for the last two as I really would like to fix the
issue correctly...

Cheers,

Richard



