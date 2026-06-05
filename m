Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2560CD6E74
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 06:15:39 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2455.1780640138365287975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 23:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oHklRj/g;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: saisneha196@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bec450b950dso223109166b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 23:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780640137; cv=none;
        d=google.com; s=arc-20240605;
        b=O1oNFRTUNtKs2t0EthPVUVvOU0pezdoQ9BOQgsog5d8hwVsi5MYnJsWrctOLSQGhzK
         8AL2gv0LhwTt2qcjpHb4ujTDWl4JiLbSNV0fw9nTSSl0G2rTO6EbqCZoc597vzIVkp+F
         zoK4JQVNweFI2PFfpXV2dDELr2WOGp5wCCvsArZNPsxQfTauPZJu8r8h0Do8tMULHUEs
         g2y6tihzgK0f38GmIEQRoAtP5sL/EybP7mDYFIBD4f3PPao29AawIxVtk8/Rz1yGc27h
         rvpsdEzPmctNHPg/P8foqtAeKBXrfoXF2SLSmK3yfDAXCDW39qL6sygHm/wnks6/uIQI
         zAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6V/kqgjdS/3Zwq5EcBxwwGwA17LWkzVujxPfyVKBKjI=;
        fh=roiaO2n9EVA5x423aAjAq3ekwHCyqnU6Hi/49yjaywY=;
        b=PMGNYsCgbIw49Eajakqp2GAdFv1R8U8N6TBqjXFzdESr++uQjabHkaMDkZBzVuteXq
         OXIuPSbrHoeVTpZdMwARu+sz54RrQxhCCUV7tL3A8V4rxhgJUyQstTWIqXp0hQBhmkYP
         /B+wWKmACNzjJYt2S50JP0MaTXDTFddElSeJ45r3SOEg3mnJMLXk3d8b4wnkC/+w96Z4
         CQGY88avjV+muWPu7R7OPgIldHaGvb3Nef8PiNb1b/J3O0acAS6jx2I4WgjCLenkR2gy
         t3/aMu6q8zvrHjoACYCvRkw0pmJ1uMzUnxSDOf8SzzVFEF7UlbyfmjB7oAcshcvCpP3j
         sOgg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780640137; x=1781244937; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6V/kqgjdS/3Zwq5EcBxwwGwA17LWkzVujxPfyVKBKjI=;
        b=oHklRj/gXAwPXAFLoYGnIns4RA2i0muMOq1aj5++5HOmQodBxQTniKTbKjl9fDNB0D
         lJKbHukkbpDbewbEp+mUCWu2caBw6xoMfy+7G8iW01938p3tjY2HNNk4TUoWfpxrrCO4
         sFpVUxdKHeBY4FLHtArB5p24c91MmdRJvnrKJr1bImLitkDpDahN2/AGdJWSL4W6I/zV
         7E46ohrUFb8kUP24BOKfGee43V6h/YvYvfcQ8uroCoKdd6IarcQzmrLBg1sDnXsUykvd
         IllowCUpO1ZdiL0+zVuY2AQPFODtDSYQGH7W6QTrwI634Ikwe+mknAKOVAb8aM5qFe/o
         zczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640137; x=1781244937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V/kqgjdS/3Zwq5EcBxwwGwA17LWkzVujxPfyVKBKjI=;
        b=SS1jqlcrWchjZfIZgMH5wJGgxDwzlsAjAGPBOXf9rlgYdtFZQWq6YiY6/248h9EvxZ
         ITIPAGgEFRCTPNpUiwRe0+9uJ6XaJlBdVLoEoNm/0tSG0EFGnl7gaeXO3cGHfsopon3V
         LMD7UmXn+S6d4uuRJJ1yKc2wWhi/KDYLMmCSDvp4AUe2vRxmlAjoZ4JRwTCsWlQaIRiz
         lE+EnHbNUbq9/eQ0NeymH0tFQlNWD3DOm4S2EnqbOXHdfpbLhhDNORMlejs6h2NACNZ4
         kQOc0f43QkaFhacNSgp/ma7In3MVnvpDux9WmL9ErXfv3eLrcwdN+xcO+NIdBDK66QG4
         oXoQ==
X-Gm-Message-State: AOJu0Yw+NAwTbYnyuAnB1lo5eK5CET94exI3xepOUoQYNp2NFLwYzOtg
	w8+72uEThJSYlJiNrY4X0gLrvDXbdDLiwEQbEiJZpBvJtcHnu5cpHi4W5sE8RbK4TLSiXe6gvPR
	P5AjKYYlRu9EatUOTX/CrY5+yN4ZV+aM=
