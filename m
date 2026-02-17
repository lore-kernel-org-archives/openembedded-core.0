Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2822E9A03E
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 22:23:09 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24465.1771366987247955572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 14:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DtF9uynu;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40f20af93aaso1196936fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 14:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771366986; cv=none;
        d=google.com; s=arc-20240605;
        b=aY0KoyTuCZOelyyKqgjlKWLQBGx6admoE7Um+xyhiAEqnQvoOZVSDYLiVHRb/pNkje
         jZPqfxQtiYHovLtRB7ehZ1a8v1b60gaWapKyku3SUpnEQWYoakUnvFR0kceZVrJvA452
         Bt2syQcmSg8R9sjTtqfLfxyPhrsZq4Dkhl/TWWOCPf+VI1TRUNMWM84thoV/SKmIJcPA
         cpbV8csEo/eP/O+bQMeU8pIkAu8P7YYhKVU12NTBT3UREjexr+1nSlTp5eRpke3lgXNe
         A5oLQv5f7xNWrlQpgPRuTNIEjPlQU5SrVTp69n9A0Nov5qVgcOorNyq8hcvmUIUxgfdW
         lQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CaD7wZtxJ6ksVPsB/jn8wkSewQmmvy7Vtr1YE5CIx6Q=;
        fh=toEqJZwqRVBtWFdjvbnHcK/jgjDz0NeahqiJS/bEzeo=;
        b=HJq0Jq/83Uigkc8oqHO44fKzTgWSDYsE8b5OZYjayG2kPDHSOc+SVa8T/UThXhHMXX
         T1pXY8yORYjrebODMDoHN4nF2MqvI4J//r9lBX4aFgNsWfUQkDR+NyYNOPlTGj7exQGN
         iI1anqzXaThEvboOqe383A3Tu37mH4/FaZw5vdPNWh9cQusuM0u+ryAJZZblPfbgs4Hv
         AcJj7nd1anarq3mDwjg0JfpQmk0SIYSs/SJOdCSRYsaVOGYrPkrrM3FKxLVTCcd2iN3Z
         spigkp/FpXg0P7TVrPcTVWr7Wyj05rAfh0AuSayrWJQoBF1SrnICa6v2e00GWGxdDUN5
         sS5Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771366986; x=1771971786; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaD7wZtxJ6ksVPsB/jn8wkSewQmmvy7Vtr1YE5CIx6Q=;
        b=DtF9uynulP3g8iS3U9IR++AI+50QblOqsmxOQBYayRz/i2/ptDMazxJGlb9wn8zA/O
         OIJHtkh8anEtkL06EqARKDH6Npukh3s64fl5adIgZqCzZhbCidtynm21KC2lw6eLaMj4
         H4nV8ndPH0ylaS9zdPPwi6NAtWPx5EsJ+vG6JGBePa4gvE9hWvBzki0DHv6eUmwg0OYW
         0kGVPtuPnLiFzTT2oYqvWGk2nXJfL+MySUDP5yBA51ZcRy493R033Wc+679X4AEjlOKo
         rgXzN9SpDR/gRgW+egUc0poUiNtf+vNMUYa1194ehcKgAQaEqn1NvHZNrd6PgaJrXk0w
         LtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771366986; x=1771971786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CaD7wZtxJ6ksVPsB/jn8wkSewQmmvy7Vtr1YE5CIx6Q=;
        b=mvVrDlxse8GtHXjtbkGnvrFWja6Rotlp03ONtljKSZj+bpRbhj0bgo0a9En6exZppV
         m1+QNSdfou7rDhxTjAl/MiVttBFFNkU4LCJr7ENi+3GGMkJIBskXcaOcwVTl0ITuOpnr
         5ZU9oDHR8P3lLEMBOOQaR+BO+vU7WwR2PoieUzXOn1Cz+LmZk/EBcxOiba6nqAaZgMge
         OFNKMOn0G8rhtKqI+XAYT8OSPL+3/M0tT7d/54fYLT4dqPG1J/8J+4ZdEarM72YFvqLw
         uqHOzMhPfXWkrbbdk912X712/Opk+S6DhdT4mJmQElc6uuhUrgK1sw2rGCSpgZFxWVtA
         /g4w==
