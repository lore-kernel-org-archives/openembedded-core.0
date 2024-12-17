Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B018BE77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:12:57 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.79055.1734433974284228097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 03:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=xCIbDjYu;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.128.48, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43616c12d72so7057795e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 03:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1734433973; x=1735038773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6Nsu1OWiAwQofIMANvJbnaFEonIzuU8e9M+WFUIK78=;
        b=xCIbDjYuH0MVc89C+qAZLOevOZNBfx44Ag/blrUU5zf7jD8z8HSQ/Qy4FxD0y9hHkP
         CWJupgyGHwtnt/bYEvyxUANbyr9qCcjSfP92x4aofNgguwxpmbnMTPdCFsdXPrBD+xkF
         J0rFlFO7FV+LKf4xlWVpr2NRyfGnYigk+AIe915K28OF+czZvzlbX1pfSc8Av+lFCfRD
         FhgsnWxclvez94ozOgJIqeGMTLuGMtdU5JTQ2gj1UAaIYSrPVDPnvR1xWOmUBAl2chgF
         KbvXcQPaXShZ+bD6GqJc98P2ksruc3UaoZEbECnCh4cSw/US/FraGL0DRSlGAMRsw/cw
         Ui7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433973; x=1735038773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6Nsu1OWiAwQofIMANvJbnaFEonIzuU8e9M+WFUIK78=;
        b=NyaaSkHcWFBFjzQHmzJvBmlofi6sO1wrtbAEpy1YlPC2AmNn8/V4sQ6roKTUfkUM+m
         MEJT+Y08Eq5A+cMGv/03Y+2mX8+0e+KpuK592dhW9CTzgefibqnJ9k/Mp+CYx2RtmQdt
         M/5siCW9Z5sLb2CVhRcPId3pkaHQo+IJWICLnpQNP3Ihxk2Q8a4wCzPHdtnU9utnDLfU
         pMwUeAO3xH2t38lxD4QmJwxUbeB9HUCwqcqKRorpCJwWv/MhRBU1KjS/vm6KWtvDTaCA
         S5FCW5AENphuThiq9P2DybjGna4X+WKdyHpYbiwtKbfdoC5o4QbMYu2BYJBy8buJH8cz
         EzYA==
X-Gm-Message-State: AOJu0Yy82Fl2rmhWkPq9dmh9o8wy2hN2d6P340sKeyZtrQe0Z3U9TO6k
	E3aLTGe3QiZ9is/1bk5zDxX8mOYEqEpLxNNrdlLIUPOBFfI9wE+4Ozvsc/fvpbzftxGOa+f+/Qe
	0CTnlUxJulHqti8SzMVM3YxJiIMlcrjcFl2LaxuEtVTJj0jhjEOEbvtPIPtzHQHcObSNjrtMnML
	kB8ATrILOb
X-Gm-Gg: ASbGnctldHvh6ihdLnGvq10+3MMsepi45Ak6XYgwhPcPIwKdT/PJDM9WIrjZBqpl4Y2
	323OLGsRm65CUUA9TTCk1OMePUdLTunLGzgmgT5FcXpdp1fZtbRMM9VCeClnhYqfMaX5YpZU3J6
	Y/uxjt66JTW8b7ElB7Q39Z1pe/6JDcbLDJHaA9VQYh5YB1QMRZkGsr1EKv1AVfFx8RIu4k/80Fh
	hjpeQEWVBx8hkRvmw2Ab+yGa2bZd4wA/lNphp4YnkHs5k1idlOK6TC2YP2L5y4CShb9Riw9au67
	o1vNZf64SxZLu4hagzpCwvLUsBA2OPRmpw==
X-Google-Smtp-Source: AGHT+IH8z8SzCEXJ4tbC5/mM/5fT4iutqMNjbTeYXujsXabTlmMYkug6xkq+1Ikj3I+LPTQVcln06Q==
X-Received: by 2002:a05:600c:1c1c:b0:42c:aeee:e603 with SMTP id 5b1f17b1804b1-4362aab2452mr54735745e9.7.1734433972580;
        Tue, 17 Dec 2024 03:12:52 -0800 (PST)
Received: from localhost (dslb-084-060-024-069.084.060.pools.vodafone-ip.de. [84.60.24.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4363606eee9sm115439525e9.24.2024.12.17.03.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:12:52 -0800 (PST)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH kirkstone 6/6] base-passwd: Add the sgx group
Date: Tue, 17 Dec 2024 12:12:29 +0100
Message-ID: <20241217111229.60698-7-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217111229.60698-1-jonas.gorski@bisdn.de>
References: <20241217111229.60698-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 11:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208838

From: Alex Kiernan <alex.kiernan@gmail.com>

To avoid errors from eudev/udev we need an sgx group, but if we add it
via groupadd that causes shadow login to be brought into an image, which
causes images which have CONFIG_MULTIUSER unset to fail with `setgid:
Function not implemented` as shadow's login doesn't implement the
heuristics which busybox has to handle this kernel configuration.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a1c81ac4a869cc57394071ace2ca086eb8ac47a4)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 .../0001-base-passwd-Add-the-sgx-group.patch  | 30 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.52.bb         |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-base-pas=
swd-Add-the-sgx-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add=
-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-=
passwd-Add-the-sgx-group.patch
new file mode 100644
index 000000000000..e1340e1b70cf
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sg=
x-group.patch
@@ -0,0 +1,30 @@
+From 9e57771d138ac423d5139b984b8c869122ce4976 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alexk@zuma.ai>
+Date: Fri, 28 Jul 2023 10:28:57 +0100
+Subject: [PATCH] base-passwd: Add the sgx group
+
+To avoid errors from eudev/udev we need an sgx group, but if we add it
+via groupadd that causes shadow login to be brought into an image, which
+causes images which have CONFIG_MULTIUSER unset to fail with `setgid:
+Function not implemented` as shadow's login doesn't implement the
+heuristics which busybox has to handle this kernel configuration.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index d34d2b832d43..e54fd1d2c6dc 100644
+--- a/group.master
++++ b/group.master
+@@ -34,6 +34,7 @@ video:*:44:
+ sasl:*:45:
+ plugdev:*:46:
+ kvm:*:47:
++sgx:*:48:
+ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb b/meta/rec=
ipes-core/base-passwd/base-passwd_3.5.52.bb
index 66b5a0e7dc6a..9fbba7e9c071 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "https://launchpad.net/debian/+archive/primar=
y/+files/${BPN}_${PV}.tar
            file://0006-Make-it-possible-to-build-without-debconf-support.p=
atch \
            file://0007-Make-it-possible-to-disable-the-generation-of-the-d=
o.patch \
            file://0008-Add-wheel-group.patch \
+           file://0001-base-passwd-Add-the-sgx-group.patch \
            "
=20
 SRC_URI[sha256sum] =3D "5dfec6556b5a16ecf14dd3f7c95b591d929270289268123f31=
a3d6317f95ccea"
--=20
2.47.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


