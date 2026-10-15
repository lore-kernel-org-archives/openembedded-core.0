Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB0DCCA464
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 20:10:46 +0000 (UTC)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6648.1792095038716263456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 13:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=lhBwoVrM;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=yTKMDkxv;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 3A0F31D00116
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 16:10:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 15 Oct 2026 16:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1792095037;
	 x=1792181437; bh=JmXROVOiiJpKR9PMELf3baSaX9ukbnfN9B8dEIK0VtQ=; b=
	lhBwoVrM4i5QugbjgiWnI7QWZul1c3E1CXJ1liCPClUJvwa/h10yVf98iGLoUnIX
	/KmTWInZjS+lmgRDalaWdjTF29AVZst813Rgmef2qT9/YJ1HWSRvozu9pOxxonnH
	oBYhuIJ2gRQieA+El4x2SGKs4IX4sehbVs/zFEaylHWC2K9xmArM3cef6jNaCm0L
	iKAvwdW5KrIrTZL2CF7oZ6D6yGJqDoLT5QkjDfgY/EcVzn6AfhkIZ1SfjKwq4i2Q
	xex5qjSNSIqN84abXpqYKOvg+JkgciE/PJkrcHZhHOREPmGXg+VeeiDjtrcZrmSg
	4JE5m1F/t/tqh5kmmVXNyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792095037; x=1792181437; bh=J
	mXROVOiiJpKR9PMELf3baSaX9ukbnfN9B8dEIK0VtQ=; b=yTKMDkxvB3BbzOLr8
	OgZhlYIUP8Gqd1/g55y2GBg2Sxb4WLp2Da94wKUv5Rp42iDfoKlWeUb483IJ0p6q
	sxpJE+6OwphlOIRWKfE88tX9Xg0YTKsWl3S0S9d6THIxGerLJg6ITJk5ZxhKzbDt
	RiXL0dRE7lL4nCisdmtvQktBfSWJwjfAES0QKKN7T16XBI3dqfdr2pBv5jGsdNQx
	UQ2JkQRVGtdnroy89tL1gG/ppEauTYvigaN6Ym/Wck+Pdo/1FEHuWgp3VKMg+1BJ
	VSKuMLKBmo5nHXbZfSTV1Ogkd+tlzppk/sr6rtHpHqV4tpwAhq2P4BhwT6LnbaZd
	f5gaw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792095037; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm3:rsa-sha256:mt20BOukcml4f4k+cfcWXHd+cHr0eAJ4h75F01Odcl9AylT
	92OTl9+hWDC5Fo4uEYwdHeRIH+V9CP5XA3RTVSVXBGC3I9GZKw7qx9lZ/yslQxYH
	4+aZIBoLn5XZmO3boVBwWo8ik7ILYiKBHden7m+5M/3LTe49E6XBmCrtyxgOtS7N
	wFW7x57kbjq5GPvflCsY/j4KLY6a6TQO3q5QUu2HbpxS9ACiAq1n68mgaLlqCOoc
	SK/+94V902VsAtcdb60X2xnup4gfqw/NHpz+5eq5j8QSMCn9QLOcxhsIVO+Mk/im
	atHCPk5KNIsks+4pUzYVTmrjAR1y0CfMSYe95nA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:ndCiJYxxyjGo6jhunv0Jpj1sJ4Z1+YQUItKywl5CLJc=:JmXROVOiiJpKR9PMELf3baSaX9ukbnfN9B8dEIK0VtQ=;
X-ME-Sender: <xms:PTPRanBD9HUhxkINUG2eJrZrrjqZ_CSOPy6LhG4XamMS818W5oGZTQ>
    <xme:PTPRajj2atESns6FiRxKGX4xBQq1xsA1z0K1sCtCLNEJeo1d9IynScW3S5TFwCS2q
    _qSN7cc2Mrn4Pa_IJgYnLRenNJaH52Sk-Ccd3amYoUmX_XMfSlNhGpC>
X-ME-Received: <xmr:PTPRagMcqgNXtr5xVvAD9E3mdlORJH5KJYW4tJrYtomyXOtB_GtY2XajJ4jxnySSRvlnHPixBrf7siND-4NN8em_tsucib0nUcvk>
X-ME-Proxy-Cause: dmFkZTF3ztjU5wXpuHV/XeaLzlAZsFCOufkoErA2bsD3K4gaJmeZmbuxyooulcgubkjOcT
    9PGK6UpbhQW8nHq7JihE9VjkxdJccJAGYV8yRzD2qe1SgW691WctBm5nagyEhkbs/T43S1
    stnsnhWq6kNonSwh/suAmjY1TtNrivTY5Lzk/xGh0fO9A4fxEL9k1s0yyMHN1Sg2N8X/Gt
    7W9cqEibU2VAu57SXhZFxhN7p6rBw87uMP2YuHihdbvROO/jq+93dEKxdzEB4k1ETN5t2T
    8VBcI4ACvM+UfU2aZbPQQyjwA/rjxTzBmnAo/uHQPPkl8WWqyp0PTtkl4zHBakQZxKBoYM
    wFi7hTCopcuVZmKzveW9c3q6fdfOV1mqsOwJ3vtv+rukiXKKDKHdd0bCFIc5Hvtd6uvFUy
    fSg1iwksxaCjYzmABRSK0qzIsX7W6K2IIaRCB5o2GhZycfNQFNKwWn/B23LGW0ehZmqMCe
    WQWFFt9+EReM0OAeMe/Izro/0hWJmLtXTy0TAxwxC6Esw4luFfShqK1TNU0mpUSdzTHRDY
    L5IKmt6k6g78pCnzC4L/h4Gut/vPv0GN+3ued0g417HTciruydt6yW76VMAomGjZ+5GCts
    ue4GV1lYsfiESpq+KJyFs/bsi2Jkwx8tM0KmchPJmU4gWSBCej5AjAF5OgMw