X-Gm-Gg: Acq92OF1XLD4h6x0Swqm7+8HGnCHPq3NC8jMiClFyV8YfZSTzoDXb3l0Q531vsp8jtx
	qpGqUBcg8FvQXuviWq2Hiwyzf+t0nygFl15fSyQBjrD1PJE2ReKUd0Xecf54EP9XzXEnFBh7qxc
	471aTlqQtYXJyPb7qeBB+0seCxc3Lk8ovTjIAJE85W3rIBPHRaVRK4O38eXIGRo230rAsD56M0u
	cjRhLwdvSNBeFq2DL0gGdIpUkDOTOCoL4cfltciMsKNYOEhk+2hY0qhcHJHplnN4Soyll9nlAJj
	kHGVrvkiQx05fGXnYa6eH6dKvl1/uuDmOAcJeaVDZVifmOo52w==
X-Received: by 2002:a17:907:6b0e:b0:bdd:f2e9:37d2 with SMTP id
 a640c23a62f3a-bf372642192mr100437366b.33.1780640136156; Thu, 04 Jun 2026
 23:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260602062940.3107241-1-saisneha196@gmail.com>
 <20260602062940.3107241-4-saisneha196@gmail.com> <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
In-Reply-To: <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
From: Sai Sneha <saisneha196@gmail.com>
Date: Fri, 5 Jun 2026 11:45:23 +0530
X-Gm-Features: AVVi8Cf2gcO7fbbiNWviqR9jwF6-UXRjvejrl5XNjrctvcxFg_63Re4gGagXcB4
Message-ID: <CANcU11eiPSZuSKHUuvQ=tbnGa__+2PPXymO-Jk7qKeSFCORX=w@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] insane.bbclass: add missing-srcrev QA check for
 SCM URIs
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, corentin.guillevic@smile.fr, 
	martin@geanix.com, paul@pbarker.dev, mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000c9dafb06537b964f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 06:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238140

--000000000000c9dafb06537b964f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

After reading through all the mailing list feedback carefully and
spending time studying the bitbake fetcher code, I think I now have
a better picture of what went wrong with my approach. I wanted
to summarize my understanding before attempting v6.

The core problem with v5:

The bigger issue is that intercepting at the vardepvalue level in
base.bbclass was the wrong approach entirely. when I suppress the
hash computation for recipes with missing SRCREV I am also
accidentally breaking something important bitbake uses that hash
to know when to re-run do_fetch. So if a branch or tag changes
upstream do_fetch would silently not re-run which is worse than
the original problem.

Other issues I missed:

- Using d.getVar(candidate, False) misses MACHINE/DISTRO overrides.
Paul is right that override resolution is the bitbake parser's job,
not something OE-core should be reimplementing.

- Hardcoding git/gitsm/hg/svn was fragile. bitbake already has
supports_srcrev() on each fetcher class for exactly this purpose.

- The parse-time warning was wrong. src-uri-bad is purely a QA-time
check I should not have added parse-time warnings.

- The problem is broader than just missing SRCREV as a SRCREV set to
a branch or tag name instead of a commit hash causes the same
reproducibility issues.

- The tag=3D skip was wrong since the selftest recipe should use
INSANE_SKIP instead of skipping tag=3D globally.

- The CHECKLAYER_REQUIRED_TESTS decision needs proper discussion
not a unilateral call in the cover letter.

Where I think the fix should go:

Richard suggested fixing this in the bitbake fetchers themselves
using supports_srcrev(). I am not sure if that means changes to the
BitBake repository itself, or just using supports_srcrev() within
OE-core. Could someone clarify the right direction?

My current thinking for OE-core is a simple QA check in
insane.bbclass using oe.qa.handle_error() with supports_srcrev()
to identify which URIs need checking, along with fixing the
gitunpackoffline selftest with INSANE_SKIP. But I want to make sure
this aligns with what the maintainers have in mind before writing
more code.

Thanks again for the thorough review it was genuinely helpful.

Sai Sneha


On Tue, 2 Jun 2026 at 1:56=E2=80=AFPM, Yoann Congal <yoann.congal@smile.fr>=
 wrote:

