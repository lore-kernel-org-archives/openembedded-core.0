Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEEFCA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 07:35:07 +0000 (UTC)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40086.1791272099515232433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 00:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=Crha3lVi;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=f8+G4kOs;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B02037A00AB
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Oct 2026 03:34:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 06 Oct 2026 03:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791272098;
	 x=1791358498; bh=H7k8Bppkk6yDDhR59LUhR4GVysIhX79gEIZHKiSJL/k=; b=
	Crha3lViI9rNPLmruCGcjBxuW31JRNOM2pBWPlyr9xXtyoTjBOdzl7v9l6OXNQkm
	BWn3MPPhp9x3U6i2lJjdrs/2ThU9fSqCkfYhCcWDxiSFREYS4FTVbOhwdKS4LRgE
	VtmO8n8XSZMDvspj2N+yvD6ssVnu9DW6B3ZwPJXpepuyDrCrVF5gs5eABl23Dhtm
	tEyGjlxXqKNgFQ8gnnDTmQ8qw/DV2PBbQ0d4LKzyy7Mnu+P4ci9beMYZFFzixAvg
	vOhJC+ecy3/H7xVrOENv8LRe5bXhdfHlPyY2/QIs2QrglTtztpelERcfLYklDFhC
	BD5CeW8SyiaMta7DMIAjeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791272098; x=1791358498; bh=H
	7k8Bppkk6yDDhR59LUhR4GVysIhX79gEIZHKiSJL/k=; b=f8+G4kOsdkeeZViEJ
	7LuONBwxZ0B4ZYGPMoM9AyldZpOtJhzZ7MMH1zKGkm6yRSIdPCWfePeL2HbKvchr
	RcH39zPj9RLpGC8KhQ/Y6xq5xhv4dMsS7E38T3i5QDJiyOenvbv+6b8ldtGFtzbN
	xbDjzDWwYlzqAh//RWX89YF2b6INbQC3+c5WU/7Izw3NQnchg+PGXH7oCpRvfAZW
	d3bwcIje8OyJCMO7dOwqSozPnGYZLOEJ/b5mkz0cCN8U2UTcsQ1PvKlzvcZqeVVw
	4lIkTUx4lJzuObs3sARUNNcWRo55RQPVGzJLqGhZreKtQnjAqkczFlAnd/FiEwDe
	S7HJg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791272098; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm3:rsa-sha256:BsbVDJhN9ADQR8sG0gU4QnEsi8s9N4TzHsQ6fuaipRzkR/p
	YEf9xNBB6Ppg5cZ1Ko7AqYcZbnb+pITPdL9kfHfpVoZgjPPYdmFxotJKsM1Cd+k/
	UaiQoa/sAAxW5M3HPgc0bZpboP5D9oQ5hgtNBBOMV2jbGPOZY/AUH6RlrIc1lOID
	QTixhFhfwHgE02gJWOPwD6sH+sYsAE4mjkPLVkjfda2M1W7qBLvndvij2fJun3gm
	UGm69+qgq9IoruTZJm+HniOK4wgvwAhc+TuVGryCwVsejnHFdlXtCdvur6gom/q1
	dRRdP57WYQrAFa7d4kSiUUTVsGIIkG8v3Seuuaw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:HNUNSZyIMA0zr8dTOllPwnNUk+IkIsMrHMDUKj1mKnY=:SSjVFf5JtOmrn5ZCLn+D+pnmfkSXu6tXPxX0RoGzzK8=;
X-ME-Sender: <xms:oqTEahKX021rnT8D4ezk3BYIlW1l6IKvOgT-QI0i2CJrRayKekLLGw>
    <xme:oqTEajIe_ZXhFdXqSrrOSrvdJTnVdokT2ggUwKWbyL1L_U44PFiSN0HSW2LXgKAJ2
    -j0OtPJy8VNdhZ11tiJwwNm-48X3dm5tw-MlghWaWdGZXhqUY6XuqO5>
X-ME-Received: <xmr:oqTEanW9R6wwBvG8eYKqFgV7bo-OCKOa3NunkuYYDx_SP7XDARM4b7C1xhbXeH-e>
X-ME-Proxy-Cause: dmFkZTG1haycvHgT/JNIq84gdHy09LzgjsMuQ4c/25FeHMyqFRTGAj7Bhx2owcN39rHpGL
    Zd+x9buqvSFY4YnRADRVSS7eBUHdXScxrLA3Gi12TiAdYgab8Gx/YKruoCdU6WUwY5CSHv
    KsguRBhvq0WI0gG3caX8UFqu5tH0zbXhS8kvmcSKWhLNixZFECMo3/AjZvi4YxoqZQn0ky
    ypdEAcNz4bqJUZp1M72sHh+so+7rjSCeANayW1chVKpw+VUcjqkWxaEBKZygt8ks7dOn/9
    vt0oLhs9Kg4UpA1rhn16ayHAiuHfCX2jgtivi/Rc2BP6MceDvlfkScc3+S1EY5ne1ClIn1
    A3ZHOjLHnyQsiSAPbyfA0HHu7prj4OApaQcMzPEPqCyksr8kcHn2DR2thPrGcq2Tjj0KyR
    q2ulFpypdYznrBB8LOcmKxptLAR4y+8WabYY2zbOlME90voWbrlQA3i63M2Ma5xxh0+tOv
    TPenXy+q1QpyR6Oxiiq85biqyKBmSku1uIslb1WUBE1duSB2sBtkq/blznV5kKRjzrWhyk
    BtVRT+6wL2inryAmu4Wi5gnct8IVG9ti6BsJ0k91aPuc7lKcLbZw7CxK2+szte0TIDrpAI
    caazdqoeg9g9kzQf4IGVHH0auHXAn7Vscqs/qV4ecJbXkH2pRSpi/66BDpPQ
