Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856FBCD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 21:02:33 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30146.1780520550017400379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 14:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TMEXS3rl;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so5259104f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 14:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780520548; x=1781125348; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztrfTmkPOA/vsx0BhSN7vemfNxatWnfDx1NKlYasj+Q=;
        b=TMEXS3rlOq36bKtIadqhK0MD8pfMmtZjNkdl7rL1okAoOsqf0fcg1LIcWAGioFPuyl
         xQAeU6kTfwBwl6jQQKdeWLHwz4AvSfZwxi0rCKmEiDnIzjOcIMhpyJBWkwq7rCB5LPeG
         57Li29aGSZAgJ86Zj/d6oRg5pI5VKQAUyP1sA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780520548; x=1781125348;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztrfTmkPOA/vsx0BhSN7vemfNxatWnfDx1NKlYasj+Q=;
        b=H4XSL5uKU4V6DTZgXQH1NDlDf59VoWq5X0BukxOP+G3xqqRz5l0Rcf1fEqZGSNfpcM
         5fkkMpHxlCkMn8tVn/QP1t2AQD2ew+RrA6oq7txJ2ezxfk2eAxsGU6YR8yexBPzIY9+m
         n/kSwjD7avQ6vNOmuxuFfXDui0a8lTKQ6WbrpaSK+kQgT36jheFkC3m9qfnpsO4ciP9G
         tmHys6544o9f5AD2GQ8nky5VMJdda6uySqXwxoRiIzWxzJOqU3NgtyO8652ZVc6G+fk+
         Y4wODQH7EULpY9Md9LB4sw4WyT1it+JtmI7/w2tXq2ObaWH6mKYLhsWVRAfom448TfoS
         SG9w==
X-Forwarded-Encrypted: i=1; AFNElJ8obLLKLKO0iihT6W8Ost4TK/NIyNNoYzILdu9MCM4+/f4qIOQvHQ1g1A+lKQHE0Pz9I3EIutZY68dq13owRXa9wA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBDuiABO1qnKpSMfwxlPt/b+we6T837dL5/Vk4ZAW7zpVuwsK4
	XsRKI/vm4yx+GI5yogHFhopKwPaxQpnSgokF/WNRBMCHyWHlZPRaUzX9vLZX40JEY4g=
X-Gm-Gg: Acq92OExVxpFG+l7e5o15SUj91k0efdBFv/aWIhmCkOhyDa8I+9JyaKOLbSGe/JznpL
	Tb0hr7xVdAGVmERHOsSxYlbwqnMFem6EGb76qoR9FFQov04gLiku18TlV8O5k10Z9WG8osJqGTy
	g35VTpHdrKQRnKKPYv0DIo3yrzRX9g1G/pr9FJc63Y3zW19y+LsAUwhUFOJevgBpBXGd8d3U2YI
	XApSu0r8dNDE5dEOpjHLqLSAHHdvYBL/RCae2TlLqaZqfz0Tjfvc41HaXm9OsvupcEJoZ+2Zdbn
	QJg88dqgT27iBH9aGldsq8UEJixmloAWOyQoa8/+wvy53lQT+Z6o576DOO/+CbOkti/AVzgr4Dv
	aKKL9B0yGgTOmAOIXQp4NHTfnIoWwOgxMwZStMhCp0WiA9TyXloiWxxNzKTMQ4OlKMjrKov5DoT
	drYrH4vo4ZdEex2YVoJF2XXII1YXkFtV9QbTDZHCSDSYM5l1m5qpuDqvzhDGNQzeI4ZrE+mXOTs
	ZRsZPLIVMnRN9cYidkosP2+Jw==
X-Received: by 2002:adf:fc48:0:b0:446:96b1:f53 with SMTP id ffacd0b85a97d-46021844e6emr5379908f8f.26.1780520548291;
        Wed, 03 Jun 2026 14:02:28 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm10422232f8f.26.2026.06.03.14.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 14:02:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 23:02:27 +0200
Message-Id: <DIZPUVCH66VP.2S19RRFXIN3RT@smile.fr>
To: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2 1/2] binutils: fix CVE-2026-3441
 and CVE-2026-3442
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <DICS8ZZ99Q7C.25QI9TUSM1VCB@smile.fr>
 <20260513172734.3995341-1-sudumbha@cisco.com>
In-Reply-To: <20260513172734.3995341-1-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 21:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238110