X-ME-Proxy: <xmx:PTPRak7oNvmgrxsjjzl_nOscNLQZFPtQs-omYvHf-bq0iZsRxiJlQA>
    <xmx:PTPRau16xSYAdLJpuDdtpRrpkaEwYrrjTMS_Y6QPPUg5LaSXPhhjqw>
    <xmx:PTPRalYwmmSg7XHVwST0JJyt497itWhrTGloM_mGn0EZaPYPW8O4Qg>
    <xmx:PTPRamCL8FtkHy7YAGSdCDCMm0lJaDU91bqn3Z5-AkQemWEYabZRYg>
    <xmx:PTPRaoRczfSCdsMGcdbROGmNnlSmOeicz0G97tIW0rf-R2yWgzSgrc4p>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Oct 2026 16:10:37 -0400 (EDT)
Message-ID: <b27fd2e45f37d9d49e311c457d1684ba03dc3543.camel@pbarker.dev>
Subject: Re: [wrynose][patch] rsync: Security fixes from v3.4.1-sec-patches3
From: Paul Barker <paul@pbarker.dev>
To: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	 <hthakar@cisco.com>, openembedded-core@lists.openembedded.org
Date: Thu, 15 Oct 2026 21:10:36 +0100
In-Reply-To: <1614257.1791448822431275973@lists.openembedded.org>
References: <20260917105551.76512-1-vanusuri@mvista.com>
	 <DLHK8G1OWTE8.394FSK4TR0VS5@smile.fr> <DLHLDE6HLTRH.2AFGSZ80URG52@smile.fr>
	 <9faaa5bbc70d619058d8abecda9cd235d210d422.camel@pbarker.dev>
	 <CANQUz1_hMwrLp4tuVS4+cEXXaj71-L0Nijw6n+pjzGpAKh=prw@mail.gmail.com>
	 <546192.1789655591562202413@lists.openembedded.org>
	 <CANQUz19S86jm7H3aoNKvm3NwEZ_L=QEmt53g4i2j=fgOz=e8jw@mail.gmail.com>
	 <4ccc62a34b7c0ff418951a62c873daa589e45683.camel@pbarker.dev>
	 <1614257.1791448822431275973@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 20:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247895

On Thu, 2026-10-08 at 01:40 -0700, Hetvi Thakar -X (hthakar - E
INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
> On Tue, Sep 22, 2026 at 01:23 AM, Paul Barker wrote:
>=20
> >=20
> > On Mon, 2026-09-21 at 15:56 +0530, Vijay Anusuri wrote:
> >=20
> > > Hi Yoann, Paul,
> > >=20
> > > I checked with the rsync upstream maintainers regarding the security =
patch
> > >=20
> > > branches and the possibility of an archive/tarball.
> > >=20
> > > They confirmed that v3.4.1-sec-patches3 and v3.2.7-sec-patches3 are
> > > official rsync security-maintenance branches. They have now also
> > > published:
> > >=20
> > > - v3.4.1-sec-patches4
> > > - v3.2.7-sec-patches4
> > >=20
> > > These branches contain the security and compatibility fixes applicabl=
e to
> > > the respective older release lines after *-sec-patches3. Both branche=
s
> > > have
> > > been tested against the refreshed stable testsuite.
> > >=20
> > > Regarding the archive/tarball, the maintainer clarified that they do =
not
> > > plan to provide release tarballs for these security branches. The bra=
nches
> > >=20
> > > are intended to be used as reviewable Git sources from which downstre=
am
> > > maintainers can cherry-pick commits or construct their own patch seri=
es.
> > >=20
> > > Based on this, can we switch the rsync recipe to Git and use the
> > > v3.4.1-sec-patches4 & v3.2.7-sec-patches4 branches for Wrynose/Scarth=
gap?
> > >=20
> > > This would allow us to consume the upstream security and compatibilit=
y
> > > fixes directly from the maintained security branch instead of carryin=
g the
> > >=20
> > > large 34KLOC patch series.
> > >=20
> > >=20
> > > The discussion with the rsync maintainers is here:
> > > https://github.com/RsyncProject/rsync/discussions/1095
> >=20
> > Hi Vijay,
> >=20
> > Thanks for checking with upstream. It seems a bit of a strange way of
> > doing things to me - I am surprised these aren't further releases in th=
e
> > 3.4.x and 3.2.x series. Or at least they could be 3.4.1.x and 3.2.7.x
> > releases. But if this is the way upstream want to handle things then
> > that's their call.
> >=20
> > We do need to discuss how this fits in with our policies on LTS
> > maintenance. We will get back to you soon.
> >=20
> > Best regards,
> >=20
> > --
> > Paul Barker
>=20
> Hi Paul, Yoann,
> Could you please share if there are any updates on this?

Apologies for the delays due to conference travel.

Debian have decided to upgrade to rsync 3.5.0 on their stable release
series, with additional regression fixes backported from 3.5.1. There is
an explanation in the Debian rsync NEWS file [1].

Based on this, Yoann and I think Yocto Project should do similar. This
will need discussion with the TSC, probably next week. I'll follow up
after that.

[1]: https://salsa.debian.org/debian/rsync/-/blob/debian/trixie/debian/rsyn=
c.NEWS

Thanks,

--=20
Paul Barker


