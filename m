Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728C0C5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 10:50:25 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7973.1786877412852449076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 03:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Rak2U782;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=gQX7z+AX;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F10267A014E;
	Sun, 16 Aug 2026 06:50:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 16 Aug 2026 06:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786877411;
	 x=1786963811; bh=lOsP4DgQwh/WklSB7gFgrndYnJHypzqXVAsQaOusDUA=; b=
	Rak2U7823uZ+Z2ZguRhxCPUzY1o/1ea8TixrN8zBi10bwderpCJEMr0MJagPm6aL
	KBW4YGBRoU/TgUekYhCzCu0jckobdeX26pMxHdKXAlC77KGhgDtuzIdxd8aTeXJ5
	wKmL7BoUQ9pBS2C9zMWagBKlRYr9CfEha3pj1crSQeh5njZOKJjAs8LpQA5wHvOj
	zwbLnFh/wTHR4ZbCU4nyaO3Meh0/tXH3CAOYc24Qq6BI0AOqjqdeh/04noaaoVYL
	4d0+kjlxY8F7BG/g4737AIjdcukBBVs1Mm0W/DnqNqeifSCZ7rHKqc+UOtPwq+ks
	hI9dvWSbo2d8i7/AFMxpxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786877411; x=
	1786963811; bh=lOsP4DgQwh/WklSB7gFgrndYnJHypzqXVAsQaOusDUA=; b=g
	QX7z+AXJWhnHRa/rjliP1DOIPlnGraxh3kWqQEw3OT/0gM5KaOjKqPYQkYPrGTcC
	Hs/zZQLVELVl58ZxUmb8VAmwJBsjgHTIM0gUaYLaBMHssxHMHNhcQrA2PBCM/QR/
	3e9Pk3CwyapoZ76Z9DaR1Fxl2cFx4VTPU6zWjL4cmCqA7nLLv5vMHas+3fdm58Q4
	f0uyxVcu4YaqTy0voWrOS8oS7l8bqsW1N6oLktPlQUzYg8k1q+x5sBS0WRBRbaB8
	KXu/ba0+4Mr8scMqYK5BRCkAHrTFI96rb2VZYEM26Q+E1AGfrvqtLI2gP0B4EXq4
	1JwT0zh30aGKA9S5HMQgw==
X-ME-Sender: <xms:45WBaqL2TcQ8BVdXJ_A_aHnyahhr5DGYfu9lT8JCGv0YGeOrnPF-Lw>
    <xme:45WBapB1TJW_wP-F7pZYQm790zGL6Y4Ves3vcA4O5bAk4tAQg91B06fzreqNOqSkS
    kZi1RUMVNO4nleIzLXwty-tfWw-KDEdSNAayWzD5L5SCtuy7srKGJE>
X-ME-Received: <xmr:45WBajABACcsvTUiXVkskVsN1Kaii1viufS_1UQAlhhBNQ6z9fc0CbVhRUkuxaY7DpsvSFG4mszAf04C-LAg5AqpVY2V2-4b2GlzH-_ixLJw>
X-ME-Proxy-Cause: dmFkZTFWTozSRqxdf/v+XccoKmvIz0Pep8X+MyL1x9vEqxBtnCJ26aPEperPKF8KEYZHVV
    nrjxtH1QQB6jyIfXVH7Isn/lPneMldLKLjrTwXz6naB50gr/Ja+6WlV+2pDOENoOSQ7uMC
    lAAcMBpiKRBhUVbuHvnE8XlS6TngE5x/k4D4FPqGwiO3Tva4vZg/YC8M56EPkReLgMoLNr
    oWdO+x2lIutDTd8FEuCos2A7bFRxWanh0pwo1Mcilj76lOd5GnbVt2ITQftD/9L9WKXipn
    PZ/z8jH9du4tGviYdopFNRqlIqYKHxV+L8ksdoU/CL9xP6TX8oXlkS3u+X5dv4oq75UaTk
    xTyVZJK0gRwvQtu2OKTNendI2wplWmv8CCPApPKQNvFlKeQ3xd2poQJtybTT29nfexvbM+
    2CmUBS011nrf60cKoEmmQik105/BYyxHsOZMd/291RadqSi9KWuU7DThXO/dGAw05/lD5L
    fTxYZCDIOQeBWfk4PW/zzmAuGlzl1+rsvuEKHnbF8VoDy4/QYZrm26ZpORE73+kzBK/vPh
    twul5qm0hocmrm1g948DdMXPtsgKQ/4LJgSm56a76t41JBOdeTfV/I4zcHjKO+6wq9pETj
    WT4nCZYaXKkkeBspGrZHwMZj4rik5Qs3t95aM7UnhsZ+ZGIsj6KzxU5C1IKg
