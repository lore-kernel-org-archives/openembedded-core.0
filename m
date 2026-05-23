Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEA9CD5BB8
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 01:45:31 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1210.1779500722732078624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 18:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bh9Q2x1D;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65eb226b1ceso2258494d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 18:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779500722; cv=none;
        d=google.com; s=arc-20240605;
        b=XelLaJl8mKGOAjBiDaY2zpQkE+0jot39lmQum32c/g/SLwgTZS0YusWSAbSY+9+BAw
         z5qpk/WK+47KMeQWu6quP2oawtPJQq1FHWfAEwfQDEhys6uIadUVOgjsgBjICMplQLt5
         OLdv9EK5CeC8u0a53vLpEKtwiun+pKH9lRQqJXjJrT5rMBNjEP7MbRKZsppU9m09qDR8
         q9XbwwjyFNmB3neuuAMVDGL/r5IdSaJu6AQsJXnw03snTSX8zt+DMAO7u7tt5v4Blarg
         JgCcCR/Ne6azBieH1n6IXPtSDhae1ej7EK64rUuM+NVCGW+Htg1CeD+vFrsWCMWV/0W6
         XADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EC6VaZ6EoS6TAyuqvkhc3mt34GHl+nYGQyrMUqnP+yk=;
        fh=lokdjCdjsyY6KjBfIJktI8BQ5vhRQ0H3tAEZGfjN5Hs=;
        b=iVnEvOcGfEvqr0MVMLNgqjqK1ohBvcdaaaLpMbyfZvuGVtQH96EkZG5X6ZgoHXGk7f
         rw+tHQAs4Y4KpjCzzphKTwXtWZf6rrAgIgccbjhDSxCoObRrUMYfOmNUZBuLb6Fjfusx
         oBeaQbngAVmf6fum3rb4oPpHv1ukhY2tyl+nBqPZ/EVbiBEgqA3+AdIcQUL3rZkKyLY+
         k5ra1/5TOFeWbAnRr0i0syojQHPXl0B4uLgxUsUKvK1vMewvpj8gohJ/qndAmP+Opwh0
         ddlWTDRnOxTo8c4llg4whDVQYL1VnubPBY8HlusWWt8hAauj/tOpABGg0Ozev94pxYdL
         bB3Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779500722; x=1780105522; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EC6VaZ6EoS6TAyuqvkhc3mt34GHl+nYGQyrMUqnP+yk=;
        b=bh9Q2x1DHyxcY6+ltUaYO8SIgsjlW892m3bPZ3TZ3c8oB6ti2tiNsM216KVypYOPMV
         /d2+V5rWdjcf9XLGGiUMzTal3rYSv8haxfNQKJrQxWyPK/H6phjkX74AIg16VzplVgx+
         uKkRMD+csuxkkBS8xUtwMywLLMFta51V8nQbwgwOAtZw7cE6kniQ7oSgPHol8KPoKabT
         L2iqAnV9Eg1vP/obGsGaeMYfq68Sdmxilx7ngZfc/ukEEVYrOSciA/23qf8NieShcUqr
         Ta8VN4CvEf6vzhQb4wepRwa2BlHyC6/nhgDN7rcUo9cven4pqZ5RH1myxCONCOC7/f2I
         rWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779500722; x=1780105522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EC6VaZ6EoS6TAyuqvkhc3mt34GHl+nYGQyrMUqnP+yk=;
        b=ljrjVn/Fz99hsHCg7dbTf4a7wposrcIe3PP6uOkSI27GclJEs07q65IVl/oAmrJwpA
         EVeMhCfS+cJO1JbQjBWbL4UYujG8YgcSdw0LfLyF1d7BVqRzy37kBG8UaMoXRVwpTmBi
         jb+l+VSGC+sXcpX+hqYR0DQuIxDnmKWiItP292VOvsnO4niL8tgsFMrsp6NWwlYF4Li5
         wpjE442n0iq7/v+Y0nJJ5ri154FbCp8xvJDxeakv16qdMPkDp8P2woOlKcf8oKtMsd7j
         4CXezHnAaOKP1tdH+RvmAt0NP4HYDxlwtmMazGRdPCUgU4PtbeCerlOetVasLfRXXFbw
         6EnQ==
X-Gm-Message-State: AOJu0Ywu/BjPCoEd3cSx7CN5nTV4WqJjVXiBBDvfH+7tzBANV4eL6HpO
	OhzVGqVBWmPSGjxcb5D3ckROmaFzzFuAoAlWL1bZaQPIR8Gh7Ijs1+KBVRgarl+LQkEbhf5voHs
	U2uuLsTcuRNl4bih0WY0xekI8VQW2rC95832Y