On Wed May 13, 2026 at 7:27 PM CEST, Sudhir Dumbhare -X (sudumbha - E INFOC=
HIPS PRIVATE LIMITED at Cisco) wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> This patch applies the upstream fix [1], which addresses two out-of-bound=
s
> read issues in bfd/xcofflink.c within xcoff_link_add_symbols(). The chang=
es
> shown in [2] are referenced by [3] and [4].
>
> [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dc2bf7=
de1eb77a91d7a3c86d56408bf57de540faf
> [2] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dbfd=
/xcofflink.c;h=3D1781182fa6a3f92e5e91996f8b0dcf3ab192679b;hp=3Dfde21c9f9583=
baff05e72e390e6bb896d02f9d43;hb=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf;=
hpb=3Dd7f532cb3a46527
> [3] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-3441
> [4] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-3442
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-3441
> https://nvd.nist.gov/vuln/detail/CVE-2026-3442
> https://www.suse.com/security/cve/CVE-2026-3441.html
> https://www.suse.com/security/cve/CVE-2026-3442.html
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---

Hello,

Thanks for this new version but as far as I can tell, those CVEs also
apply to master and wrynose, can you send the fix for those branches and
ping back here?

Thanks!

> Changes v1 -> v2:
> - fixed tab issue around context lines
>
>  .../binutils/binutils-2.42.inc                |  1 +
>  .../CVE-2026-3441_CVE-2026-3442.patch         | 51 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441=
_CVE-2026-3442.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 1a865c45f4..1a91792b13 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -74,5 +74,6 @@ SRC_URI =3D "\
>       file://0030-CVE-2025-11840.patch \
>       file://CVE-2025-69647.patch \
>       file://CVE-2025-69648.patch \
> +     file://CVE-2026-3441_CVE-2026-3442.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-20=
26-3442.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2=
026-3442.patch
> new file mode 100644
> index 0000000000..ada80e5189
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442=
.patch
> @@ -0,0 +1,51 @@
> +From a28f517b1e3c3c22d5984e82046dcb844eef63fd Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Sat, 28 Feb 2026 13:16:40 +1030
> +Subject: [PATCH] xcofflink buffer overflows
> +
> +This fixes two fuzzed object file out-of-bounds accesses.
> +
> +	* xcofflink.c (xcoff_link_add_symbols): Properly bounds check
> +	XTY_LD x_scnlen index.  Sanity check r_symndx before using it
> +	to index sym hashes.
> +
> +CVE: CVE-2026-3441 CVE-2026-3442
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommit;h=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf]
> +
> +(cherry picked from commit c2bf7de1eb77a91d7a3c86d56408bf57de540faf)
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + bfd/xcofflink.c | 10 ++++------
> + 1 file changed, 4 insertions(+), 6 deletions(-)
> +
> +diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
> +index e0165d202a9..88c49755c64 100644
> +--- a/bfd/xcofflink.c
> ++++ b/bfd/xcofflink.c
> +@@ -1873,12 +1873,9 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_lin=
k_info *info)
> + 	     follow its appropriate XTY_SD symbol.  The .set pseudo op can
> + 	     cause the XTY_LD to not follow the XTY_SD symbol. */
> + 	  {
> +-	    bool bad;
> +-
> +-	    bad =3D false;
> +-	    if (aux.x_csect.x_scnlen.u64
> +-		>=3D (size_t) (esym - (bfd_byte *) obj_coff_external_syms (abfd)))
> +-	      bad =3D true;
> ++	    bool bad =3D (aux.x_csect.x_scnlen.u64
> ++			>=3D ((esym - (bfd_byte *) obj_coff_external_syms (abfd))
> ++			    / symesz));
> + 	    if (! bad)
> + 	      {
> + 		section =3D xcoff_data (abfd)->csects[aux.x_csect.x_scnlen.u64];
> +@@ -2244,6 +2241,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link=
_info *info)
> + 		 functions imported from dynamic objects.  */
> + 	      if (info->output_bfd->xvec =3D=3D abfd->xvec
> + 		  && *rel_csect !=3D bfd_und_section_ptr
> ++		  && (unsigned long) rel->r_symndx < obj_raw_syment_count (abfd)
> + 		  && obj_xcoff_sym_hashes (abfd)[rel->r_symndx] !=3D NULL)
> + 		{
> + 		  struct xcoff_link_hash_entry *h;
> +--=20
> +2.35.6
> +


--=20
Yoann Congal
Smile ECS


