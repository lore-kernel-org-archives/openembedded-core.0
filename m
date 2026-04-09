Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F0FF31E5B
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:08:18 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.132280.1775740889989900615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 06:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MIkhfn5/;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7986e0553bdso9225477b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775740889; cv=none;
        d=google.com; s=arc-20240605;
        b=Lmd/5IMGhHKuT9PJvpqjt9u0IRFoEcEM42BMAFPdvmKmEAqSOryyv8jqLhEBUWQCX6
         e23k/2uZuxYiF0Lr6wg9KCDD4uLRUFjy5k8ikA+TutHm5coSCcVMrSnd+ExyiKkQH5FM
         kKdRzG0q1UmgMh/HRdEUt5OQUL4tyIS2pBKtE/cUTMkayByKbICvDlPb7DgRnDx9Mwi5
         ian2sutO37ReoMeKaWIQoX5ybqGGIa9nsTLLZpxbzu/N0Zc83F1pYoK/LSlURpDsj8Ww
         AKcBmXhbOr0w44MxyqWegiP1sTfdtkT4ggAOqpFGAOrrM4OePuMfCabWXeUqRYSiyAzv
         xf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=crziMs4zQPEzUjG3TAuo+8F53mpU7Flsm5v8shcll4k=;
        fh=aau17nZiWBWLAuV28bdQl11CALmaYKIz0azuQOwC3G0=;
        b=XHaM2n1tM9Z6aPtjMwhLh3jsxEE7OONvTzuYft5SReZZSrRO6XxM+pXMLnvF6pk2+l
         vuXhKp5zZc7B2P0v0YHNbB2RFWrrxiRj0R2ZiaJTOFl/NUQPX2ukdpiNcD9yPdp0WF6R
         zcc63epNZNddclJFVH8C7AKRDbwn0WscWfVwQFv81JhmpcfdHJ55DzoSDKv67rETMJWb
         nQ3wcBCcvjx5UgM43G5jFGUZCvl0Zll/hCJ4UMWOt+/3IX96tmuiG6rtLCulnIRrBP3D
         wGbwwIqsOkuHJyc+NPKDSGgCv/fLykoogJg/Bk5a8/QzIvF8BMkINBwjWwQBXQKyy/Fy
         q2KA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775740889; x=1776345689; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=crziMs4zQPEzUjG3TAuo+8F53mpU7Flsm5v8shcll4k=;
        b=MIkhfn5/QXZZ3ka1YrXuNOuTaP33x2PlIrQOEVCebhm4oMi+diGf3Qyn0dIsCYia0R
         dyLxVHAkG54shV4mKkwhwDd80qiixHGDMfo9JaEJHdo0sPV1Ubs4yAUV9bxeAwr9X0gC
         Tfd1CuUFbePzHR2SJD3fFQmMd/XR5+EubdTNtdu0LaCJUInjK+MmOAJ0Rb309HR2GY3w
         +4VVurAc/LJBW0LNY+YCWe3YA3R9BK4xdhW7ta3Tbi0PGca4V/7Xe8uCsVF0Msncdf5y
         fK0z1ZmBb6ANlYIFq/p539+DQFP8N05LPV9i3w+W0o6Htxlysnd+76QyN/3FOwvGpibD
         hyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775740889; x=1776345689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crziMs4zQPEzUjG3TAuo+8F53mpU7Flsm5v8shcll4k=;
        b=PSKuajXal544eN9mOrXdemCdMBRVArOYV22OGHI4QN/OfonJZwfy9Pz5uq8MCSrrRa
         /i/L97B0leLypKud9KZXUrHlhwy6uijj0/YbrFA1UHqjbmgV5zXVR4+cEQdoVPSYq1Hr
         44nN3dtoalwTsPjFBlkA2R9HTDxYZ0Nke2xdpFXDKqOUV3tigK/BztVDX/FlI7uJlsKX
         M8+nZ20iQotLvkKceQQMVYs/shTFmZmU86c+upAAok+1ofksreykdDmhDmjkLtfwxJXs
         EFD4caGvXX8XS0sN4HDNDf/o2/6cmAiMIV7DCHh1qdqN3R4DhC6oJkv/bKjPidUyyD5K
         6s0g==
