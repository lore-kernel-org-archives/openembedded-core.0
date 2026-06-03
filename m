Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE6DCD6E4A
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 06:17:59 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14014.1780467474045529751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 23:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M7KYtEnI;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: saisneha196@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so5836536a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 23:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780467472; cv=none;
        d=google.com; s=arc-20240605;
        b=WIa7H/aevLVk8FZkA7UJkG4KGu7XrLDFTqjSCJHuzNMOj/SF0ytaAjHm45gDwGG0o2
         caPhuaHly1XWA2hdTUO/TF+zks3jIdkdj50y2M7EBBFb7YMTbGNVJfC+UMmThFi0fqi8
         4Cf7eRKvY6baQjEpRZN8yWmoa9naMPkyr1Zno/sCIJjZoaCNHi+KtM4kQ/B6MdCTkVUL
         4jNI6nJtu+1ymOHJB75X7gkhVaELEeENDyYi8y2emtL2H+oeVmwRWuLM+asgvUoKpqXH
         bfy7PQIaAwIBpJ001LtHKaqdoGb4LTeQDD9jTUqccicviCPk5flLgmXN510PR3F+Glkd
         QRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o2po/xiWAOxjyD/s5TGaUasYpnjzBmSs6hq0PvMMk6g=;
        fh=VRwT57IF5xI0wFDxRjTAjHBfwByJLy3WBt21rLmZTjw=;
        b=Qx0bZo1jRNXpsMx+jdEldJzG7YWEhKpkcrDLyXQrkBhSdgC+TmkZX2reC3cckEjsQi
         /ingDxDlzkDKlKOdLVAoUFkpQw/36pL+XSAiSv4kMao58UJbxrRTxaxYrThdeOr4YN61
         fNTjF7oEZ/rMp1tdVZGulpNwvWutJo+UCRGUHYpUukPhh0yzLqf5IIze8W4QNqmdygr+
         JLiNFhIX4YDbeo/qftbfHEbLPexVmD4dxkM/MN+xvpkQhfStlLav2Ejo2XImQ3AHUAYn
         8Yc2UIzzIJnn/9QNfqj4VMIkjCTgQkepY8adHse4v9lV/aFEcbg7SQ2DmUayHFcLMIlH
         G84g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780467472; x=1781072272; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o2po/xiWAOxjyD/s5TGaUasYpnjzBmSs6hq0PvMMk6g=;
        b=M7KYtEnI/7xjQGZyAj9huQsZ8mr4ZdvMyoSOjT0Z9eR4dX7ncGh3IqoLH6D/yKss55
         MwpikZzqsDTHzuDfcbV/gnDmlfit2NGwwiftbR03l821O+1PSc3dRJwFc3J3zMdOUBzk
         OBDt0FLuo32je+Xdqg/wiLgz7vbCUTNO/ARy3lv+zEfonhr6ZFdORv16LtR1DkhmI15t
         1ErLAZOZHaxUGJ0dhh6GvQTv2nZGp1gsbBsSm/dH2XQicTpLSPfG8MXWg8KzyHRf92Zg
         gNlG/7WNNgID94DvUgHuHyexErjMBqUhyCEFUySBfaVKD7pqQJsSBhBjcoiJkTVQwqWd
         LEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780467472; x=1781072272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2po/xiWAOxjyD/s5TGaUasYpnjzBmSs6hq0PvMMk6g=;
        b=leDz09vE+KdNGkcemDyjkc5RMK8YNbKwzn4Kg8YFBz1bImJ6yLIano/Bp9DzrE4FOl
         9Edbp8dp7SA4a17kw604aiEuEkIFiy3zRL7n9UzaC+hVxyPRmjcKuNfgWRa+GcAL3J2O
         FiV3u5x5iaeHl6hdP42pX7cZDjkSs1qm2ozr/dl+MDF4VBkhnmQyZfPepm12IIcu5Mmq
         0nZ8841KRfmvug7bsHT5r5cy+5SOYK/18DutRm6/fP5jK2UFtOkAxEhOzsQ8HT57icyt
         TZQi7rGOlVYe4Dkx6dQsQJ5GtE1HqsLo0JxyeVhUI2ObpH+Kk6snCMIa72U59Wu3M17W
         02rA==
