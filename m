Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12ED8CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 08:00:17 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.124925.1781510410801601510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 01:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=LgtHZ3eW;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=NgWuPPrY;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6CF3B7A0174;
	Mon, 15 Jun 2026 04:00:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 15 Jun 2026 04:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781510409; x=1781596809; bh=XAP8iJrpNj
	4j5CRSCEYDdJrucLgwcIzbGmcT5iQFRqw=; b=LgtHZ3eWiZre2rQqqpoK87yJgz
	XOPW+jM+yhj6s935tGYhgBdSV5uJLfbKngFm3CcdQNL1BN7neLWxdDXkV05LYbzJ
	udFo88SfZ/3R0F3Yh/7GiExAKvsDD2J6N8SrwD9SsCB8UDI+OcPvCl02VU6Yu6Fz
	9XZl0kyUgPrEhifiWRy7XHV12e0OpOXxkKt237V5pEXmEkXDmh9qCE5fuc/CjEV1
	E8Tn7MToKrHG57EqndbOdC/KWGDR95XKu0z9cJnZFARSpLpZXt+znAPtAW6lF1EF
	YPHW25NmDQTiI87c//Ej6Yzyl9TnjGpmyekaLXBbxT61hu0ENs/NvyGj7FKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781510409; x=1781596809; bh=XAP8iJrpNj4j5CRSCEYDdJrucLgwcIzbGmc
	T5iQFRqw=; b=NgWuPPrYLozM4M2wfHV/x4ODFmfPvGjlkQKVpdqVlNGtNQQLFTI
	ov3fv5yLTsuyGZScas9I83wI61XnLkOPav7p4sKhbsM8NwtaT6iDYeTv3hLHpAT9
	5VpP8/hUGAA3ijPkBzmLJxy53I4OeHGrZgMoxfuOFoy2//F1mIaTrczRKN/+PcN7
	z22wvILxvdFF8EDGC4x94lFLtpL6ON2wXOAQW2vinklyKu3LZPtvylIf8RjENrl+
	ipuBkkTDIBQC5vcvO+tcYKpJ+VEYexBvryrTSps4yYX9aQtUSlNjwgYOqNBuJsIA
	APammwPC72oegT98T4m+mp3ciUhMVX0exOQ==
X-ME-Sender: <xms:CLEvaipHXXBj02AZZq8EMUs052VDvxtKC50vUznWENYG7fcVZInzeg>
    <xme:CLEvanrJjQ9_7X0pTN7w3cbER6Fh7wJIAHSUkqYaj-smL2I-Twe6E1R898FIE8-Yt
    nOwUvdBgkBkf4qj1s8VLPJvB1wCtOEsL3k2jY9NgFtCX7vfJlI>
X-ME-Received: <xmr:CLEvasNyxPgx0jrb0BAbgoF5-tj82VCSNTTkIz0mrd_8aYgTc9YiECc6ZwCmpS5Q8_ppvDkEOs6QbOB4DioOZBJTytaA-za_e4PYJP1rdURA>
X-ME-Proxy-Cause: dmFkZTFktOA5HOvNeu1dcXERMPjgUqeQYxqWP+OJEZQqn2pE+cHefhSC4Q1ZHI/iTFB5N7
    yVudQajam6nwLK+k1obD7kenD1Ti847KG4cHFIgk5hAHPLe0HXxk93vF+RNELI4vv6n/VQ
    fX04xXpL18U3xvPmHRAhP+6G5wxoCOugFrPLbV4+9t5ePjv5PjzncUg0Ey7we1nEQcIhEZ
    MuLDKHrtW+lIvrUGAAsp5Z1GRUPs7D0fo6BQzMs9qwJ0YlXXmckmzywZ+6TatIxVur6TVz
    MW6RDzk+IqtqeXNw5ypBM/W9dX9+jCyENG/K0JDLPaTl488aq2ry96Ey4kenPpxdMWNWAY
    9FgyCpBmVksRM134V/G5j08eN3BZ0mJ9dv+jxG9B7JJH5UJOpi1ckUK0m8Mho2b2nj2nv1
    kKmShbgTmwZZY6P3Ag1ceTPh8SEVGDuIrh+TMiFv8OMW0qXxEzjWNsE5Vhc/jTJrbTw3lO
    qQrIc1bEYtVe655ew4pNIYb3QNsOzsNFT8fCzlaXu3URbu9KW6QnMjBBV79kgKrF71Xjo2
    Hs1fiEfpURR8B1pkV+8Ur4kb8EyOdJF0XWbfoT6/MTs49IS+AciORFCxIv9VfXJd0ku2OX
    Qvv6VNYdvLF7XCco8CWlFUaDOAPWqiN8sxKzeKLaOs+NLPnYQ7vzNVGOXMMA
X-ME-Proxy: <xmx:CLEvagwdpClp951D8YC5wWOAbdTb8-i85f_8s2hOlWzbKyDl4iZerw>
    <xmx:CLEvattbSgnv8BdqfEkP_iymr1Ikpr7UBHdss0A5hY-f1AHBUDm6YA>
    <xmx:CLEvah4sqqmfw_mMThSCT_LKgbAq5RloOThBp-tkrhX8RPZg3E85Fg>
    <xmx:CLEvakTQqlhm53iCkftTPsS59VJrUFt36zlvgBD_V9ru8hlC9U08yA>
    <xmx:CbEvag-k3TTeDcQP4rR9c-exWHWCMp7dFQGmAzWxTecQmiEQGh7WJFHv>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Jun 2026 04:00:06 -0400 (EDT)
