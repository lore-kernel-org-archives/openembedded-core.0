Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB843C5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 16:05:56 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12217.1786896355442882856
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 09:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=YGX4wb9n;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=ZJmlF+5d;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5CAA114000B2;
	Sun, 16 Aug 2026 12:05:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Aug 2026 12:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786896354;
	 x=1786982754; bh=aofJulf4Jwk7/7/OVpzuL+hPMj2zR8C9kAx8wnPDiWw=; b=
	YGX4wb9ncPzObam/ABlQIKrw0OtH1PfcSwnNH8X8ml8dbDzJnoSvyYwOqGN/1j3U
	wkQ5YN3mwKThKLX3xcvFIFsGmurD/NmOXFXlApPKjj+1dipXJ6R47IzwPombJfzD
	xKFVqwBYwR4Rv6UNABboTXRMI/r/dRoySM0uIuSH24MdeTdx/hcBR4VaO7T5FLHB
	PAywLHwLPdSSO27mqyCX1RMmPpGYCi4ZiEsOMcwPjgd0XlnrAgHBnLXcx9WdhVaC
	Hu47qrT6+x3CQ9xQ+PkS5ojdVUTrRIAN5lVMiLZ/vBb2hJJXv4eGvzcLQc0TttzU
	/xQTmJNu1nvClZPRKAOFnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786896354; x=1786982754; bh=a
	ofJulf4Jwk7/7/OVpzuL+hPMj2zR8C9kAx8wnPDiWw=; b=ZJmlF+5d24kntJiv6
	4PJuwCNQtvm1bRjaOe9qcEVYvSMVBiTvL6dWymC757rwQo8DQVPahYtw2cGaXxjK
	lQhwpIGVxAAHg6iCij2hkmG+bsC1llTnvi+gfrpaLnVP9gueCGBjf/1XonxJ9WoG
	e986faR/TsDEzvG7lErpsh6CwXX1+/QJf+06CCFAD76lLsjmXifNEgOkRqGcMGKl
	fwQMFe+fsPRsCQUYChfLY1fs+QwQ0vhFcTV8Mk3cm61OK25BXo/ZfI7ZexDtGqVX
	wMw+A6g/Da0nlbc8YKqv/si9BLCGWjQiJQNw14xwdBDVUoVs8pGE5d5KHfHwjO7J
	KEpAw==
X-ME-Sender: <xms:4t-BasKykIKVzUH94La6zdgeb6YBFBDv8wZ5sFjQ0_Bt-aQIcur42Q>
    <xme:4t-BaiIIondSHvqmvKQdkCQf-9NrIDePj1uFuMDdW2JeLS8LpZWXCGEQK6YI7KAgw
    7B0OJj721tM24UuxxKB8j_HfWaTAwUvoOkLmieOEeaBDuiScoNyBD_N>
X-ME-Received: <xmr:4t-BaqX47LKRTENSpX1wicx3GH3LTTljZqvE1RF7_Ehu8S_dA-3E5QGo9TYFYLdaaU_CpZY2c3dvE4LWIIESQoFL_hvcwwrw73GShDWUCgSb>
X-ME-Proxy-Cause: dmFkZTGQiwji1zFt5zlXlZOTf4qXxXFSA6P4PYqlMjb/wkpntNwr+oQwdY7iLopZDKH79q
    yseJpSJmhmCAA/3VUUShDhM1NXbgqoIdJkchGBUsntvp1w/jiXwOPUwOELbeEadhkHKEHR
    uCVfI89ioqLgycPwain9gZDm65VRgG140M+YtbpqMVF1ibBnPPjdW7fXnLcoSVZtc9CZHM
    PuJOIjkjuocA8q1BRJEmvQS+eouUZIGreDBONseLgWlNpm+xvMdLH5Ou0xKGUtF7aM+y5D
    K+HxXQdl6NokKazSY4vO182U7i4xTqnoQMDY9kf5+I8A82O5M7pYRln5k8awy6i5ZH1XYD
    M2RarheSJI7MUpf0ITuDzWwzrdaMhksdmd2dajT9krwCqQjpz+JYQWKPE50cub9l9Y1jjC
    c0ic3SxUTLIoRflpV1ZhsVKWjOeTCclQTk1f+MQ5C/w7b4OBRWMwg9MmLF/8mlIE3SOSL3
    oZNxMJn5LoZrlWG+iDHhNzGLOyU1LCYNboLusdjPk18nPZbWnF1rTFPIsbv19KT8Xo1YsY
    Kak5rdL06IcyckvRxutureIYiscWhTGJjmqpJQiZP8rJ+F1NavPtZu3Py2HAuQFcvMK7m9
    rQDEGOmFpPU8D9Lwlfu2fzs+VUu/m+N1fqEgj335PSnqauH0v13HHWzUy9Wg
