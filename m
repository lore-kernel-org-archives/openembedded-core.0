Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF579C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 08:01:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51640.1782547304451899021
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 01:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u5vHVqiD;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4720d22c94aso36750f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 01:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782547303; cv=none;
        d=google.com; s=arc-20260327;
        b=dGtenapn4Z6q0c9PXxNBFnIbtydwYpe9e1LuIfMnCzOLqzxaEgCLh9MMlj+31HpwAR
         LCGn1LjEX8WWJlVhkIvqc7FHb5iTjdm8NC9N18aEzQZlS9jdfFsZhn4n7ysGaw6fEULY
         CTuExhdVl9LWs9fTCpxTTCR4npVyZvr2gT9MxiOOhoC2Dvh2QsWVqv5DAMik6W5BdsEq
         oLIn5uYiUmZFT7hxV492cnI/v67Umycic8XPqfybqZNdP7BLlVioPr7jkM9rr2fKSVM6
         z1IIExEEIHA970iP5CnvP9RgTar4vCp79MqzNzPfNtfS2YeMqgQjnMwAn1xezDkx5gxB
         9uMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=82tSzRV8lKaa4nSfAmxPOnQuGlaW27z3YNAzW6rGXFw=;
        fh=50fgw5/+oHw4mAwr3EiQ6PlEePgjFmbILTGVzKCgRhA=;
        b=S6jfWA3K8mrcrIi8CQKzBD67DBmqF0VXkMDVDrVMhcAwkF5kcldVgIb99PeVYtuan3
         LO6D+zoSUt4JrbkNxK0bocltGnKtytAqg5rDSP81pbV3LSMMfkIzgG+oUzHOYJF0/kl4
         OCkD+TFuShVP3lQygpVzK3M0enAjW0k51YIFY6fSmVZfd/B1C4oR8yfJKYafce59lueb
         iCKB9hkP61XcHCMRCtI9MS0Arwit3fVmokKQt3Zd0FxyLyUJbyGQ4XICOJL6dfPlv6ZL
         ey9KCfWYBjYJzWIt8a5Ot+n2TWRLft5dbcquqGUCaMh85lUcNUl9LIycBSgurLCnuWLL
         5HRg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782547303; x=1783152103; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=82tSzRV8lKaa4nSfAmxPOnQuGlaW27z3YNAzW6rGXFw=;
        b=u5vHVqiDatKbmx+yZiNvGoxJlyEEcgudqmPz1JG9farArbCcDIwNmkT5rDlozG/Mnd
         0h+7rxU5H1AOsnxWjr6ZyZMtnkC3/WDKpRzcR0OEbjnku+71a3NGfwixej3D7c39hw+N
         0XtBLJWogf1PB+rInJZz2t8L/i6ot5gJNQ9RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782547303; x=1783152103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82tSzRV8lKaa4nSfAmxPOnQuGlaW27z3YNAzW6rGXFw=;
        b=mRMIYrzHsvExUmwDQabnr0rDS/yDXwZ5IWRjm1sToXGFni+jO/brhwmm0LIZqKL+wo
         vHqX7gj6dUfzOIbomn6b+bHbbYh04hktO3e5XLigDQAybNaU07A2IY+a7V7/PsPjieEE
         /OPkjkfAdZbpw0dKHllVhb3NjrSATDHd8mKXWNXZ9esA5CJ2PRUQTwizIp+2KPI/94nJ
         V4btkQtFuTywLarXVVdeAw4dtxHT7S/1GR3ieTBHQqrKP+77g5CyohwazJZJwDTPPD9u
         4W27OTbfwMzn0IQhL9C3lv80ZzGz33+DXtxAab3AZkuN5+e2gYtyhwJlBKAhD5ofS69B
         2j9Q==
X-Gm-Message-State: AOJu0YyMPjuXDUmInS+jdQjp9LF9V0svMIsgawPDjWc7VfdCGrvAC9as
	MaaxWfLNxpTrUZsAKWQ3Jzk3/me3NlZFNTKLCwG21LZBWcG2tqMvMY7suqH5mUIIG5o2mf/E++2
	ozv6x7NhV/o+0GmNYgigav6bq/2FYzRReAbEFeQaHwA==