X-Gm-Gg: Acq92OGwD0bzawqG3tUWPfDf4pQ8wGHmE+VMvxzm+vxBh+YUnQUkqEaYPMPtP39Nely
	CQW+q1tENfwDtCvgLRoSJpix2Y9ryO420MzzAd9+1mroQWlNLbPwt9Fj+tAl4q3tebKSOtyLRul
	6FWZEfB+Klm3S0xyFo3GodOmt1apdmFhdlDaiBLXphHRSwsgmgRhIGSBNSZokDl6ZAJqu1IqdPp
	nlqr0aggTbeMVogVOP56OTJwrZfyvlUWEQIAUaK+ETcQS1h1FmzeVorTkRGFh8Z4jaOZ3aysFC2
	TPHQswHXv0ODMCjmUaVuKg1q0afquax+eU1TFCoMxc/xqDZlH2I0Y9p49ftOIyV4kFqN7q+JjgN
	SnoMR6vUhYLKoxeJ5pv6Zfyrjno3KInyeRnHHdqrgq2GuteXG4itlRuhqzs6m/VqAL4ov4M4JTM
	hBI+u8
X-Received: by 2002:a53:e237:0:b0:64e:8b35:e24 with SMTP id
 956f58d0204a3-65ec97dcb2cmr4592566d50.29.1779500721773; Fri, 22 May 2026
 18:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com> <20260519072534.24588-12-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260519072534.24588-12-Hemanth.KumarMD@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 May 2026 18:44:55 -0700
X-Gm-Features: AVHnY4K8aQ1chhJGdT52RALY0y7GK93tjwU3tYOTSRiRSIS2uXfB68F03nxiqsI
Message-ID: <CAMKF1spE4vkhsNNiG+bM5Ro8XCgZpgNDDYNv-=hzFfqC0LGJUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 11/12] libc-test: add libatomic-staticdev to
 ptest RDEPENDS
To: Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	Randy.MacLeod@windriver.com
Content-Type: multipart/alternative; boundary="0000000000006621c90652724c4b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 May 2026 01:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237560

--0000000000006621c90652724c4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:26=E2=80=AFAM Hemanth Kumar M D via
lists.openembedded.org <Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.=
org>
wrote:

> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> GCC 16 adds libatomic_asneeded.a which is required when statically
> linking. The libc-test static tests fail on musl without it. Add
> libatomic-staticdev alongside musl-staticdev for the same reason.
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
>  meta/recipes-core/musl/libc-test_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/musl/libc-test_git.bb
> b/meta/recipes-core/musl/libc-test_git.bb
> index 9d159ea9d2..d9999ec377 100644
> --- a/meta/recipes-core/musl/libc-test_git.bb
> +++ b/meta/recipes-core/musl/libc-test_git.bb
> @@ -36,6 +36,7 @@ RDEPENDS:${PN} =3D " \
>
>  RDEPENDS:${PN}-ptest =3D " \
>       ${PN} \
> +     libatomic-staticdev \
>

clang wont need it.


>       locale-base-en-us \
>       musl-staticdev \
>       sed \
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237286):
> https://lists.openembedded.org/g/openembedded-core/message/237286
> Mute This Topic: https://lists.openembedded.org/mt/119387084/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006621c90652724c4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 19,=
 2026 at 12:26=E2=80=AFAM Hemanth Kumar M D via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;Hemanth.KumarMD=3D<a href=3D"=
mailto:windriver.com@lists.openembedded.org">windriver.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@windriv=
er.com" target=3D"_blank">Hemanth.KumarMD@windriver.com</a>&gt;<br>
<br>
GCC 16 adds libatomic_asneeded.a which is required when statically<br>
linking. The libc-test static tests fail on musl without it. Add<br>
libatomic-staticdev alongside musl-staticdev for the same reason.<br>
<br>
Signed-off-by: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@wind=
river.com" target=3D"_blank">Hemanth.KumarMD@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://libc-test_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libc-test_git.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/musl/<a href=3D"http://libc-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libc-test_git.bb</a> b/meta/recipes-core/=
musl/<a href=3D"http://libc-test_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">libc-test_git.bb</a><br>
index 9d159ea9d2..d9999ec377 100644<br>
--- a/meta/recipes-core/musl/<a href=3D"http://libc-test_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libc-test_git.bb</a><br>
+++ b/meta/recipes-core/musl/<a href=3D"http://libc-test_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libc-test_git.bb</a><br>
@@ -36,6 +36,7 @@ RDEPENDS:${PN} =3D &quot; \<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 ${PN} \<br>
+=C2=A0 =C2=A0 =C2=A0libatomic-staticdev \<br></blockquote><div><br></div><=
div>clang wont need it.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 locale-base-en-us \<br>
=C2=A0 =C2=A0 =C2=A0 musl-staticdev \<br>
=C2=A0 =C2=A0 =C2=A0 sed \<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#237286): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/237286" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/237286</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119387084/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119387084/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006621c90652724c4b--

