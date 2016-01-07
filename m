Return-Path: <akuster808@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id C607265CBF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 23:04:08 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 77so238311980ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 15:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=EHjg0fR2Bf9ZbFOFOgFE3cfnaDuI1ynIS+i/eLLnQz0=;
	b=o6cCVCxyLPbueGYlvArwtXrIQsqD2bYS4adH9Gw1Fn+GNIx7LJJSq9L4iZ3tYPz8Tg
	ebDRAz478AQTmAT6UmuFINHHJcjI8dfcgKGvSpZavvClbvDqM9vjCfIykRgq80SeFtqs
	9kg0nnOeTyGSoFgd1L0I7kWcsa/5hHYSwGSH7rNszipC15ll27vAT4dkwuQy7C9ZeOsG
	cSA6yNFyjxX+t9Un7KHcrOPmENA1M1JPaB40c4oKKcdmp6DbR3HDYi/IjI3FW3smTtvd
	YkhD0zQjmg1/Sif1BOLFC8QW+A6igopy+wFRCRddgQ0r7Hj5lJ5bQs0PqV6QxK/zmKZH
	Yu5Q==
X-Received: by 10.107.19.203 with SMTP id 72mr114605297iot.41.1452207849184;
	Thu, 07 Jan 2016 15:04:09 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	w194sm134740iof.39.2016.01.07.15.04.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 15:04:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 15:04:02 -0800
Message-Id: <1452207843-29858-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1452207843-29858-1-git-send-email-akuster808@gmail.com>
References: <1452207843-29858-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 2/3] openssl: fix for CVE-2015-3194
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jan 2016 23:04:09 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openssl/0001-Add-test-for-CVE-2015-3194.patch  | 66 ++++++++++++++++++++++
 .../CVE-2015-3194-1-Add-PSS-parameter-check.patch  | 45 +++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |  2 +
 3 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch b/meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch
new file mode 100644
index 0000000..39a2e5a
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch
@@ -0,0 +1,66 @@
+From 00456fded43eadd4bb94bf675ae4ea5d158a764f Mon Sep 17 00:00:00 2001
+From: "Dr. Stephen Henson" <steve@openssl.org>
+Date: Wed, 4 Nov 2015 13:30:03 +0000
+Subject: [PATCH] Add test for CVE-2015-3194
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+
+Upstream-Status: Backport
+
+This patch was imported from 
+https://git.openssl.org/?p=openssl.git;a=commit;h=00456fded43eadd4bb94bf675ae4ea5d158a764f
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ test/certs/pss1.pem | 21 +++++++++++++++++++++
+ test/tx509          |  7 +++++++
+ 2 files changed, 28 insertions(+)
+ create mode 100644 test/certs/pss1.pem
+
+diff --git a/test/certs/pss1.pem b/test/certs/pss1.pem
+new file mode 100644
+index 0000000..29da71d
+--- /dev/null
++++ b/test/certs/pss1.pem
+@@ -0,0 +1,21 @@
++-----BEGIN CERTIFICATE-----
++MIIDdjCCAjqgAwIBAgIJANcwZLyfEv7DMD4GCSqGSIb3DQEBCjAxoA0wCwYJYIZI
++AWUDBAIBoRowGAYJKoZIhvcNAQEIMAsGCWCGSAFlAwQCAaIEAgIA3jAnMSUwIwYD
++VQQDDBxUZXN0IEludmFsaWQgUFNTIGNlcnRpZmljYXRlMB4XDTE1MTEwNDE2MDIz
++NVoXDTE1MTIwNDE2MDIzNVowJzElMCMGA1UEAwwcVGVzdCBJbnZhbGlkIFBTUyBj
++ZXJ0aWZpY2F0ZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMTaM7WH
++qVCAGAIA+zL1KWvvASTrhlq+1ePdO7wsrWX2KiYoTYrJYTnxhLnn0wrHqApt79nL
++IBG7cfShyZqFHOY/IzlYPMVt+gPo293gw96Fds5JBsjhjkyGnOyr9OUntFqvxDbT
++IIFU7o9IdxD4edaqjRv+fegVE+B79pDk4s0ujsk6dULtCg9Rst0ucGFo19mr+b7k
++dbfn8pZ72ZNDJPueVdrUAWw9oll61UcYfk75XdrLk6JlL41GrYHc8KlfXf43gGQq
++QfrpHkg4Ih2cI6Wt2nhFGAzrlcorzLliQIUJRIhM8h4IgDfpBpaPdVQLqS2pFbXa
++5eQjqiyJwak2vJ8CAwEAAaNQME4wHQYDVR0OBBYEFCt180N4oGUt5LbzBwQ4Ia+2
++4V97MB8GA1UdIwQYMBaAFCt180N4oGUt5LbzBwQ4Ia+24V97MAwGA1UdEwQFMAMB
++Af8wMQYJKoZIhvcNAQEKMCSgDTALBglghkgBZQMEAgGhDTALBgkqhkiG9w0BAQii
++BAICAN4DggEBAAjBtm90lGxgddjc4Xu/nbXXFHVs2zVcHv/mqOZoQkGB9r/BVgLb
++xhHrFZ2pHGElbUYPfifdS9ztB73e1d4J+P29o0yBqfd4/wGAc/JA8qgn6AAEO/Xn
++plhFeTRJQtLZVl75CkHXgUGUd3h+ADvKtcBuW9dSUncaUrgNKR8u/h/2sMG38RWY
++DzBddC/66YTa3r7KkVUfW7yqRQfELiGKdcm+bjlTEMsvS+EhHup9CzbpoCx2Fx9p
++NPtFY3yEObQhmL1JyoCRWqBE75GzFPbRaiux5UpEkns+i3trkGssZzsOuVqHNTNZ
++lC9+9hPHIoc9UMmAQNo1vGIW3NWVoeGbaJ8=
++-----END CERTIFICATE-----
+diff --git a/test/tx509 b/test/tx509
+index 0ce3b52..77f5cac 100644
+--- a/test/tx509
++++ b/test/tx509
+@@ -74,5 +74,12 @@ if [ $? != 0 ]; then exit 1; fi
+ cmp x509-f.p x509-ff.p3
+ if [ $? != 0 ]; then exit 1; fi
+ 
++echo "Parsing test certificates"
++
++$cmd -in certs/pss1.pem -text -noout >/dev/null
++if [ $? != 0 ]; then exit 1; fi
++
++echo OK
++
+ /bin/rm -f x509-f.* x509-ff.* x509-fff.*
+ exit 0
+-- 
+2.3.5
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch
new file mode 100644
index 0000000..13d4891
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch
@@ -0,0 +1,45 @@
+From c394a488942387246653833359a5c94b5832674e Mon Sep 17 00:00:00 2001
+From: "Dr. Stephen Henson" <steve@openssl.org>
+Date: Fri, 2 Oct 2015 12:35:19 +0100
+Subject: [PATCH] Add PSS parameter check.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Avoid seg fault by checking mgf1 parameter is not NULL. This can be
+triggered during certificate verification so could be a DoS attack
+against a client or a server enabling client authentication.
+
+Thanks to Loïc Jonas Etienne (Qnective AG) for discovering this bug.
+
+CVE-2015-3194
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+
+Upstream-Status: Backport
+
+This patch was imported from 
+https://git.openssl.org/?p=openssl.git;a=commit;h=c394a488942387246653833359a5c94b5832674e
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ crypto/rsa/rsa_ameth.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/rsa/rsa_ameth.c b/crypto/rsa/rsa_ameth.c
+index ca3922e..4e06218 100644
+--- a/crypto/rsa/rsa_ameth.c
++++ b/crypto/rsa/rsa_ameth.c
+@@ -268,7 +268,7 @@ static X509_ALGOR *rsa_mgf1_decode(X509_ALGOR *alg)
+ {
+     const unsigned char *p;
+     int plen;
+-    if (alg == NULL)
++    if (alg == NULL || alg->parameter == NULL)
+         return NULL;
+     if (OBJ_obj2nid(alg->algorithm) != NID_mgf1)
+         return NULL;
+-- 
+2.3.5
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index 79e86d8..0364b64 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -38,6 +38,8 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-1.0.2a-x32-asm.patch \
             file://ptest_makefile_deps.patch  \
             file://CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch \
+            file://CVE-2015-3194-1-Add-PSS-parameter-check.patch \
+            file://0001-Add-test-for-CVE-2015-3194.patch \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
2.3.5


