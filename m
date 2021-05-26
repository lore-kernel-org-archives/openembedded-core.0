Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web11.801.1621988876429773046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 17:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 33FA4E01D2;
	Wed, 26 May 2021 12:27:47 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH 0/3] icecc: Silence warnings
Date: Wed, 26 May 2021 12:27:41 +1200
Message-Id: <20210526002744.3683697-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

icecc: Demote "could not get ICECC_CC" warning to note

For many components, it is perfectly correct not to have gcc or g++ in
the PATH, notably when INHIBIT_DEFAULT_DEPS is set.
We were getting a flood of warnings when icecc was enabled, eg:

    WARNING: base-files-3.0.14-r89.tait.8.6 do_configure: Cannot use icec=
c: could not get ICECC_CC or ICECC_CXX
    WARNING: base-files-3.0.14-r89.tait.8.6 do_compile: Cannot use icecc:=
 could not get ICECC_CC or ICECC_CXX
    WARNING: base-files-3.0.14-r89.tait.8.6 do_install: Cannot use icecc:=
 could not get ICECC_CC or ICECC_CXX
    WARNING: busybox-inittab-1.33.0-r0 do_configure: Cannot use icecc: co=
uld not get ICECC_CC or ICECC_CXX
    WARNING: busybox-inittab-1.33.0-r0 do_compile: Cannot use icecc: coul=
d not get ICECC_CC or ICECC_CXX
    WARNING: busybox-inittab-1.33.0-r0 do_install: Cannot use icecc: coul=
d not get ICECC_CC or ICECC_CXX
    WARNING: linux-libc-headers-3.14-r0 do_configure: Cannot use icecc: c=
ould not get ICECC_CC or ICECC_CXX
    WARNING: linux-libc-headers-3.14-r0 do_compile: Cannot use icecc: cou=
ld not get ICECC_CC or ICECC_CXX
    WARNING: linux-libc-headers-3.14-r0 do_install: Cannot use icecc: cou=
ld not get ICECC_CC or ICECC_CXX

Demote this message to a "NOTE".
It still appears in log.do_configure and friends:

    NOTE: Cannot use icecc: could not get ICECC_CC or ICECC_CXX

Revert "icecc: Don't use icecc when INHIBIT_DEFAULT_DEPS is set".
Although this silenced the warnings, it also turned off icecc for
gcc-cross and friends, binutils-cross, and importantly, the linux
kernel.

[YOCTO #13863]
   =20
Douglas Royds (3):
  Revert "icecc: Don't use icecc when INHIBIT_DEFAULT_DEPS is set"
  icecc: Demote "could not get ICECC_CC" warning to note
  icecc-create-env: Silence warning: invalid ICECC_ENV_EXEC

 meta/classes/icecc.bbclass                                  | 6 +-----
 .../icecc-create-env/icecc-create-env_0.1.bb                | 1 +
 2 files changed, 2 insertions(+), 5 deletions(-)

--=20
2.25.1