X-Forwarded-Encrypted: i=1; AFNElJ/UpgonWFdmfgyrjeCqSgj8/Y5xH4XvFHbXYDrF+Dol7EkyI+g0x4xmwuVCE43tk8wj494P3crEDvve7wESZycmkA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzDKcpqvcXiO935xPVW6JFFFsMyvgIVKFp8FcK6msSfJYI5ZEAh
	JHNHDsKg4jjllOUhJpYMsPJTzuS0c7jP5Yv6ZBjEtLBC2EEKTiacBJ31bE2zoayhpIpRUzyj1Qt
	kUwVjQvXIEzuILszYLzT7krgVjlwbDD4=
X-Gm-Gg: Acq92OFiSxxxR8GDyW4OgtsdGFp6PYMaSKBrlPzRU9VALFDNIJfkL7SyFamaAYTBku8
	qLFYLeSY3BYj7izat++dT4nOX5KeSuQdtETFSSCWXIL5nV+eeDVR0UlQZUoWwbAJS464UTz/BMp
	n/hnQtHSoTevEypG989BcGI8GZtWolAaQ3M19wBro4/Nge3V543QDy3SAFcQhDTVgltigyF5mIE
	MzUDXQQw7vjrujiEunYP9YClI1ygKUmVbHvodGstcjbNBjSJ5vZniEVeJVtz7eQYxuYdnX5i7uu
	SguFo+Qi+LXPMt1jJldlgbkGXbqKzTepjjl9z7aWE3kKAnwk6AA=
X-Received: by 2002:a05:6402:5285:b0:68b:767b:40dc with SMTP id
 4fb4d7f45d1cf-68e710eb7b0mr814088a12.14.1780467471903; Tue, 02 Jun 2026
 23:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260527111756.1306022-1-saisneha196@gmail.com>
 <20260527111756.1306022-3-saisneha196@gmail.com> <d1023d5b6fa9f1ba8173d685c633c04a7b1a169e.camel@pbarker.dev>
 <CANcU11d7bw=-B88ngyuHaYTKPTYdEcHJ06kA-WTz1NtMc0ae+w@mail.gmail.com> <DB5PR02MB102132A5B94B4279D5091DE4EEF122@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102132A5B94B4279D5091DE4EEF122@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Sai Sneha <saisneha196@gmail.com>
Date: Wed, 3 Jun 2026 11:47:40 +0530
X-Gm-Features: AVHnY4LNUGCqohlVm3cJbCmkafpxoy_ig5OTPrNq2IMw6fcgA3z6Y0PxHmhRp8I
Message-ID: <CANcU11forz3NRGOThY26LLU44bHSb-_k6Zns3unqJwUvvQYBLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/4] base.bbclass: warn when SRCREV is
 missing for SCM URIs at parse time
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Paul Barker <paul@pbarker.dev>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"yoann.congal@smile.fr" <yoann.congal@smile.fr>, 
	"corentin.guillevic@smile.fr" <corentin.guillevic@smile.fr>, "martin@geanix.com" <martin@geanix.com>
Content-Type: multipart/alternative; boundary="0000000000003271bb0653536330"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 06:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238082

--0000000000003271bb0653536330
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Thank you for the thorough review. I clearly need to step back and
rethink the approach before sending more patches. I will continue
the discussion on the bug tracker.

Best regards,
Sai Sneha