X-Gm-Gg: AfdE7ckT/tSpa21WqYSGun+BnjfpD34aCcoXgyr/jVv4gdsifdZDSlMmOi/QjzLVxcQ
	X+YrjGv6+QBbkpBslt2q2vbMPAHtHqZUIvEyY2tLiBk6q2sfdGTbVURc5PPnZKhi07fUI5fzf9c
	5ndL/tVW/Y5Q1ykiYCdCGCXTfijnn9tdqJNbP4XdUnf1LtUgIEy1BQwyeuZsGk7DtPLQeaCmllX
	x/cdU+nlBUzZrvzExvgLsWhgLq00wlvb+yG7Stbej9xL4n1s1FKUnjfn+YA5rem6Oo2E+prJjqF
	LMNDGfy81zS7iCmsj6cscTKJCUoxvw==
X-Received: by 2002:a05:6000:2889:b0:471:f180:86dd with SMTP id
 ffacd0b85a97d-471f18088f1mr531046f8f.41.1782547299405; Sat, 27 Jun 2026
 01:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260622093400.2735723-1-daniel.turull@ericsson.com>
 <DJJCWETHYRIH.1MYP9M9XYIZAS@smile.fr> <PA3PR07MB107219471CE7CCEF801347F1F8AEA2@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: <PA3PR07MB107219471CE7CCEF801347F1F8AEA2@PA3PR07MB10721.eurprd07.prod.outlook.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 27 Jun 2026 10:01:27 +0200
X-Gm-Features: AVVi8Cdn76sxYDWBSP4Q2XNNtNYotYmi9-0w5YiQ7sDzBuCSyMbu9tP9SSC2QIs
Message-ID: <CAMSfU+7XmxeRW9EG779e0Uu_EtE=1xHJi8DcLaq3Oj1X1Y05pg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap] [patch] libssh2: fix CVE-2026-55200
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, anders.heimer@est.tech
Content-Type: multipart/alternative; boundary="00000000000093a37d065537a271"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 08:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239693

--00000000000093a37d065537a271
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 27 juin 2026, 09:47, Daniel Turull <daniel.turull@ericsson.com> a
=C3=A9crit :

> Hi,
> I have sent the wrong version of the patch. I realized on the same issue
> when I created the wrynose one and I had this version in my scarthgap bui=
ld.
>
> It should have been the same that I sent for wrynose and master. Those ar=
e
> correct. It is the same libssh2 version.
>
> I'll resend a v2 on Monday.
>
> I really thought I sent the same patch to the three releases.
>
> In the future, if it is the same patch to multiple branches, how should i=
t
> be marked?
>

Nothing in particular: this is not a frequent case and there is no special
case for it. Send a patch per branch as usual.

Thanks!

