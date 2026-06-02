Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB88CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:57:48 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19053.1780383462790457016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cv+aFTcN;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: saisneha196@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68ae265815aso8513283a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 23:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780383461; cv=none;
        d=google.com; s=arc-20240605;
        b=YOYOKUQf4azNgFIV1iplcdLD3l5zQNBu7wb39uy/hV6sKRxn80uh49nfbHIK4b3U8Y
         JhGzuqdojnTvlRmEUg98gytPx4YM2dszWI2P1imnvNL+dwLc1ttbU30muu48xstwj+3/
         CsxPnm5Tm8BHPf1i6XlKt4e6wdpxZkUrK+TDSI0wi5kf0wmb3Gw3mE+ks9F1a28Apfa/
         ofi6M/9zxhSZE4ZHu0CcNrbY3NmL80mF7S3HFMrS7VwGJKHnkWMiDd+pSXi7q9NVBP9o
         Uj1RY+Fx8JVBoK3nDnl9qL6qci7ZFIKmLQNd6jaGzETrQNBBAcPNNTBSv4AX7ZIUJOR4
         RfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L18LSzl4KSFTAuYPyg9XoFMt8GAcLkazaj6K89aVTW4=;
        fh=6xGPmAnN1hhcKnxbEIJO+Z/zx/VUorFs3705yHFJ6pE=;
        b=adlewAPZCp3Rqcv/DxkmP8YXdM5wLIgF9r3zUbOXgwSrG52nNVlFkpFyo6vs4b6DAL
         SvGMz80FXaIbTke9pnGKc1v4ORQx1ZNnDewtYkTuJsVN+nRXR8tZtB8KQPy9noMeN0AY
         fjhAmQYrDF56QHOFG3+h1HdfFI/WGWXXRzEQlLyJfSONWjMA9KoaBnRJCiSE8fykkWZq
         jIQRv68i2YsmxiLBcg84P2wGFqY5PLreMQy/LsrUsKGWgYLXhO9py1tKfsXDeXgaJ4UV
         KMoD2AL6mQP7Wi3yewud/M2khfPkie8Hw7NIQa+8rak2ZNr9ID2ALy/MiYZFq2xT8g7S
         L0PQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780383461; x=1780988261; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L18LSzl4KSFTAuYPyg9XoFMt8GAcLkazaj6K89aVTW4=;
        b=cv+aFTcNYhzana2O9DfOMGKExuioPghrYihHhHdOghetIueCB75aARTPAZoOpD/GoX
         1U2IyT1zxefjYO98MkR5nH0DHIefjadqgXF0x8ndCevz/g4Qo6TgbkP+PC1TyBCgmzBr
         6V2OCy8Sufi6QNQXgrUtWdrAYL1HJKeweyF4Tg9vz/Y0O8z11MLmAbPxVlCr1sDaZd5/
         0gtdsY8SlXnbotG1rKn4/d7XYpqxtyIeJfMCP/acD5+9KcfpKwfiIgV8JqLgykSEkyh4
         owhAJupdMSQ2QyaEpG5FI1MmVIXYnCwyA09GaI+GczHmfRF3b46vkBbpCybya3mU5aLw
         8a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780383461; x=1780988261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L18LSzl4KSFTAuYPyg9XoFMt8GAcLkazaj6K89aVTW4=;
        b=HvZSKm0E63aI+oIvjjRijRqV7/xpCYRwBTXbA140ZCATBwAQe/dbz1+w1CRTDLf/IW
         qbzSgwRk+65cmnCu7RXJBRO67SXGgvKRWAJvU254yPZXTwTkg3K7rvLimgONUyYLzhuh
         Y2VLQlKmhcoM7hbsJG6qn5WkNPpD/GsRJW1LA0qjIaS4pUpa/6w5Yyd9bwLVJwCUvW/v
         NFZ2zadmf7sChqDJ/BU0Yu4OD4VwLiLe4YZK2cRIHn1Lk9iN+bItgUgG6+zsBO1PSAVU
         5GapUn8pa2cVCsFetHfZnSQR9h+SUbrnvu0nuW6blDwCmG6FDG5/AXzg0oSUOej0o8JX
         NvzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TstuWkII4TrjOXd05J3KhocDJvz9jUTS4JG3SIQX7FVHTQwjYFltV6tsiDMdzYmMqrxP7L8V/350o0yuKhRSVBg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxDdziHN8mL5lWbbu3DE1r+G8aNV9YF6H9yTrYxC9h9ZnacLrgg
	vg6WziijqOJUv08OkwHonmgsPreQL4DqQoFG02OhikZj+TZxn3+cAi59eGIfYaBj3K6qRmT7vxv
	6KsNbE5OXRbg1+CSSZ/ezpRLv/kUxp3og0A==