Message-ID: <8dd3e431cafdd364285eeaa79bf89507a4f4c6a1.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 03/21] nfs-utils: fix CVE-2025-12801
From: Paul Barker <paul@pbarker.dev>
To: jeremy.rosen@smile.fr, openembedded-core@lists.openembedded.org
Cc: Sudhir Dumbhare <sudumbha@cisco.com>, Yoann Congal
 <yoann.congal@smile.fr>
Date: Mon, 15 Jun 2026 08:59:58 +0100
In-Reply-To: <33321e687cf18e03bb1d824d58214d758b02078f.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
	 <33321e687cf18e03bb1d824d58214d758b02078f.1781270474.git.jeremy.rosen@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-73G6CiekxgpakQdafXOd"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 08:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238821


--=-73G6CiekxgpakQdafXOd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-06-12 at 16:25 +0200, J=C3=A9r=C3=A9my Rosen via
lists.openembedded.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>

+Cc Sudhir

>=20
> - This patch applies the upstream fix [5] as referenced in [7].
> - To successfully apply the fixed commit, apply the dependent commits [2]=
 to [4]
>   which are included in v2.8.6, as referenced in [7].
> - Additionally, include dependent commit [1] from v2.8.3, as referenced i=
n [8]
>   under the [2.5.4-38.2] description, along with compilation fix commit [=
6]
>   from v2.7.1
> - Reference:
>   [1] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D=
cd90f2925790
>   [2] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D=
7e8b36522f58
>   [3] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D=
42f01e6a78fe
>   [4] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D=
51738ae56d92
>   [5] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D=
f36bd900a899
>   [6] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D=
a2c95e4f557a
>   [7] https://security-tracker.debian.org/tracker/CVE-2025-12801
>   [8] https://linux.oracle.com/errata/ELSA-2026-3940.html
>=20
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>

[snip]

> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801=
-dependent_p1.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-202=
5-12801-dependent_p1.patch
> new file mode 100644
> index 0000000000..223249a9d6
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-depend=
ent_p1.patch
> @@ -0,0 +1,71 @@
> +From 647c9cb3ac3cbdf9ffd9e29f7d5dd04da84afdbc Mon Sep 17 00:00:00 2001
> +From: Christopher Bii <christopherbii@hyub.org>
> +Date: Wed, 15 Jan 2025 12:10:48 -0500
> +Subject: [PATCH] NFS export symlink vulnerability fix
> +
> +Replaced dangerous use of realpath within support/nfs/export.c with
> +nfsd_realpath variant that is executed within the chrooted thread
> +rather than main thread.
> +
> +Implemented nfsd_path.h methods to work securely within chrooted
> +thread using nfsd_run_task() help
> +
> +CVE: CVE-2025-12801
> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-uti=
ls.git;a=3Dcommit;h=3Dcd90f29257904f36509ea5a04a86f42398fbe94a]
> +
> +Backport Changes:
> +- In support/misc/nfsd_path.c file, only nfsd_run_task() and the
> +  struct nfsd_task_t have been included to resolve a compilation
> +  issue. All other non-essential changes were excluded.
> +- The non-required file support/export/cache.c and support/nfs/exports.c
> +  has been excluded.
> +
> +Signed-off-by: Christopher Bii <christopherbii@hyub.org>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +(cherry picked from commit cd90f29257904f36509ea5a04a86f42398fbe94a)
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + support/include/nfsd_path.h |  1 +
> + support/misc/nfsd_path.c    | 14 +++++++++++++-
> + 2 files changed, 14 insertions(+), 1 deletion(-)
> +
> +diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
> +index aa1e1dd0..4f5fc44e 100644
> +--- a/support/include/nfsd_path.h
> ++++ b/support/include/nfsd_path.h
> +@@ -8,6 +8,7 @@
> +=20
> + struct file_handle;
> + struct statfs;
> ++struct nfsd_task_t;
> +=20
> + void 		nfsd_path_init(void);
> +=20
> +diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
> +index c3dea4f0..fa908f7c 100644
> +--- a/support/misc/nfsd_path.c
> ++++ b/support/misc/nfsd_path.c
> +@@ -19,7 +19,19 @@
> + #include "nfsd_path.h"
> + #include "workqueue.h"
> +=20
> +-static struct xthread_workqueue *nfsd_wq;
> ++static struct xthread_workqueue *nfsd_wq =3D NULL;
> ++
> ++struct nfsd_task_t {
> ++        int             ret;
> ++        void*           data;
> ++};
> ++/* Function used to offload tasks that must be ran within the correct
> ++ * chroot environment.
> ++ */
> ++static void
> ++nfsd_run_task(void (*func)(void*), void* data){
> ++        nfsd_wq ? xthread_work_run_sync(nfsd_wq, func, data) : func(dat=
a);
> ++};
> +=20
> + static int
> + nfsd_path_isslash(const char *path)
> +--=20
> +2.35.6
> +

Reading the commit message, and looking at the diff in the original
commit [1], I think we should apply the complete patch here. And it
seems that's what RedHat have done when backporting this fix for RHEL
9 [2].

Sudhir, what's the reason for trimming the patch down?

[1]: https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3Dcd9=
0f29257904f36509ea5a04a86f42398fbe94a
[2]: https://gitlab.com/redhat/centos-stream/rpms/nfs-utils/-/commit/6f3323=
16f7aa605d67f6b60db0be68f63bf28f9c

Best regards,

--=20
Paul Barker


--=-73G6CiekxgpakQdafXOd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCai+w/hEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bvcaAP9iyPwMg0PGABgSrXsL4TszJsgEgBMLZstU
lXC+Xoeh9gD8DZ+NccHk6QOox1A/tAP55Le3SSrGx6RYZUF8sikfpww=
=yKUj
-----END PGP SIGNATURE-----

--=-73G6CiekxgpakQdafXOd--