On Wed, 3 Jun 2026 at 1:20=E2=80=AFAM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> I was under the impression that a tag=3D in the SRC_URI is there to
> complement the SRCREV, not replace it. I.e., SRCREV should always exist,
> and if a tag=3D also exists then it is verified that it matches the SRCRE=
V.
>
>
>
> //Peter
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *Sai Sneha via
> lists.openembedded.org
> *Sent:* den 2 juni 2026 08:39
> *To:* Paul Barker <paul@pbarker.dev>
> *Cc:* openembedded-core@lists.openembedded.org; yoann.congal@smile.fr;
> corentin.guillevic@smile.fr; martin@geanix.com
> *Subject:* Re: [OE-core] [PATCH v4 2/4] base.bbclass: warn when SRCREV is
> missing for SCM URIs at parse time
>
>
>
> Hi Paul,
>
> You were right to raise the tag=3D concern =E2=80=94 it turned out to be =
exactly the
> cause of the selftest failure reported by Mathieu. Recipes using tag=3D i=
n
> SRC_URI intentionally leave SRCREV empty, and my check was incorrectly
> treating this as missing.
>
> The fix adds tag=3D to the list of URI parameters that bypass the SRCREV
> check, alongside the existing rev=3D handling:
>
> if params.get('rev', '') or params.get('tag', ''):
> return ''
>
> I have verified the fix by running the full bbtests.BitbakeTests selftest
> suite =E2=80=94 32/33 passed. The one failure (test_image_manifest) requi=
res
> building a full image and fails due to network constraints in my
> environment, unrelated to this patch.
>
> I have sent v5 with this fix.
>
> Best regards,
> Sai Sneha
>
> On Thu, 28 May 2026 at 8:39=E2=80=AFPM, Paul Barker <paul@pbarker.dev> wr=
ote:
>
> On Wed, 2026-05-27 at 16:47 +0530, Sai Sneha via lists.openembedded.org
> wrote:
> > A recipe with a git:// (or other SCM) URI in SRC_URI must have a
> > corresponding SRCREV set. Without it, BitBake performs a live query
> > on the remote repository at every parse, breaking reproducibility
> > and causing parse failures under BB_NO_NETWORK=3D1.
> >
> > The trivial fix of checking SRCREV in insane.bbclass do_recipe_qa
> > fails because fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV
> > at parse time before QA checks run, causing a FetchError that halts
> > parsing entirely. This was identified in Corentin Guillevic's RFC
> > series and confirmed by Mathieu Dubois-Briand's autobuilder testing.
> >
> > The fix intercepts at the vardepvalue expansion point by introducing
> > check_srcrev_set() which uses the shared oe.qa.check_uri_srcrev()
> > helper. The function is called conditionally:
> >
> >   fetcher_hashes_dummyfunc[vardepvalue] =3D
> >     "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else ''}"
> >
> > Note on design choice: we intentionally use d.getVar(candidate, False)
> > in oe.qa.check_uri_srcrev() rather than srcrev_internal_helper()
> > because the latter expands SRCREV, triggering get_autorev() and live
> > network fetches -- the exact problem this patch fixes.
> >
> > Note: parse-time warnings intentionally complement the QA-time warnings
> > added in insane.bbclass. This is necessary because CI pipelines running
> > 'bitbake --parse-only' with BB_NO_NETWORK=3D1 (the original motivation
> > from Ross Burton) would miss the issue entirely if only QA-time
> > warnings existed. This pattern is already established in the codebase
> > (e.g. src-uri-bad fires at both parse and QA time).
> >
> > Reported-by: Yoann Congal <yoann.congal@smile.fr>
> > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
> > AI-Generated: Developed with assistance from Anthropic Claude
> > Signed-off-by: Sai Sneha <saisneha196@gmail.com>
> > ---
> >
> > Changes in v4:
> > - Refactored to use shared oe.qa.check_uri_srcrev() helper
> > - Eliminates duplicated URI parsing logic
> > - Added docstring explaining True/False return values
> >
> > Changes in v3:
> > - Added AI-Generated disclosure and Reported-by tag
> > - Added design decision notes to commit message
> >
> > Changes in v2:
> > - Initial public submission
> >  meta/classes-global/base.bbclass | 30 ++++++++++++++++++++++++++++--
> >  1 file changed, 28 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes-global/base.bbclass
> b/meta/classes-global/base.bbclass
> > index 62f2814bb7..7de896ca7d 100644
> > --- a/meta/classes-global/base.bbclass
> > +++ b/meta/classes-global/base.bbclass
> > @@ -164,14 +164,40 @@ def setup_hosttools_dir(dest, toolsvar, d,
> fatal=3DTrue):
> >
> >      if notfound and fatal:
> >          bb.fatal("The following required tools (as specified by
> HOSTTOOLS) appear to be unavailable in PATH, please install them in order
> to proceed:\n  %s" % " ".join(notfound))
> > +
> > +def check_srcrev_set(d):
> > +    """
> > +    Inspect SRC_URI for SCM URIs missing a valid SRCREV.
> > +
> > +    Returns True if all SCM URIs have a valid SRCREV or AUTOREV set,
> > +    allowing get_hashvalue(d) to proceed normally.
> > +
> > +    Returns False if any SCM URI is missing SRCREV, suppressing
> > +    get_hashvalue(d) to prevent a FetchError parse crash.
> > +    """
> > +    import oe.qa
> > +    src_uri =3D (d.getVar('SRC_URI', False) or '').split()
> > +    pn =3D d.getVar('PN')
> > +    for uri in src_uri:
> > +        rev =3D oe.qa.check_uri_srcrev(pn, uri, d)
> > +        if rev is None:
> > +            # SRCREV missing =E2=80=94 warn and suppress hash expansio=
n
> > +            if bb.utils.contains('ERROR_QA', 'missing-srcrev', True,
> False, d):
> > +                bb.error("%s: SRCREV not set for %s" % (pn, uri))
> > +            elif bb.utils.contains('WARN_QA', 'missing-srcrev', True,
> False, d):
> > +                bb.warn("%s: SRCREV not set for %s" % (pn, uri))
> > +            return False
> > +        if rev and '${AUTOREV}' in rev:
> > +            return True
> > +    return True
> > +
> >
> >  # We can't use vardepvalue against do_fetch directly since that would
> overwrite
> >  # the other task dependencies so we use an indirect function.
> >  python fetcher_hashes_dummyfunc() {
> >      return
> >  }
> > -fetcher_hashes_dummyfunc[vardepvalue] =3D "${@bb.fetch.get_hashvalue(d=
)}"
> > -
> > +fetcher_hashes_dummyfunc[vardepvalue] =3D "${@bb.fetch.get_hashvalue(d=
)
> if check_srcrev_set(d) else ''}"
>
> How confident are you that this is a safe change to make?
>
> This is an area where I would not make AI-driven changes myself, as a
> change here could cause quite subtle issues. We may not have sufficient
> test coverage to catch such issues.
>
> Specifically, what happens if a SRC_URI has a 'tag=3D...' property, SRCRE=
V
> is not set, and the tag is changed upstream?
>
> Best regards,
>
> --
> Paul Barker
>
>

