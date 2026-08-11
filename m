Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B54C5B572
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 15:04:40 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56517.1786460675115536774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 08:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZkWvhe/i;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6685001353fso3278292d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 08:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786460674; cv=none;
        d=google.com; s=arc-20260327;
        b=VJdEHiw9yQuZz+WhVP/N+/qqjhqixbO+CTyC0JLJjJemrvPDIqTFE4mQC7R3O+hvaB
         uTXiOmLrn5JVj3vyDSXmj3RM0Qdn+ECMGlT6Kqb0KgZ5AasFE56rh0GBWVMKHG1qjTcm
         zNel2e1keFJW/4U8dn5XcVmnDeXJm1NUGgBC1vo82KaEWKLDa+T4Voz1BTwetjgGLlye
         +J7WHXSfUbwoZMw2Cx7SPMGTExOjJ4RGPDy6qRjVMAYBCbKfRwOB2t3SfId38dNpRDWU
         EBY5Qj4Fl6OCWGxaNjtCFYKuSQYwPtOYM5+y15fY22DpDzsTRloZSTLj8d5OKf2xYzrO
         BoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vb/soWOSB4diji7SS1uU73EzIITj8SeNKHJ49jYFtyk=;
        fh=kyrcx/wGdP1K8AcZ1t5dlAg43e9Kck6gc8gLfroTQbI=;
        b=IAXuUuvs/x74ginUybZWAgbRbYbSdSQv2nNWCbQYzyLAdSZP3cjKw53s5FHgxlplqK
         /dpSplJTKHZmm1raEbM71KjO2eOYPyMLSlOwNb5wvIN0dLsICJ6MGQIOEwqCXGp5ACdC
         jsS5qOi+z1K0PUasMmfTT534jcC8w7X1BQdonz341jx7pKdX2hfOEg4onzSlSqkl5BbR
         6L3mlX9SuXyEqcT+mnF8y9Ws/l8b31QX6yyjXuJVA7Xwt59K3g3hz5A+c2F4zOU6wLOu
         GF+yjJPE2ui1Em4MRaAXwAsDDoX44AdyL/DIdRTvUK7gkknLfKrxWrP1GUk3r9RtP9/1
         G+Jg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786460674; x=1787065474; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vb/soWOSB4diji7SS1uU73EzIITj8SeNKHJ49jYFtyk=;
        b=ZkWvhe/i6jgeicdL9m3yOPjtgDRM8lwkXQV7oh2OBlAlSBr754Jo0sxREsEUDoR+gm
         kz/2984ZO6MW/Ha39ajo1vTJoD+hSjIHN1K5DCXszp4C1Q7xTxkmB6KbJlgwJJT1EyhU
         1WM9oEKLwll3rnzoAJX5ta2YlhsK72pWe7N/rBDLdImPjpGldUelGeJiZPTqzlm3qxIO
         x7xc6lgnRf3+ql6Um+pXxRKbsSAUunWQY8fvl1uhbOBdYDtWYgdw/izWjfFoM3xR7DZr
         ABNwTY604Jzp68YjBfKEY+hRnMfCuOfAy3RI6h3PvFL/fK+J1nYoqE1/o945zpm2ZawC
         35cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786460674; x=1787065474;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vb/soWOSB4diji7SS1uU73EzIITj8SeNKHJ49jYFtyk=;
        b=DkPbBY696UIjCA++JuXUSzTEJw4JSZ09I586omFof5PfHiGacZfb6RYV3B3atUR12Q
         WHqtzezKo338vCBBN4f9oFcAJl1su5BU9Ha/k2BCHEwC2zG53f2eG3ddZWeRxv5EIssS
         ZNX3TlT18XQbX/dauk7nYgw10m9JHEm/7InVaFyix1ic8gqnI714UjfZkhDG7YdDCE7T
         Q31qMOxPN/6hqx19UsavWoXAkuiWUHPZXbDMulah3HD41nuLJVH5WIOY+TTlUqvRHI7Q
         DP7l+QQYKJ7rfekMR8Kdo4IDO/up8Cap1H0tJB1bMc8svVGgj3AWkgIPOAe90hAkZRU8
         h2OA==
X-Gm-Message-State: AOJu0Ywe57H+ituILPbPZwDlfii5fEmlWW7Cir2X0izDjC+3CDZwUEuh
	9xJWhSInk9JeClOebaPGL8cYOUKJgT6r4XjnaudpcBkxjVAiPt2N06vBJCwPe2UXMAACX1JxcBg
	L9e4eQyYent0CPfMzWfF9IlxXqUNiRvYNRFfL
