Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44C4C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 11:21:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.37371.1751282479919194763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 04:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LTUz+xhz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453749aef9eso15098465e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751282478; x=1751887278; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kXz+zEvzTxq5QyQCR8Y+Whdt4lmRxF0fBb92amQRLh8=;
        b=LTUz+xhzhHSa5K48sJUAeyvB4R4128+paVHepqrPdQhBBdhRrcLEvcGltHZLvrXJUR
         iT9eS4Fmf6GG+XdTUn2gXJLml3X9QuF1yKqHfPaubVadIi9GfDNnAMxZhFqb3h8Kb0uB
         ab6r9fnXksLvxLUv7zB1VImTI0duGERlvDEis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282478; x=1751887278;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXz+zEvzTxq5QyQCR8Y+Whdt4lmRxF0fBb92amQRLh8=;
        b=gr7I7lUV1TaqjisTk3BtGm1uw+BPfHdudHgGiCT5jP6fCsGQpfO8ydBLj5Js2yAESI
         exOnyeQtGdi0Md4+9OTRzuqDOqQXAsB2S7y5+/baqUMJB+w2gSESZx4GaehWQKBadBOI
         Im0rxz6VxNChBx30HfgGv38fh4gLFyZEvMK2pGIXRey9BGdQ3t+GHdwiQdvlY7ADscFQ
         t3ByvNWJVkcawDCa0HzJJFyN6nHLrwYhqbRGK2Nj96eV5k1S/eiX+iubk8KJx/6c0e9v
         njJOMcqRH5W7Ve0v6Gqm5MIKQxLFfA+FM6v+zfLpRxUg5xKZEwkjCBoNviKhIyPyCUPi
         hCMQ==
X-Gm-Message-State: AOJu0YyVmwpoS137EuXTlVXXfzAXL5Z87Mimn7pel/my4yWzNhJffxzT
	nO6RPX9DXQV4ByCGWwMkebjlpF/8grOhyvuR5I98wyVP9UH7razKNlQR/KaHepXjPPoAV1T3Ymj
	Isl0y
X-Gm-Gg: ASbGnctxjeqHcXOSA7kbtQW6qTLH9BOhp6j/hl6B4ShuGlF7hzKXFYYxf4FAKnKRnqy
	qSbHG19kGcJlJdvPoHOl/+uyROnuIbHyxTs586wO+8xztwY5hJfMM8Bhi9EGqMzIEvROWozx911
	iEVFVUBscTAaJCQOTIoXqNE0LHs+m7E5Jhu9ZSgm69mJfS6oe9O+ex0Hszzxkjoe/C3VmLF6WHz
	4lNSqMGZnsGX1t0CT/5E793mEl4lEwC65fP8ClT/MmDBp5C1fi7v58G+FpyRlIRiur6/VKOH77V
	CiCq79tfaCuvB0mr04JQGAG7PxS/KEQs2/HNbT+dGx3ANLN2be+vkRQYLMgARLQeMC5EFXbOway
	cww2MYnPZUZoATD6iN6uyBJsq4NveBeSpwvyISfpUFd3aytx0e8E=