X-Gm-Message-State: AOJu0YxISnjxLHzP29VT0om2f+x5OLQqPSoCMhOq2ZvZfGqnINAXrhct
	dFaVq4MW2+9qpN+HWjVR/gyJDIWSjGZn2unRLNKhIAPZfbjtTPYg89KZHISpyzt2D/fFRS6Hpjx
	qKEjz3tTcAAJxXuW+QiJbQaqVj9J5Tts=
X-Gm-Gg: AZuq6aIZyRVKPOKPZZduaeez9nfZa3nNXTq07UhObQ+AR6DEcusYtr5njt/nm642Ix5
	zfHrNicz8sp2ydz+SyX7FbV6R4Ckp4GNoi5/wpjc35fdE5H6Gx0y/omebfSqofT56SCDxdqJHfA
	ajDaayilkGFTDifHIdPo6Eqmuak8pLI6wVRX7SAktb4o+VYUFgQnvkc7/eo/FbMtMQKsPKLMqTH
	ZYZbz3lPq2E8/CJx7UfwaaYdO0ZF2205BK4jyCbmJHawm9SOcwfwvlhS86QbULLY0btJmqEjBOY
	wqOaNBb1
X-Received: by 2002:a05:6820:468e:b0:662:c1a7:e166 with SMTP id
 006d021491bc7-67768ccc148mr5783377eaf.48.1771366986299; Tue, 17 Feb 2026
 14:23:06 -0800 (PST)
MIME-Version: 1.0
References: <20260216221118.2240588-1-ankur.tyagi85@gmail.com>
 <20260216221118.2240588-2-ankur.tyagi85@gmail.com> <CANNYZj8CHW7A40KxWMe-VohYGGAbf0MnYtdCwdAUtu-c3yoKBw@mail.gmail.com>
In-Reply-To: <CANNYZj8CHW7A40KxWMe-VohYGGAbf0MnYtdCwdAUtu-c3yoKBw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 18 Feb 2026 11:22:54 +1300
X-Gm-Features: AaiRm50e8JH0XvvvRm1M1ezmm0EwzqRvj_Wcsg2MQt-M99JwBcykZ7JqfvoaKwE
Message-ID: <CADySD0E_o0pOkxxxRQRfpXZ4+WSuA6j5YnNtknvYX9-mRC83mw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] mdadm: catch sed substitution failure
 during install
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 22:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231279

On Tue, Feb 17, 2026 at 10:39=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> To be honest, I wouldn't start tweaking the code with patches just
> yet. The existing code doesn't seem wrong, so we need to understand
> where and how it breaks, otherwise how would we justify any changes to
> upstream?
>
> So I'd keep only the very last bit:
>
> +        # temp change
> +        install -m 644 ${S}/udev-md-raid-safe-timeouts.rules
> ${D}/${sysconfdir}/tmp-file
> +
> +        if grep -q "BINDIR" ${D}${datadir}/${BPN}/mdcheck; then
> +            bberror "Build failed: 'BINDIR' placeholder found in mdcheck=
."
> +            bbfatal_log "sed command in Makefile failed to execute corre=
ctly."
> +        fi
>
> tmp-file needs to increment every time a new version is sent. E.g.
> tmp-file-2 etc.
>

Hi Alex,

I am unsure of the resource constraints, so I was planning to achieve
a working baseline first.
And then undo changes incrementally, which now I think is the same effort.

I'll start with incremental changes and send v3 with the Makefile patch rem=
oved.

cheers
Ankur

