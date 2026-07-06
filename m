Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362DAC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:56:37 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148521.1783335394785031998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W+HWm9bG;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c2cce930cso32624801cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 03:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783335394; cv=none;
        d=google.com; s=arc-20260327;
        b=JBmOoPKeENX2ACrq8qROkH0mC5IAV9ibD3gICFYnKcix25XLxUDoYgdy2FnQMbcss/
         ZtEPjp/lH7pRihwB4rFgmsAfTWdZCxGFrxLQcA09GT/VpGQ8pev5MeNyW5T/xsRPl2u8
         hdLTmAOoSlr2kl9QeT9w9ZZ2fWbMILsK3QakJ0kSDR13MNztKiLopb3zJZ/MYUtY7O5K
         GXRy599XS8/KbyGBiAXBky8ixLLPMyJSb3jdH+veqWF/Qbt2DbjMsrVqheM5BOn1XHqO
         TsXjafFdg8MOrV5VaSF/4mZO7Q6PkcdFD7vzy72S2zhKcwuaDmLMjDcaQA3mK9tAebSD
         p0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9LBChsApvYuRUKe4sqGkh+E/ibWvrd88slWaibTYnds=;
        fh=okNfW9qbJKe3pmxcosyCdjKEt0a4O5ln7qJpm5hIjj8=;
        b=mfJ4MQbSdJ0LVVd+FTbQZSM1qRRK+2qLFmKzoS775pqqk3fL6nNsVQdnlQPzYFF+76
         4NdyMfRKmNLeNzitvP5io38Gq7KJtFNNMEdjRGF7KOUq+9pbMrJlkFEtV5uFi8824c7i
         1xfjz5b5GQVTE657/MMweaCeGjjVt8Dxtg74dvxCmWzJxWK+bjY0Sr0oPh1MCBWFptNN
         iXNxe5HrFBHUmgIw9jbeMzmM9/Aquw6O8CG0QchdwOlnfM8IzoSYDVI2YA2vKZPcXd+V
         OpJTvxgL+QxP3vXeb3ig+xXaEmi/djvRpoDw9sq0+U07pMg2xi9VoArIXM0rNbByzokp
         oYIA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783335394; x=1783940194; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9LBChsApvYuRUKe4sqGkh+E/ibWvrd88slWaibTYnds=;
        b=W+HWm9bGA6b8rktdVf9ZjxLtN39akkk3SHm7UvSMUoarZCfC5jTkRfkbkKr03LR1oE
         AW2kv+h9laTFcDngnB9dUZEyb2CQvTBau55m/G79ajV1O3t4toeSHAcazMkmAEGYxgvO
         URrzwQvhQ67Zdq8c/v4sSvTF1IihXPpRoGsS/gHHoNGl6MHk9efCYindRhU9BuJjg5Ma
         qte6Wd7A9zrlN6ByomOW9m3+poDJs2PRyF9Qjj/mGn9XJmlVKe9aIZJZiegBxPri2g3E
         mRiWReA1ZULGfbi99xXlL2VTmoTNOfVNbaznqtXl8BLsBeKmu1Gj4OtIHJkKbEcz/k7K
         BIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783335394; x=1783940194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LBChsApvYuRUKe4sqGkh+E/ibWvrd88slWaibTYnds=;
        b=Nelp5nr2wcvxg30dLJMI2BBpdF5cyuPKNXj8CJAepRS3VpbxryuQVUMLBk1hrckBAc
         9SFFSBEocKlwehFeFYarIlMYltzZnK1gusblgCyv28k9NyxN3ljsndjLsvwwFnu4Jnqd
         cFA1QRoyEYGFSvP7eop/pkxfcLhhXweGR/xcpoS0iHI5tkoIOC2QnfoqL6kwSn7r/C/N
         1S2qaN7ivIMMLMoDARlMlw+DcBijg9GoNVkHdgwo6Nwxp06VFFXQSulASgzMY9vgxTEd
         PYF+SVfqeQ3BNETSpgUmuRNwAAl+9TipgwuxgdDrI1/V8IwoM6hEFEr/xdKcefPsB8MI
         KtSQ==
X-Gm-Message-State: AOJu0Yysj46gL0pmKTfFt2u4xT9sGZAzfadQ2jUmUFNdWUBxSEAs+q+B
	zqNOx1dqwgaXo6YgV9pEFWehtwBqk9coGk2H/mhqLfu47jRuN+53h2hM79TPdnAxDyN6abEwBF2
	ZhESza++QFhFB/SYF/W/VE7ppNZcSBIM=
