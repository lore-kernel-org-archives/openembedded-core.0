Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F50E68155
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:39:35 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8734.1771321168283477343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 01:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aibFFykM;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb3fb47559so395110185a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 01:39:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771321167; cv=none;
        d=google.com; s=arc-20240605;
        b=fB36fWsgcxlfPU443T/p6ktOdPLxRA+z7pRRnmyN77neqS4X3uB3oDixcc0SCBKS3F
         5egr2RKwP4tGzaLPMOz4uxCkx0OOl7EW1T74AEuNDPkovtd8XtzLAETKY/iT14wufITc
         SzNkOzHwHIMpUQmqJuir+f7Z/tAFnGryZV7dtyekfTgOoce/yWt3wvZWUzcIKagq2GA3
         69ZqIMhsj5invXx53Xkb1oEDp+8XDGtuu40VgkttuMjHOqrgrCpNDSfJYgiRQjMeXYYA
         4no6cFGONKRYMEL2PGpLCT/EWItPrtF+xDzM5seGzFYVGOTcwUlORAdEvYvp/QXAFKSw
         Kyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z0SaA2Ei8mt4/u0V6c+FUBXgNwsIVGnnz+jD9peZrG4=;
        fh=Eip4Jn1XwWJma9SY+p290X7lO535Eq/j3krUlYr6gVY=;
        b=RzThhVrlgs6pJoYVp2EUH4BEzHzLt/kGWQHZbvbH2uk2k16f/jfgVW0Z3i40XZXtyp
         c6qV7quBtdYKl7m4fp7yxe4/omstyv5B5wfaUYz0dmgsjl+NYN8KmB8AWXXFxigm5GOo
         yfAWc9hgWzT8iVlRz+HSDUpUhCuZFTw/yneY0hqntuGAvmpRQkTGPC/19qKy/449jIz4
         Izdy8WGHRMjbXI2PkDUsdFJs7zwAyCrwdDtyY8pjSBiIi+hO46i7zIwssOd5qZxfwZER
         xX0JBAhH88vaz4mH45mj6518rVxOYbscDzQdEPLoqTcvAPmfTJbLSsZucL1LBUgIZg2y
         3sJQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771321167; x=1771925967; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0SaA2Ei8mt4/u0V6c+FUBXgNwsIVGnnz+jD9peZrG4=;
        b=aibFFykMEzDz9UBlRxJl4+QeqlolABD4N0ftWPLUMsXuLU6mqBPNusD0cBpOlJUJpX
         aEAgHq/nPIR31lXyF16vXA1CJulRrYSg6mZRWfIjgt6A3N1ZdQhRRaj+mCjSzCh4LImp
         pGxD7DNUaNSCVIXJcKTydzkurd310qtwhoi9sPebM+48LqFqcBWn6t8V4U3tJWuNGgkn
         0xdf6uUSToWjaGK/zPbQFi4ZDZJOWWuf7+5s4oU9HtuCwu5JEHlHVAc+3UHOVQw3ON4Y
         MML9exWsQ+ErN5z0Jk/SoYD8mXg6lhZfevXJI5iyyx0y9B5/6HRb/BdsY8yZnYDxKKIq
         o4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771321167; x=1771925967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0SaA2Ei8mt4/u0V6c+FUBXgNwsIVGnnz+jD9peZrG4=;
        b=S4QtumxVa1BFgxB7XxPLn3nvImyyJ+v7egUffWvA1J1wA5gZYm+b3Ubokir06kykXu
         Ut6hWda5xBpJirJT1EuQduiT4MA/uZEDqwhrPFxEuSSmt9B73uiM4bwRvCmcyafngX4Q
         RiktATNj0NREUVWpccRJLTgBkrvD9ZDWpZI049KDqdW2Gc31bsfXCxEnbOqlwVUbtraH
         yO+b5EfW4V6japc6Hu8LvMum9DAGAlihr1HzE+Lq2nyvbOWhu5s+LnB7YaphvBEz6Dyw
         edzVfwHLas65hHbq33GQE8VClegPuK97pA+JGHfsTFXBOQ7eG9w0zfyKvHsyrsYWNMzW
         8v4Q==
X-Gm-Message-State: AOJu0YxzF2wedIWEM515nOKVtuMXx+KRlTEc5E14uqiDwXR1XeG0ect3
	WQqR0pRM+QhcZHiT5SfQky+5JVoNPUB3fXF/bC1emvXWeF9UXqJYQWagc237+HFt4J/+LWoyJIX
	LUC6IBsunz368DzoWosuuyZhkYHsK4m0=