>
> Thanks
> Daniel
> ------------------------------
> *From:* Yoann Congal <yoann.congal@smile.fr>
> *Sent:* Saturday, June 27, 2026 1:06 AM
> *To:* Daniel Turull <daniel.turull@ericsson.com>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Cc:* anders.heimer@est.tech <anders.heimer@est.tech>
> *Subject:* Re: [OE-core] [scarthgap] [patch] libssh2: fix CVE-2026-55200
>
> On Mon Jun 22, 2026 at 11:33 AM CEST, Daniel Turull via
> lists.openembedded.org wrote:
> > From: Daniel Turull <daniel.turull@ericsson.com>
> >
> > Backport patch to fix CVE-2026-55200.
> >
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.n=
ist.gov%2Fvuln%2Fdetail%2FCVE-2026-55200&data=3D05%7C02%7Cdaniel.turull%40e=
ricsson.com%7C2f3364dd9a284c28d67508ded3d79154%7C92e84cebfbfd47abbe52080c6b=
87953f%7C0%7C0%7C639181119971761508%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGk=
iOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%=
3D%7C0%7C%7C%7C&sdata=3DtmWBrZABG8OQtWK6Cds18odLAc%2FOcm4ql3en4e0Wgio%3D&re=
served=3D0
> <https://nvd.nist.gov/vuln/detail/CVE-2026-55200>
> >
> > Upstream fix:
> >
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Flibssh2%2Flibssh2%2Fcommit%2F97acf3dfda80c91c3a8c9f2372546301d4a1a7=
a8&data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C2f3364dd9a284c28d67508de=
d3d79154%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639181119971778602%7C=
Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa=
W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dct5f7AASg%2FMt=
Vlbo6YFwhO4C1xrUbTzkI3J7pTZpCRM%3D&reserved=3D0
> <https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f23725463=
01d4a1a7a8>
> >
> > Tested with ptest:
> > Before: PASSED: 3, FAILED: 0, SKIPPED: 0
> > After: PASSED: 3, FAILED: 0, SKIPPED: 0
> >
> > Reviewed-by: Anders Heimer <anders.heimer@est.tech
> > Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> > ---
> >  .../libssh2/libssh2/CVE-2026-55200.patch      | 51 +++++++++++++++++++
> >  .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
> >  2 files changed, 52 insertions(+)
> >  create mode 100644
> meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
> >
> > diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
> b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
> > new file mode 100644
> > index 00000000000..f5ab9b9f204
> > --- /dev/null
> > +++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
> > @@ -0,0 +1,51 @@
> > +From df0b03ee5ef12f3a46fccc0fc688ebfb91702972 Mon Sep 17 00:00:00 2001
> > +From: Will Cosgrove <will@panic.com>
> > +Date: Fri, 12 Jun 2026 15:57:44 -0700
> > +Subject: [PATCH] transport.c: Additional boundary checks for packet
> length
> > + (#2052)
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Backport Resolution: Add additional bounds checking on packet length t=
o
> > +prevent OOB write =E2=80=94 checks that packet_length is not below 1 a=
nd not
> > +above LIBSSH2_PACKET_MAXPAYLOAD before proceeding.
> > +
> > +Conflicts Resolved:
> > +
> > +src/transport.c (1 conflict):
> > +- Upstream uses renamed API ssh2_ntohu32(); stable branch uses
> > +  _libssh2_ntohu32(). Kept stable function name while applying the
> > +  new upper-bound check (LIBSSH2_PACKET_MAXPAYLOAD) unchanged.
> > +
> > +Assisted-by: kiro:claude-sonnet-4.6
> > +
> > +Changes from upstream commit 97acf3dfda80:
> > +  - src/transport.c: adapted from upstream
>
> While resolving the conflict, your AI completely rewrote the patch
> message and notably removed the Credit: line.
>
> Please keep the original patch message and put the backporting
> information below the "Upstream-Status:" line. While you changing this,
> the conflict resolution is trivial, no need to be so verbose (a line
> referencing ssh2_ntohu32 should be enough).
>
> Thanks!
>
> > +
> > +CVE: CVE-2026-55200
> > +Upstream-Status: Backport [
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Flibssh2%2Flibssh2%2Fcommit%2F97acf3dfda80c91c3a8c9f2372546301d4a1a7=
a8&data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C2f3364dd9a284c28d67508de=
d3d79154%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639181119971788230%7C=
Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa=
W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D2qunEVqQYFYAKj=
gr3pUGogxQYBa9GYLKBT%2FQslEJb9o%3D&reserved=3D0
> <https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f23725463=
01d4a1a7a8>
> ]
> > +
> > +Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> > +---
> > + src/transport.c | 6 +++++-
> > + 1 file changed, 5 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/transport.c b/src/transport.c
> > +index e1120656..d147505b 100644
> > +--- a/src/transport.c
> > ++++ b/src/transport.c
> > +@@ -639,8 +639,12 @@ int _libssh2_transport_read(LIBSSH2_SESSION *
> session)
> > +                 total_num =3D 4;
> > +
> > +                 p->packet_length =3D _libssh2_ntohu32(block);
> > +-                if(p->packet_length < 1)
> > ++                if(p->packet_length < 1) {
> > +                     return LIBSSH2_ERROR_DECRYPT;
> > ++                }
> > ++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD)=
 {
> > ++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
> > ++                }
> > +
> > +                 /* total_num may include size field, however due to
> existing
> > +                  * logic it needs to be removed after the entire
> packet is read
> > diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> > index 2284d054b10..d6ee97f7ed0 100644
> > --- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> > +++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> > @@ -11,6 +11,7 @@ SRC_URI =3D "
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.li=
bssh2.org%2Fdownload%2F%24&data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C=
2f3364dd9a284c28d67508ded3d79154%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0=
%7C639181119971797263%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiO=
iIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7=
C&sdata=3Db6xuzsvaWoBiC%2BiylM5H5sHW7Boo2xTyzR7gquZrO1g%3D&reserved=3D0{BP}=
.tar.gz
> <https://eur02.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.l=
ibssh2.org%2Fdownload%2F%24&data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7=
C2f3364dd9a284c28d67508ded3d79154%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C=
0%7C639181119971797263%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYi=
OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%=
7C&sdata=3Db6xuzsvaWoBiC%2BiylM5H5sHW7Boo2xTyzR7gquZrO1g%3D&reserved=3D0%7B=
BP%7D.tar.gz>
> \
> >             file://run-ptest \
> >
> file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
> >             file://CVE-2026-7598.patch \
> > +           file://CVE-2026-55200.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D
> "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--00000000000093a37d065537a271
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le sam. 27 juin 2026, 09:47,=
 Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.com">daniel.tur=
ull@ericsson.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">



<div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi,</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I have sent the wrong version of the patch. I realized on the same issue wh=
en I created the wrynose one and I had this version in my scarthgap build.<=
/div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
It should have been the same that I sent for wrynose and master. Those are =
correct. It is the same libssh2 version.</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I&#39;ll resend a v2 on Monday.</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I really thought I sent the same patch to the three releases.</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
In the future, if it is the same patch to multiple branches, how should it =
be marked?</div></div></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Nothing in particular: this is not a frequent case and th=
ere is no special case for it. Send a patch per branch as usual.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Thanks!</div><div dir=3D"auto"><di=
v class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Thanks</div>
<div style=3D"font-family:Aptos,Aptos_MSFontService,-apple-system,Roboto,Ar=
ial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Daniel</div>
<div style=3D"font-family:Aptos,Aptos_MSFontService,-apple-system,Roboto,Ar=
ial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)" id=3D"m_303564873=
2329787069ms-outlook-mobile-signature" dir=3D"ltr">
</div>
<div id=3D"m_3035648732329787069mail-editor-reference-message-container">
<div id=3D"m_3035648732329787069mail-editor-reference-message-container">
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_3035648732329787069divRplyFwdMsg" dir=3D"ltr"><span style=3D"f=
ont-family:Calibri,sans-serif"><b>From:</b>=C2=A0Yoann Congal &lt;<a href=
=3D"mailto:yoann.congal@smile.fr" target=3D"_blank" rel=3D"noreferrer">yoan=
n.congal@smile.fr</a>&gt;<br>
<b>Sent:</b>=C2=A0Saturday, June 27, 2026 1:06 AM<br>
<b>To:</b>=C2=A0Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.=
com" target=3D"_blank" rel=3D"noreferrer">daniel.turull@ericsson.com</a>&gt=
;; <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_b=
lank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</a> &lt;<=
a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank=
" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b>=C2=A0anders.heimer@est.tech &lt;anders.heimer@est.tech&gt;<br>
<b>Subject:</b>=C2=A0Re: [OE-core] [scarthgap] [patch] libssh2: fix CVE-202=
6-55200</span>
<div style=3D"font-family:Calibri,sans-serif">=C2=A0</div>
</div>

<div style=3D"font-size:11pt">On Mon Jun 22, 2026 at 11:33 AM CEST, Daniel =
Turull via <a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=
=3D"noreferrer">lists.openembedded.org</a> wrote:<br>
&gt; From: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.com" =
target=3D"_blank" rel=3D"noreferrer">daniel.turull@ericsson.com</a>&gt;<br>
&gt;<br>
&gt; Backport patch to fix CVE-2026-55200.<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-55200" target=3D"=
_blank" rel=3D"noreferrer">https://eur02.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2026-55200&amp;data=
=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C2f3364dd9a284c28d67508ded3d7915=
4%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639181119971761508%7CUnknown=
%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIs=
IkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DtmWBrZABG8OQtWK6C=
ds18odLAc%2FOcm4ql3en4e0Wgio%3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Upstream fix:<br>
&gt;=C2=A0=C2=A0 <a href=3D"https://github.com/libssh2/libssh2/commit/97acf=
3dfda80c91c3a8c9f2372546301d4a1a7a8" target=3D"_blank" rel=3D"noreferrer">
https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Flibssh2%2Flibssh2%2Fcommit%2F97acf3dfda80c91c3a8c9f2372546301d4a1a7a8=
&amp;data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C2f3364dd9a284c28d67508=
ded3d79154%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639181119971778602%=
7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ=
XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dct5f7AAS=
g%2FMtVlbo6YFwhO4C1xrUbTzkI3J7pTZpCRM%3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Tested with ptest:<br>
&gt; Before: PASSED: 3, FAILED: 0, SKIPPED: 0<br>
&gt; After: PASSED: 3, FAILED: 0, SKIPPED: 0<br>
&gt;<br>
&gt; Reviewed-by: Anders Heimer &lt;anders.heimer@est.tech<br>
&gt; Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@erics=
son.com" target=3D"_blank" rel=3D"noreferrer">daniel.turull@ericsson.com</a=
>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../libssh2/libssh2/CVE-2026-55200.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 51 +++++++++++++++++++<br>
&gt;=C2=A0 .../recipes-support/libssh2/<a href=3D"http://libssh2_1.11.1.bb"=
 target=3D"_blank" rel=3D"noreferrer">libssh2_1.11.1.bb</a> |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 52 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026=
-55200.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch=
 b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..f5ab9b9f204<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch<br>
&gt; @@ -0,0 +1,51 @@<br>
&gt; +From df0b03ee5ef12f3a46fccc0fc688ebfb91702972 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Will Cosgrove &lt;<a href=3D"mailto:will@panic.com" target=3D"_=
blank" rel=3D"noreferrer">will@panic.com</a>&gt;<br>
&gt; +Date: Fri, 12 Jun 2026 15:57:44 -0700<br>
&gt; +Subject: [PATCH] transport.c: Additional boundary checks for packet l=
ength<br>
&gt; + (#2052)<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +Backport Resolution: Add additional bounds checking on packet length =
to<br>
&gt; +prevent OOB write =E2=80=94 checks that packet_length is not below 1 =
and not<br>
&gt; +above LIBSSH2_PACKET_MAXPAYLOAD before proceeding.<br>
&gt; +<br>
&gt; +Conflicts Resolved:<br>
&gt; +<br>
&gt; +src/transport.c (1 conflict):<br>
&gt; +- Upstream uses renamed API ssh2_ntohu32(); stable branch uses<br>
&gt; +=C2=A0 _libssh2_ntohu32(). Kept stable function name while applying t=
he<br>
&gt; +=C2=A0 new upper-bound check (LIBSSH2_PACKET_MAXPAYLOAD) unchanged.<b=
r>
&gt; +<br>
&gt; +Assisted-by: kiro:claude-sonnet-4.6<br>
&gt; +<br>
&gt; +Changes from upstream commit 97acf3dfda80:<br>
&gt; +=C2=A0 - src/transport.c: adapted from upstream<br>
<br>
While resolving the conflict, your AI completely rewrote the patch<br>
message and notably removed the Credit: line.<br>
<br>
Please keep the original patch message and put the backporting<br>
information below the &quot;Upstream-Status:&quot; line. While you changing=
 this,<br>
the conflict resolution is trivial, no need to be so verbose (a line<br>
referencing ssh2_ntohu32 should be enough).<br>
<br>
Thanks!<br>
<br>
&gt; +<br>
&gt; +CVE: CVE-2026-55200<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/libssh2/libs=
sh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8" target=3D"_blank" rel=
=3D"noreferrer">https://eur02.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub.com%2Flibssh2%2Flibssh2%2Fcommit%2F97acf3dfda80c91c3a8c9f23=
72546301d4a1a7a8&amp;data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C2f3364=
dd9a284c28d67508ded3d79154%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639=
181119971788230%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjA=
uMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;=
sdata=3D2qunEVqQYFYAKjgr3pUGogxQYBa9GYLKBT%2FQslEJb9o%3D&amp;reserved=3D0</=
a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@eric=
sson.com" target=3D"_blank" rel=3D"noreferrer">daniel.turull@ericsson.com</=
a>&gt;<br>
&gt; +---<br>
&gt; + src/transport.c | 6 +++++-<br>
&gt; + 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/transport.c b/src/transport.c<br>
&gt; +index e1120656..d147505b 100644<br>
&gt; +--- a/src/transport.c<br>
&gt; ++++ b/src/transport.c<br>
&gt; +@@ -639,8 +639,12 @@ int _libssh2_transport_read(LIBSSH2_SESSION * se=
ssion)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 total_num =3D 4;<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 p-&gt;packet_length =3D _libssh2_ntohu32(block)=
;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if(p-&gt;packet_length &lt; 1)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if(p-&gt;packet_length &lt; 1) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return LIBSSH2_ERROR_DE=
CRYPT;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 else if(p-&gt;packet_length &gt; LIBSSH2_PACKET_MA=
XPAYLOAD) {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return LIBSSH2_ERROR_OUT_O=
F_BOUNDARY;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* total_num may include size field, however du=
e to existing<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * logic it needs to be removed after the =
entire packet is read<br>
&gt; diff --git a/meta/recipes-support/libssh2/<a href=3D"http://libssh2_1.=
11.1.bb" target=3D"_blank" rel=3D"noreferrer">libssh2_1.11.1.bb</a> b/meta/=
recipes-support/libssh2/<a href=3D"http://libssh2_1.11.1.bb" target=3D"_bla=
nk" rel=3D"noreferrer">libssh2_1.11.1.bb</a><br>
&gt; index 2284d054b10..d6ee97f7ed0 100644<br>
&gt; --- a/meta/recipes-support/libssh2/<a href=3D"http://libssh2_1.11.1.bb=
" target=3D"_blank" rel=3D"noreferrer">libssh2_1.11.1.bb</a><br>
&gt; +++ b/meta/recipes-support/libssh2/<a href=3D"http://libssh2_1.11.1.bb=
" target=3D"_blank" rel=3D"noreferrer">libssh2_1.11.1.bb</a><br>
&gt; @@ -11,6 +11,7 @@ SRC_URI =3D &quot;<a href=3D"https://eur02.safelinks=
.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.libssh2.org%2Fdownload%2F%2=
4&amp;data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C2f3364dd9a284c28d6750=
8ded3d79154%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639181119971797263=
%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOi=
JXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Db6xuzsv=
aWoBiC%2BiylM5H5sHW7Boo2xTyzR7gquZrO1g%3D&amp;reserved=3D0%7BBP%7D.tar.gz" =
target=3D"_blank" rel=3D"noreferrer">https://eur02.safelinks.protection.out=
look.com/?url=3Dhttp%3A%2F%2Fwww.libssh2.org%2Fdownload%2F%24&amp;data=3D05=
%7C02%7Cdaniel.turull%40ericsson.com%7C2f3364dd9a284c28d67508ded3d79154%7C9=
2e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639181119971797263%7CUnknown%7CTW=
FpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI=
joiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Db6xuzsvaWoBiC%2BiylM5H=
5sHW7Boo2xTyzR7gquZrO1g%3D&amp;reserved=3D0{BP}.tar.gz</a>
 \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a rel=3D"noreferrer">file://run-ptest</a>=C2=A0\<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a rel=3D"noreferrer">
file://0001-Return-error-if-user-KEX-methods-are-invalid.patch</a>=C2=A0\<b=
r>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a rel=3D"noreferrer">file://CVE-2026-7598.patch</a>=C2=A0\<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=
=3D"noreferrer">file://CVE-2026-55200.patch</a>=C2=A0\<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;<br>
&gt;=C2=A0<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;d9ec76cbe34db98eec3539fe2c899d26b0c=
837cb3eb466a56b0f109cabf658f7&quot;<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</div>
</div>
</div>

</blockquote></div></div></div>

--00000000000093a37d065537a271--