X-Gm-Gg: AR+sD12GbApzaNuNv/gt57bf4ZWxa9qS9xQ4NOVn1D9sAxv4oe2yALOaN3nHzYOWJGN
	IkM6uHl20cjckSZCDUIr79UonoIbsfb72Nd0ogd6z4AfVxywJuNnWVz7RH3Mkqqw2Q0ifBvWyCk
	UFNkLovl8kXV9Ift2OKDBQwHZ5H5rnKaGzvHq91IusGyt8VetMuFjyL6rfzk0RWoyhbkPTXiBLN
	ntYoYGCRRUj/vyK/DUpPQ90F+vCztONGu8NMBGuJ6muVDEqs6AmbyHiTJW4N1lVZvxZAvU7Em3f
	yhimSo6UuO/fQPAQ98aYUVJyCFyCj+xe+pEYdpHr/ewqNfK8FDpBOZHbGgd6d/wr94/Axw==
X-Received: by 2002:a53:d04e:0:10b0:667:c3c0:f2b7 with SMTP id
 956f58d0204a3-66b22dc1b64mr2356761d50.19.1786460673738; Tue, 11 Aug 2026
 08:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260810161132.614235-1-JPEWhacker@gmail.com> <AS8PR10MB5073A8A1830344344A974B7EFDDD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB5073A8A1830344344A974B7EFDDD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 11 Aug 2026 09:04:21 -0600
X-Gm-Features: AUfX_mx39QaiW_X7em-J9Ho1yZf1IIWXCyR8AszDmIoBmn1-EDlbsN7wt79kN5o
Message-ID: <CAJdd5GapVFB23bv2aZtDVGHXnJ3LwnE+rnLGNdgfY++ZzATKow@mail.gmail.com>
Subject: Re: [OE-core][PATCH] AGENTS.md: Add file
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dd0bd80658c6c9b2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 15:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243212

--000000000000dd0bd80658c6c9b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 2:22=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

>
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Joshua Watt via
> > lists.openembedded.org
> > Sent: Monday, August 10, 2026 6:12 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Joshua Watt <JPEWhacker@gmail.com>
> > Subject: [OE-core][PATCH] AGENTS.md: Add file
> >
> > Adds an AGENTS.md file to direct agents about better commit practices.
> > This is specifically *not* attempting to improve or direct agents about
> > the code that they generate. It has been noted that when AI is used to
> > write code and commit code, the commit messages that it generates can b=
e
> > long and draw out (e.g. a "wall of text") which affects maintainer
> > ability to review the patches. Therefore, this AGENTS.md text file is
> > only focused on instructing the agents to produce commits that are more
> > suitable for our review process.
> >
> > This file is intended to help agents comply with the existing project
> > document (and specifically, the AI Policy[1]), and does not constitute =
a
> > new policy. Any subsequent changes to this file should derive and compl=
y
> > with the project documentation and policies.
> >
> > It what can only be described as the most bizarre interaction with a
> > computer I've ever experienced, the best way to get an AGENTS.md file
> > that AI agents actually respect as intended is to instruct one to write
> > it for you (as opposed to writing one by hand). Future edits to this
> > file will likely be most effective if written by an Agent.
> >
> > [1]: https://docs.yoctoproject.org/contributor-guide/submit-
> > changes.html#acceptance-of-ai-generated-code
> > AI-Generated: Uses Claude Sonnet 5
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  AGENTS.md | 55
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >  create mode 100644 AGENTS.md
> >
> > diff --git a/AGENTS.md b/AGENTS.md
> > new file mode 100644
> > index 0000000000..ce4d6d9e6e
> > --- /dev/null
> > +++ b/AGENTS.md
> > @@ -0,0 +1,55 @@
> > +# AGENTS.md =E2=80=94 OpenEmbedded-Core & BitBake
> > +
> > +Guidance for AI agents working in the `openembedded-core` repository.
> > +
> > +## Making changes
> > +
> > +- No web PR workflow. The project use **patches on mailing lists**
> > +  (openembedded-core@lists.openembedded.org) tracked via patchwork.
> Don't
> > +  assume GitHub PR conventions apply.
> > +- One Git commit per logical change (e.g., one commit per recipe
> > added/upgraded).
> > +- Commit message format:
> > +  - Summary line prefixed with the recipe name or short file path,
> > +    e.g. `openssl: upgrade to 3.2.1` or `classes/rootfs-postcommands:
> fix typo`.
>
> Current standard for upgrade commit message is "openssl: upgrade 3.2.0 ->
> 3.2.1"