X-Gm-Gg: AZuq6aLkTU/49vVhF2JybmqbEVkLxM+TCjosCMp/9Hwok8bqBqSEyc8mS4xfAL6HCCQ
	/pIKlvisOABVoy47fya1fwTs8G1bMeo3QlgWS2douyvDT3hV0gvTBJToIcaIMdFl/DnMy8iSpT2
	BHyg0VTFlZHqTBCNxFDBecZS48ktIqm5OnRBlA0Ab2ZAkmmXhfhajV4kfGIVTyy3IHpWjxtCbAw
	06/sFj1i82x7ShWkmMV/7byz/vI9PSRwxK6z7UsY7AjtG75xzw0tYv/on/IOT+ZqOmG8RXYgrlb
	lKGlzUNlZDt5JK7Lq8sL4K4UeyiDP7aidaJxtgB7cDws9uRMBKvr
X-Received: by 2002:a05:620a:1a18:b0:8c6:a034:9220 with SMTP id
 af79cd13be357-8cb4229c0bemr1515378285a.25.1771321167134; Tue, 17 Feb 2026
 01:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20260216221118.2240588-1-ankur.tyagi85@gmail.com> <20260216221118.2240588-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20260216221118.2240588-2-ankur.tyagi85@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Feb 2026 10:39:14 +0100
X-Gm-Features: AaiRm51WmVIIPtpILjnF445ywFwQvubs5VNGRrmChwCGbApRJhWW-G-fqHYIqGY
Message-ID: <CANNYZj8CHW7A40KxWMe-VohYGGAbf0MnYtdCwdAUtu-c3yoKBw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] mdadm: catch sed substitution failure
 during install
To: ankur.tyagi85@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 09:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231233

To be honest, I wouldn't start tweaking the code with patches just
yet. The existing code doesn't seem wrong, so we need to understand
where and how it breaks, otherwise how would we justify any changes to
upstream?

So I'd keep only the very last bit:

+        # temp change
+        install -m 644 ${S}/udev-md-raid-safe-timeouts.rules
${D}/${sysconfdir}/tmp-file
+
+        if grep -q "BINDIR" ${D}${datadir}/${BPN}/mdcheck; then
+            bberror "Build failed: 'BINDIR' placeholder found in mdcheck."
+            bbfatal_log "sed command in Makefile failed to execute correctly."
+        fi

tmp-file needs to increment every time a new version is sent. E.g.
tmp-file-2 etc.

Alex