--0000000000003271bb0653536330
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit">Hi all,<br style=3D"font-size:inherit=
"><br style=3D"font-size:inherit">Thank you for the thorough review. I clea=
rly need to step back and <br style=3D"font-size:inherit">rethink the appro=
ach before sending more patches. I will continue <br style=3D"font-size:inh=
erit">the discussion on the bug tracker.<br style=3D"font-size:inherit"><br=
 style=3D"font-size:inherit">Best regards,<br style=3D"font-size:inherit">S=
ai Sneha<br style=3D"font-size:inherit"></div><br></div><div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, 3 Jun 2026 at 1:20=E2=80=AFAM, Peter Kjellerstedt &lt;<a href=3D"=
mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"SV" link=3D"blue" vlink=3D"purple" style=3D"overflow-wrap: bre=
ak-word;">
<div class=3D"m_7808700450652846793WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">I was under the impression th=
at a tag=3D in the SRC_URI is there to complement the SRCREV, not replace i=
t. I.e., SRCREV
 should always exist, and if a tag=3D also exists then it is verified that =
it matches the SRCREV.</span></p></div></div><div lang=3D"SV" link=3D"blue"=
 vlink=3D"purple" style=3D"overflow-wrap: break-word;"><div class=3D"m_7808=
700450652846793WordSection1"><p class=3D"MsoNormal"><span lang=3D"EN-US" st=
yle=3D"font-size:11pt;font-family:Calibri,sans-serif;color:rgb(148,54,52)">=
<u style=3D"font-family:Calibri,sans-serif"></u><u style=3D"font-family:Cal=
ibri,sans-serif"></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u style=3D"font-family:Calib=
ri,sans-serif"></u>=C2=A0<u style=3D"font-family:Calibri,sans-serif"></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">//Peter<u style=3D"font-famil=
y:Calibri,sans-serif"></u><u style=3D"font-family:Calibri,sans-serif"></u><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u style=3D"font-family:Calib=
ri,sans-serif"></u>=C2=A0<u style=3D"font-family:Calibri,sans-serif"></u></=
span></p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;padding:0cm 0cm 0cm 4pt;border-color:currentcolor currentcolor=
 currentcolor blue">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;p=