I would probably recommend leaving it and seeing how it goes? This file is
almost certainly better written reactively to things we actually see
happening than trying to guess what an agent _might_ do. It's really hard
to tell how the Agent will behave with regard to some of these things, and
I tried pretty hard to not try and enumerate all the ways it _could_ go
wrong (e.g. Do we need to specify that commit messages should not contain
emoji? I just don't know). Instead, we plan to keep an eye on it and if we
see agents doing other things that are undesirable, then we will add more
rules to this file as appropriate.

FWIW, most of this section was generated by Claude by reading our
documentation, although I did specifically prompt it to add in text about
making more succinct commit messages


>
> > +    Check `git log --oneline <path>` for the prefix convention already
> in use.
> > +  - Body explains what/why/how, and how it was tested.
> > +  - Prefer explaining *why* a change was made over restating what's
> > +    already visible in the diff, unless the diff is long/hard to follo=
w
> > +    or the reason for the change isn't known =E2=80=94 in those cases,=
 summarize
> > +    what changed instead.
> > +  - Be succinct: use as few sentences and lines as possible while stil=
l
> > +    covering what/why/how. Cut restatements, filler, and any detail a
> > +    reviewer wouldn't need (e.g. exact test-run counts, step-by-step
> > +    narration). One short paragraph is usually enough; only add a seco=
nd
> > +    if a distinct point (e.g. testing) needs it.
> > +  - The most relevant information about the change should be presented
> first.
> > +  - Reference bugs as `Fixes [YOCTO #1234]` when applicable.
> > +  - Use `Reported-by`, `Suggested-by`, `Tested-by`, `Reviewed-by`, `Cc=
`
> tags
> > +    where relevant.
>
> Where should the agent get yocto bugzilla ID or the personal tags from?
> This may lead to hallucinations.
> Maybe we can suggest to ask/remind user about those?


If we really think an agent will trip on this, we should just remove the
line for now until we have actual examples of it doing something wrong
(which, I understand, is a little tricky, because we also expect the human
submitting the patch to look at and fix any problems :)

In the future if we did change anything, I'd probably rather err on the
side of asking the user or never adding a tag than trying to look up a bug
in bugzilla. The agents are pretty good at incorporating context, so a
prompt like, "Fix Yocto bug 12345 by doing XYZ" would likely do the right
thing.


> > +
> > +### AI-generated code
> > +
> > +- **Mandatory**: any AI-generated code/commit must add an
> `AI-Generated:`
> > +  tag line in the commit message, placed *before* `Signed-off-by` (if
> present),
> > +  naming the tool used, e.g.:
> > +
> > +  ```
> > +  component: Add the ability to ...
> > +
> > +  AI-Generated: Uses GitHub Copilot
> > +  ```
> > +
> > +- Also add a code comment or other in-patch indication that the code i=
s
> > +  AI-generated (recommended, not just the commit tag).
> > +- **Mandatory** Do not automatically add a `Signed-off-by`. This tag
> must
> > +  always be written by the human contributor, never by the AI tool =E2=
=80=94 the
> > +  DCO/Developer's Statement of Origin still applies in full.
> > +- Contributor is responsible for confirming the AI tool's terms don't
> > +  conflict with the project's open source license/IP policy, and that
> > +  any third-party copyrighted material in the AI output is properly
> > +  licensed before contributing it. See the Linux Foundation generative
> AI
> > +  guidance: https://www.linuxfoundation.org/legal/generative-ai.
> > +- `Co-authored-by` should be omitted in favor of the `AI-generated` ta=
g.
>
> Do you have references about AI-generated git tags?
> I think that the AssistedBy is the current state-of-the-art way of
> annotating this...
>
> > +
> > +When in doubt about a convention, grep `git log --oneline <path>` in t=
he
> > +target repo for precedent before inventing a new style.
> > --
> > 2.54.0
>
>

--000000000000dd0bd80658c6c9b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 11,=
 2026 at 2:22=E2=80=AFAM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@sie=
