Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664A3C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 12:16:38 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149675.1783340187888582101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 05:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q2rf9Mw5;
 spf=pass (domain: smile.fr, ip: 209.85.218.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1268d56234so369448866b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783340186; x=1783944986; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAplTD/ytY1VafiyLCyhWVh+JRHtXs59Ri/HFzbARak=;
        b=Q2rf9Mw54mkKyPrYtniF781jFIfKzFwy+vJnd3oiuZy9kK16Pap2hnR28fJ0iKWqST
         /1IKKJ+rdDAJPiuDr5HXhwuHeXl+i4bjuEN7d7xwMpz2nPxhOeiK4Ar0inZ02GVAxwUK
         GRPiLPFKxZQgyZltD1Df6KFY2HtRzairRNyOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340186; x=1783944986;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAplTD/ytY1VafiyLCyhWVh+JRHtXs59Ri/HFzbARak=;
        b=GNj0PjuBGo40Hx0kuvE/J8BfT7zdLdE/ohk9n/FRROn/bP1+TgKAk93YUOgu8b/vqz
         YscCXQPzOyF2EzCBXuZEhtx7X7n59A1TK6N76JWAaclFOpY0a6oXsOkmZuGUSJSyJM0c
         umTyLolAUBbbdqTrhxbqYqoi6kR1kLbdDpiT8qlUCnsSp55NnrHQyvCUT7AI0Kn7Tju5
         wEAFk2I+IevJn/gneRMLpe95295zdbkFbdekcRbrtBHEU+WkIKVS+WNxobEogPRMK3bx
         T92AmB/nR+bJvp0uYtaT2tqqvA/QJyM03EvTnNdD1/6EO6RVd79Vxs15rZJ4XcNecqIc
         k7hQ==
X-Gm-Message-State: AOJu0Yz43VesbLhVLysKxzJ3LAonDuHQjMg755edlaThNE6GmDEnGYMH
	P4ajrDEAJLD2nM9BOiJ/KFuMakvHXpDefBO4bq+IBG34p4CgmIHnGQQVbgUenZnUfaQ=
X-Gm-Gg: AfdE7cllP8O86dTo2naXxnMNdIQIB0FGoX28DUFFlutdakOFt6n2NgX1wP5p7fEFqqK
	sPuxr+hQNrnlVwtXRUOFB8l/ud1d3pHdRk7SNS/SXiVSuKJBPL6NVeVYMlqnKw9Re0/9vNySuFy
	3hb3uk31Oh4IgFEqyL0ldeutuP4P+w7bQNqmwal8DUCRCzNnTI7JFeaaOLn9ey1SEUJlUN/XuBi
	83/Pb5JYCjYbwn/O5zWbcCP+iWewB9Xh9H9q4XC3YN0Tnhj5ca1EbQHKiTEgANaPaO0kk3OBWce
	xx1FHT9eWe6M3RbrFeKd9VCVHeqUFW+KkyYE8R96tE1U83RePsbn6nAnqKfONzzwluhq52jka78
	5FbiGMW4fmjMOXc5DTpCqYPH9oZAbKNXjbG4XGyfd1y976Dph+JOaxA7VO2/sNwZBdzpOR3+pPz
	bV0QXY/0vwWG6krfSQr88sydl7sg==
X-Received: by 2002:a17:907:843:b0:c11:f607:dc9f with SMTP id a640c23a62f3a-c15a6914bb4mr14806466b.46.1783340185546;
        Mon, 06 Jul 2026 05:16:25 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f38f3sm751293766b.57.2026.07.06.05.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:16:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 14:16:24 +0200
Message-Id: <DJRHC2WC2WVO.180CB9L3V28O8@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, "Chen Qi"
 <Qi.Chen@windriver.com>
To: "Siva Kumar Balasubramanian" <sivakumar.bs@gmail.com>
Subject: Re: [OE-core][wrynose][PATCH v2] util-linux: backport pam_lastlog2
 libpam linking fix
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
 <20260706063055.1914103-1-sivakumar.bs@gmail.com>
 <DJRDTHK4PVP9.F3U7AFZTXTGU@smile.fr>
 <CACFV95Jy1RTuOznn73wLaOFdoM_ACKHF1mgQeYyZywsvFiKJLw@mail.gmail.com>
In-Reply-To: <CACFV95Jy1RTuOznn73wLaOFdoM_ACKHF1mgQeYyZywsvFiKJLw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 12:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240263

On Mon Jul 6, 2026 at 12:56 PM CEST, Siva Kumar Balasubramanian wrote:
> Hello Yoann,
>
> Good call, I checked and the upgrade does comply with the stable policy,
> so I'll send it instead of the backport.
>
> 2.41.4 and 2.41.5 are point releases within the same 2.41 stable series
> and carry only bug fixes and security fixes, no new features and no
> API/ABI breaks. The v2.41.3...v2.41.5 range is mostly mount(8) TOCTOU /
> symlink hardening (including CVE-2026-27456), a libblkid integer overflow
> in parse_dos_extended() and a use-after-free in partition probing, plus
> the pam_lastlog2 libpam linking fix that this bug was about
> (c8d0af0421f6, in 2.41.5).
>
> A nice side effect: the upgrade lets us drop two backports that wrynose
> currently carries and that are now part of the release -
> 0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-... (upstream f55f9906, in 2.41.4)
> and the pam_lastlog2 backport from my v2.
>
> I built util-linux with pam enabled on top of 2.41.5 and confirmed
> pam_lastlog2.so now lists libpam.so.0 in its NEEDED entries, so
> YOCTO #16320 is fixed.
>
> I'll send the upgrade as a separate patch (this supersedes the
> pam_lastlog2 backport v1/v2).