X-ME-Proxy: <xmx:45WBarDL8tnk8KbMlrjT4_P-9csCVhf7IC1RAjG9COkoNO0gRZtDBQ>
    <xmx:45WBauqWtoqX2m_0nsaPH3Q5uTLbM9jpyUgVvfX57q5qHGj4kJC9Kg>
    <xmx:45WBalnXCCvK6ER6te9CuZcQN6DrS_9uI0x-JTz2KPRvh2HiS4UA2w>
    <xmx:45WBauzugk6PZM85OV_wWxwAJ2GJyLaEnaAbiiWP158CvfxnQEoyQw>
    <xmx:45WBaplFpO7lAKuyeBqx3wW1dNNymUVnLgViYIKKelq_mXO0BEGyHu0A>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 06:50:10 -0400 (EDT)
Message-ID: <3e5f24dc43f974a5572ab35ad6ab77e0135bbda6.camel@pbarker.dev>
Subject: Re: [PATCH v4 1/5] oe/patch: Skip commitIgnored when nothing is
 actually staged
From: Paul Barker <paul@pbarker.dev>
To: Jamin Lin <jamin_lin@aspeedtech.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>, "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>
Cc: Troy Lee <troy_lee@aspeedtech.com>
Date: Sun, 16 Aug 2026 11:50:09 +0100
In-Reply-To: <20260731092634.1127862-2-jamin_lin@aspeedtech.com>
References: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
	 <20260731092634.1127862-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 10:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243512

On Fri, 2026-07-31 at 09:26 +0000, Jamin Lin wrote:
> patch.bbclass's patch_task_postfunc calls GitApplyTree.commitIgnored()
> whenever 'git status --porcelain .' reports the source tree as dirty
> after do_patch, to snapshot those changes into the devtool tracking
> repo with 'git add' + 'git commit'.
>=20
> A path can be reported as dirty by git status purely because it is a
> submodule (or an unregistered embedded git repo) that itself has
> modified or untracked content - for example a recipe with multiple git
> SRC_URI entries where one destsuffix places a repo inside another
> repo's own working tree. The outer repo's tracked commit hash for that
> submodule hasn't changed, so 'git add' has nothing new to stage for it,
> and git refuses to fold the submodule's own dirty state into a plain
> commit without it being resolved first:
>=20
>   $ git commit -m ... --no-verify --no-gpg-sign
>   Changes not staged for commit:
>     (commit or discard the untracked or modified content in submodules)
>           modified:   level1 (modified content)
>   no changes added to commit (use "git add" and/or "git commit -a")
>=20
> 'git commit' then exits non-zero with nothing to commit, and
> commitIgnored() propagates that failure straight up, taking the whole
> do_patch task down with it.
>=20
> Fix by checking 'git diff --cached --name-only' after 'git add': if
> nothing was actually staged, there is nothing meaningful to snapshot,
> so skip the commit (and the note it would otherwise add) instead of
> failing.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  meta/lib/oe/patch.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 1d50e83ab7..944dde1e03 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -516,6 +516,18 @@ class GitApplyTree(PatchTree):
>      def commitIgnored(subject, dir=3DNone, files=3DNone, d=3DNone):
>          if files:
>              runcmd(['git', 'add'] + files, dir)
> +
> +        # 'git add' can leave nothing actually staged even though the ca=
ller
> +        # saw a dirty status: a path can show as modified purely because=
 it
> +        # is a submodule/embedded git repository with modified or untrac=
ked
> +        # content of its own (e.g. a further nested git repo from anothe=
r
> +        # destsuffix SRC_URI entry) - git refuses to record that via a p=
lain
> +        # 'git add'/'git commit' without resolving the submodule's own s=
tate,
> +        # so the commit below would fail with "no changes added to commi=
t".
> +        # Skip the commit if there is nothing actually staged.
> +        if not runcmd(['git', 'diff', '--cached', '--name-only'], dir).s=
trip():
> +            return

This is a lot of text for a simple message, was this AI generated?

We can just say "Skip the commit if there is nothing actually staged"
here.

Best regards,

--=20
Paul Barker


