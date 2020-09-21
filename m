Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.36229.1600670284347348050
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2020 23:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08L6bxvu022012
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2020 23:37:59 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Sun, 20 Sep 2020
 23:37:58 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] bind: remove -r option for rndc-confgen
Date: Sun, 20 Sep 2020 23:37:58 -0700
Message-ID: <20200921063758.16983-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The named service fail to start as below:
 # systemctl  status  named.service
   named.service - Berkeley Internet Name Domain (DNS)
     Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor preset: enabled)
     Active: failed (Result: exit-code) since Wed 2020-09-16 06:07:49 UTC; 9s ago
    Process: 134206 ExecStartPre=/usr/sbin/generate-rndc-key.sh (code=exited, status=1/FAILURE)

Sep 16 06:07:49 intel-x86-64 systemd[1]: Starting Berkeley Internet Name Domain (DNS)...
Sep 16 06:07:49 intel-x86-64 generate-rndc-key.sh[134206]: Generating /etc/bind/rndc.key:
Sep 16 06:07:49 intel-x86-64 generate-rndc-key.sh[134207]: rndc-confgen: The -r option has been deprecated.
Sep 16 06:07:49 intel-x86-64 generate-rndc-key.sh[134208]: chown: cannot access '/etc/bind/rndc.key': No such file or directory
Sep 16 06:07:49 intel-x86-64 generate-rndc-key.sh[134209]: chmod: cannot access '/etc/bind/rndc.key': No such file or directory
Sep 16 06:07:49 intel-x86-64 systemd[1]: named.service: Control process exited, code=exited, status=1/FAILURE
Sep 16 06:07:49 intel-x86-64 systemd[1]: named.service: Failed with result 'exit-code'.
Sep 16 06:07:49 intel-x86-64 systemd[1]: Failed to start Berkeley Internet Name Domain (DNS).

It is because fail to execute "/usr/sbin/generate-rndc-key.sh" as
-r is deprecated since bind 9.13.x and the random function changes
in [1], so remove -r option to fix the above issue.

DNSSEC validation is now active by default after bind upgrade to 9.16.x,
but it is not in 9.11.x. So disable DNSSEC validation explicitly to
silence below message.
Sep 18 03:21:37 intel-x86-64 named[23272]: managed-keys-zone: Unable to fetch DNSKEY set '.': timed out

[1]: https://gitlab.isc.org/isc-projects/bind9/-/commit/3a4f820d625c214cfb21f5e6d18ce9160d2a193b

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh | 2 +-
 meta/recipes-connectivity/bind/bind_9.16.5.bb                   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
index ef915c0ae5..633e29c0e6 100644
--- a/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
+++ b/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
@@ -2,7 +2,7 @@
 
 if [ ! -s /etc/bind/rndc.key ]; then
     echo -n "Generating /etc/bind/rndc.key:"
-    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
+    /usr/sbin/rndc-confgen -a -b 512
     chown root:bind /etc/bind/rndc.key
     chmod 0640 /etc/bind/rndc.key
 fi
diff --git a/meta/recipes-connectivity/bind/bind_9.16.5.bb b/meta/recipes-connectivity/bind/bind_9.16.5.bb
index 103192490a..eb263c2eda 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.5.bb
@@ -34,7 +34,7 @@ PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
 PACKAGECONFIG[python3] = "--with-python=yes --with-python-install-dir=${PYTHON_SITEPACKAGES_DIR} , --without-python, python3-ply-native,"
 
-EXTRA_OECONF = " --with-libtool --disable-devpoll --enable-epoll \
+EXTRA_OECONF = " --with-libtool --disable-devpoll --disable-auto-validation --enable-epoll \
                  --with-gssapi=no --with-lmdb=no --with-zlib \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_DIR_HOST}${prefix} \
-- 
2.17.1

