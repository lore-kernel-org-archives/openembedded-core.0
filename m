Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC43CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 20:59:59 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68426.1790629190326241976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 13:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iCeb5zCM;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1914104f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 13:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790629188; x=1791233988; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=79ulX61XuG3xtpG1cIZfcIW+TRAP8cBSG/aMjabFAms=;
        b=iCeb5zCMEfDzrINIl7n1U+TCUde9mH41KpNjlZOM2uMRTOmeQh/SUTFR7NY2AFKxJE
         zzkpn5p6Fd19mBu3cP6r/+TSJIXmIQYQobBnCz7nzJXUXFU6WjE93tpEbXGanLYnYxtd
         K9jJbYiefcbxUCaQW7hkHEgovUY8CvNHNSlbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629188; x=1791233988;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79ulX61XuG3xtpG1cIZfcIW+TRAP8cBSG/aMjabFAms=;
        b=y/FAVU/kfiX36EP64K3pzg0v0ugwBo3LxyYE90apMs1J/l8XaJoxJyrcDzaRO3NHoM
         /7TIo53VlSXaPQH7pbPW6Y2BjtxEssULFVEAVtHvDYGMfac4bfr/ltBPRGKLJzUPgeTd
         BwzvqhwAgYbszsZEYu8dRT8YrPDG3o61xHpYbYmtaDKYiYj8CJSKvZqbUQiwbBfuiOjd
         SVzhxmYcqid3GIyfCUGBktZWWpBM832hsExsIvrQ1yg04vMbq5yVvvojkYkrfaqkId/x
         1qE5NEDH7pHsiXySWlGOjW0IqMvOzzfFnXMufyn05SJRjSMIY681hSYq9lsZJ6bHYtyJ
         /Low==
X-Forwarded-Encrypted: i=1; AKwUvBx2K7RzitLjuVuaZE4Kq8f10Swx9MaoUlIICVumg6vijTKBGPny9HgIR5nCvWhvRiAvlrmFY9vxfdtzdsKcM7x2Ew==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKgBq4sJ7obF5PqsA18Ke3FD9R5Ke94YBmKMjLrrikQMoQfkZ5c
	YFv8cr1XtwsjiudLSlm1IipJAA7JjsTNyF3gs8RRDKZbaxFzSgC8x1GTecO530zFmN8=
X-Gm-Gg: AYBFou37Zk4710ec3+Xl4Ld0FYWQVk5+V69llyLnI/g2plDmDVVbZO31aQv5BBSc3PA
	2DA6J4YHx6HuK0Zi0tqIsk/3Tc1eb88d4lqa61HdoHCJUn6QPpGK9EuKDdepA5ISAlHscgspD+E
	wNLe4zEr9cX1nP+h0nICywSuX9aKB6+XLmf1kVHXcwXiwAXFeGW22QLPn1V3w3jFV1geRdezR5I
	JA1Nm3x4M6CeDufLwnU9828orom7d+No+Xk/vXeIrDF5xpvXSDrvDIaZ0s2/u8qsJbQ9p5roBvA
	nPgQKTqksRlNHYkEvfxdOjgN7+6ETTqCVe7mwj7tUuRNs6wrOcYi7qYxsXSKNa62ekLOpM4PGJ7
	uSroKAhK6XGT5EM4/0etbyvqMeLvIxIWp3gqKgIOG9gmxqc5vHLFfiK7i07S9E+7CBC8ZSdSAPQ
	CKFV0OwOWp+050qyv3aAd0A9sF1L9gX7Of5KrfvTwUP6ownNi/xg7urvPF3wqgl1XCe4KMwtBYP
	7KNxYfav/hm5wjm3IFy/wqdO8denGBXeeDN6ZAbWFBsVvCFS90kXC4bUCMr4sI=