X-Forwarded-Encrypted: i=1; AJvYcCXQ5sjmJ8wLr6kbGhHhF3FmYM5UDTHar5EV7XsD0Oiw5iaSuxr0ZKoWxClOSWQ8tXx9N1D0PgdEPAhX5BStLRAnFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzWIFBRE+czbEtqOy/fMvtfkLcNgJ4GhnHCEJSc7fQwaoaMRMtg
	JASYEVcyK4abPRyzGa5jlqE9om6DnxEkvUiH+hTVP3UJIyVviJdU/cvhzrIJLHwiR474OdnCQ20
	gOTHqv3VuH1umxKr9iZh9Y/haoxFvNBQ=
X-Gm-Gg: AeBDies2d8H7DPU6qHovrIEujwb+XlXzskRywd3vDUfvtCxcbNcVgb7MxAOWtMR7o4P
	n+LlhmWjYJVsjGCia5l8FsLqRCsdRrPTGA4F2q6rSbaQSEBCnNlj6i0oK+VUZrRhZEWc8fmvYoN
	n/tPanC4H2HEbLtWeW0I0PFF9bxQHJQln+KM+oyuEn/VmB7O/oXa+2j3avKSf0Oz2TqAfd1fiuc
	YgOihscvZcespyxqkz9URsmCZqBHrVgABPLbwV3uwLZUveHALCuIaQI3sZO53t3vT3E6/gzVqJ3
	A2idmBJ1hw5vjtNQkdp+QgShCflzQmdpp99RWmwYvoBDQhtbuAo=
X-Received: by 2002:a05:690e:1902:b0:650:1ad2:7990 with SMTP id
 956f58d0204a3-65048693f3dmr25064732d50.10.1775740888829; Thu, 09 Apr 2026
 06:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <e615740d-eff9-4125-a6e6-e6b58ee29225@doubleopen.io>
 <f4bf51a0b26fcff35191bcedf8e51c09e27b856d.camel@linuxfoundation.org> <171ed7c8-e488-4113-a64f-a55395dccd9d@doubleopen.io>
In-Reply-To: <171ed7c8-e488-4113-a64f-a55395dccd9d@doubleopen.io>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 9 Apr 2026 07:21:16 -0600
X-Gm-Features: AQROBzBUdAOPIEZj-PbkZUIGYDtgg3aQ_BM2ra0gj3QKKAoH69wkyqhS9w3EuDE
Message-ID: <CAJdd5GZRsW79e-t6YjMyb6HUsE-Dszu=dW8b7H+KvVG+bvU3Kg@mail.gmail.com>
Subject: Re: [OE-core] [RFC] Adding PURL identifiers to SPDX 3.0.1 install
 package elements
To: Martin von Willebrand <martin.vonwillebrand@doubleopen.io>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, Stefano Tondo <stondo@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e451c4064f06e477"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234916

--000000000000e451c4064f06e477
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026, 2:56=E2=80=AFAM Martin von Willebrand <
martin.vonwillebrand@doubleopen.io> wrote:

> On 4/9/2026 12:23 AM, Richard Purdie wrote:
> > On Wed, 2026-04-08 at 16:19 +0300, Martin von Willebrand via
> lists.openembedded.org wrote:
> >> While working with ORT (OSS Review Toolkit) to analyse Yocto-generated
> >> SPDX 3.0.1 documents for ongoing vulnerability management and
> >> monitoring, I noticed that install package elements
> >> (`software_primaryPurpose: install`) carry only a wildcard CPE
> >> identifier, e.g.:
> >>
> >> cpe:2.3:*:*:busybox:1.36.1:*:*:*:*:*:*:*
> >>
> >> ORT recently released an SPDX analyzer (since ORT 83.0) targeting Yoct=
o
> >> 5.0 generated SPDX 3.0.1 documents, which makes this gap more visible:
> >> the analyzer can consume the package graph, but the identifiers
> >> available are not sufficient to drive post-release CVE monitoring
> >> against external vulnerability databases such as NVD or VulnerableCode=
,
> >> since wildcard CPEs cannot be used directly as query keys.
> >>
> >> If I understand correctly, sbom-cve-check faces the same underlying
> >> limitation. In our understanding it would benefit from this change too=
,
> >> though the two approaches are complementary rather than overlapping.
> >>
> >> The upstream download URL for tarball-based packages is available at
> >> build time and is already derived from SRC_URI via `fetch_data_to_uri(=
)`
> >> in `spdx30_tasks.py`. A PURL constructed from that URL and placed
> >> directly as an `externalIdentifier` on the install package element wou=
ld
> >> give downstream consumers a durable, canonical identifier for
> >> post-release vulnerability monitoring.
> >>
> >> Before drafting a patch I wanted to ask:
> >>
> >> 1. Is there a specific reason PURL is not currently emitted on install
> >> package elements =E2=80=94 policy, technical constraint, or simply not=
 yet done?