On Mon, 16 Feb 2026 at 23:11, Ankur Tyagi via lists.openembedded.org
<ankur.tyagi85=gmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> This patch is to validate a possible race condition theory during install.
> Also fail the build if sed substitution still fails for further investigation.
>
> Details: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16166
>
> [YOCTO #16166]
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...1-Makefile-install-rule-improvements.patch | 64 +++++++++++++++++++
>  meta/recipes-extended/mdadm/mdadm_4.5.bb      | 13 +++-
>  2 files changed, 76 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-rule-improvements.patch
>
> diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-rule-improvements.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-rule-improvements.patch
> new file mode 100644
> index 0000000000..feb4c5d926
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-rule-improvements.patch
> @@ -0,0 +1,64 @@
> +From 21310a9249e21c3dbdb6a6b8e07e74bf0a4557bc Mon Sep 17 00:00:00 2001
> +From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +Date: Tue, 17 Feb 2026 08:41:48 +1300
> +Subject: [PATCH] Makefile: install rule improvements
> +
> +- Removed double install logic
> +- Use unique temp files
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + Makefile | 30 ++++++++++++++----------------
> + 1 file changed, 14 insertions(+), 16 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 788ff5d9..a4d4f178 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -298,30 +298,28 @@ install-man: mdadm.8 md.4 mdadm.conf.5 mdmon.8
> + install-udev: udev-md-raid-arrays.rules udev-md-raid-assembly.rules udev-md-raid-creating.rules \
> +               udev-md-clustered-confirm-device.rules
> +       @for file in $(UDEV_RULES); \
> +-      do sed -e 's,BINDIR,$(BINDIR),g' udev-$${file#??-} > .install.tmp.1 && \
> +-         $(ECHO) $(INSTALL) -D -m 644 udev-$${file#??-} $(DESTDIR)$(UDEVDIR)/rules.d/$$file ; \
> +-         $(INSTALL) -D -m 644 .install.tmp.1 $(DESTDIR)$(UDEVDIR)/rules.d/$$file ; \
> +-         rm -f .install.tmp.1; \
> ++      do \
> ++              srcfile=udev-$${file#??-} ; \
> ++              sed -e 's,BINDIR,$(BINDIR),g' $$srcfile > $$srcfile.tmp && \
> ++              $(INSTALL) -D -m 644 $$srcfile.tmp $(DESTDIR)$(UDEVDIR)/rules.d/$$file && \
> ++              rm -f $$srcfile.tmp ; \
> +       done
> +
> + install-systemd: systemd/mdmon@.service
> +       @for file in $(SYSTEMD_UNITS); \
> +-      do sed -e 's,BINDIR,$(BINDIR),g;s,MISCDIR,$(MISCDIR),g' systemd/$$file > .install.tmp.2 && \
> +-         $(ECHO) $(INSTALL) -D -m 644 systemd/$$file $(DESTDIR)$(SYSTEMD_DIR)/$$file ; \
> +-         $(INSTALL) -D -m 644 .install.tmp.2 $(DESTDIR)$(SYSTEMD_DIR)/$$file ; \
> +-         rm -f .install.tmp.2; \
> ++      do sed -e 's,BINDIR,$(BINDIR),g;s,MISCDIR,$(MISCDIR),g' systemd/$$file > systemd/$$file.tmp && \
> ++         $(INSTALL) -D -m 644 systemd/$$file.tmp $(DESTDIR)$(SYSTEMD_DIR)/$$file && \
> ++         rm -f systemd/$$file.tmp; \
> +       done
> +       @for file in mdadm.shutdown ; \
> +-      do sed -e 's,BINDIR,$(BINDIR),g' systemd/$$file > .install.tmp.3 && \
> +-         $(ECHO) $(INSTALL) -D -m 755  systemd/$$file $(DESTDIR)$(SYSTEMD_DIR)-shutdown/$$file ; \
> +-         $(INSTALL) -D -m 755  .install.tmp.3 $(DESTDIR)$(SYSTEMD_DIR)-shutdown/$$file ; \
> +-         rm -f .install.tmp.3; \
> ++      do sed -e 's,BINDIR,$(BINDIR),g' systemd/$$file > systemd/$$file.tmp && \
> ++         $(INSTALL) -D -m 755  systemd/$$file.tmp $(DESTDIR)$(SYSTEMD_DIR)-shutdown/$$file && \
> ++         rm -f systemd/$$file.tmp; \
> +       done
> +       @for file in mdcheck ; \
> +-      do sed -e 's,BINDIR,$(BINDIR),g' misc/$$file > .install.tmp.4 && \
> +-         $(ECHO) $(INSTALL) -D -m 755  misc/$$file $(DESTDIR)$(MISCDIR)/$$file ; \
> +-         $(INSTALL) -D -m 755  .install.tmp.4 $(DESTDIR)$(MISCDIR)/$$file ; \
> +-         rm -f .install.tmp.4; \
> ++      do sed -e 's,BINDIR,$(BINDIR),g' misc/$$file > misc/$$file.tmp && \
> ++         $(INSTALL) -D -m 755  misc/$$file.tmp $(DESTDIR)$(MISCDIR)/$$file && \
> ++         rm -f misc/$$file.tmp; \
> +       done
> +
> + install-bin: mdadm mdmon
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.5.bb b/meta/recipes-extended/mdadm/mdadm_4.5.bb
> index b30d3d776e..bca70aeaf0 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.5.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.5.bb
> @@ -14,6 +14,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;bra
>             file://mdadm.init \
>             file://0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch \
>             file://0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch \
> +           file://0001-Makefile-install-rule-improvements.patch \
>             "
>
>  SRCREV = "8f0c7692d48414ff7b3fe927ce75799c65ef24b1"
> @@ -40,11 +41,21 @@ EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CWFLAGS="" CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${sys
>  DEBUG_OPTIMIZATION:append = " -Wno-error"
>
>  do_install() {
> -        oe_runmake 'DESTDIR=${D}' install install-systemd
> +        install -d ${D}/${datadir}/
> +
> +        oe_runmake -j 1 'DESTDIR=${D}' install install-systemd
> +
>          install -d ${D}/${sysconfdir}/
>          install -m 644 ${S}/documentation/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
>          install -d ${D}/${sysconfdir}/init.d
>          install -m 755 ${UNPACKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
> +        # temp change
> +        install -m 644 ${S}/udev-md-raid-safe-timeouts.rules ${D}/${sysconfdir}/tmp-file
> +
> +        if grep -q "BINDIR" ${D}${datadir}/${BPN}/mdcheck; then
> +            bberror "Build failed: 'BINDIR' placeholder found in mdcheck."
> +            bbfatal_log "sed command in Makefile failed to execute correctly."
> +        fi
>  }
>
>  do_compile_ptest() {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231226): https://lists.openembedded.org/g/openembedded-core/message/231226
> Mute This Topic: https://lists.openembedded.org/mt/117847720/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