X-Received: by 2002:a5d:6f03:0:b0:487:fa8:46cc with SMTP id ffacd0b85a97d-4887165ea11mr25944068f8f.1.1790629188568;
        Mon, 28 Sep 2026 13:59:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac72:a995:3736:8254? ([2001:8b0:aba:5f3c:ac72:a995:3736:8254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm28024098f8f.5.2026.09.28.13.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:59:47 -0700 (PDT)
Message-ID: <6720cb7aa4c91cc51bc72b47e48ed78b6a6d421b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 2/3] create-spdx-3.0: record component
 release date in SPDX output
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, mathieu.dubois-briand@bootlin.com
Date: Mon, 28 Sep 2026 21:59:46 +0100
In-Reply-To: <20260928190400.3908822-3-daniel.turull@ericsson.com>
References: <20260928190400.3908822-1-daniel.turull@ericsson.com>
	 <20260928190400.3908822-3-daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 20:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246801

On Mon, 2026-09-28 at 21:03 +0200, Daniel Turull via lists.openembedded.org=
 wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> Record each recipe's release date in the releaseTime property of its
> software_Package object, using the SOURCE_DATE_EPOCH already computed
> for reproducible builds.
>=20
> Accuracy depends on how SOURCE_DATE_EPOCH was derived: exact for
> git-tagged recipes, best-effort for tarball/http(s) sources. Some
> Python sdists (e.g. cryptography, hypothesis, maturin) normalize all
> file mtimes to a fixed placeholder, so their releaseTime reflects
> packaging-tool behavior, not the real release date.
>=20
> Tested with oe-selftest -r spdx, and with `bitbake world
> --runall=3Ddo_create_spdx`: 1011/1150 recipes got a releaseTime (range
> 1998-12-30 to 2026-09-17), 139 correctly had none.
>=20
> AI-Generated: Uses Kiro with Claude Sonnet 5
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
> v2:
> - Dropped all options per Joshua's feedback; read SDE_FILE directly.
> - Dropped the redundant else: delattr(recipe, "releaseTime") branch.
> - Selftest compares against SDE_FILE content directly instead of
> =C2=A0 SOURCE_DATE_EPOCH, which can diverge from it.
> - Fixed a leak: recipes with no git checkout and no fetched source
> =C2=A0 had SDE_FILE holding only SOURCE_DATE_EPOCH_FALLBACK, showing a
> =C2=A0 bogus 2011-04-05T23:00:00Z releaseTime instead of none.
> v3:
> - Also run after do_unpack: do_deploy_source_date_epoch's setscene
> =C2=A0 shortcut can skip it, leaving SOURCE_DATE_EPOCH unset.
> - get_release_date() reads SOURCE_DATE_EPOCH again instead of
> =C2=A0 SDE_FILE, now that they're guaranteed equivalent.
> - test_release_date_source_date_epoch: switched to tar (base-files
> =C2=A0 has S =3D=3D UNPACKDIR and never gets a real SOURCE_DATE_EPOCH).
> - Added test_release_date_omitted_for_fallback_value.
> ---
> =C2=A0meta/classes/create-spdx-3.0.bbclass |=C2=A0 2 +-
> =C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 19 ++++++++++++++
> =C2=A0meta/lib/oeqa/selftest/cases/spdx.py | 39 +++++++++++++++++++++++++=
+++
> =C2=A03 files changed, 59 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 56fd01fd53..2b1465b5a6 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -192,7 +192,7 @@ python do_create_recipe_spdx() {
> =C2=A0=C2=A0=C2=A0=C2=A0 import oe.spdx30_tasks
> =C2=A0=C2=A0=C2=A0=C2=A0 oe.spdx30_tasks.create_recipe_spdx(d)
> =C2=A0}
> -addtask do_create_recipe_spdx
> +addtask do_create_recipe_spdx after do_unpack do_deploy_source_date_epoc=
h
> =C2=A0
> =C2=A0SSTATETASKS +=3D "do_create_recipe_spdx"
> =C2=A0do_create_recipe_spdx[sstate-inputdirs] =3D "${SPDXRECIPEDEPLOY}"

I'm not really very happy about this part of the change. The "recipe"
SPDX data was meant to be the data which can be obtained from the
recipe without fetching the sources. This changes that and adds a
fetch/unpack requirement. At this point it may as well be merged with
other SPDX data that being generated "later" in the build as the
"recipe" only data is losing it's meaning?

Cheers,

Richard