Thanks!
Sounds good.

I will review the upgrade in the next review cycle.

Regards,

>
> Thanks!
> Siva
>
> On Mon, Jul 6, 2026 at 3:01=E2=80=AFPM Yoann Congal <yoann.congal@smile.f=
r> wrote:
>>
>> On Mon Jul 6, 2026 at 8:30 AM CEST, Siva Balasubramanian wrote:
>> > pam_lastlog2.so uses pam_syslog() and other libpam symbols but the
>> > autotools build did not link the module against libpam. With the
>> > linker default of --as-needed, libpam was discarded and did not end
>> > up in the module's ELF NEEDED entries. The module then fails to load
>> > via dlopen() in processes that do not themselves link libpam (e.g.
>> > systemd on recent Fedora, or weston on journald-based systems without
>> > syslog):
>> >
>> >   PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined s=
ymbol: pam_syslog
>> >   PAM adding faulty module: /usr/lib/security/pam_lastlog2.so
>> >
>> > Backport the upstream fix (in 2.41.5) that moves -lpam into LIBADD so
>> > it is placed after the object files and retained as a NEEDED entry.
>> > Against 2.41.3 only the LIBADD line needs changing.
>>
>> Hello,
>>
>> I quickly looked at util-linux v2.41.5 and it look like we can upgrade
>> instead of backporting:
>> https://github.com/util-linux/util-linux/compare/v2.41.3...v2.41.5
>>
>> Could you check and, if you think that the upgrade complies with the
>> stable policy, send the upgrade?
>>
>> Thanks!
>>
>> >
>> > [YOCTO #16320]
>> >
>> > Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
>> > ---
>> > v2:
>> >  - Preserve the upstream commit message verbatim in the backported
>> >    patch and only append the backport info (Upstream-Status, dropped
>> >    LDFLAGS hunk note), per review feedback from Yoann Congal.
>> >  - Point Upstream-Status at the util-linux master commit
>> >    5683ed6320e00205146cbb3d0c76462733530eca (PR #4358). It is also in
>> >    the v2.41 stable branch as c8d0af0421f6 (released in 2.41.5) and is
>> >    already present in 2.42.x, so this backport targets the wrynose
>> >    branch (still on util-linux 2.41.3).
>> >  - Retag the subject for the wrynose branch.
>> >
>> >  meta/recipes-core/util-linux/util-linux.inc   |  1 +
>> >  ...ix-libpam-linking-in-autotools-build.patch | 43 ++++++++++++++++++=
+
>> >  2 files changed, 44 insertions(+)
>> >  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-pam_l=
astlog2-fix-libpam-linking-in-autotools-build.patch
>> >
>> > diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipe=
s-core/util-linux/util-linux.inc
>> > index 0235862666..3cdc1e2c0f 100644
>> > --- a/meta/recipes-core/util-linux/util-linux.inc
>> > +++ b/meta/recipes-core/util-linux/util-linux.inc
>> > @@ -21,6 +21,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-li=
nux/v${MAJOR_VERSION}/util-lin
>> >             file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-o=
f-hard.patch \
>> >             file://0001-tests-script-Disable-size-option-test.patch \
>> >             file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-sym=
link-a.patch \
>> > +           file://0001-pam_lastlog2-fix-libpam-linking-in-autotools-b=
uild.patch \
>> >             "
>> >
>> >  SRC_URI[sha256sum] =3D "3330d873f0fceb5560b89a7dc14e4f3288bbd880e9690=
3ed9b50ec2b5799e58b"
>> > diff --git a/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2=
-fix-libpam-linking-in-autotools-build.patch b/meta/recipes-core/util-linux=
/util-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch
>> > new file mode 100644
>> > index 0000000000..90532dde7a
>> > --- /dev/null
>> > +++ b/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-li=
bpam-linking-in-autotools-build.patch
>> > @@ -0,0 +1,43 @@
>> > +From 5683ed6320e00205146cbb3d0c76462733530eca Mon Sep 17 00:00:00 200=
1
>> > +From: Karel Zak <kzak@redhat.com>
>> > +Date: Tue, 19 May 2026 10:54:57 +0200
>> > +Subject: [PATCH] pam_lastlog2: fix libpam linking in autotools build
>> > +
>> > +Move -lpam from LDFLAGS to LIBADD. When -lpam is in LDFLAGS it
>> > +appears on the linker command line before object files, so the
>> > +--as-needed linker flag (default on Fedora) discards it before
>> > +seeing any undefined PAM symbols. This results in pam_lastlog2.so
>> > +missing libpam.so in its ELF NEEDED entries.
>> > +
>> > +The module then fails to load with dlopen() if the calling process
>> > +does not itself link against libpam (e.g., systemd in Fedora 44+):
>> > +
>> > +  PAM unable to dlopen(pam_lastlog2.so): undefined symbol: pam_syslog
>> > +
>> > +Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2453457
>> > +Signed-off-by: Karel Zak <kzak@redhat.com>
>> > +
>> > +Upstream-Status: Backport [https://github.com/util-linux/util-linux/c=
ommit/5683ed6320e00205146cbb3d0c76462733530eca]
>> > +[Dropped the LDFLAGS hunk: the -lpam in LDFLAGS was introduced upstre=
am
>> > + after 2.41.3 and is not present in this tree, so only the LIBADD hun=
k
>> > + applies here.]
>> > +Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
>> > +---
>> > + pam_lastlog2/src/Makemodule.am | 2 +-
>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> > +
>> > +diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemo=
dule.am
>> > +index 40d597c58..876171e9f 100644
>> > +--- a/pam_lastlog2/src/Makemodule.am
>> > ++++ b/pam_lastlog2/src/Makemodule.am
>> > +@@ -11,7 +11,7 @@ pam_lastlog2_la_CFLAGS =3D \
>> > +      $(SOLIB_CFLAGS) \
>> > +      -I$(ul_liblastlog2_incdir)
>> > +
>> > +-pam_lastlog2_la_LIBADD =3D liblastlog2.la
>> > ++pam_lastlog2_la_LIBADD =3D liblastlog2.la -lpam
>> > +
>> > + pam_lastlog2_la_LDFLAGS =3D $(SOLIB_LDFLAGS) -module -avoid-version =
-shared
>> > + if HAVE_VSCRIPT
>> > +--
>> > +2.43.0
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>


--=20
Yoann Congal
Smile ECS


