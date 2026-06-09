Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5B1CD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:19:28 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75267.1780996766198047642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=djvmOhII;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: saisneha196@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68cec9f4c6cso7370633a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 02:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996764; cv=none;
        d=google.com; s=arc-20240605;
        b=UBrDCa9MQcG1QXzqu9ib3kO0VH1XQOhvUiybWOUyI3sM2XtbDDeUxP0VM2Z0spRq0I
         53JlQHOF+32vd6pnsatZ5gkRKEKKrYaB62hGHn8NYpLYcJido+3MGj8StevrsLJc4m09
         r9vnmoYehAgRSC2jj85BO1OGGyXHuF24gomRi9Uv6rU83wkwGjXN4Ghx5PVKVyLRO6MJ
         rNSqCpMD8bngGcOT6mkCtasyDKYS799VFy259PHl1zyknDAblH9FusvxzcxqNcg98asW
         drqmuICkxaLW4ajESMBF836TUNkneKM+L/Tlz1xgwxzuKZg0gindAqp6v90YTa1HreIo
         TYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R5L0nFN1UJLiHTJAXhLHVBaq2jXb+2dhJwlJgqTO16A=;
        fh=vxhglLuRWm2zhhoz7YijsUOM8tq6Sfx2u0dCLV0GIdM=;
        b=NXNyCfY4cujwc+RrKi4C9Y/zfRZiCTJmfqUc47kRXiOo6a08Q/5fHnta7EkWkKyec3
         JNqmITeW+W9bbdZJgqmNcapaUV18Bcoynnszf3Y8AneyxqtyHCpPBRxdeA/l6+xc3UQf
         SF3XoSRQnwLVQk2Qi1WVgVFlnMMDSeVyeth/mm1Dg55AwqXrBDfRKO9KBsdiDP9gJ3CA
         dmUnvHpW5zZ+qeMhmF6TV2Y2jUEtXLyDl5opKLBtXmmLvAlmSUDO28P8VVMX5h/KgBxO
         o+ehJdWaEKrexB298G4XacqA1EaFD3mQF6emhGsxGYd3UmmNByARi6cWMvtGV+PXxPY0
         PO3Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780996764; x=1781601564; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R5L0nFN1UJLiHTJAXhLHVBaq2jXb+2dhJwlJgqTO16A=;
        b=djvmOhIICW+C491s1eEyVrWpOgoImchY9ypYm3dcjVbXIUFbC90aHNAM1X9EK7fQ5l
         vVkoDBBGWZYjl9JMiGd0GjYir91d2SyaecZHVygalqFksYvXreg6RicCQxT1xS3FdPO7
         DB7lQEAvpG1EhOygVYx+ciLpcec+ZnkoPwhPbv+J79PGOU2HcO1x2gA4HrwdrDF3Ngb/
         h7qGmpVjI7LAzbJ6S35ah1RYmRa8O6CdG1dt9bS5sLvsaGoiUWiwcK275LEFAF/j24xF
         YLl51zlJD/OqajU/WsJBUHkDb/COnkUk8o82bYcsrn9Ura01codFrPFCsN7DKvgRn8Dw
         ah9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996764; x=1781601564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5L0nFN1UJLiHTJAXhLHVBaq2jXb+2dhJwlJgqTO16A=;
        b=PDkYNlTvh4m1dP5uIdTCh0i7md3J5vaaKTNDpJLYheRZpTfbKWpFhSx9JcWnrvwNDX
         ipztixxwh7OkQEPul2qKhGKHrk9/3jrcHKxyajH9mFMdOIys23Xubw7usVoAu9Cn4E4b
         mOuvvfs7vSdom5PBGSMBsQ2gKMJB2e5bZ2t+uW35b5XgyJjmrCiN8PnznBTRH62+wwxC
         RpT2hFJrYZYc4i+CCcwf0OdFlNFkrrBb9VNACYyXw+W6NCMPG3mSvWf6Uxx0KSlgzgQQ
         dM+Y7sCJExPNELcEBvg5p5Ho8itlUiaZa98SKi5/0djr/tzxMFqcklvurwhYNIAmNSMm
         R9hw==
