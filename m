Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.9806.1600324947433000791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 23:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08H6gQGh008402
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 23:42:26 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 23:42:25 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bind: remove -r option for rndc-confgen
Date: Wed, 16 Sep 2020 23:42:25 -0700
Message-ID: <20200917064225.58759-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 08H6gQGh008402
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Mingli Yu <mingli.yu@windriver.com>

The named service fail to start as below:
 # systemctl  status  named.service
=E2=97=8F named.service - Berkeley Internet Name Domain (DNS)
     Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor p=
reset: enabled)
     Active: failed (Result: exit-code) since Wed 2020-09-16 06:07:49 UTC=
; 9s ago
    Process: 134206 ExecStartPre=3D/usr/sbin/generate-rndc-key.sh (code=3D=
exited, status=3D1/FAILURE)

Sep 16 06:07:49 intel-x86-64 systemd[1]: Starting Berkeley Internet Name =
Domain (DNS)...
Sep 16 06:07:49 intel-x86-64 generate-rndc-key.sh[134206]: Generating /et=
c/bind/rndc.key:
Sep 16 06:07:49 intel-x86-64 generate-rndc-key.sh[134207]: rndc-confgen: =
The -r option has been deprecated.
Sep 16 06:07:49 intel-x86-64 generate-rndc-key.sh[134208]: chown: cannot =
access '/etc/bind/rndc.key': No such file or directory
Sep 16 06:07:49 intel-x86-64 generate-rndc-key.sh[134209]: chmod: cannot =
access '/etc/bind/rndc.key': No such file or directory
Sep 16 06:07:49 intel-x86-64 systemd[1]: named.service: Control process e=
xited, code=3Dexited, status=3D1/FAILURE
Sep 16 06:07:49 intel-x86-64 systemd[1]: named.service: Failed with resul=
t 'exit-code'.
Sep 16 06:07:49 intel-x86-64 systemd[1]: Failed to start Berkeley Interne=
t Name Domain (DNS).

It is because fail to execute "/usr/sbin/generate-rndc-key.sh" as
-r is deprecated since bind 9.13.x and the random function changes
in [1], so remove -r option to fix the above issue.

[1]: https://gitlab.isc.org/isc-projects/bind9/-/commit/3a4f820d625c214cf=
b21f5e6d18ce9160d2a193b

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key=
.sh b/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
index ef915c0ae5..633e29c0e6 100644
--- a/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
+++ b/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
@@ -2,7 +2,7 @@
=20
 if [ ! -s /etc/bind/rndc.key ]; then
     echo -n "Generating /etc/bind/rndc.key:"
-    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
+    /usr/sbin/rndc-confgen -a -b 512
     chown root:bind /etc/bind/rndc.key
     chmod 0640 /etc/bind/rndc.key
 fi
--=20
2.17.1

