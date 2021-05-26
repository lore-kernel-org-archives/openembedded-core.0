Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web12.820.1621988879842472844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 17:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 4C3EDE0C0F;
	Wed, 26 May 2021 12:27:47 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH 2/3] icecc: Demote "could not get ICECC_CC" warning to note
Date: Wed, 26 May 2021 12:27:43 +1200
Message-Id: <20210526002744.3683697-3-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526002744.3683697-1-douglas.royds@taitradio.com>
References: <20210526002744.3683697-1-douglas.royds@taitradio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 0dde960e7a..80943fcf02 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -358,7 +358,7 @@ set_icecc_env() {
     ICECC_WHICH_AS=3D"${@bb.utils.which(os.getenv('PATH'), 'as')}"
     if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
     then
-        bbwarn "Cannot use icecc: could not get ICECC_CC or ICECC_CXX"
+        bbnote "Cannot use icecc: could not get ICECC_CC or ICECC_CXX"
         return
     fi
=20
--=20
2.25.1