X-Forwarded-Encrypted: i=1; AFNElJ/rNKMphipbLTsuXlSTbnwZsPjKNYn/0uwuZi7Clzsc0bJLwWGAzXKpOgpwc9s+Uj4fn8maCmdvVA1RzsJgUv2HMQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx5L5sQK5ZAOk1hyYoBGHLFYje9h/+itOw2CpDTV5q7fZ89Xgka
	GewhcivJmbiolG70/292qQarTXUPc1VlchXZXRZIopF9cC00VqkkluJ32P5y9qis667+dl8aQ7E
	aOOv8F0BDzy0mH4zC6pM68RodTJOlGa4=
X-Gm-Gg: Acq92OFUaYhcHdyM1v45taEtUB6APHowdKesgIPXUR8V/VO18+cZfCOmiAOxGvCYjil
	pUNy4zOl714E1wwpqv/gNSCGdk8+toC6tf2X1ZZD/Kp+uOOOKenwkGIZP5weZdIba+CvRHne/4t
	pC2TkM9Y9wqde+nykrqbhy0Yf4GK6Jo8yfjkNGgVdfLsLQFV57TMPgFhLycj3cfse35VEU4KVN9
	ieRaADkls9wvYEgvvsyffYQDlusOUu7ZS7apJJneMEkP0JAS3u6L1Q4tT71zWG1G8EurKmGQLn9
	RIHALDUA5UlK8pNWPIfiTQEQFqTav7HZXMGWZCvO8PwclcHgxg==
X-Received: by 2002:a17:907:6d0d:b0:be1:d908:ce23 with SMTP id
 a640c23a62f3a-bf372541e6emr1002144966b.21.1780996763789; Tue, 09 Jun 2026
 02:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260602062940.3107241-1-saisneha196@gmail.com>
 <20260602062940.3107241-4-saisneha196@gmail.com> <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
 <18B61AC5A22983D6.29982@lists.openembedded.org>
In-Reply-To: <18B61AC5A22983D6.29982@lists.openembedded.org>
From: Sai Sneha <saisneha196@gmail.com>
Date: Tue, 9 Jun 2026 14:49:12 +0530
X-Gm-Features: AVVi8CekETsHjLkA891BGzdLvugx2ABmJN8Ey6EfSuS034wBHNxzJD_OfDCpCmw
Message-ID: <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
Subject: Re: [OE-core] insane.bbclass: add missing-srcrev QA check for SCM URIs
To: saisneha196@gmail.com
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	corentin.guillevic@smile.fr, martin@geanix.com, paul@pbarker.dev, 
	mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="00000000000073abe20653ce9f92"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 09:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238282

--00000000000073abe20653ce9f92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Following up on the suggestions to fix this in the BitBake
fetchers using supports_srcrev(), I have tried implementing that
approach locally. Here is what I did and how it works.

The fix has two parts:

Part 1 =E2=80=94 BitBake fix (prevent parse crash):
The crash happens in setup_revisions() when srcrev_internal_helper()
raises a FetchError for missing SRCREV. This propagates up through
expandWithRefs() as an ExpansionError which halts parsing for all
recipes. The fix catches FetchError in setup_revisions() and sets
a missing_srcrev flag on the FetchData object:

def setup_revisions(self, d):
try:
self.revision =3D srcrev_internal_helper(self, d, self.name)
except FetchError:
self.revision =3D None
self.missing_srcrev =3D True

git.py and hg.py also needed a guard to prevent calling
latest_revision() when missing_srcrev is set, since that would
trigger a live network fetch under BB_NO_NETWORK=3D1.

Part 2 =E2=80=94 OE-core QA check (insane.bbclass):
A simple test_missing_srcrev() in do_recipe_qa uses supports_srcrev()
to identify which URIs need checking:

def test_missing_srcrev(pn, d):
import bb.fetch2
try:
fetcher =3D bb.fetch2.Fetch(
(d.getVar('SRC_URI') or '').split(), d)
for url in fetcher.ud:
ud =3D fetcher.ud[url]
if ud.method.supports_srcrev() and \
getattr(ud, 'missing_srcrev', False):
oe.qa.handle_error("missing-srcrev",
"%s: SRCREV not set for SCM URI %s" % (pn, url), d)
except bb.fetch2.FetchError:
pass

