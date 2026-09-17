Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C279C982CF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 13:59:03 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40167.1789653538924477606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 06:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=kqyrsS0t;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=xL7zdUBQ;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E9EFA7A0103;
	Thu, 17 Sep 2026 09:58:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 17 Sep 2026 09:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789653537;
	 x=1789739937; bh=Rq6DD6PbjrOZAp+rec9wQGW7tS93yq+KrbrQuM0S4Fo=; b=
	kqyrsS0ttf/XziBGghH8/vdD6cUOK093dIdpJVhprmzOi6fgzYfN4PGEMfDB1CpF
	OJ9v3gnK1SrhEQ11mJiQm4iW1O44HJENLUrlOmXHivL036h/IwwxfLd7UpyaWzBt
	9nB6awxWvUNnJP/wfbpIcS6YiVfQ4HX5ZOb81kzdJBfgTpyCMR2dcbt83Aa02wRX
	yIenNXOjiqcoy4oSZdvglBn59T/PkO7KuqWXKM4iRuiJjdHPzodex2/MDogAIWS6
	+/BY+UuCIKanQ7r729grQxodT044Q3w6OLQyP+tMWjUux055zX+dDKkvctSW4Y2F
	0EbisjizFy8d4EAei8GfDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789653537; x=
	1789739937; bh=Rq6DD6PbjrOZAp+rec9wQGW7tS93yq+KrbrQuM0S4Fo=; b=x
	L7zdUBQaufF4k5Haeghbc4YTcGbvniBtqq4lZIO4tBRTk8dxh+sLW/u4d2TQryc3
	2kTB+qfxIzS0xLenJmPMPLwXZOCQ/8WaGSqE3LAx6mo5ejJCPiTP18G19S9O0nT0
	GC6fyNPoE+TaSCd4FLHv2PbsK82OHxjBkIQppdNPHBYyr+PUOmG7BxrWdz2WvuRc
	bCZwe5diE8ZT41wk88e56zOPBuJA/iRp6CuOvg5TR9e62+Byqld3eQTqedYqTtYr
	2SYyAchRkcpFBHYo1c1Aw5bd6uNOhKAGdyvZxxtVGtqkUhKLb6i/olqjAkwOgNs6
	Mm6IeF0hAvFSaX/TrpeCg==
X-ME-Sender: <xms:IfKrahCUdvHDmE7mU-Ny6SeTjqp99oxbTQVYvg4G3J8J3Hl_EV43bQ>
    <xme:IfKramgrchr_x-Su3sLXK-gNiVjra2cHLW9Mnj-r4xKf1pdU80A2OPhsi245MW85Y
    9WpjH-M3jgyEIjG-1BStKxOpXZ6dVGqOMEG2GI7tHv9PIjQcLI1sDx8CA>
X-ME-Received: <xmr:IfKrahn5ZXc1oDDXpl8rcV6qvWbPg8rDrVyuD_potR42oOcF7VBXQ3P9tMaCPEKGRltAtei4nB-Rp2WemqhJWuOTIfBD7ueb42aOTiQ>
X-ME-Proxy-Cause: dmFkZTGT8YOYrV4+BQuAiy9RN+d2AL0UHFTv/ZPH5Hm1HcBtoDif2rgKNFTC87DI4dfDaq
    P23JW8wWeksPJk22Upo+iilZ1VBk8CK7rB1KuVqnanukEPZispMU0qZvGA9oLfvdkB1QmV
    ZnoVUjq+I4swatLxg1baklQBPzvRjnpEqM0WttdTv/PDXHzJbLWQ3IqY68eCAQBJjyeiN2
    cJdahNB8QweGacqxPiAFNqgp1TplmVgEx2VUth7WKwfWXZgXWb6VvAdgfm8N5SvTOgWEVi
    ++ZP0R4R/KZHELPEWgJM5tNDQs+UWTC16/5t3QfDI4jeE7+JFA3gxLSzD6IbTdMYR4X2dm
    8QNR53KsmCztHvqTURzB3EbhGLS/GPflKEKEa0ZiLHN0EzbFOFcTvjL/LOygZMB2+5k5UQ
    RMlWFIRotYftYVNktfz24a085bn71JpwlGlJk6H01pdw0RWbkeM1jcDPPsCXRNeb0EWnoE
    QHEp6waoMhMkCtFZg278gKBkukQAelouL9T5TfcKRf+7NTdApltEW5wSz+k3HvHrP9Bdr8
    g7g18Nwbk9Dv1hJ5GLRvau7v3yCzPfknMCGMYCsEYdUiLLR81/x4G1tijXVNRFca1PDmXx
    ov03WMstU5qEcfBmnPnONpODWH/tTz/fUv0ETJLH14p5ehroYgaJxxFSZWAA