X-Google-Smtp-Source: AGHT+IHIkwehoQTr7qZeww03ajpSV46uAMf3vyAYMkIYK6SJCql619uas02g8V3KLRXt1qqgk6VAng==
X-Received: by 2002:a05:600c:1f0f:b0:442:d9f2:c6ef with SMTP id 5b1f17b1804b1-4538f2178b2mr140503115e9.2.1751282478301;
        Mon, 30 Jun 2025 04:21:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ea45:3640:e90f:2224? ([2001:8b0:aba:5f3c:ea45:3640:e90f:2224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538f2fec5fsm108368425e9.40.2025.06.30.04.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 04:21:17 -0700 (PDT)
Message-ID: <09bc1fd2ba95df690a70d19633aa37dee15518c4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf/sstate: Introduce
 DEFAULT_SHARED_UMASK to standarise shared area umask
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jun 2025 12:21:16 +0100
In-Reply-To: <87ecv1y547.fsf@prevas.dk>
References: <20250627212423.3315152-1-richard.purdie@linuxfoundation.org>
	 <87ecv1y547.fsf@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 11:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219513

On Mon, 2025-06-30 at 11:02 +0200, Rasmus Villemoes wrote:
> On Fri, Jun 27 2025, "Richard Purdie via lists.openembedded.org" <richard=
.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>=20
> > Currently, the "shared" directory permissions of sstate are hardcoded. =
Since
> > multiple areas of the code reference this, separate it out to a variabl=
e to
> > allow the behaviour to be configurable. Initially this applies to SSTAT=
E_DIR.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/classes-global/sstate.bbclass | 12 +++++++-----
> > =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A02 files changed, 9 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/s=
state.bbclass
> > index 2968cc4c2e7..7578aad24ea 100644
> > --- a/meta/classes-global/sstate.bbclass
> > +++ b/meta/classes-global/sstate.bbclass
> > @@ -745,7 +745,7 @@ def pstaging_fetch(sstatefetch, d):
> > =C2=A0=C2=A0=C2=A0=C2=A0 if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY=
_SIG"), False):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uris +=3D ['file://{0}=
.sig;downloadfilename=3D{0}.sig'.format(sstatefetch)]
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 with bb.utils.umask(0o002):
> > +=C2=A0=C2=A0=C2=A0 with bb.utils.umask(bb.utils.to_filemode(d.getVar("=
DEFAULT_SHARED_UMASK"))):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.mkdirhier(dld=
ir)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for srcuri in uris:
> > @@ -776,9 +776,10 @@ sstate_task_prefunc[dirs] =3D "${WORKDIR}"
> > =C2=A0python sstate_task_postfunc () {
> > =C2=A0=C2=A0=C2=A0=C2=A0 shared_state =3D sstate_state_fromvars(d)
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 omask =3D os.umask(0o002)
> > -=C2=A0=C2=A0=C2=A0 if omask !=3D 0o002:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.note("Using umask 0o002 (not %=
0o) for sstate packaging" % omask)
> > +=C2=A0=C2=A0=C2=A0 shared_umask =3D bb.utils.to_filemode(d.getVar("DEF=
AULT_SHARED_UMASK"))
> > +=C2=A0=C2=A0=C2=A0 omask =3D os.umask(shared_umask)
> > +=C2=A0=C2=A0=C2=A0 if omask !=3D shared_umask:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.note("Using umask %0o (not %0o=
) for sstate packaging" % (shared_umask, omask))
> > =C2=A0=C2=A0=C2=A0=C2=A0 sstate_package(shared_state, d)
> > =C2=A0=C2=A0=C2=A0=C2=A0 os.umask(omask)
> > =C2=A0
> > @@ -843,7 +844,8 @@ python sstate_create_and_sign_package () {
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 # Create the required sstate directory if it i=
s not present.
> > =C2=A0=C2=A0=C2=A0=C2=A0 if not sstate_pkg.parent.is_dir():
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with bb.utils.umask(0o002):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shared_umask =3D bb.utils.t=
o_filemode(d.getVar("DEFAULT_SHARED_UMASK"))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with bb.utils.umask(shared_=
umask):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bb.utils.mkdirhier(str(sstate_pkg.parent))
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 if sign_pkg:
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index a3300fc1727..22473bfe23a 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -944,6 +944,8 @@ TRANSLATED_TARGET_ARCH ??=3D "${@d.getVar('TARGET_A=
RCH').replace("_", "-")}"
> > =C2=A0
> > =C2=A0# Set a default umask to use for tasks for determinism
> > =C2=A0BB_DEFAULT_UMASK ??=3D "022"
> > +# The umask to use for shared files (e.g. DL_DIR and SSTATE_DIR)
> > +DEFAULT_SHARED_UMASK ??=3D "002"
>=20
> This is perhaps bikeshedding, but I think that naming is somewhat
> off. For BB_DEFAULT_UMASK, the "default" refers to this being used if
> the task doesn't have it's own [umask] flag.
>=20
> For the new variable, yes, this setting is a default, but that's really
> the ??=3D part of the line. If someone wants to change the umask used for
> those 'shared' areas, they should just have to change
> "SHARED_UMASK". Otherwise we should also have DEFAULT_PARALLEL_MAKE etc.
>=20
> I think I'd prefer a BB_ prefix, just to keep it a little namespaced,
> but I can see how this might not be a bitbake thing (unlike the variable
> that applies to tasks in general).

Naming is important and I agree, "DEFAULT" in there isn't right. We
can't really use BB_ as that is reserved for things bitbake itself
handles so I've updated a version to use OE_SHARED_UMASK.

> Should the 0775 instances in the test code be updated to be computed
> as 0777 minus [DEFAULT_]SHARED_UMASK or is it assumed that the tests
> are always run with default settings?

I wasn't sure what to do with that, we could change it as you suggest.
I guess we may end up needing to test multiple values.

Cheers,

Richard