mens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Joshua Watt via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Monday, August 10, 2026 6:12 PM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"=
_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core][PATCH] AGENTS.md: Add file<br>
&gt; <br>
&gt; Adds an AGENTS.md file to direct agents about better commit practices.=
<br>
&gt; This is specifically *not* attempting to improve or direct agents abou=
t<br>
&gt; the code that they generate. It has been noted that when AI is used to=
<br>
&gt; write code and commit code, the commit messages that it generates can =
be<br>
&gt; long and draw out (e.g. a &quot;wall of text&quot;) which affects main=
tainer<br>
&gt; ability to review the patches. Therefore, this AGENTS.md text file is<=
br>
&gt; only focused on instructing the agents to produce commits that are mor=
e<br>
&gt; suitable for our review process.<br>
&gt; <br>
&gt; This file is intended to help agents comply with the existing project<=
br>
&gt; document (and specifically, the AI Policy[1]), and does not constitute=
 a<br>
&gt; new policy. Any subsequent changes to this file should derive and comp=
ly<br>
&gt; with the project documentation and policies.<br>
&gt; <br>
&gt; It what can only be described as the most bizarre interaction with a<b=
r>
&gt; computer I&#39;ve ever experienced, the best way to get an AGENTS.md f=
ile<br>
&gt; that AI agents actually respect as intended is to instruct one to writ=
e<br>
&gt; it for you (as opposed to writing one by hand). Future edits to this<b=
r>
&gt; file will likely be most effective if written by an Agent.<br>
&gt; <br>
&gt; [1]: <a href=3D"https://docs.yoctoproject.org/contributor-guide/submit=
-" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/contr=
ibutor-guide/submit-</a><br>
&gt; changes.html#acceptance-of-ai-generated-code<br>
&gt; AI-Generated: Uses Claude Sonnet 5<br>
&gt; <br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 AGENTS.md | 55<br>
&gt; +++++++++++++++++++++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 55 insertions(+)<br>
&gt;=C2=A0 create mode 100644 AGENTS.md<br>
&gt; <br>
&gt; diff --git a/AGENTS.md b/AGENTS.md<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ce4d6d9e6e<br>
&gt; --- /dev/null<br>
&gt; +++ b/AGENTS.md<br>
&gt; @@ -0,0 +1,55 @@<br>
&gt; +# AGENTS.md =E2=80=94 OpenEmbedded-Core &amp; BitBake<br>
&gt; +<br>
&gt; +Guidance for AI agents working in the `openembedded-core` repository.=
<br>
&gt; +<br>
&gt; +## Making changes<br>
&gt; +<br>
&gt; +- No web PR workflow. The project use **patches on mailing lists**<br=
>
&gt; +=C2=A0 (<a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a>) tracked via =
patchwork. Don&#39;t<br>
&gt; +=C2=A0 assume GitHub PR conventions apply.<br>
&gt; +- One Git commit per logical change (e.g., one commit per recipe<br>
&gt; added/upgraded).<br>
&gt; +- Commit message format:<br>
&gt; +=C2=A0 - Summary line prefixed with the recipe name or short file pat=
h,<br>
&gt; +=C2=A0 =C2=A0 e.g. `openssl: upgrade to 3.2.1` or `classes/rootfs-pos=
tcommands: fix typo`.<br>
<br>
Current standard for upgrade commit message is &quot;openssl: upgrade 3.2.0=
 -&gt; 3.2.1&quot;</blockquote><div><br></div><div>I would probably recomme=
nd leaving it and seeing how it goes? This file is almost certainly=C2=A0be=
tter written reactively to things we actually see happening than trying to =
guess what an agent _might_ do. It&#39;s really hard to tell how the Agent =
will behave with regard to=20
some of these things, and I tried pretty hard to not try and enumerate=20
all the ways it _could_ go wrong (e.g. Do we need to specify that commit
 messages should not contain emoji? I just don&#39;t know). Instead, we pla=
n
 to keep an eye on it and if we see agents doing other things that are=20
undesirable, then we will add more rules to this file as appropriate.</div>=
<div><br></div><div></div><div>FWIW, most of this section was generated by =
Claude by reading our documentation, although I did specifically prompt it =
to add in text about making more succinct=C2=A0commit messages</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 Check `git log --oneline &lt;path&gt;` for the prefix c=
onvention already in use.<br>
&gt; +=C2=A0 - Body explains what/why/how, and how it was tested.<br>
&gt; +=C2=A0 - Prefer explaining *why* a change was made over restating wha=
t&#39;s<br>
&gt; +=C2=A0 =C2=A0 already visible in the diff, unless the diff is long/ha=
rd to follow<br>
&gt; +=C2=A0 =C2=A0 or the reason for the change isn&#39;t known =E2=80=94 =
in those cases, summarize<br>
&gt; +=C2=A0 =C2=A0 what changed instead.<br>
&gt; +=C2=A0 - Be succinct: use as few sentences and lines as possible whil=
e still<br>
&gt; +=C2=A0 =C2=A0 covering what/why/how. Cut restatements, filler, and an=
y detail a<br>
&gt; +=C2=A0 =C2=A0 reviewer wouldn&#39;t need (e.g. exact test-run counts,=
 step-by-step<br>
&gt; +=C2=A0 =C2=A0 narration). One short paragraph is usually enough; only=
 add a second<br>