X-ME-Proxy: <xmx:oqTEatgReRTaTJ3yllCUpPBlFvZXTLWLOcSQT9pfUcND62211CuKSg>
    <xmx:oqTEaq8meyosqpL-4p5JGh2SVzXn5WzSGEqpUvtDlbutCX1D2pIcYw>
    <xmx:oqTEavCdHMQgFgyPd6ZfFINUOGXhIA_x-3dxrJi2ZFL7FAfvZuyK7g>
    <xmx:oqTEavKR6crdKcXxgBDUozuQEpGrK3V8L1q9noBX4cKNGhBsCd-v_Q>
    <xmx:oqTEaqQFbO6LL2Yk7AX2Gmc76o25psNhgA0G2A2mAlVpPcjpvQnJQE_J>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Oct 2026 03:34:57 -0400 (EDT)
Message-ID: <9ecab349757517b9cc7e9997e3e292325d945b2d.camel@pbarker.dev>
Subject: Re: [PATCH v3] systemd: Upgrade 261.3 -> 262
From: Paul Barker <paul@pbarker.dev>
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 06 Oct 2026 08:34:54 +0100
In-Reply-To: <20261001075039.4339-1-jaipaul.cheernam@est.tech>
References: <20260928113956.42485-2-jaipaul.cheernam@est.tech>
	 <20261001075039.4339-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 07:35:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247276

On Thu, 2026-10-01 at 09:50 +0200, Jaipaul Cheernam wrote:
> NEWS: https://github.com/systemd/systemd/blob/v262-stable/NEWS#L3-L877
>=20
> - Refresh patches for v262
> - Drop deprecated meson build options [1]
> - Drop 0001-include-fix-limits.h-override.patch [2]
> - Add rules: install 60-persistent-media-controller.rules [3]
> - Gate systemd-coredumpd.service on kernel >=3D 6.19
>=20
>   262's systemd-coredumpd.service needs PIDFD_INFO_COREDUMP_SIGNAL (Linux
>   6.19); on older kernels its ExecCondition fails and the unit flaps into
>   start-limit-hit, failing test_systemd_failed on qemu*-alt (6.18). Add a
>   ConditionKernelVersion=3D>=3D6.19 drop-in so it is skipped on 6.18 and =
active
>   on 7.2. Upstream report: [4]
>=20
> [1] https://github.com/systemd/systemd/blob/v262-stable/NEWS#L41
> [2] https://github.com/systemd/systemd/commit/6a131b32e0fe948e845ae4bf41f=
8fed003ec30ce
> [3] https://github.com/systemd/systemd/commit/d153b49473
> [4] https://github.com/systemd/systemd/issues/43963
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

> diff --git a/meta/recipes-core/systemd/systemd/coredumpd-kernel-version.c=
onf b/meta/recipes-core/systemd/systemd/coredumpd-kernel-version.conf
> new file mode 100644
> index 00000000000..dcc23825f42
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/coredumpd-kernel-version.conf
> @@ -0,0 +1,14 @@
> +# systemd 262's kernel coredump socket manager (systemd-coredumpd.servic=
e)
> +# requires the PIDFD_INFO_COREDUMP_SIGNAL pidfd flag, added in Linux 6.1=
9
> +# (PIDFD_INFO_COREDUMP itself is from 6.16). Its ExecCondition
> +# (systemd-coredump --check-requirements) fails on older kernels, and co=
mbined
> +# with Restart=3Don-failure and the Upholds=3D relationship the unit fla=
ps into
> +# start-limit-hit instead of being skipped, which fails the systemd runt=
ime
> +# tests. OE-Core ships both linux-yocto 6.18 (< 6.19) and 7.2 (>=3D 6.19=
), so
> +# gate activation on the kernel version at runtime: this keeps coredumpd=
 active
> +# on 7.2 while cleanly skipping it on 6.18. A ConditionKernelVersion=3D =
failure is
> +# a clean skip and does not trigger the restart/start-limit escalation.
> +# The per-coredump systemd-coredump@.service path remains available on a=
ll kernels.
> +# Upstream report: https://github.com/systemd/systemd/issues/43963
> +[Unit]
> +ConditionKernelVersion=3D>=3D6.19

Hi Jaipaul,

Thanks for the patch!

The comment here needs a little re-work, it's too long and verbose. It
also references specific kernel recipe versions which will change
regularly, and this patch might not be looked at again until after the
comment becomes out-of-date.

We should also keep this conf file even when OE-core stops shipping
Linux 6.18 because BSP layers may continue using older kernel versions
for a while longer.

I think just keeping the first sentence of this comment is probably
enough detail.

Best regards,

--=20
Paul Barker