adding:3pt 0cm 0cm;border-color:rgb(225,225,225) currentcolor currentcolor"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> <a href=3D"mailto:openembedd=
ed-core@lists.openembedded.org" target=3D"_blank" style=3D"font-family:Cali=
bri,sans-serif">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D=
"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank" style=
=3D"font-family:Calibri,sans-serif">openembedded-core@lists.openembedded.or=
g</a>&gt;
<b style=3D"font-family:Calibri,sans-serif">On Behalf Of </b>Sai Sneha via =
<a href=3D"http://lists.openembedded.org" target=3D"_blank" style=3D"font-f=
amily:Calibri,sans-serif">lists.openembedded.org</a><br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> den 2 juni 2026 08:39=
<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b> Paul Barker &lt;<a href=
=3D"mailto:paul@pbarker.dev" target=3D"_blank" style=3D"font-family:Calibri=
,sans-serif">paul@pbarker.dev</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Cc:</b> <a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank" style=3D"font-family=
:Calibri,sans-serif">openembedded-core@lists.openembedded.org</a>; <a href=
=3D"mailto:yoann.congal@smile.fr" target=3D"_blank" style=3D"font-family:Ca=
libri,sans-serif">yoann.congal@smile.fr</a>; <a href=3D"mailto:corentin.gui=
llevic@smile.fr" target=3D"_blank" style=3D"font-family:Calibri,sans-serif"=
>corentin.guillevic@smile.fr</a>; <a href=3D"mailto:martin@geanix.com" targ=
et=3D"_blank" style=3D"font-family:Calibri,sans-serif">martin@geanix.com</a=
><br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> Re: [OE-core] [PAT=
CH v4 2/4] base.bbclass: warn when SRCREV is missing for SCM URIs at parse =
time<u style=3D"font-family:Calibri,sans-serif"></u><u style=3D"font-family=
:Calibri,sans-serif"></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Hi Paul,<br>
<br>
You were right to raise the tag=3D concern =E2=80=94 it turned out to be ex=
actly=C2=A0the cause of the selftest failure reported by Mathieu. Recipes u=
sing=C2=A0tag=3D in SRC_URI intentionally leave SRCREV empty, and my check =
was incorrectly treating this as missing.<br>
<br>
The fix adds tag=3D to the list of URI parameters that bypass the SRCREV<br=
>
check, alongside the existing rev=3D handling:<br>
<br>
if params.get(&#39;rev&#39;, &#39;&#39;) or params.get(&#39;tag&#39;, &#39;=
&#39;):<br>
return &#39;&#39;<br>
<br>
I have verified the fix by running the full bbtests.BitbakeTests=C2=A0selft=
est suite =E2=80=94 32/33 passed. The one failure (test_image_manifest)=C2=
=A0requires building a full image and fails due to network constraints in m=
y environment, unrelated to this patch.<br>
<br>
I have sent v5 with this fix.<br>
<br>
Best regards,<br>
Sai Sneha<u></u><u></u></p>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal">On Thu, 28 May 2026 at 8:39<span style=3D"font-famil=
y:Arial,sans-serif">=E2=80=AF</span>PM, Paul Barker &lt;<a href=3D"mailto:p=
aul@pbarker.dev" target=3D"_blank">paul@pbarker.dev</a>&gt; wrote:<u></u><u=
></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0c=
m;border-color:currentcolor currentcolor currentcolor rgb(204,204,204)">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">On Wed, 2026-05-27 at 1=
6:47 +0530, Sai Sneha via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a><br>
wrote:<br>
&gt; A recipe with a git:// (or other SCM) URI in SRC_URI must have a<br>
&gt; corresponding SRCREV set. Without it, BitBake performs a live query<br=
>
&gt; on the remote repository at every parse, breaking reproducibility<br>
&gt; and causing parse failures under BB_NO_NETWORK=3D1.<br>
&gt; <br>
&gt; The trivial fix of checking SRCREV in insane.bbclass do_recipe_qa<br>
&gt; fails because fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV<br>
&gt; at parse time before QA checks run, causing a FetchError that halts<br=
>
&gt; parsing entirely. This was identified in Corentin Guillevic&#39;s RFC<=
br>
&gt; series and confirmed by Mathieu Dubois-Briand&#39;s autobuilder testin=
g.<br>
&gt; <br>
&gt; The fix intercepts at the vardepvalue expansion point by introducing<b=
r>
&gt; check_srcrev_set() which uses the shared oe.qa.check_uri_srcrev()<br>
&gt; helper. The function is called conditionally:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0fetcher_hashes_dummyfunc[vardepvalue] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"mailto:$%7b@bb.fetch.get_hashvalue=
(d)%20if%20check_srcrev_set(d)%20else%20&#39;&#39;%7d" target=3D"_blank">${=
@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else &#39;&#39;}</a>&quot=
;<br>
&gt; <br>
&gt; Note on design choice: we intentionally use d.getVar(candidate, False)=
<br>
&gt; in oe.qa.check_uri_srcrev() rather than srcrev_internal_helper()<br>
&gt; because the latter expands SRCREV, triggering get_autorev() and live<b=
r>
&gt; network fetches -- the exact problem this patch fixes.<br>
&gt; <br>
&gt; Note: parse-time warnings intentionally complement the QA-time warning=
s<br>
&gt; added in insane.bbclass. This is necessary because CI pipelines runnin=
g<br>
&gt; &#39;bitbake --parse-only&#39; with BB_NO_NETWORK=3D1 (the original mo=
tivation<br>
&gt; from Ross Burton) would miss the issue entirely if only QA-time<br>
&gt; warnings existed. This pattern is already established in the codebase<=
br>
&gt; (e.g. src-uri-bad fires at both parse and QA time).<br>
&gt; <br>
&gt; Reported-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr"=
 target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; Fixes: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