X-ME-Proxy: <xmx:4t-BakhlQIzz5T3_qQ3jsgZmzcqJbhDTey42KbRcr41mEfO1RdkqAA>
    <xmx:4t-Bal9NkEq5342AyJsOqS8nMWqjNO_6Qqy_MVL8yVha0OFVymf5kQ>
    <xmx:4t-BauA2ILhmDPoC-w-giEoGJWWvY5BPbxbarnzt6JTDokZeVmCggQ>
    <xmx:4t-BaiJQGQnfHlrw1--mTOYOwEW8P0d4mQxGU5oeWFONe12tp3eqCQ>
    <xmx:4t-Baiuxy5DUI5D3gMs8gN-yyJWs_O-lBmaPS26cDsC82JG3mgRTQqjB>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 12:05:53 -0400 (EDT)
Message-ID: <8b14e416bf63eec0c09c4d5d2a0f71f9b5db4e40.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v3 7/9] cve-exclusions: set status for
 CVE-2023-3397
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 17:05:52 +0100
In-Reply-To: <20260812072842.1176341-8-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
	 <20260812072842.1176341-8-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243532

On Wed, 2026-08-12 at 02:28 -0500, Junjie Cao wrote:
> txEnd() in fs/jfs/jfs_txnmgr.c reads the log pointer from the superblock
> info, drops TXN_LOCK and then takes log->gclock, while lmLogClose() can
> free that log during umount.
>=20
> No fix has been merged. The 2023 proposal was withdrawn by its author
> ("I think my fix method is not a good solution"), and the 2026 proposals
> for the same unmount race are unreviewed:
>=20
>   https://lore.kernel.org/all/20230515095956.17898-1-zyytlz.wz@163.com/
>   https://lore.kernel.org/all/20260505123330.2822833-1-tristmd@gmail.com/
>   https://lore.kernel.org/all/20260603171620.2532527-1-jie.wang@intel.com=
/

The proposed patches from this year are certainly for a similar slab
use-after-free race, but I can't be sure it's exactly the same. So
please re-word this.

>=20
> The txEnd() sequence is unchanged in linux-next 20260727, and the
> use-after-free was reported again in June 2026 against 7.0-rc1, with the
> free stack in lmLogClose() via jfs_umount(); syzbot still lists it open:
>=20
>   https://lore.kernel.org/all/6a3eedfa.fd822575.2d6b21.e180@mx.google.com=
/
>   https://syzkaller.appspot.com/bug?extid=3Dea7ed3bb2f444cb4dfeb

Again, may be a similar use-after-free, validating that it is exactly
the same one is time consuming.

> CONFIG_JFS_FS=3Dn in both ktypes/standard and ktypes/preempt-rt in
> yocto-kernel-cache, and no fragment enables it.

Yes, but users may enable this, so it's not relevant to the analysis.

>=20
> CC: Paul Barker <paul@pbarker.dev>
> AI-Generated: Uses Claude (claude-opus-5)
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
> ---
> v3:
> - correct the claim that only one fix was proposed and withdrawn:
>   further fixes were posted in 2026 but none is merged
> - add the syzbot dashboard and the June 2026 report as evidence the
>   race is still live in mainline
>=20
> v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/
>=20
>  meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
> index a909aef..c4a9dea 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -237,3 +237,10 @@ CVE_STATUS[CVE-2022-1247] =3D "fixed-version: Fixed =
from version 6.17"
>  # https://www.willsroot.io/2022/12/entrybleed.html
>  CVE_STATUS[CVE-2022-4543] =3D "unpatched: no upstream fix, KASLR is not =
\
>  treated as a defence against local attackers"
> +
> +# JFS txEnd()/lmLogClose() use-after-free on unmount. No fix merged: the
> +# 2023 proposal was withdrawn, the 2026 proposals are unreviewed, and th=
e
> +# racy code is unchanged; syzbot still reproduces it.
> +# https://syzkaller.appspot.com/bug?extid=3Dea7ed3bb2f444cb4dfeb
> +CVE_STATUS[CVE-2023-3397] =3D "unpatched: no upstream fix merged, the \
> +affected fs/jfs txEnd()/lmLogClose() unmount race is unchanged"

Recommended wording, links and include triage date:

    # Triaged August 2026 - Originally proposed fix was withdrawn, similar
    # slab-use-after-free appears to have been re-found by syzkaller in 202=
6.
    # Unfixed in Debian, "needs evaluation" in Ubuntu.
    # https://lore.kernel.org/lkml/CAJedcCzmx02bfa22QezE8mu-iDsSdSy_oApT2oz=
CWO8O-8MJEQ@mail.gmail.com/
    # https://syzkaller.appspot.com/bug?extid=3Dea7ed3bb2f444cb4dfeb
    # https://security-tracker.debian.org/tracker/CVE-2023-3397
    # https://ubuntu.com/security/CVE-2023-3397
    CVE_STATUS[CVE-2023-3397] =3D "unpatched: Proposed fix was withdrawn"

Best regards,

--=20
Paul Barker