X-Gm-Gg: Acq92OFwwyeGrgM4vNOj1yoh4zAG+dKOp18g6cdE5F7Jv5M0inOehNfAc1OWHV9Qyrt
	sODfvzISTquZ46npX9EXOIlhdMJh2nrdDX2UsoZkjZtjA2KEPpxR2iJj/wQZ1MpcDyjoNGCpBqW
	bmLQ1QeJmEe2X1CIFzwiipCPTGvuy9DJe3MtyO5mG+YISqQ7SIqHpHpFNlfzf+VxP/wxIBmIFca
	/5k9srmQFT2atshx6sCemeHtxsL9wDQwOkvA/+FzEvGyaSeo8gCPEqB7hAyvFN3sbrJQZdPmMLn
	qYAbWtSEXHUxlxuOwpM2k3rPChTMiqyHWTE5uNR9xoSbQVb8qg==
X-Received: by 2002:a17:907:75da:b0:bec:b177:c346 with SMTP id
 a640c23a62f3a-becb177c87amr347529066b.3.1780383460632; Mon, 01 Jun 2026
 23:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260527111756.1306022-1-saisneha196@gmail.com>
 <20260527111756.1306022-3-saisneha196@gmail.com> <d1023d5b6fa9f1ba8173d685c633c04a7b1a169e.camel@pbarker.dev>
 <18B5305B60AFB2AF.3644386@lists.openembedded.org>
In-Reply-To: <18B5305B60AFB2AF.3644386@lists.openembedded.org>
From: Sai Sneha <saisneha196@gmail.com>
Date: Tue, 2 Jun 2026 12:27:26 +0530
X-Gm-Features: AVHnY4J8G9R07MrRzBJU7Z2pWXHA6HwWQeQhECgwN3M1n8GAQNhkpuI4tjTpHts
Message-ID: <CANcU11djwrDy-6gD=XZNoLLpnvcDwwqN8D6gyX_zecCUJH6qaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/4] base.bbclass: warn when SRCREV is
 missing for SCM URIs at parse time
To: saisneha196@gmail.com
Cc: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org, 
	yoann.congal@smile.fr, corentin.guillevic@smile.fr, martin@geanix.com
Content-Type: multipart/alternative; boundary="000000000000bc2b0006533fd382"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 06:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238008

--000000000000bc2b0006533fd382
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

One more thing I wanted to address, your concern about AI-driven  changes
in this sensitive area.

I understand the concern and I think it is valid. The tag=3D bug that
was caught validates your point, AI-assisted code can miss edge
cases. That is precisely why I disclosed the AI involvement honestly,
and why your review was valuable in catching it.

To be clear about my role: I used Claude as a development aid, not
as a replacement for my own judgment. Every design decision, test,
and fix was made by me personally. I reproduced the selftest failure
locally, identified the root cause, and applied the correct fix.

I have now run the full bbtests.BitbakeTests suite (32/33 passing).
If there are specific additional scenarios you would like me to verify, I
am happy to do so.

Best regards,
Sai Sneha