Test results:

$ bitbake -p 2>&1 | grep -E "(WARNING|ERROR|SRCREV)"
WARNING: You are running bitbake under WSLv2...
Summary: There was 1 WARNING message.
(no parse crash, all recipes parse cleanly)

$ bitbake -c recipe_qa -f test-fetcher 2>&1 | grep -E
"(WARNING|ERROR|missing-srcrev)"
WARNING: test-fetcher-1.0-r0 do_recipe_qa: QA Issue: test-fetcher:
SRCREV not set for SCM URI git://github.com/example/project.git
[missing-srcrev]

$ bitbake -c recipe_qa test-srcrev 2>&1 | grep -E
"(WARNING|ERROR|missing-srcrev)"
ERROR: test-srcrev-1.0-r0 do_recipe_qa: QA Issue: test-srcrev:
SRCREV not set for SCM URI git://github.com/example/project.git
[missing-srcrev]

Selftest results:
test_git_unpack_nonetwork PASSED
test_git_unpack_nonetwork_fail PASSED
test_git_patchtool PASSED
test_git_patchtool2 PASSED
test_just_parse PASSED
test_warnings_errors PASSED
test_invalid_recipe_src_uri PASSED

Changes are minimal:
BitBake: 3 files, 8 insertions, 3 deletions
OE-core: 1 file, 16 insertions, 1 deletion

Does this approach align with what was suggested? I am happy to
refine it further based on the feedback.

Best regards,
Sai Sneha


On Fri, 5 Jun 2026 at 11:45=E2=80=AFAM, Sai Sneha via lists.openembedded.or=
g
<saisneha196=3Dgmail.com@lists.openembedded.org> wrote:

> Hi all,
>
> After reading through all the mailing list feedback carefully and
> spending time studying the bitbake fetcher code, I think I now have
> a better picture of what went wrong with my approach. I wanted
> to summarize my understanding before attempting v6.
>
> The core problem with v5:
>
> The bigger issue is that intercepting at the vardepvalue level in
> base.bbclass was the wrong approach entirely. when I suppress the
> hash computation for recipes with missing SRCREV I am also
> accidentally breaking something important bitbake uses that hash
> to know when to re-run do_fetch. So if a branch or tag changes
> upstream do_fetch would silently not re-run which is worse than
> the original problem.
>
> Other issues I missed:
>
> - Using d.getVar(candidate, False) misses MACHINE/DISTRO overrides.
> Paul is right that override resolution is the bitbake parser's job,
> not something OE-core should be reimplementing.
>
> - Hardcoding git/gitsm/hg/svn was fragile. bitbake already has
> supports_srcrev() on each fetcher class for exactly this purpose.
>
> - The parse-time warning was wrong. src-uri-bad is purely a QA-time
> check I should not have added parse-time warnings.
>
> - The problem is broader than just missing SRCREV as a SRCREV set to
> a branch or tag name instead of a commit hash causes the same
> reproducibility issues.
>
> - The tag=3D skip was wrong since the selftest recipe should use
> INSANE_SKIP instead of skipping tag=3D globally.
>
> - The CHECKLAYER_REQUIRED_TESTS decision needs proper discussion
> not a unilateral call in the cover letter.
>
> Where I think the fix should go:
>
> Richard suggested fixing this in the bitbake fetchers themselves
> using supports_srcrev(). I am not sure if that means changes to the
> BitBake repository itself, or just using supports_srcrev() within
> OE-core. Could someone clarify the right direction?
>
> My current thinking for OE-core is a simple QA check in
> insane.bbclass using oe.qa.handle_error() with supports_srcrev()
> to identify which URIs need checking, along with fixing the
> gitunpackoffline selftest with INSANE_SKIP. But I want to make sure
> this aligns with what the maintainers have in mind before writing
> more code.
>
> Thanks again for the thorough review it was genuinely helpful.
>
> Sai Sneha
>
>
> On Tue, 2 Jun 2026 at 1:56=E2=80=AFPM, Yoann Congal <yoann.congal@smile.f=
r> wrote:
>
>> On Tue Jun 2, 2026 at 8:29 AM CEST, Sai Sneha wrote:
>> > Add a proper QA check test_missing_srcrev() in do_recipe_qa that
>> > fires at build time via oe.qa.handle_error(), using the shared
>> > oe.qa.check_uri_srcrev() helper to avoid code duplication.
>> >
>> > Severity is controlled per layer:
>> > - WARN_QA:append =3D " missing-srcrev" for all layers (warning by defa=
ult)
>> > - ERROR_QA:append:layer-core =3D " missing-srcrev" for oe-core (strict=
)
>> >
>> > This follows the same pattern as missing-metadata and missing-maintain=
er
>> > which are warnings globally but errors for oe-core.
>> >
>> > Note on CHECKLAYER_REQUIRED_TESTS: missing-srcrev is intentionally
>> > not added to CHECKLAYER_REQUIRED_TESTS because that would promote it
>> > to ERROR_QA for all layers globally during normal builds, contradictin=
g
>> > the layer-specific enforcement requested in Bug 16051 Comment 3.
>> > Instead, yocto-check-layer.bbclass enforces it directly during
>> > checklayer validation runs.
>>
>> Neither CHECKLAYER_REQUIRED_TESTS nor yocto-check-layer does not appear
>> in this patch. Maybe move this note to the next patch?
>>
>> >
>> > Reported-by: Yoann Congal <yoann.congal@smile.fr>
>> > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
>> > AI-Generated: Developed with assistance from Anthropic Claude
>> > Signed-off-by: Sai Sneha <saisneha196@gmail.com>
>> > ---
>> >
>> > Changes in v5:
>> > - No changes to this patch
>> >
>> > Changes in v4:
>> > - Refactored to use shared oe.qa.check_uri_srcrev() helper
>> > - Eliminates duplicated URI parsing logic
>> > - Added note explaining why CHECKLAYER_REQUIRED_TESTS is not used
>> >
>> > Changes in v3:
>> > - Added AI-Generated disclosure and Reported-by tag
>> >
>> > Changes in v2:
>> > - Initial public submission
>> >  meta/classes-global/insane.bbclass | 13 +++++++++++++
>> >  1 file changed, 13 insertions(+)
>> >
>> > diff --git a/meta/classes-global/insane.bbclass
>> b/meta/classes-global/insane.bbclass
>> > index 04700be71c..1fe426646d 100644
>> > --- a/meta/classes-global/insane.bbclass
>> > +++ b/meta/classes-global/insane.bbclass
>> > @@ -49,6 +49,9 @@ ERROR_QA ?=3D "\
>> >  ERROR_QA:append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge=
',
>> d)}"
>> >  WARN_QA:append:layer-core =3D " missing-metadata missing-maintainer"
>> >
>> > +WARN_QA:append =3D " missing-srcrev"
>> > +ERROR_QA:append:layer-core =3D " missing-srcrev"
>> > +
>> >  FAKEROOT_QA =3D "host-user-contaminated"
>> >  FAKEROOT_QA[doc] =3D "QA tests which need to run under fakeroot. If a=
ny \
>> >  enabled tests are listed here, the do_package_qa task will run under
>> fakeroot."
>> > @@ -1455,6 +1458,15 @@ python do_qa_unpack() {
>> >  python do_recipe_qa() {
>> >      import re
>> >
>> > +    def test_missing_srcrev(pn, d):
>> > +        import oe.qa
>> > +        src_uri =3D (d.getVar('SRC_URI', False) or '').split()
>> > +        for uri in src_uri:
>> > +            rev =3D oe.qa.check_uri_srcrev(pn, uri, d)
>> > +            if rev is None:
>> > +                oe.qa.handle_error("missing-srcrev",
>> > +                    "%s: SRCREV not set for SCM URI %s" % (pn, uri), =
d)
>> > +
>> >      def test_naming(pn, d):
>> >          if pn.endswith("-native") and not
>> bb.data.inherits_class("native", d):
>> >              oe.qa.handle_error("recipe-naming", "Recipe %s appears
>> native but is not, should inherit native" % pn, d)
>> > @@ -1497,6 +1509,7 @@ python do_recipe_qa() {
>> >
>> >      pn =3D d.getVar('PN')
>> >      test_naming(pn, d)
>> > +    test_missing_srcrev(pn, d)
>> >      test_missing_metadata(pn, d)
>> >      test_missing_maintainer(pn, d)
>> >      test_srcuri(pn, d)
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238140):
> https://lists.openembedded.org/g/openembedded-core/message/238140
> Mute This Topic: https://lists.openembedded.org/mt/119607376/10302268
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> saisneha196@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000073abe20653ce9f92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit" dir=3D"auto">Hi all,<br style=3D"font=
-size:inherit"><br style=3D"font-size:inherit">Following up on the=C2=A0sug=
gestions to fix this in the BitBake <br style=3D"font-size:inherit">fetcher=
s using supports_srcrev(), I have tried implementing that <br style=3D"font=
-size:inherit">approach locally. Here is what I did and how it works.<br st=
yle=3D"font-size:inherit"><br style=3D"font-size:inherit">The fix has two p=
arts:<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">Part 1=
 =E2=80=94 BitBake fix (prevent parse crash):<br style=3D"font-size:inherit=
">The crash happens in setup_revisions() when srcrev_internal_helper() <br =
style=3D"font-size:inherit">raises a FetchError for missing SRCREV. This pr=
opagates up through <br style=3D"font-size:inherit">expandWithRefs() as an =
ExpansionError which halts parsing for all <br style=3D"font-size:inherit">=
recipes. The fix catches FetchError in setup_revisions() and sets <br style=
=3D"font-size:inherit">a missing_srcrev flag on the FetchData object:<br st=
yle=3D"font-size:inherit"><br style=3D"font-size:inherit">  def setup_revis=
ions(self, d):<br style=3D"font-size:inherit">      try:<br style=3D"font-s=
ize:inherit">          self.revision =3D srcrev_internal_helper(self, d, <a=
 href=3D"http://self.name">self.name</a>)<br style=3D"font-size:inherit">  =
    except FetchError:<br style=3D"font-size:inherit">          self.revisi=
on =3D None<br style=3D"font-size:inherit">          self.missing_srcrev =
=3D True<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">git=
.py and hg.py also needed a guard to prevent calling <br style=3D"font-size=
:inherit">latest_revision() when missing_srcrev is set, since that would <b=
r style=3D"font-size:inherit">trigger a live network fetch under BB_NO_NETW=
ORK=3D1.<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">Par=
t 2 =E2=80=94 OE-core QA check (insane.bbclass):<br style=3D"font-size:inhe=
rit">A simple test_missing_srcrev() in do_recipe_qa uses supports_srcrev() =
<br style=3D"font-size:inherit">to identify which URIs need checking:<br st=
yle=3D"font-size:inherit"><br style=3D"font-size:inherit">  def test_missin=
g_srcrev(pn, d):<br style=3D"font-size:inherit">      import bb.fetch2<br s=
tyle=3D"font-size:inherit">      try:<br style=3D"font-size:inherit">      =
    fetcher =3D bb.fetch2.Fetch(<br style=3D"font-size:inherit">           =
   (d.getVar(&#39;SRC_URI&#39;) or &#39;&#39;).split(), d)<br style=3D"font=
-size:inherit">          for url in fetcher.ud:<br style=3D"font-size:inher=
it">              ud =3D fetcher.ud[url]<br style=3D"font-size:inherit">   =
           if ud.method.supports_srcrev() and \<br style=3D"font-size:inher=
it">                 getattr(ud, &#39;missing_srcrev&#39;, False):<br style=
=3D"font-size:inherit">                  oe.qa.handle_error(&quot;missing-s=
rcrev&quot;,<br style=3D"font-size:inherit">                      &quot;%s:=
 SRCREV not set for SCM URI %s&quot; % (pn, url), d)<br style=3D"font-size:=
inherit">      except bb.fetch2.FetchError:<br style=3D"font-size:inherit">=
          pass<br style=3D"font-size:inherit"><br style=3D"font-size:inheri=
t">Test results:<br style=3D"font-size:inherit"><br style=3D"font-size:inhe=
rit">  $ bitbake -p 2&gt;&amp;1 | grep -E &quot;(WARNING|ERROR|SRCREV)&quot=
;<br style=3D"font-size:inherit">  WARNING: You are running bitbake under W=
SLv2...<br style=3D"font-size:inherit">  Summary: There was 1 WARNING messa=
ge.<br style=3D"font-size:inherit">  (no parse crash, all recipes parse cle=
anly)<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">  $ bi=
tbake -c recipe_qa -f test-fetcher 2&gt;&amp;1 | grep -E &quot;(WARNING|ERR=
OR|missing-srcrev)&quot;<br style=3D"font-size:inherit">  WARNING: test-fet=
cher-1.0-r0 do_recipe_qa: QA Issue: test-fetcher: <br style=3D"font-size:in=
herit">  SRCREV not set for SCM URI git://<a href=3D"http://github.com/exam=
ple/project.git">github.com/example/project.git</a> [missing-srcrev]<br sty=
le=3D"font-size:inherit"><br style=3D"font-size:inherit">  $ bitbake -c rec=
ipe_qa test-srcrev 2&gt;&amp;1 | grep -E &quot;(WARNING|ERROR|missing-srcre=
v)&quot;<br style=3D"font-size:inherit">  ERROR: test-srcrev-1.0-r0 do_reci=
pe_qa: QA Issue: test-srcrev: <br style=3D"font-size:inherit">  SRCREV not =
set for SCM URI git://<a href=3D"http://github.com/example/project.git">git=
hub.com/example/project.git</a> [missing-srcrev]<br style=3D"font-size:inhe=
rit"><br style=3D"font-size:inherit">Selftest results:<br style=3D"font-siz=
e:inherit">  test_git_unpack_nonetwork      PASSED<br style=3D"font-size:in=
herit">  test_git_unpack_nonetwork_fail PASSED<br style=3D"font-size:inheri=
t">  test_git_patchtool             PASSED<br style=3D"font-size:inherit"> =
 test_git_patchtool2            PASSED<br style=3D"font-size:inherit">  tes=
t_just_parse                PASSED<br style=3D"font-size:inherit">  test_wa=
rnings_errors           PASSED<br style=3D"font-size:inherit">  test_invali=
d_recipe_src_uri    PASSED<br style=3D"font-size:inherit"><br style=3D"font=
-size:inherit">Changes are minimal:<br style=3D"font-size:inherit">  BitBak=
e:  3 files, 8 insertions, 3 deletions<br style=3D"font-size:inherit">  OE-=
core:  1 file,  16 insertions, 1 deletion<br style=3D"font-size:inherit"><b=
r style=3D"font-size:inherit">Does this approach align with what was sugges=
ted? I am happy to <br style=3D"font-size:inherit">refine it further based =
on the feedback.<br style=3D"font-size:inherit"><br style=3D"font-size:inhe=
rit">Best regards,<br style=3D"font-size:inherit">Sai Sneha<br style=3D"fon=
t-size:inherit"></div><br></div><div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 5 Jun 2026 at =
11:45=E2=80=AFAM, Sai Sneha via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;saisneha196=3D<a href=3D"mailto:gmail.com@lis=
ts.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div style=3D"fon=
t-size:inherit" dir=3D"auto">Hi all,<br style=3D"font-size:inherit"><br sty=
le=3D"font-size:inherit">After reading through all the mailing list feedbac=
k carefully and <br style=3D"font-size:inherit">spending time studying the =
bitbake fetcher code, I think I now have <br style=3D"font-size:inherit">a =
better picture of what went wrong with my approach. I wanted <br style=3D"f=
ont-size:inherit">to summarize my understanding before attempting v6.<br st=
yle=3D"font-size:inherit"><br style=3D"font-size:inherit">The core problem =
with v5:<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">The=
 bigger issue is that intercepting at the vardepvalue level in <br style=3D=
"font-size:inherit">base.bbclass was the wrong approach entirely. when I su=
ppress the <br style=3D"font-size:inherit">hash computation for recipes wit=
h missing SRCREV I am also <br style=3D"font-size:inherit">accidentally bre=
aking something important bitbake uses that hash <br style=3D"font-size:inh=
erit">to know when to re-run do_fetch. So if a branch or tag changes <br st=
yle=3D"font-size:inherit">upstream do_fetch would silently not re-run which=
 is worse than <br style=3D"font-size:inherit">the original problem.<br sty=
le=3D"font-size:inherit"><br style=3D"font-size:inherit">Other issues I mis=
sed:<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">- Using=
 d.getVar(candidate, False) misses MACHINE/DISTRO overrides. <br style=3D"f=
ont-size:inherit">  Paul is right that override resolution is the bitbake p=
arser&#39;s job, <br style=3D"font-size:inherit">  not something OE-core sh=
ould be reimplementing.<br style=3D"font-size:inherit"><br style=3D"font-si=
ze:inherit">- Hardcoding git/gitsm/hg/svn was fragile. bitbake already has =
<br style=3D"font-size:inherit">  supports_srcrev() on each fetcher class f=
or exactly this purpose.<br style=3D"font-size:inherit"><br style=3D"font-s=
ize:inherit">- The parse-time warning was wrong. src-uri-bad is purely a QA=
-time <br style=3D"font-size:inherit">  check I should not have added parse=
-time warnings.<br style=3D"font-size:inherit"><br style=3D"font-size:inher=
it">- The problem is broader than just missing SRCREV as a SRCREV set to <b=
r style=3D"font-size:inherit">  a branch or tag name instead of a commit ha=
sh causes the same <br style=3D"font-size:inherit">  reproducibility issues=
.<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">- The tag=
=3D skip was wrong since the selftest recipe should use <br style=3D"font-s=
ize:inherit">  INSANE_SKIP instead of skipping tag=3D globally.<br style=3D=
"font-size:inherit"><br style=3D"font-size:inherit">- The CHECKLAYER_REQUIR=
ED_TESTS decision needs proper discussion <br style=3D"font-size:inherit"> =
 not a unilateral call in the cover letter.<br style=3D"font-size:inherit">=
<br style=3D"font-size:inherit">Where I think the fix should go:<br style=
=3D"font-size:inherit"><br style=3D"font-size:inherit">Richard suggested fi=
xing this in the bitbake fetchers themselves <br style=3D"font-size:inherit=
">using supports_srcrev(). I am not sure if that means changes to the <br s=
tyle=3D"font-size:inherit">BitBake repository itself, or just using support=
s_srcrev() within <br style=3D"font-size:inherit">OE-core. Could someone cl=
arify the right direction?<br style=3D"font-size:inherit"><br style=3D"font=
-size:inherit">My current thinking for OE-core is a simple QA check in <br =
style=3D"font-size:inherit">insane.bbclass using oe.qa.handle_error() with =
supports_srcrev() <br style=3D"font-size:inherit">to identify which URIs ne=
ed checking, along with fixing the <br style=3D"font-size:inherit">gitunpac=
koffline selftest with INSANE_SKIP. But I want to make sure <br style=3D"fo=
nt-size:inherit">this aligns with what the maintainers have in mind before =
writing <br style=3D"font-size:inherit">more code.<br style=3D"font-size:in=
herit"><br style=3D"font-size:inherit">Thanks again for the thorough review=
 it was genuinely helpful.<br style=3D"font-size:inherit"><br style=3D"font=
-size:inherit">Sai Sneha</div><br></div><div><br><div class=3D"gmail_quote"=
></div></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, 2 Jun 2026 at 1:56=E2=80=AFPM, Yoann Congal &lt;<a href=3D"=
mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue=
 Jun 2, 2026 at 8:29 AM CEST, Sai Sneha wrote:<br>
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
</blockquote></div></div><div><div class=3D"gmail_quote"></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#238140): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/238140" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/238140</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119607376/103=
02268" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/119607376/10302268</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:saisneha196@gmail.com" tar=
get=3D"_blank">saisneha196@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000073abe20653ce9f92--