> Alex
>
> On Mon, 16 Feb 2026 at 23:11, Ankur Tyagi via lists.openembedded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > This patch is to validate a possible race condition theory during insta=
ll.
> > Also fail the build if sed substitution still fails for further investi=
gation.
> >
> > Details: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16166
> >
> > [YOCTO #16166]
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  ...1-Makefile-install-rule-improvements.patch | 64 +++++++++++++++++++
> >  meta/recipes-extended/mdadm/mdadm_4.5.bb      | 13 +++-
> >  2 files changed, 76 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-ins=
tall-rule-improvements.patch
> >
> > diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-ru=
le-improvements.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-ins=
tall-rule-improvements.patch
> > new file mode 100644
> > index 0000000000..feb4c5d926
> > --- /dev/null
> > +++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-rule-impr=
ovements.patch
> > @@ -0,0 +1,64 @@
> > +From 21310a9249e21c3dbdb6a6b8e07e74bf0a4557bc Mon Sep 17 00:00:00 2001
> > +From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +Date: Tue, 17 Feb 2026 08:41:48 +1300
> > +Subject: [PATCH] Makefile: install rule improvements
> > +
> > +- Removed double install logic
> > +- Use unique temp files
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + Makefile | 30 ++++++++++++++----------------
> > + 1 file changed, 14 insertions(+), 16 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 788ff5d9..a4d4f178 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -298,30 +298,28 @@ install-man: mdadm.8 md.4 mdadm.conf.5 mdmon.8
> > + install-udev: udev-md-raid-arrays.rules udev-md-raid-assembly.rules u=
dev-md-raid-creating.rules \
> > +               udev-md-clustered-confirm-device.rules
> > +       @for file in $(UDEV_RULES); \
> > +-      do sed -e 's,BINDIR,$(BINDIR),g' udev-$${file#??-} > .install.t=
mp.1 && \
> > +-         $(ECHO) $(INSTALL) -D -m 644 udev-$${file#??-} $(DESTDIR)$(U=
DEVDIR)/rules.d/$$file ; \
> > +-         $(INSTALL) -D -m 644 .install.tmp.1 $(DESTDIR)$(UDEVDIR)/rul=
es.d/$$file ; \
> > +-         rm -f .install.tmp.1; \
> > ++      do \
> > ++              srcfile=3Dudev-$${file#??-} ; \
> > ++              sed -e 's,BINDIR,$(BINDIR),g' $$srcfile > $$srcfile.tmp=
 && \
> > ++              $(INSTALL) -D -m 644 $$srcfile.tmp $(DESTDIR)$(UDEVDIR)=
/rules.d/$$file && \
> > ++              rm -f $$srcfile.tmp ; \
> > +       done
> > +
> > + install-systemd: systemd/mdmon@.service
> > +       @for file in $(SYSTEMD_UNITS); \
> > +-      do sed -e 's,BINDIR,$(BINDIR),g;s,MISCDIR,$(MISCDIR),g' systemd=
/$$file > .install.tmp.2 && \
> > +-         $(ECHO) $(INSTALL) -D -m 644 systemd/$$file $(DESTDIR)$(SYST=
EMD_DIR)/$$file ; \
> > +-         $(INSTALL) -D -m 644 .install.tmp.2 $(DESTDIR)$(SYSTEMD_DIR)=
/$$file ; \
> > +-         rm -f .install.tmp.2; \
> > ++      do sed -e 's,BINDIR,$(BINDIR),g;s,MISCDIR,$(MISCDIR),g' systemd=
/$$file > systemd/$$file.tmp && \
> > ++         $(INSTALL) -D -m 644 systemd/$$file.tmp $(DESTDIR)$(SYSTEMD_=
DIR)/$$file && \
> > ++         rm -f systemd/$$file.tmp; \
> > +       done
> > +       @for file in mdadm.shutdown ; \
> > +-      do sed -e 's,BINDIR,$(BINDIR),g' systemd/$$file > .install.tmp.=
3 && \
> > +-         $(ECHO) $(INSTALL) -D -m 755  systemd/$$file $(DESTDIR)$(SYS=
TEMD_DIR)-shutdown/$$file ; \
> > +-         $(INSTALL) -D -m 755  .install.tmp.3 $(DESTDIR)$(SYSTEMD_DIR=
)-shutdown/$$file ; \
> > +-         rm -f .install.tmp.3; \
> > ++      do sed -e 's,BINDIR,$(BINDIR),g' systemd/$$file > systemd/$$fil=
e.tmp && \
> > ++         $(INSTALL) -D -m 755  systemd/$$file.tmp $(DESTDIR)$(SYSTEMD=
_DIR)-shutdown/$$file && \
> > ++         rm -f systemd/$$file.tmp; \
> > +       done
> > +       @for file in mdcheck ; \
> > +-      do sed -e 's,BINDIR,$(BINDIR),g' misc/$$file > .install.tmp.4 &=
& \
> > +-         $(ECHO) $(INSTALL) -D -m 755  misc/$$file $(DESTDIR)$(MISCDI=
R)/$$file ; \
> > +-         $(INSTALL) -D -m 755  .install.tmp.4 $(DESTDIR)$(MISCDIR)/$$=
file ; \
> > +-         rm -f .install.tmp.4; \
> > ++      do sed -e 's,BINDIR,$(BINDIR),g' misc/$$file > misc/$$file.tmp =
&& \
> > ++         $(INSTALL) -D -m 755  misc/$$file.tmp $(DESTDIR)$(MISCDIR)/$=
$file && \
> > ++         rm -f misc/$$file.tmp; \
> > +       done
> > +
> > + install-bin: mdadm mdmon
> > diff --git a/meta/recipes-extended/mdadm/mdadm_4.5.bb b/meta/recipes-ex=
tended/mdadm/mdadm_4.5.bb
> > index b30d3d776e..bca70aeaf0 100644
> > --- a/meta/recipes-extended/mdadm/mdadm_4.5.bb
> > +++ b/meta/recipes-extended/mdadm/mdadm_4.5.bb
> > @@ -14,6 +14,7 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/mdadm=
/mdadm.git;protocol=3Dhttps;bra
> >             file://mdadm.init \
> >             file://0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_Z=
ERO_R.patch \
> >             file://0001-raid6check.c-restripe.c-Use-64-bit-off_t-across=
-both.patch \
> > +           file://0001-Makefile-install-rule-improvements.patch \
> >             "
> >
> >  SRCREV =3D "8f0c7692d48414ff7b3fe927ce75799c65ef24b1"
> > @@ -40,11 +41,21 @@ EXTRA_OEMAKE =3D 'CHECK_RUN_DIR=3D0 CWFLAGS=3D"" CX=
FLAGS=3D"${CFLAGS}" SYSTEMD_DIR=3D${sys
> >  DEBUG_OPTIMIZATION:append =3D " -Wno-error"
> >
> >  do_install() {
> > -        oe_runmake 'DESTDIR=3D${D}' install install-systemd
> > +        install -d ${D}/${datadir}/
> > +
> > +        oe_runmake -j 1 'DESTDIR=3D${D}' install install-systemd
> > +
> >          install -d ${D}/${sysconfdir}/
> >          install -m 644 ${S}/documentation/mdadm.conf-example ${D}${sys=
confdir}/mdadm.conf
> >          install -d ${D}/${sysconfdir}/init.d
> >          install -m 755 ${UNPACKDIR}/mdadm.init ${D}${sysconfdir}/init.=
d/mdmonitor
> > +        # temp change
> > +        install -m 644 ${S}/udev-md-raid-safe-timeouts.rules ${D}/${sy=
sconfdir}/tmp-file
> > +
> > +        if grep -q "BINDIR" ${D}${datadir}/${BPN}/mdcheck; then
> > +            bberror "Build failed: 'BINDIR' placeholder found in mdche=
ck."
> > +            bbfatal_log "sed command in Makefile failed to execute cor=
rectly."
> > +        fi
> >  }
> >
> >  do_compile_ptest() {
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#231226): https://lists.openembedded.org/g/openembed=
ded-core/message/231226
> > Mute This Topic: https://lists.openembedded.org/mt/117847720/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