16051" target=3D"_blank">
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051</a><br>
&gt; AI-Generated: Developed with assistance from Anthropic Claude<br>
&gt; Signed-off-by: Sai Sneha &lt;<a href=3D"mailto:saisneha196@gmail.com" =
target=3D"_blank">saisneha196@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Changes in v4:<br>
&gt; - Refactored to use shared oe.qa.check_uri_srcrev() helper<br>
&gt; - Eliminates duplicated URI parsing logic<br>
&gt; - Added docstring explaining True/False return values<br>
&gt; <br>
&gt; Changes in v3:<br>
&gt; - Added AI-Generated disclosure and Reported-by tag<br>
&gt; - Added design decision notes to commit message<br>
&gt; <br>
&gt; Changes in v2:<br>
&gt; - Initial public submission<br>
&gt;=C2=A0 meta/classes-global/base.bbclass | 30 ++++++++++++++++++++++++++=
++--<br>
&gt;=C2=A0 1 file changed, 28 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/ba=
se.bbclass<br>
&gt; index 62f2814bb7..7de896ca7d 100644<br>
&gt; --- a/meta/classes-global/base.bbclass<br>
&gt; +++ b/meta/classes-global/base.bbclass<br>
&gt; @@ -164,14 +164,40 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=
=3DTrue):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if notfound and fatal:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;The following require=
d tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, pleas=
e install them in order to proceed:\n=C2=A0 %s&quot; % &quot; &quot;.join(n=
otfound))<br>
&gt; +=C2=A0 =C2=A0 <br>
&gt; +def check_srcrev_set(d):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 Inspect SRC_URI for SCM URIs missing a valid SRCREV.<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Returns True if all SCM URIs have a valid SRCREV or AUT=
OREV set,<br>
&gt; +=C2=A0 =C2=A0 allowing get_hashvalue(d) to proceed normally.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Returns False if any SCM URI is missing SRCREV, suppres=
sing<br>
&gt; +=C2=A0 =C2=A0 get_hashvalue(d) to prevent a FetchError parse crash.<b=
r>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 import <a href=3D"http://oe.qa" target=3D"_blank">oe.qa=
</a><br>
&gt; +=C2=A0 =C2=A0 src_uri =3D (d.getVar(&#39;SRC_URI&#39;, False) or &#39=
;&#39;).split()<br>
&gt; +=C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
&gt; +=C2=A0 =C2=A0 for uri in src_uri:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rev =3D oe.qa.check_uri_srcrev(pn, uri, d=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if rev is None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # SRCREV missing =E2=80=94 =
warn and suppress hash expansion<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.utils.contains(&#39;E=
RROR_QA&#39;, &#39;missing-srcrev&#39;, True, False, d):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quo=
t;%s: SRCREV not set for %s&quot; % (pn, uri))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif bb.utils.contains(&#39=
;WARN_QA&#39;, &#39;missing-srcrev&#39;, True, False, d):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot=
;%s: SRCREV not set for %s&quot; % (pn, uri))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if rev and &#39;${AUTOREV}&#39; in rev:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
&gt; +=C2=A0 =C2=A0 return True<br>
&gt; + <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # We can&#39;t use vardepvalue against do_fetch directly since t=
hat would overwrite<br>
&gt;=C2=A0 # the other task dependencies so we use an indirect function.<br=
>
&gt;=C2=A0 python fetcher_hashes_dummyfunc() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 }<br>
&gt; -fetcher_hashes_dummyfunc[vardepvalue] =3D &quot;<a href=3D"mailto:$%7=
b@bb.fetch.get_hashvalue(d)%7d" target=3D"_blank">${@bb.fetch.get_hashvalue=
(d)}</a>&quot;<br>
&gt; -<br>
&gt; +fetcher_hashes_dummyfunc[vardepvalue] =3D &quot;<a href=3D"mailto:$%7=
b@bb.fetch.get_hashvalue(d)%20if%20check_srcrev_set(d)%20else%20&#39;&#39;%=
7d" target=3D"_blank">${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) e=
lse &#39;&#39;}</a>&quot;<br>
<br>
How confident are you that this is a safe change to make?<br>
<br>
This is an area where I would not make AI-driven changes myself, as a<br>
change here could cause quite subtle issues. We may not have sufficient<br>
test coverage to catch such issues.<br>
<br>
Specifically, what happens if a SRC_URI has a &#39;tag=3D...&#39; property,=
 SRCREV<br>
is not set, and the tag is changed upstream?<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--0000000000003271bb0653536330--

