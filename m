Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350D0CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 11:35:48 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17585.1781782538475288064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 04:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PIFz1LIY;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8dd6e530061so6650826d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 04:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781782537; cv=none;
        d=google.com; s=arc-20240605;
        b=RHD227X2H7PHPMts60PkhM6k6vusth/HTDj4Vm91ov+SlLooyw1IELF9pie2kF/ptC
         oFpiJAB6zGMOJ3OfoNy+238P2Ioob0SWgpxyXrEgwmswnfXEM6/RulF8H5SjNyWr4bt9
         eBFl8zoEKLO9XMNlw7w03lAkQmBz4XR4Y4kPWtM0Abhe03LDbZd+Osd7a6jUmzd2PXP3
         43cIAjQT+KocFSqGIGaaPlYzvTGvGJAyeSsmMFy3yS6Nlpuyvu4VSNXrMAQRelrAfEzO
         r4sRX3epU2Z8LWoGois36XJIC26fQ37XPwe6ozxAT8PT4k+6AOqVPsdNYgJEsz4u5N/U
         xoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hiG61m7JZRwrM8RNHTDLyl1T6OH8fcOqQPCMe/dXQGE=;
        fh=HgBFE8oDzdXxjqz2aDHYJnzucCDxY3o+p6tmacWzQqM=;
        b=CBLtKSDnJUeWjpHZuV2P4mn/ajT0fDLjJswQTcjKW45SerqS+vzdO58lJI9rmKuxAc
         6LVcgDEbHIqUVl4Qka2pS6Eenn3qH9OEIH0R+I/g5y/OSs6Cuj5fJyZ4oOtYRIA3GAUe
         iQQvTJkOGrez/5AQ4D88pMbP/e4lF3Kob2bc9PYNtu3uonNp4qcnQULHSVWSvP4qOyJV
         4eb75rWfxAu0kljdv0bvF3rLDtKsa2Pr1/lsa3MaqMpOMF55HLborwllo0q9MU4h+33f
         17BiLFl3kMLoR253qT7ByDOfVe1RqI3haPF4zLH5ya1fsvcYailUkO0bcaDHteBVpfM5
         r1zg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781782537; x=1782387337; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hiG61m7JZRwrM8RNHTDLyl1T6OH8fcOqQPCMe/dXQGE=;
        b=PIFz1LIYkhmL6KyrDQdfQEn3sbq5sd7b1s1iSPJOuCvglpENtvRY2Fw0OduIgTO7N5
         tHrBTx62/CErbyCRIyWwxKWrwH6l9It25aY8R6+DRknaUhUghoD8dGNN93RrXLaUL1Fc
         mRkEd52sv/Gc5wVAwYfNX9B31kI2aAtmppgEctzEpqaACEzUTx22HNJ6XkID8QJx0vrJ
         ALSzFZ+JujIHUuXkf2QR/J0gil4B7DBra5E6qZkfArVes9k8VAayZjVGen0FRgKcVvYN
         tkWUfG6cPnBN2xXzi4p6INeugbvCe17OyxV2HdRxBoffdaqfSAnX/W1FEMiAkSNBR4SJ
         HZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782537; x=1782387337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiG61m7JZRwrM8RNHTDLyl1T6OH8fcOqQPCMe/dXQGE=;
        b=p7sA+10oRp2N2s8SCn6ZwHpuxijJhmTChKYEr1Lc7KZ9sfjdN4oXypazxvVziUTpZZ
         NjoNq+qEjcHNn0zghxlZyHjl3osqH/KnV7IrLQLPJklWEYXtWv0HkypsuJyc5eeYpq1g
         i1AdRuHR7CMAa1HH0Z/Np+OKerGaUgvNP3htiEqJLs1H8uw6IQr2J22z4fj84waz2379
         MHMt7yZexOxMunwWc4dDqheoC6zOkBMFZlMyTBFNd1PKRmL9kQ1L0zVG/NGGeZXiMm/l
         PvFeVqJFgwbvFYl5L07/TrjmnwL/kUvyzHnuupOJb8BflU8To4uW3SOujKjOJQFdJvMV
         M0ZQ==
X-Gm-Message-State: AOJu0Yy+o4WIyzyaHA9EOo60fkzpdSnACImKh6kROiUwg9y7Wqua6k5z
	CzyEF3thNROulHD+m/f/07+GtpdgiLWiTrVWYKWOVVUfxElezSR0kX98HvEIO0m5lNHRutAslS7
	Ta9TU/mnUfWv1LmaG8hL72fISkFj/iglFOr/imBB5YQ==