X-Gm-Gg: AfdE7clDSxPYozQpQcYpeO3F9wO0N4JvXPFgWf/EOaYnsDDqSSmMZVddPJObGRzH8DQ
	m26Thh7U/v5+T/DWY2DcZiusORyEve8UPGN2TC8rW0A15Bt7geCMwhOvVdiHyPvV2GZ52cgHxD7
	TxkrQHG/uboSj5aTIDaw0ReGQM+IGksYpYRv62T7fSUfBidGFo9DI0AW0jjJIUj7jhiaYjFKGz2
	KVREZQVMbWApgk13Sp0L4h6dZAdPHitiqo4mcDL0jVK+Y07qc/3sTNaFU0nYwzqDK5ij648LPTN
	pBj9hygN485fAJhIbeki3Ua2LA==
X-Received: by 2002:ac8:7dcd:0:b0:517:90d2:598b with SMTP id
 d75a77b69052e-51c4c2ad12emr139805201cf.39.1783335393545; Mon, 06 Jul 2026
 03:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
 <20260706063055.1914103-1-sivakumar.bs@gmail.com> <DJRDTHK4PVP9.F3U7AFZTXTGU@smile.fr>
In-Reply-To: <DJRDTHK4PVP9.F3U7AFZTXTGU@smile.fr>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Mon, 6 Jul 2026 16:26:07 +0530
X-Gm-Features: AVVi8CcuKF-sbwdWH0hrZZ5SRzIxeaEerfttFCn4UX5XpTaCPAQ9Kbb0ji-gLJY
Message-ID: <CACFV95Jy1RTuOznn73wLaOFdoM_ACKHF1mgQeYyZywsvFiKJLw@mail.gmail.com>
Subject: Re: [OE-core][wrynose][PATCH v2] util-linux: backport pam_lastlog2
 libpam linking fix
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240247

Hello Yoann,

Good call, I checked and the upgrade does comply with the stable policy,
so I'll send it instead of the backport.

2.41.4 and 2.41.5 are point releases within the same 2.41 stable series
and carry only bug fixes and security fixes, no new features and no
API/ABI breaks. The v2.41.3...v2.41.5 range is mostly mount(8) TOCTOU /
symlink hardening (including CVE-2026-27456), a libblkid integer overflow
in parse_dos_extended() and a use-after-free in partition probing, plus
the pam_lastlog2 libpam linking fix that this bug was about
(c8d0af0421f6, in 2.41.5).

A nice side effect: the upgrade lets us drop two backports that wrynose
currently carries and that are now part of the release -
0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-... (upstream f55f9906, in 2.41.4)
and the pam_lastlog2 backport from my v2.

I built util-linux with pam enabled on top of 2.41.5 and confirmed
pam_lastlog2.so now lists libpam.so.0 in its NEEDED entries, so
YOCTO #16320 is fixed.

I'll send the upgrade as a separate patch (this supersedes the
pam_lastlog2 backport v1/v2).

Thanks!
Siva