&gt; +=C2=A0 =C2=A0 if a distinct point (e.g. testing) needs it.<br>
&gt; +=C2=A0 - The most relevant information about the change should be pre=
sented first.<br>
&gt; +=C2=A0 - Reference bugs as `Fixes [YOCTO #1234]` when applicable.<br>
&gt; +=C2=A0 - Use `Reported-by`, `Suggested-by`, `Tested-by`, `Reviewed-by=
`, `Cc` tags<br>
&gt; +=C2=A0 =C2=A0 where relevant.<br>
<br>
Where should the agent get yocto bugzilla ID or the personal tags from?<br>
This may lead to hallucinations.<br>
Maybe we can suggest to ask/remind user about those?</blockquote><div><br><=
/div><div>If we really think an agent will trip on this, we should just rem=
ove the line for now until we have actual examples of it doing something wr=
ong (which, I understand, is a little tricky, because we also expect the hu=
man submitting the patch to look at and fix any problems :)</div><div><br><=
/div><div>In the future if we did change anything, I&#39;d probably rather =
err on the side of asking the user or never adding a tag than trying to loo=
k up a bug in bugzilla. The agents are pretty good at incorporating=C2=A0co=
ntext, so a prompt like, &quot;Fix Yocto bug 12345 by doing XYZ&quot; would=
 likely do the right thing.</div><div></div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +### AI-generated code<br>
&gt; +<br>
&gt; +- **Mandatory**: any AI-generated code/commit must add an `AI-Generat=
ed:`<br>
&gt; +=C2=A0 tag line in the commit message, placed *before* `Signed-off-by=
` (if present),<br>
&gt; +=C2=A0 naming the tool used, e.g.:<br>
&gt; +<br>
&gt; +=C2=A0 ```<br>
&gt; +=C2=A0 component: Add the ability to ...<br>
&gt; +<br>
&gt; +=C2=A0 AI-Generated: Uses GitHub Copilot<br>
&gt; +=C2=A0 ```<br>
&gt; +<br>
&gt; +- Also add a code comment or other in-patch indication that the code =
is<br>
&gt; +=C2=A0 AI-generated (recommended, not just the commit tag).<br>
&gt; +- **Mandatory** Do not automatically add a `Signed-off-by`. This tag =
must<br>
&gt; +=C2=A0 always be written by the human contributor, never by the AI to=
ol =E2=80=94 the<br>
&gt; +=C2=A0 DCO/Developer&#39;s Statement of Origin still applies in full.=
<br>
&gt; +- Contributor is responsible for confirming the AI tool&#39;s terms d=
on&#39;t<br>
&gt; +=C2=A0 conflict with the project&#39;s open source license/IP policy,=
 and that<br>
&gt; +=C2=A0 any third-party copyrighted material in the AI output is prope=
rly<br>
&gt; +=C2=A0 licensed before contributing it. See the Linux Foundation gene=
rative AI<br>
&gt; +=C2=A0 guidance: <a href=3D"https://www.linuxfoundation.org/legal/gen=
erative-ai" rel=3D"noreferrer" target=3D"_blank">https://www.linuxfoundatio=
n.org/legal/generative-ai</a>.<br>
&gt; +- `Co-authored-by` should be omitted in favor of the `AI-generated` t=
ag.<br>
<br>
Do you have references about AI-generated git tags?<br>
I think that the AssistedBy is the current state-of-the-art way of annotati=
ng this...<br>
<br>
&gt; +<br>
&gt; +When in doubt about a convention, grep `git log --oneline &lt;path&gt=
;` in the<br>
&gt; +target repo for precedent before inventing a new style.<br>
&gt; --<br>
&gt; 2.54.0<br>
<br>
</blockquote></div></div>

--000000000000dd0bd80658c6c9b2--