> On Tue Jun 2, 2026 at 8:29 AM CEST, Sai Sneha wrote:
> > Add a proper QA check test_missing_srcrev() in do_recipe_qa that
> > fires at build time via oe.qa.handle_error(), using the shared
> > oe.qa.check_uri_srcrev() helper to avoid code duplication.
> >
> > Severity is controlled per layer:
> > - WARN_QA:append =3D " missing-srcrev" for all layers (warning by defau=
lt)
> > - ERROR_QA:append:layer-core =3D " missing-srcrev" for oe-core (strict)
> >
> > This follows the same pattern as missing-metadata and missing-maintaine=
r
> > which are warnings globally but errors for oe-core.
> >
> > Note on CHECKLAYER_REQUIRED_TESTS: missing-srcrev is intentionally
> > not added to CHECKLAYER_REQUIRED_TESTS because that would promote it
> > to ERROR_QA for all layers globally during normal builds, contradicting
> > the layer-specific enforcement requested in Bug 16051 Comment 3.
> > Instead, yocto-check-layer.bbclass enforces it directly during
> > checklayer validation runs.
>
> Neither CHECKLAYER_REQUIRED_TESTS nor yocto-check-layer does not appear
> in this patch. Maybe move this note to the next patch?
>
> >
> > Reported-by: Yoann Congal <yoann.congal@smile.fr>
> > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
> > AI-Generated: Developed with assistance from Anthropic Claude
> > Signed-off-by: Sai Sneha <saisneha196@gmail.com>
> > ---
> >
> > Changes in v5:
> > - No changes to this patch
> >
> > Changes in v4:
> > - Refactored to use shared oe.qa.check_uri_srcrev() helper
> > - Eliminates duplicated URI parsing logic
> > - Added note explaining why CHECKLAYER_REQUIRED_TESTS is not used
> >
> > Changes in v3:
> > - Added AI-Generated disclosure and Reported-by tag
> >
> > Changes in v2:
> > - Initial public submission
> >  meta/classes-global/insane.bbclass | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/meta/classes-global/insane.bbclass
> b/meta/classes-global/insane.bbclass
> > index 04700be71c..1fe426646d 100644
> > --- a/meta/classes-global/insane.bbclass
> > +++ b/meta/classes-global/insane.bbclass
> > @@ -49,6 +49,9 @@ ERROR_QA ?=3D "\
> >  ERROR_QA:append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge'=
,
> d)}"
> >  WARN_QA:append:layer-core =3D " missing-metadata missing-maintainer"
> >
> > +WARN_QA:append =3D " missing-srcrev"
> > +ERROR_QA:append:layer-core =3D " missing-srcrev"
> > +
> >  FAKEROOT_QA =3D "host-user-contaminated"
> >  FAKEROOT_QA[doc] =3D "QA tests which need to run under fakeroot. If an=
y \
> >  enabled tests are listed here, the do_package_qa task will run under
> fakeroot."
> > @@ -1455,6 +1458,15 @@ python do_qa_unpack() {
> >  python do_recipe_qa() {
> >      import re
> >
> > +    def test_missing_srcrev(pn, d):
> > +        import oe.qa
> > +        src_uri =3D (d.getVar('SRC_URI', False) or '').split()
> > +        for uri in src_uri:
> > +            rev =3D oe.qa.check_uri_srcrev(pn, uri, d)
> > +            if rev is None:
> > +                oe.qa.handle_error("missing-srcrev",
> > +                    "%s: SRCREV not set for SCM URI %s" % (pn, uri), d=
)
> > +
> >      def test_naming(pn, d):
> >          if pn.endswith("-native") and not
> bb.data.inherits_class("native", d):
> >              oe.qa.handle_error("recipe-naming", "Recipe %s appears
> native but is not, should inherit native" % pn, d)
> > @@ -1497,6 +1509,7 @@ python do_recipe_qa() {
> >
> >      pn =3D d.getVar('PN')
> >      test_naming(pn, d)
> > +    test_missing_srcrev(pn, d)
> >      test_missing_metadata(pn, d)
> >      test_missing_maintainer(pn, d)
> >      test_srcuri(pn, d)
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000c9dafb06537b964f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit" dir=3D"auto">Hi all,<br style=3D"font=
-size:inherit"><br style=3D"font-size:inherit">After reading through all th=
e mailing list feedback carefully and <br style=3D"font-size:inherit">spend=
ing time studying the bitbake fetcher code, I think I now have <br style=3D=
"font-size:inherit">a better picture of what went wrong with my approach. I=
 wanted <br style=3D"font-size:inherit">to summarize my understanding befor=
e attempting v6.<br style=3D"font-size:inherit"><br style=3D"font-size:inhe=
rit">The core problem with v5:<br style=3D"font-size:inherit"><br style=3D"=
font-size:inherit">The bigger issue is that intercepting at the vardepvalue=
 level in <br style=3D"font-size:inherit">base.bbclass was the wrong approa=
ch entirely. when I suppress the <br style=3D"font-size:inherit">hash compu=
tation for recipes with missing SRCREV I am also <br style=3D"font-size:inh=
erit">accidentally breaking something important bitbake uses that hash <br =
style=3D"font-size:inherit">to know when to re-run do_fetch. So if a branch=
 or tag changes <br style=3D"font-size:inherit">upstream do_fetch would sil=
ently not re-run which is worse than <br style=3D"font-size:inherit">the or=
iginal problem.<br style=3D"font-size:inherit"><br style=3D"font-size:inher=
it">Other issues I missed:<br style=3D"font-size:inherit"><br style=3D"font=
-size:inherit">- Using d.getVar(candidate, False) misses MACHINE/DISTRO ove=
rrides. <br style=3D"font-size:inherit">  Paul is right that override resol=
ution is the bitbake parser&#39;s job, <br style=3D"font-size:inherit">  no=
t something OE-core should be reimplementing.<br style=3D"font-size:inherit=
"><br style=3D"font-size:inherit">- Hardcoding git/gitsm/hg/svn was fragile=
. bitbake already has <br style=3D"font-size:inherit">  supports_srcrev() o=
n each fetcher class for exactly this purpose.<br style=3D"font-size:inheri=
t"><br style=3D"font-size:inherit">- The parse-time warning was wrong. src-=
uri-bad is purely a QA-time <br style=3D"font-size:inherit">  check I shoul=
d not have added parse-time warnings.<br style=3D"font-size:inherit"><br st=
yle=3D"font-size:inherit">- The problem is broader than just missing SRCREV=
 as a SRCREV set to <br style=3D"font-size:inherit">  a branch or tag name =
instead of a commit hash causes the same <br style=3D"font-size:inherit">  =
reproducibility issues.<br style=3D"font-size:inherit"><br style=3D"font-si=
ze:inherit">- The tag=3D skip was wrong since the selftest recipe should us=
e <br style=3D"font-size:inherit">  INSANE_SKIP instead of skipping tag=3D =
globally.<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">- =
The CHECKLAYER_REQUIRED_TESTS decision needs proper discussion <br style=3D=
"font-size:inherit">  not a unilateral call in the cover letter.<br style=
=3D"font-size:inherit"><br style=3D"font-size:inherit">Where I think the fi=
x should go:<br style=3D"font-size:inherit"><br style=3D"font-size:inherit"=
>Richard suggested fixing this in the bitbake fetchers themselves <br style=
=3D"font-size:inherit">using supports_srcrev(). I am not sure if that means=
 changes to the <br style=3D"font-size:inherit">BitBake repository itself, =
or just using supports_srcrev() within <br style=3D"font-size:inherit">OE-c=
ore. Could someone clarify the right direction?<br style=3D"font-size:inher=
it"><br style=3D"font-size:inherit">My current thinking for OE-core is a si=
mple QA check in <br style=3D"font-size:inherit">insane.bbclass using oe.qa=
.handle_error() with supports_srcrev() <br style=3D"font-size:inherit">to i=
dentify which URIs need checking, along with fixing the <br style=3D"font-s=
ize:inherit">gitunpackoffline selftest with INSANE_SKIP. But I want to make=
 sure <br style=3D"font-size:inherit">this aligns with what the maintainers=
 have in mind before writing <br style=3D"font-size:inherit">more code.<br =
style=3D"font-size:inherit"><br style=3D"font-size:inherit">Thanks again fo=
r the thorough review it was genuinely helpful.<br style=3D"font-size:inher=
it"><br style=3D"font-size:inherit">Sai Sneha</div><br></div><div><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 2 Jun 2026 at 1:56=E2=80=AFPM, Yoann Congal &lt;<a href=3D"m=
ailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Tue Jun 2, 2026 at 8:2=
9 AM CEST, Sai Sneha wrote:<br>
&gt; Add a proper QA check test_missing_srcrev() in do_recipe_qa that<br>
&gt; fires at build time via oe.qa.handle_error(), using the shared<br>
&gt; oe.qa.check_uri_srcrev() helper to avoid code duplication.<br>
&gt;<br>
&gt; Severity is controlled per layer:<br>
&gt; - WARN_QA:append =3D &quot; missing-srcrev&quot; for all layers (warni=
ng by default)<br>
&gt; - ERROR_QA:append:layer-core =3D &quot; missing-srcrev&quot; for oe-co=
re (strict)<br>
&gt;<br>
&gt; This follows the same pattern as missing-metadata and missing-maintain=
er<br>
&gt; which are warnings globally but errors for oe-core.<br>
&gt;<br>
&gt; Note on CHECKLAYER_REQUIRED_TESTS: missing-srcrev is intentionally<br>
&gt; not added to CHECKLAYER_REQUIRED_TESTS because that would promote it<b=
r>
&gt; to ERROR_QA for all layers globally during normal builds, contradictin=
g<br>
&gt; the layer-specific enforcement requested in Bug 16051 Comment 3.<br>
&gt; Instead, yocto-check-layer.bbclass enforces it directly during<br>
&gt; checklayer validation runs.<br>
<br>
Neither CHECKLAYER_REQUIRED_TESTS nor yocto-check-layer does not appear<br>
in this patch. Maybe move this note to the next patch?<br>
<br>
&gt;<br>
&gt; Reported-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr"=
 target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; Fixes: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
16051" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D16051</a><br>
&gt; AI-Generated: Developed with assistance from Anthropic Claude<br>
&gt; Signed-off-by: Sai Sneha &lt;<a href=3D"mailto:saisneha196@gmail.com" =
target=3D"_blank">saisneha196@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Changes in v5:<br>
&gt; - No changes to this patch<br>
&gt;<br>
&gt; Changes in v4:<br>
&gt; - Refactored to use shared oe.qa.check_uri_srcrev() helper<br>
&gt; - Eliminates duplicated URI parsing logic<br>
&gt; - Added note explaining why CHECKLAYER_REQUIRED_TESTS is not used<br>
&gt;<br>
&gt; Changes in v3:<br>
&gt; - Added AI-Generated disclosure and Reported-by tag<br>
&gt;<br>
&gt; Changes in v2:<br>
&gt; - Initial public submission<br>
&gt;=C2=A0 meta/classes-global/insane.bbclass | 13 +++++++++++++<br>
&gt;=C2=A0 1 file changed, 13 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/=
insane.bbclass<br>
&gt; index 04700be71c..1fe426646d 100644<br>
&gt; --- a/meta/classes-global/insane.bbclass<br>
&gt; +++ b/meta/classes-global/insane.bbclass<br>
&gt; @@ -49,6 +49,9 @@ ERROR_QA ?=3D &quot;\<br>
&gt;=C2=A0 ERROR_QA:append =3D &quot; ${@bb.utils.filter(&#39;DISTRO_FEATUR=
ES&#39;, &#39;usrmerge&#39;, d)}&quot;<br>
&gt;=C2=A0 WARN_QA:append:layer-core =3D &quot; missing-metadata missing-ma=
intainer&quot;<br>
&gt;=C2=A0 <br>
&gt; +WARN_QA:append =3D &quot; missing-srcrev&quot;<br>
&gt; +ERROR_QA:append:layer-core =3D &quot; missing-srcrev&quot;<br>
&gt; +<br>
&gt;=C2=A0 FAKEROOT_QA =3D &quot;host-user-contaminated&quot;<br>
&gt;=C2=A0 FAKEROOT_QA[doc] =3D &quot;QA tests which need to run under fake=
root. If any \<br>
&gt;=C2=A0 enabled tests are listed here, the do_package_qa task will run u=
nder fakeroot.&quot;<br>
&gt; @@ -1455,6 +1458,15 @@ python do_qa_unpack() {<br>
&gt;=C2=A0 python do_recipe_qa() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 import re<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 def test_missing_srcrev(pn, d):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import <a href=3D"http://oe.qa" rel=3D"no=
referrer" target=3D"_blank">oe.qa</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 src_uri =3D (d.getVar(&#39;SRC_URI&#39;, =
False) or &#39;&#39;).split()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for uri in src_uri:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev =3D oe.qa.check_uri_src=
rev(pn, uri, d)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if rev is None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_=
error(&quot;missing-srcrev&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;%s: SRCREV not set for SCM URI %s&quot; % (pn, uri), d)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def test_naming(pn, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pn.endswith(&quot;-native&quot;) =
and not bb.data.inherits_class(&quot;native&quot;, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&qu=
ot;recipe-naming&quot;, &quot;Recipe %s appears native but is not, should i=
nherit native&quot; % pn, d)<br>
&gt; @@ -1497,6 +1509,7 @@ python do_recipe_qa() {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 test_naming(pn, d)<br>
&gt; +=C2=A0 =C2=A0 test_missing_srcrev(pn, d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 test_missing_metadata(pn, d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 test_missing_maintainer(pn, d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 test_srcuri(pn, d)<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div></div>

--000000000000c9dafb06537b964f--