On Tue, 2 Jun 2026 at 12:09=E2=80=AFPM, Sai Sneha via lists.openembedded.or=
g
<saisneha196=3Dgmail.com@lists.openembedded.org> wrote:

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
> On Thu, 28 May 2026 at 8:39=E2=80=AFPM, Paul Barker <paul@pbarker.dev> wr=
ote:
>
>> On Wed, 2026-05-27 at 16:47 +0530, Sai Sneha via lists.openembedded.org
>> wrote:
>> > A recipe with a git:// (or other SCM) URI in SRC_URI must have a
>> > corresponding SRCREV set. Without it, BitBake performs a live query
>> > on the remote repository at every parse, breaking reproducibility
>> > and causing parse failures under BB_NO_NETWORK=3D1.
>> >
>> > The trivial fix of checking SRCREV in insane.bbclass do_recipe_qa
>> > fails because fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV
>> > at parse time before QA checks run, causing a FetchError that halts
>> > parsing entirely. This was identified in Corentin Guillevic's RFC
>> > series and confirmed by Mathieu Dubois-Briand's autobuilder testing.
>> >
>> > The fix intercepts at the vardepvalue expansion point by introducing
>> > check_srcrev_set() which uses the shared oe.qa.check_uri_srcrev()
>> > helper. The function is called conditionally:
>> >
>> >   fetcher_hashes_dummyfunc[vardepvalue] =3D
>> >     "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else ''}"
>> >
>> > Note on design choice: we intentionally use d.getVar(candidate, False)
>> > in oe.qa.check_uri_srcrev() rather than srcrev_internal_helper()
>> > because the latter expands SRCREV, triggering get_autorev() and live
>> > network fetches -- the exact problem this patch fixes.
>> >
>> > Note: parse-time warnings intentionally complement the QA-time warning=
s
>> > added in insane.bbclass. This is necessary because CI pipelines runnin=
g
>> > 'bitbake --parse-only' with BB_NO_NETWORK=3D1 (the original motivation
>> > from Ross Burton) would miss the issue entirely if only QA-time
>> > warnings existed. This pattern is already established in the codebase
>> > (e.g. src-uri-bad fires at both parse and QA time).
>> >
>> > Reported-by: Yoann Congal <yoann.congal@smile.fr>
>> > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
>> > AI-Generated: Developed with assistance from Anthropic Claude
>> > Signed-off-by: Sai Sneha <saisneha196@gmail.com>
>> > ---
>> >
>> > Changes in v4:
>> > - Refactored to use shared oe.qa.check_uri_srcrev() helper
>> > - Eliminates duplicated URI parsing logic
>> > - Added docstring explaining True/False return values
>> >
>> > Changes in v3:
>> > - Added AI-Generated disclosure and Reported-by tag
>> > - Added design decision notes to commit message
>> >
>> > Changes in v2:
>> > - Initial public submission
>> >  meta/classes-global/base.bbclass | 30 ++++++++++++++++++++++++++++--
>> >  1 file changed, 28 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/classes-global/base.bbclass
>> b/meta/classes-global/base.bbclass
>> > index 62f2814bb7..7de896ca7d 100644
>> > --- a/meta/classes-global/base.bbclass
>> > +++ b/meta/classes-global/base.bbclass
>> > @@ -164,14 +164,40 @@ def setup_hosttools_dir(dest, toolsvar, d,
>> fatal=3DTrue):
>> >
>> >      if notfound and fatal:
>> >          bb.fatal("The following required tools (as specified by
>> HOSTTOOLS) appear to be unavailable in PATH, please install them in orde=
r
>> to proceed:\n  %s" % " ".join(notfound))
>> > +
>> > +def check_srcrev_set(d):
>> > +    """
>> > +    Inspect SRC_URI for SCM URIs missing a valid SRCREV.
>> > +
>> > +    Returns True if all SCM URIs have a valid SRCREV or AUTOREV set,
>> > +    allowing get_hashvalue(d) to proceed normally.
>> > +
>> > +    Returns False if any SCM URI is missing SRCREV, suppressing
>> > +    get_hashvalue(d) to prevent a FetchError parse crash.
>> > +    """
>> > +    import oe.qa
>> > +    src_uri =3D (d.getVar('SRC_URI', False) or '').split()
>> > +    pn =3D d.getVar('PN')
>> > +    for uri in src_uri:
>> > +        rev =3D oe.qa.check_uri_srcrev(pn, uri, d)
>> > +        if rev is None:
>> > +            # SRCREV missing =E2=80=94 warn and suppress hash expansi=
on
>> > +            if bb.utils.contains('ERROR_QA', 'missing-srcrev', True,
>> False, d):
>> > +                bb.error("%s: SRCREV not set for %s" % (pn, uri))
>> > +            elif bb.utils.contains('WARN_QA', 'missing-srcrev', True,
>> False, d):
>> > +                bb.warn("%s: SRCREV not set for %s" % (pn, uri))
>> > +            return False
>> > +        if rev and '${AUTOREV}' in rev:
>> > +            return True
>> > +    return True
>> > +
>> >
>> >  # We can't use vardepvalue against do_fetch directly since that would
>> overwrite
>> >  # the other task dependencies so we use an indirect function.
>> >  python fetcher_hashes_dummyfunc() {
>> >      return
>> >  }
>> > -fetcher_hashes_dummyfunc[vardepvalue] =3D "${@bb.fetch.get_hashvalue(=
d)}"
>> > -
>> > +fetcher_hashes_dummyfunc[vardepvalue] =3D "${@bb.fetch.get_hashvalue(=
d)
>> if check_srcrev_set(d) else ''}"
>>
>> How confident are you that this is a safe change to make?
>>
>> This is an area where I would not make AI-driven changes myself, as a
>> change here could cause quite subtle issues. We may not have sufficient
>> test coverage to catch such issues.
>>
>> Specifically, what happens if a SRC_URI has a 'tag=3D...' property, SRCR=
EV
>> is not set, and the tag is changed upstream?
>>
>> Best regards,
>>
>> --
>> Paul Barker
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238005):
> https://lists.openembedded.org/g/openembedded-core/message/238005
> Mute This Topic: https://lists.openembedded.org/mt/119510786/10302268
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> saisneha196@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bc2b0006533fd382
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div></div><div style=3D"font-size:inherit" dir=3D"auto">Hi Paul,<br style=
=3D"font-size:inherit"><br style=3D"font-size:inherit">One more thing I wan=
ted to address, your concern about AI-driven =C2=A0changes in this sensitiv=
e area.<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">I un=
derstand the concern and I think it is valid. The tag=3D bug that <br style=
=3D"font-size:inherit">was caught validates your point,=C2=A0<span style=3D=
"font-size:inherit">AI-assisted code can miss edge=C2=A0</span></div><div s=
tyle=3D"font-size:inherit" dir=3D"auto">cases. That is precisely why I disc=
losed the AI involvement honestly, <br style=3D"font-size:inherit">and why =
your review was valuable in catching it.<br style=3D"font-size:inherit"><br=
 style=3D"font-size:inherit">To be clear about my role: I used Claude as a =
