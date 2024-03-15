Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D91C54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 14:37:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24116.1710513461747993713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 07:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0DDFDA7
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:38:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 159C33F73F
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:37:40 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] curl: increase test timeouts
Date: Fri, 15 Mar 2024 14:37:37 +0000
Message-Id: <20240315143738.1234858-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315143738.1234858-1-ross.burton@arm.com>
References: <20240315143738.1234858-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 14:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197134

From: Ross Burton <ross.burton@arm.com>

We often see multiple curl tests fail during ptest runs, the actual test
varies but the output is like this:

  FAIL: 337: protoc!
  There was no content at all in the file log/3/server.input.
  Server glitch? Total curl failure? Returned: 28

Error code 28 is CURLE_OPERATION_TIMEDOUT, so this is almost certainly
due to a loaded machine resulting in the tests running slowly.

It is notable that the test runner explicitly passes --max-time=3D13 to
curl, so experiment and change this to 600 to see if this solves the
problem.

[ YOCTO #15268 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../curl/curl/no-test-timeout.patch            | 18 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.6.0.bb        |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/no-test-timeout.patch

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/=
recipes-support/curl/curl/no-test-timeout.patch
new file mode 100644
index 00000000000..b4cfe716db7
--- /dev/null
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -0,0 +1,18 @@
+Set the max-time timeout to 600 so the timeout is 10 minutes instead of =
13 seconds.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/tests/servers.pm b/tests/servers.pm
+index d4472d509..aeab62c47 100644
+--- a/tests/servers.pm
++++ b/tests/servers.pm
+@@ -120,7 +120,7 @@ my $sshdverstr;  # for socks server, ssh daemon vers=
ion string
+ my $sshderror;   # for socks server, ssh daemon version error
+ my %doesntrun;    # servers that don't work, identified by pidfile
+ my %PORT =3D (nolisten =3D> 47); # port we use for a local non-listenin=
g service
+-my $server_response_maxtime=3D13;
++my $server_response_maxtime=3D600;
+ my $httptlssrv =3D find_httptlssrv();
+ my %run;          # running server
+ my %runcert;      # cert file currently in use by an ssl running server
diff --git a/meta/recipes-support/curl/curl_8.6.0.bb b/meta/recipes-suppo=
rt/curl/curl_8.6.0.bb
index d4473d868e2..ea69164d765 100644
--- a/meta/recipes-support/curl/curl_8.6.0.bb
+++ b/meta/recipes-support/curl/curl_8.6.0.bb
@@ -13,6 +13,7 @@ SRC_URI =3D " \
     https://curl.se/download/${BP}.tar.xz \
     file://run-ptest \
     file://disable-tests \
+    file://no-test-timeout.patch \
 "
 SRC_URI[sha256sum] =3D "3ccd55d91af9516539df80625f818c734dc6f2ecf9bada33=
c76765e99121db15"
=20
--=20
2.34.1