On Mon, Jul 6, 2026 at 3:01=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> On Mon Jul 6, 2026 at 8:30 AM CEST, Siva Balasubramanian wrote:
> > pam_lastlog2.so uses pam_syslog() and other libpam symbols but the
> > autotools build did not link the module against libpam. With the
> > linker default of --as-needed, libpam was discarded and did not end
> > up in the module's ELF NEEDED entries. The module then fails to load
> > via dlopen() in processes that do not themselves link libpam (e.g.
> > systemd on recent Fedora, or weston on journald-based systems without
> > syslog):
> >
> >   PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined sy=
mbol: pam_syslog
> >   PAM adding faulty module: /usr/lib/security/pam_lastlog2.so
> >
> > Backport the upstream fix (in 2.41.5) that moves -lpam into LIBADD so
> > it is placed after the object files and retained as a NEEDED entry.
> > Against 2.41.3 only the LIBADD line needs changing.
>
> Hello,
>
> I quickly looked at util-linux v2.41.5 and it look like we can upgrade
> instead of backporting:
> https://github.com/util-linux/util-linux/compare/v2.41.3...v2.41.5
>
> Could you check and, if you think that the upgrade complies with the
> stable policy, send the upgrade?
>
> Thanks!
>
> >
> > [YOCTO #16320]
> >
> > Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> > ---
> > v2:
> >  - Preserve the upstream commit message verbatim in the backported
> >    patch and only append the backport info (Upstream-Status, dropped
> >    LDFLAGS hunk note), per review feedback from Yoann Congal.
> >  - Point Upstream-Status at the util-linux master commit
> >    5683ed6320e00205146cbb3d0c76462733530eca (PR #4358). It is also in
> >    the v2.41 stable branch as c8d0af0421f6 (released in 2.41.5) and is
> >    already present in 2.42.x, so this backport targets the wrynose
> >    branch (still on util-linux 2.41.3).
> >  - Retag the subject for the wrynose branch.
> >
> >  meta/recipes-core/util-linux/util-linux.inc   |  1 +
> >  ...ix-libpam-linking-in-autotools-build.patch | 43 +++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> >  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-pam_la=
stlog2-fix-libpam-linking-in-autotools-build.patch
> >
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes=
-core/util-linux/util-linux.inc
> > index 0235862666..3cdc1e2c0f 100644
> > --- a/meta/recipes-core/util-linux/util-linux.inc
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -21,6 +21,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-lin=
ux/v${MAJOR_VERSION}/util-lin
> >             file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of=
-hard.patch \
> >             file://0001-tests-script-Disable-size-option-test.patch \
> >             file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-syml=
ink-a.patch \
> > +           file://0001-pam_lastlog2-fix-libpam-linking-in-autotools-bu=
ild.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903=
ed9b50ec2b5799e58b"
> > diff --git a/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-=
fix-libpam-linking-in-autotools-build.patch b/meta/recipes-core/util-linux/=
util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch
> > new file mode 100644
> > index 0000000000..90532dde7a
> > --- /dev/null
> > +++ b/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-lib=
pam-linking-in-autotools-build.patch
> > @@ -0,0 +1,43 @@
> > +From 5683ed6320e00205146cbb3d0c76462733530eca Mon Sep 17 00:00:00 2001
> > +From: Karel Zak <kzak@redhat.com>
> > +Date: Tue, 19 May 2026 10:54:57 +0200
> > +Subject: [PATCH] pam_lastlog2: fix libpam linking in autotools build
> > +
> > +Move -lpam from LDFLAGS to LIBADD. When -lpam is in LDFLAGS it
> > +appears on the linker command line before object files, so the
> > +--as-needed linker flag (default on Fedora) discards it before
> > +seeing any undefined PAM symbols. This results in pam_lastlog2.so
> > +missing libpam.so in its ELF NEEDED entries.
> > +
> > +The module then fails to load with dlopen() if the calling process
> > +does not itself link against libpam (e.g., systemd in Fedora 44+):
> > +
> > +  PAM unable to dlopen(pam_lastlog2.so): undefined symbol: pam_syslog
> > +
> > +Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2453457
> > +Signed-off-by: Karel Zak <kzak@redhat.com>
> > +
> > +Upstream-Status: Backport [https://github.com/util-linux/util-linux/co=
mmit/5683ed6320e00205146cbb3d0c76462733530eca]
> > +[Dropped the LDFLAGS hunk: the -lpam in LDFLAGS was introduced upstrea=
m
> > + after 2.41.3 and is not present in this tree, so only the LIBADD hunk
> > + applies here.]
> > +Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> > +---
> > + pam_lastlog2/src/Makemodule.am | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemod=
ule.am
> > +index 40d597c58..876171e9f 100644
> > +--- a/pam_lastlog2/src/Makemodule.am
> > ++++ b/pam_lastlog2/src/Makemodule.am
> > +@@ -11,7 +11,7 @@ pam_lastlog2_la_CFLAGS =3D \
> > +      $(SOLIB_CFLAGS) \
> > +      -I$(ul_liblastlog2_incdir)
> > +
> > +-pam_lastlog2_la_LIBADD =3D liblastlog2.la
> > ++pam_lastlog2_la_LIBADD =3D liblastlog2.la -lpam
> > +
> > + pam_lastlog2_la_LDFLAGS =3D $(SOLIB_LDFLAGS) -module -avoid-version -=
shared
> > + if HAVE_VSCRIPT
> > +--
> > +2.43.0
>
>
> --
> Yoann Congal
> Smile ECS
>


--=20

Sivakumar B