X-Gm-Gg: AfdE7ckZB0JfQ/8IKZlybaLUqgaQiZ0Kt4eNbAMLY6tPiZn1Q30r/HHEzC+T6rkx9QH
	Ka1iieZYYcDkp4apNxoMMulxG1yRpVrrhtBG2jxjYA+KeEiylV6Ho5eMns/ZPW2hxVykctfVCpO
	NCgxkfuSl14pxvulWzB+mffdY+ItJe4oy0qdFJsZVYAYPt9bo2uyJeM/ZeuvvYPeWM9UJPIFWck
	lmdCPJdtz0QHkL2xY7M/m0p+RlwVEHsan+84Qqfy7kxG3zlRZsriwO6dKePVGkPCa1tvuRshiTZ
	mKg+2SxUEBrxde/fjZRSv6mqpNQ=
X-Received: by 2002:a05:6214:61c5:20b0:8db:dd:4d85 with SMTP id
 6a1803df08f44-8dce0f999f1mr43321306d6.26.1781782537365; Thu, 18 Jun 2026
 04:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260618102839.363123-1-nathan@otiv.ai> <20260618111458.3490459-1-sivakumar.bs@gmail.com>
 <uzyyorseo2zcjbxjk4yi4h6kxcienx4tdo3funkrnpw6k5lwv7@aimmwwbtvknn>
In-Reply-To: <uzyyorseo2zcjbxjk4yi4h6kxcienx4tdo3funkrnpw6k5lwv7@aimmwwbtvknn>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Thu, 18 Jun 2026 17:05:10 +0530
X-Gm-Features: AVVi8CdP-EUFo36S2f3dc4B-lZGtB1n0gGipV-s14DT-aNN7pUTfImc8Vq674f8
Message-ID: <CACFV95+UJnH3=Vibi_nh_4d7c22PvQAxOJGcoxPV4L6OvfSZ4Q@mail.gmail.com>
Subject: Re: [PATCH] Update sed usage by 'pam-wheel' for sudoers
To: Nate Kent <nathan@otiv.ai>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000034ed82065485931b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 11:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239078

--00000000000034ed82065485931b
Content-Type: text/plain; charset="UTF-8"

Absolutely, please go ahead - it's your bug and your patch, glad to
leave it with you.

For the resend, the convention is a "v2" of the same patch, not a
brand-new submission:

1. Amend the commit to address the feedback:

   - Shortlog needs a "<target>: " prefix, e.g.
       sudo: fix pam-wheel sed for 1.9.17p2 sudoers format
     That clears the patchtest shortlog failure (and it's well under
     the length limit).

   - Use the bug tag in the form "[YOCTO #16321]" on its own line
     instead of "Fixes Yocto Bug #16321". That is the form that
     auto-links the bug and that patchtest's bugzilla-entry test looks
     for - your v1 was reported as "No bug ID found" because of the
     free-text wording.

   - Drop the "Upstream-Status:" line. That header belongs in actual
     patch files (recipes-*/.../files/*.patch that modify upstream
     source), not in the commit message of a recipe (.bb) change, so it
     does not apply here.

   So the message body would look roughly like:

       sudo: fix pam-wheel sed for 1.9.17p2 sudoers format

       <your explanation of the root cause>

       [YOCTO #16321]

       Signed-off-by: Nate Kent <nathan@otiv.ai>
       Tested-by: Siva Balasubramanian <sivakumar.bs@gmail.com>

   Feel free to carry over the Tested-by above into v2 - the code is
   byte-identical, only the commit message changes.

2. Regenerate with the version bump:

       git format-patch -v2 -1

   That labels it [PATCH v2]. format-patch won't add the changelog for
   you; edit the generated .patch and insert a short "what changed"
   note right after the "---" tear line (above the diffstat), so it
   stays out of the committed message, e.g.:

       ---
       v2: add "sudo:" shortlog prefix, switch to [YOCTO #16321] tag,
           drop Upstream-Status (n/a for a recipe change)
        meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 +-

   (You can also use "git send-email --annotate" and add those lines
   there before sending.)

3. Send it with the same git send-email to
   openembedded-core@lists.openembedded.org. Either a fresh send or a
   reply works; sending top-level with
   --in-reply-to=<20260618102839.363123-1-nathan@otiv.ai> (your v1)
   keeps the thread linked. v1 can then be marked Superseded on
   patchwork.

Happy to look over v2 when it's up.

--00000000000034ed82065485931b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif">Absolutely, please go ahead - it&#39;s=
 your bug and your patch, glad to<br>leave it with you.<br><br>For the rese=
nd, the convention is a &quot;v2&quot; of the same patch, not a<br>brand-ne=
w submission:<br><br>1. Amend the commit to address the feedback:<br><br>=
=C2=A0 =C2=A0- Shortlog needs a &quot;&lt;target&gt;: &quot; prefix, e.g.<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0sudo: fix pam-wheel sed for 1.9.17p2 sudoers f=
ormat<br>=C2=A0 =C2=A0 =C2=A0That clears the patchtest shortlog failure (an=
d it&#39;s well under<br>=C2=A0 =C2=A0 =C2=A0the length limit).<br><br>=C2=
=A0 =C2=A0- Use the bug tag in the form &quot;[YOCTO #16321]&quot; on its o=
wn line<br>=C2=A0 =C2=A0 =C2=A0instead of &quot;Fixes Yocto Bug #16321&quot=
;. That is the form that<br>=C2=A0 =C2=A0 =C2=A0auto-links the bug and that=
 patchtest&#39;s bugzilla-entry test looks<br>=C2=A0 =C2=A0 =C2=A0for - you=
r v1 was reported as &quot;No bug ID found&quot; because of the<br>=C2=A0 =
=C2=A0 =C2=A0free-text wording.<br><br>=C2=A0 =C2=A0- Drop the &quot;Upstre=
am-Status:&quot; line. That header belongs in actual<br>=C2=A0 =C2=A0 =C2=
=A0patch files (recipes-*/.../files/*.patch that modify upstream<br>=C2=A0 =
=C2=A0 =C2=A0source), not in the commit message of a recipe (.bb) change, s=
o it<br>=C2=A0 =C2=A0 =C2=A0does not apply here.<br><br>=C2=A0 =C2=A0So the=
 message body would look roughly like:<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0su=
do: fix pam-wheel sed for 1.9.17p2 sudoers format<br><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0&lt;your explanation of the root cause&gt;<br><br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0[YOCTO #16321]<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by=
: Nate Kent &lt;<a href=3D"mailto:nathan@otiv.ai">nathan@otiv.ai</a>&gt;<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0Tested-by: Siva Balasubramanian &lt;<a href=3D"=
mailto:sivakumar.bs@gmail.com">sivakumar.bs@gmail.com</a>&gt;<br><br>=C2=A0=
 =C2=A0Feel free to carry over the Tested-by above into v2 - the code is<br=
>=C2=A0 =C2=A0byte-identical, only the commit message changes.<br><br>2. Re=
generate with the version bump:<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0git forma=
t-patch -v2 -1<br><br>=C2=A0 =C2=A0That labels it [PATCH v2]. format-patch =
won&#39;t add the changelog for<br>=C2=A0 =C2=A0you; edit the generated .pa=
tch and insert a short &quot;what changed&quot;<br>=C2=A0 =C2=A0note right =
after the &quot;---&quot; tear line (above the diffstat), so it<br>=C2=A0 =
=C2=A0stays out of the committed message, e.g.:<br><br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0v2: add &quot;sudo:&quot; shortlog=
 prefix, switch to [YOCTO #16321] tag,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drop Upstream-Status (n/a for a recipe change)<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 meta/recipes-extended/sudo/<a href=3D"http://sudo_1.9.17p2.bb=
">sudo_1.9.17p2.bb</a> | 2 +-<br><br>=C2=A0 =C2=A0(You can also use &quot;g=
it send-email --annotate&quot; and add those lines<br>=C2=A0 =C2=A0there be=
fore sending.)<br><br>3. Send it with the same git send-email to<br>=C2=A0 =
=C2=A0<a href=3D"mailto:openembedded-core@lists.openembedded.org">openembed=
ded-core@lists.openembedded.org</a>. Either a fresh send or a<br>=C2=A0 =C2=
=A0reply works; sending top-level with<br>=C2=A0 =C2=A0--in-reply-to=3D&lt;=
<a href=3D"mailto:20260618102839.363123-1-nathan@otiv.ai">20260618102839.36=
3123-1-nathan@otiv.ai</a>&gt; (your v1)<br>=C2=A0 =C2=A0keeps the thread li=
nked. v1 can then be marked Superseded on<br>=C2=A0 =C2=A0patchwork.<br><br=
>Happy to look over v2 when it&#39;s up.<br></div></div></div>

--00000000000034ed82065485931b--