X-ME-Proxy: <xmx:IfKraqqTY54w0RqQIpYsU2TRyTuieXum5EPXLPSBj-w7SrOnvt4vlg>
    <xmx:IfKraiHRCSHn62SRjcoVqOTPRLV4SsZphi2h7uj01RQpSYbAX0T12Q>
    <xmx:IfKrauz-E5q8KPhY2zUDY3EgFzJCtqfwlA9u_0TZbzo1NGh4Nc1dsg>
    <xmx:IfKravqlBsP4wnQ1DuRSobMokEz_TczyKNvdxuFdFS4TTvhC3Iz-7w>
    <xmx:IfKrahUt_Osg5dNS1kITu-umSkreBxrHWMnwUQ7QhVh19UYgftyFWJwp>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Sep 2026 09:58:56 -0400 (EDT)
Message-ID: <7ceb1874bae6aae6c4bb27b948a38c1015960739.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] go: Fix CVE-2026-33814
From: Paul Barker <paul@pbarker.dev>
To: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	 <hthakar@cisco.com>, openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 17 Sep 2026 14:58:55 +0100
In-Reply-To: <20260831061447.180612-1-hthakar@cisco.com>
References: <20260831061447.180612-1-hthakar@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 13:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246065

On Sun, 2026-08-30 at 23:14 -0700, Hetvi Thakar -X (hthakar - E
INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>=20
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>=20
> [1] https://github.com/golang/go/commit/9024c3f6b150fb1349d8a5dc5e9aa31d7=
896f67f
> [2] https://pkg.go.dev/vuln/GO-2026-4918
>=20
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
>  .../go/go/CVE-2026-33814.patch                | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33814.patch
>=20
> diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devto=
ols/go/go-1.22.12.inc
> index 99c5f8b63b..ee2f5ca277 100644
> --- a/meta/recipes-devtools/go/go-1.22.12.inc
> +++ b/meta/recipes-devtools/go/go-1.22.12.inc
> @@ -62,6 +62,7 @@ SRC_URI +=3D "\
>      file://CVE-2026-25679.patch \
>      file://CVE-2026-32288.patch \
>      file://CVE-2026-27145.patch \
> +    file://CVE-2026-33814.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b=
9cf4d9ca02db986e17d71"
> =20
> diff --git a/meta/recipes-devtools/go/go/CVE-2026-33814.patch b/meta/reci=
pes-devtools/go/go/CVE-2026-33814.patch
> new file mode 100644
> index 0000000000..8265bf205f
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go/CVE-2026-33814.patch
> @@ -0,0 +1,44 @@
> +From 825d42a14d8ffbdbdda87a39e78795eb17e4f0f2 Mon Sep 17 00:00:00 2001
> +From: Mark Freeman <mark@golang.org>
> +Date: Fri, 17 Apr 2026 16:28:03 -0400
> +Subject: [PATCH] [release-branch.go1.25] all: update x/net to a9171bc8
> +
> +Fixes #78477
> +
> +Change-Id: I0a4c8e25f569fc1bfb8ac39ff728bfe7300b751f
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/768323
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
> +
> +CVE: CVE-2026-33814
> +Upstream-Status: Backport [https://github.com/golang/go/commit/9024c3f6b=
150fb1349d8a5dc5e9aa31d7896f67f]
> +
> +Backport Changes:
> +- Omitted src/go.mod, src/go.sum, and src/vendor/modules.txt because
> +  their x/net version updates are not required for this focused backport=
.

Hi Hetvi, Yoann,

My Go knowledge is limited, but omitting the go.mod/go.sum changes
didn't seem right to me. Those files track dependencies.

Looking in to it a bit further, the CVE description is:

    When processing HTTP/2 SETTINGS frames, transport will enter an
    infinite loop of writing CONTINUATION frames if it receives a
    SETTINGS_MAX_FRAME_SIZE with a value of 0.

The commit message is "all: update x/net to a9171bc8", if we look at
that commit in the x/net go module [1] it makes other changes which look
relevant to this CVE.

[1]: https://go.googlesource.com/net/+/a9171bc8c6f19c50efad8880f96e361359ed=
5307%5E%21/

Could we check if the backport submitted here is a complete fix? As I
say, my Go knowledge is limited, and I'm not sure how we would pick up
changes to the x/net module if we need to.

Best regards,

--=20
Paul Barker