> >> 2. Would a contribution adding PURL for example as an
> >> `externalIdentifier` on install packages (derived from SRC_URI fetch
> >> data) be welcome in OE-Core master?
> >>
> >> Happy to hear comments, and discuss scope and approach before writing
> code.
> > I'm not sure this is as simple as it first appears. We support the
> > notion of "premirrors" and "mirrors", which are searched before and
> > after the primary SRC_URI. We validate a checksum of the resulting
> > download to verify we did get what we expected but it doesn't always
> > come from that SRC_URI but can be cached. I guess we assume you use the
> > unmodified original SRC_URI?
> >
> > What happens if there are two items in SRC_URI? If we patch the tarball
> > with other entries in SRC_URI, is the PURL still valid?
> >
> > What happens in the cases where the recipe uses git to fetch the
> > sources instead of a tarball?
> >
> > Can the external tooling not look at the url data already in the SPDX
> > output and work out the purls itself if it wants to?
> >
> > I guess what I'm saying is we're trying to avoid too much "processing"
> > of the data we put into the SPDX so I'm cautious about duplicating
> > info. If the purl is always derived from the SRC_URI and we include
> > that, should we be adding the extra data?
> >
> > I'm not trying to be negative, I'm just worried about where this might
> > lead and the corner cases that may be involved.
> >
> > Coping Joshua who I suspect also may have thoughts on this.
> >
> > Cheers,
> >
> > Richard
> >
> Thanks for the detailed response and raising up the edge cases =E2=80=94 =
I'll try
> to address them below:


Can you try again with spdx output from the latest master branch of yocto?
Stefano (CC'd) just recently did a lot of work in this area



> On mirrors and premirrors: yes, we would use the canonical upstream
> SRC_URI,
> not the actual fetch location. The upstream URI would be correct for CVE
> matching purposes, the point is not to record build-time fetch provenance=
.
>
> On multiple SRC_URI entries and patches: a PURL would identify the upstre=
am
> package, not the downstream patched artefact =E2=80=94 consistent with ho=
w the CPE
> is
> already handled. CVEs are filed against upstream versions, and that is wh=
at
> both identifiers reference.
>
> On git sources: you're right, a git fetch produces a revision-pinned URI
> that
> does not map cleanly to a standard PURL. Scoping an initial contribution =
to
> non-git fetchers would sidestep this for now and cover the majority of
> cases.
>
> On whether consumers can derive the PURL themselves: for the generic case
> (pkg:generic/busybox@1.36.1), yes =E2=80=94 name and version are already =
on the
> install package element and any consumer can construct that trivially, as
> long as they undestand Yocto's package structure.
>
> The real value of doing this in OE is the ecosystem-typed cases: pkg:pypi=
,
> pkg:npm, pkg:cpan, and similar. The bbclass inheritance information that
> determines ecosystem type =E2=80=94 inherit pypi, inherit npm, inherit cp=
an =E2=80=94
> exists
> exclusively in the recipes and is not recoverable by downstream consumers
> from
> the SPDX output, with or without SPDX_INCLUDE_SOURCES. It looks like that
> information is available to OE at build time and nowhere else in the chai=
n.
>
> That said, we would propose emitting PURLs on all install package element=
s
> =E2=80=94
> ecosystem-typed where the recipe provides that information, pkg:generic
> otherwise. Partial coverage would produce an inconsistent SPDX where some
> packages have PURLs and others do not, which is worse than either extreme=
.
> And even the generic case, while derivable, removes the need for consumer=
s
> to understand Yocto's package structure at all.
>
> The broader argument for doing this in OE: PURL is now an ECMA standard
> (ECMA-426) and is on the path to becoming an ISO standard. It is the
> identifier
> that the supply chain tooling ecosystem =E2=80=94 ORT, Dependency-Track, =
CycloneDX,
> and others =E2=80=94 is converging on for package matching. OE already
> takes the position that canonical package identifiers belong in the SPDX
> output,
> by emitting CPE on install package elements. PURL is the natural
> complement to
> that.
>
> It is of course the community's call whether this belongs in OE or
> downstream. If
> this doesn't belong in OE, we could instead document the (limited)
> derivation
> algorithm so consumers can implement it consistently. But to me it looks
> that OE
> is the right place, and that the ecosystem-typed cases, removal of need t=
o
> understand Yocto's package structure, as well as explicit purl support
> make it
> worth doing in OE rather than leaving it to downstream.
>
> Thanks, Martin
>
>

--000000000000e451c4064f06e477
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 9, 2026, 2:56=E2=80=
=AFAM Martin von Willebrand &lt;<a href=3D"mailto:martin.vonwillebrand@doub=
leopen.io">martin.vonwillebrand@doubleopen.io</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On 4/9/2026 12:23 AM, Richard Purdie wrote:<br>
&gt; On Wed, 2026-04-08 at 16:19 +0300, Martin von Willebrand via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt; While working with ORT (OSS Review Toolkit) to analyse Yocto-gener=
ated<br>
&gt;&gt; SPDX 3.0.1 documents for ongoing vulnerability management and<br>
&gt;&gt; monitoring, I noticed that install package elements<br>
&gt;&gt; (`software_primaryPurpose: install`) carry only a wildcard CPE<br>
&gt;&gt; identifier, e.g.:<br>
&gt;&gt;<br>
&gt;&gt; cpe:2.3:*:*:busybox:1.36.1:*:*:*:*:*:*:*<br>
&gt;&gt;<br>
&gt;&gt; ORT recently released an SPDX analyzer (since ORT 83.0) targeting =
Yocto<br>
&gt;&gt; 5.0 generated SPDX 3.0.1 documents, which makes this gap more visi=
ble:<br>
&gt;&gt; the analyzer can consume the package graph, but the identifiers<br=
>
&gt;&gt; available are not sufficient to drive post-release CVE monitoring<=
br>
&gt;&gt; against external vulnerability databases such as NVD or Vulnerable=
Code,<br>
&gt;&gt; since wildcard CPEs cannot be used directly as query keys.<br>
&gt;&gt;<br>
&gt;&gt; If I understand correctly, sbom-cve-check faces the same underlyin=
g<br>
&gt;&gt; limitation. In our understanding it would benefit from this change=
 too,<br>
&gt;&gt; though the two approaches are complementary rather than overlappin=
g.<br>
&gt;&gt;<br>
&gt;&gt; The upstream download URL for tarball-based packages is available =
at<br>
&gt;&gt; build time and is already derived from SRC_URI via `fetch_data_to_=
uri()`<br>
&gt;&gt; in `spdx30_tasks.py`. A PURL constructed from that URL and placed<=
br>
&gt;&gt; directly as an `externalIdentifier` on the install package element=
 would<br>
&gt;&gt; give downstream consumers a durable, canonical identifier for<br>
&gt;&gt; post-release vulnerability monitoring.<br>
&gt;&gt;<br>
&gt;&gt; Before drafting a patch I wanted to ask:<br>
&gt;&gt;<br>
&gt;&gt; 1. Is there a specific reason PURL is not currently emitted on ins=
tall<br>
&gt;&gt; package elements =E2=80=94 policy, technical constraint, or simply=
 not yet done?<br>
&gt;&gt; 2. Would a contribution adding PURL for example as an<br>
&gt;&gt; `externalIdentifier` on install packages (derived from SRC_URI fet=
ch<br>
&gt;&gt; data) be welcome in OE-Core master?<br>
&gt;&gt;<br>
&gt;&gt; Happy to hear comments, and discuss scope and approach before writ=
ing code.<br>
&gt; I&#39;m not sure this is as simple as it first appears. We support the=
<br>
&gt; notion of &quot;premirrors&quot; and &quot;mirrors&quot;, which are se=
arched before and<br>
&gt; after the primary SRC_URI. We validate a checksum of the resulting<br>
&gt; download to verify we did get what we expected but it doesn&#39;t alwa=
ys<br>
&gt; come from that SRC_URI but can be cached. I guess we assume you use th=
e<br>
&gt; unmodified original SRC_URI?<br>
&gt;<br>
&gt; What happens if there are two items in SRC_URI? If we patch the tarbal=
l<br>
&gt; with other entries in SRC_URI, is the PURL still valid?<br>
&gt;<br>
&gt; What happens in the cases where the recipe uses git to fetch the<br>
&gt; sources instead of a tarball?<br>
&gt;<br>
&gt; Can the external tooling not look at the url data already in the SPDX<=
br>
&gt; output and work out the purls itself if it wants to?<br>
&gt;<br>
&gt; I guess what I&#39;m saying is we&#39;re trying to avoid too much &quo=
t;processing&quot;<br>
&gt; of the data we put into the SPDX so I&#39;m cautious about duplicating=
<br>
&gt; info. If the purl is always derived from the SRC_URI and we include<br=
>
&gt; that, should we be adding the extra data?<br>
&gt;<br>
&gt; I&#39;m not trying to be negative, I&#39;m just worried about where th=
is might<br>
&gt; lead and the corner cases that may be involved.<br>
&gt;<br>
&gt; Coping Joshua who I suspect also may have thoughts on this.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
Thanks for the detailed response and raising up the edge cases =E2=80=94 I&=
#39;ll try<br>
to address them below:</blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Can you try again with spdx output from the latest master=
 branch of yocto? Stefano (CC&#39;d) just recently did a lot of work in thi=
s area=C2=A0</div><div dir=3D"auto"></div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_qu=
ote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<br>
On mirrors and premirrors: yes, we would use the canonical upstream SRC_URI=
,<br>
not the actual fetch location. The upstream URI would be correct for CVE<br=
>
matching purposes, the point is not to record build-time fetch provenance.<=
br>
<br>
On multiple SRC_URI entries and patches: a PURL would identify the upstream=
<br>
package, not the downstream patched artefact =E2=80=94 consistent with how =
the CPE is<br>
already handled. CVEs are filed against upstream versions, and that is what=
<br>
both identifiers reference.<br>
<br>
On git sources: you&#39;re right, a git fetch produces a revision-pinned UR=
I that<br>
does not map cleanly to a standard PURL. Scoping an initial contribution to=
<br>
non-git fetchers would sidestep this for now and cover the majority of case=
s.<br>
<br>
On whether consumers can derive the PURL themselves: for the generic case<b=
r>
(pkg:generic/busybox@1.36.1), yes =E2=80=94 name and version are already on=
 the<br>
install package element and any consumer can construct that trivially, as<b=
r>
long as they undestand Yocto&#39;s package structure.<br>
<br>
The real value of doing this in OE is the ecosystem-typed cases: pkg:pypi,<=
br>
pkg:npm, pkg:cpan, and similar. The bbclass inheritance information that<br=
>
determines ecosystem type =E2=80=94 inherit pypi, inherit npm, inherit cpan=
 =E2=80=94 exists<br>
exclusively in the recipes and is not recoverable by downstream consumers f=
rom<br>
the SPDX output, with or without SPDX_INCLUDE_SOURCES. It looks like that<b=
r>
information is available to OE at build time and nowhere else in the chain.=
<br>
<br>
That said, we would propose emitting PURLs on all install package elements =
=E2=80=94<br>
ecosystem-typed where the recipe provides that information, pkg:generic<br>
otherwise. Partial coverage would produce an inconsistent SPDX where some<b=
r>
packages have PURLs and others do not, which is worse than either extreme.<=
br>
And even the generic case, while derivable, removes the need for consumers<=
br>
to understand Yocto&#39;s package structure at all.<br>
<br>
The broader argument for doing this in OE: PURL is now an ECMA standard<br>
(ECMA-426) and is on the path to becoming an ISO standard. It is the identi=
fier<br>
that the supply chain tooling ecosystem =E2=80=94 ORT, Dependency-Track, Cy=
cloneDX,<br>
and others =E2=80=94 is converging on for package matching. OE already<br>
takes the position that canonical package identifiers belong in the SPDX ou=
tput,<br>
by emitting CPE on install package elements. PURL is the natural complement=
 to<br>
that.<br>
<br>
It is of course the community&#39;s call whether this belongs in OE or down=
stream. If<br>
this doesn&#39;t belong in OE, we could instead document the (limited) deri=
vation<br>
algorithm so consumers can implement it consistently. But to me it looks th=
at OE<br>
is the right place, and that the ecosystem-typed cases, removal of need to<=
br>
understand Yocto&#39;s package structure, as well as explicit purl support =
make it<br>
worth doing in OE rather than leaving it to downstream.<br>
<br>
Thanks, Martin<br>
<br>
</blockquote></div></div></div>

--000000000000e451c4064f06e477--