development aid, not <br style=3D"font-size:inherit">as a replacement for m=
y own judgment. Every design decision, test, <br style=3D"font-size:inherit=
">and fix was made by me personally. I reproduced the selftest failure <br =
style=3D"font-size:inherit">locally, identified the root cause, and applied=
 the correct fix.<br style=3D"font-size:inherit"><br style=3D"font-size:inh=
erit">I have now run the full bbtests.BitbakeTests suite (32/33 passing). <=
br style=3D"font-size:inherit">If there are specific additional scenarios y=
ou would like me to verify, I am happy to do so.<br style=3D"font-size:inhe=
rit"><br style=3D"font-size:inherit">Best regards,<br style=3D"font-size:in=
herit">Sai Sneha</div><div style=3D"font-size:inherit" dir=3D"auto"><br></d=
iv><div style=3D"font-size:inherit" dir=3D"auto">On Tue, 2 Jun 2026 at 12:0=
9=E2=80=AFPM, Sai Sneha via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;saisneha196=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:</div><div>=
<div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div></div><div style=3D"font-size:inherit" dir=3D"=
auto">Hi Paul,<br style=3D"font-size:inherit"><br style=3D"font-size:inheri=
t">You were right to raise the tag=3D concern =E2=80=94 it turned out to be=
 exactly=C2=A0the cause of the selftest failure reported by Mathieu. Recipe=
s using=C2=A0tag=3D in SRC_URI intentionally leave SRCREV empty, and my che=
ck was incorrectly treating this as missing.<br style=3D"font-size:inherit"=
><br style=3D"font-size:inherit">The fix adds tag=3D to the list of URI par=
ameters that bypass the SRCREV<br style=3D"font-size:inherit">check, alongs=
ide the existing rev=3D handling:<br style=3D"font-size:inherit"><br style=
=3D"font-size:inherit">  if params.get(&#39;rev&#39;, &#39;&#39;) or params=
.get(&#39;tag&#39;, &#39;&#39;):<br style=3D"font-size:inherit">      retur=
n &#39;&#39;<br style=3D"font-size:inherit"><br style=3D"font-size:inherit"=
>I have verified the fix by running the full bbtests.BitbakeTests=C2=A0self=
test suite =E2=80=94 32/33 passed. The one failure (test_image_manifest)=C2=
=A0requires building a full image and fails due to network constraints in m=
y environment, unrelated to this patch.<br style=3D"font-size:inherit"><br =
style=3D"font-size:inherit">I have sent v5 with this fix.<br style=3D"font-=
size:inherit"><br style=3D"font-size:inherit">Best regards,<br style=3D"fon=
t-size:inherit">Sai Sneha<br style=3D"font-size:inherit"></div><div><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 28 May 20=
26 at 8:39=E2=80=AFPM, Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" =
target=3D"_blank">paul@pbarker.dev</a>&gt; wrote:<br></div></div></div><div=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Wed, 2026-05-27 at 16:47 +0530, Sai Sneha via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a><br>
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
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${@bb.fetch.get_hashvalue(d) if check_srcrev_=
set(d) else &#39;&#39;}&quot;<br>
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
16051" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D16051</a><br>
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
&gt; +=C2=A0 =C2=A0 import <a href=3D"http://oe.qa" rel=3D"noreferrer" targ=
et=3D"_blank">oe.qa</a><br>
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
&gt; -fetcher_hashes_dummyfunc[vardepvalue] =3D &quot;${@bb.fetch.get_hashv=
alue(d)}&quot;<br>
&gt; -<br>
&gt; +fetcher_hashes_dummyfunc[vardepvalue] =3D &quot;${@bb.fetch.get_hashv=
alue(d) if check_srcrev_set(d) else &#39;&#39;}&quot;<br>
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
Paul Barker<br>
<br>
</blockquote></div></div><div><div class=3D"gmail_quote"></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#238005): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/238005" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/238005</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119510786/103=
02268" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/119510786/10302268</a><br>
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

--000000000000bc2b0006533fd382--

