Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A5BC36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 05:53:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.41540.1745819593261309685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 22:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62139e711a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RMuJtW016452
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 05:53:12 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468pf92e22-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 05:53:12 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 27 Apr 2025 22:53:11 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 27 Apr 2025 22:53:11 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 3/3] buildtools-tarball: Make buildtools respects host CA certificates
Date: Mon, 28 Apr 2025 13:53:07 +0800
Message-ID: <20250428055307.3507811-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428055307.3507811-1-changqing.li@windriver.com>
References: <20250428055307.3507811-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: wFUuhPvq2LoYF6XIrJtTPnlJv-VVHzlu
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=680f17c8 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=016Zi2SdOkiEh_9rNDoA:9 a=pKl0Dz69q9eXMyLR:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA0OCBTYWx0ZWRfX1LO+FBdGZZFP X0a7G6/9pTtvnnHjEam3haC0o2drviCGBx0hv6EXZSfWWCP8GhByI4Y+zUMJOKs4yVZ+LlIgoi9 QAN04UDq409qTUSn+nmvh6MEeilY+rB2b+zUeuZXaznUAc048751tsomz/zYGPv11LYhEyJvLmg
 h1kQJtncqCBvvghiLWDH7/p7rfvadqbo+qMyK0nHS0/xO3p/6JZD/PVnZQAAgsdm7b4tK33qXNd gfsYMFFXH0t70LZVDcoC6N5KOcP5nN0HREQmcTpJgi5aHAS1byfwz+1U2L/f1c/iztDTy4s1JYa 6lHNYd0k/+DZ5BR/UHDEa1LwThCbzqK82ZDZHkOWa4QUEXd+POyyJepI/7z7nNTTMH1/uAd7LKb
 S3WLdTSEgUOXilF0BlXAbfWsJ1+6wc6sARBh+HKRVrHNRS+vT4KCcgCgjx87Pq1cRaSvQUei
X-Proofpoint-ORIG-GUID: wFUuhPvq2LoYF6XIrJtTPnlJv-VVHzlu
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 05:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215575

From: Changqing Li <changqing.li@windriver.com>

To adapt user network enviroment, buildtools should first try to use
the user configured envs like SSL_CERT_FILE/CURL_CA_BUNDLE/..., if these
envs is not set, then use the auto-detected ca file and ca path, and
finally use the CA certificates in buildtools.

nativesdk-openssl set OPENSSLDIR as "/not/builtin", need set SSL_CERT_FILE/SSL_CERT_DIR to work

nativesdk-curl don't set default ca file, need
SSL_CERT_FILE/SSL_CERT_DIR or CURL_CA_BUNDLE/CURL_CA_PATH to work

nativesdk-git actually use libcurl, and GIT_SSL_CAPATH/GIT_SSL_CAINFO
also works

nativesdk-python3-requests will use cacert.pem under python module certifi by
default, need to set REQUESTS_CA_BUNDLE

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../openssl/files/environment.d-openssl.sh    | 25 +++++++++++++++----
 meta/recipes-core/meta/buildtools-tarball.bb  | 23 ++++++++++++++++-
 .../git/git/environment.d-git.sh              | 21 +++++++++++++---
 .../environment.d-python3-requests.sh         | 13 +++++++---
 .../curl/curl/environment.d-curl.sh           | 21 +++++++++++++---
 5 files changed, 88 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index 6cb82d7386..c635be8aca 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,8 +1,23 @@
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
-if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
-    export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
-    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE"
-fi
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
+
+# Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
+# CAFILE/CAPATH is auto-deteced when source buildtools
+if [ -z "$SSL_CERT_FILE" ]; then
+   if [ -n "$CAFILE" ];then
+       export SSL_CERT_FILE="$CAFILE"
+   elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+       export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
+   fi
+fi
+
+if [ -z "$SSL_CERT_DIR" ]; then
+   if [ -n "$CAPATH" ];then
+       export SSL_CERT_DIR="$CAPATH"
+   elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+       export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
+   fi
+fi
+
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE"
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 414c266663..8e78169e23 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -80,14 +80,35 @@ create_sdk_files:append () {
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
 	cat >> $script <<EOF
+# Detect host ca file/path, export for envfile to use
+# /etc/ssl/certs/ca-certificates.crt Debian systems
+# /etc/pki/tls/certs/ca-bundle.crt Fedora systems
+# /etc/ssl/ca-bundle.pem Suse systems
+export CAFILE
+export CAPATH
+for a in /etc/ssl/certs/ca-certificates.crt \
+    /etc/pki/tls/certs/ca-bundle.crt \
+    /etc/ssl/ca-bundle.pem ; do
+    if test -f "\$a"; then
+        CAFILE="\$a"
+        break
+    fi
+done
+
+a="/etc/ssl/certs"
+if test -d "\$a" && ls "\$a"/[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f].0 >/dev/null 2>/dev/null; then
+    CAPATH="\$a"
+fi
+
 if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 	for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
 		. \$envfile
 	done
 fi
+
 # We have to unset this else it can confuse oe-selftest and other tools
 # which may also use the overlapping namespace.
-unset OECORE_NATIVE_SYSROOT
+unset OECORE_NATIVE_SYSROOT CAFILE CAPATH
 EOF
 
 	if [ "${SDKMACHINE}" = "i686" ]; then
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
index f8e3221510..9c7b5a9251 100644
--- a/meta/recipes-devtools/git/git/environment.d-git.sh
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -1,4 +1,19 @@
-if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-    export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
-    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} GIT_SSL_CAINFO"
+# Respect host env GIT_SSL_CAINFO/GIT_SSL_CAPATH first, then auto-detected host cert, then cert in buildtools
+# CAFILE/CAPATH is auto-deteced when source buildtools
+if [ -z "$GIT_SSL_CAINFO" ]; then
+	if [ -n "$CAFILE" ];then
+		export GIT_SSL_CAINFO="$CAFILE"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+	fi
 fi
+
+if [ -z "$GIT_SSL_CAPATH" ]; then
+	if [ -n "$CAPATH" ];then
+		export GIT_SSL_CAPATH="$CAPATH"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export GIT_SSL_CAPATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
+	fi
+fi
+
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} GIT_SSL_CAINFO GIT_SSL_CAPATH"
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
index c7faec127d..492177a9c3 100644
--- a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -1,4 +1,11 @@
-if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-    export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
-    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} REQUESTS_CA_BUNDLE"
+# Respect host env REQUESTS_CA_BUNDLE first, then auto-detected host cert, then cert in buildtools
+# CAFILE/CAPATH is auto-deteced when source buildtools
+if [ -z "$REQUESTS_CA_BUNDLE" ]; then
+	if [ -n "$CAFILE" ];then
+		export REQUESTS_CA_BUNDLE="$CAFILE"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+	fi
 fi
+
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} REQUESTS_CA_BUNDLE"
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 0ab83a267d..7c2971b3da 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,4 +1,19 @@
-if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-    export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
-    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} CURL_CA_BUNDLE"
+# Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
+# CAFILE/CAPATH is auto-deteced when source buildtools
+if [ -z "$CURL_CA_PATH" ]; then
+	if [ -n "$CAFILE" ];then
+		export CURL_CA_BUNDLE="$CAFILE"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+	fi
 fi
+
+if [ -z "$CURL_CA_PATH" ]; then
+	if [ -n "$CAPATH" ];then
+		export CURL_CA_PATH="$CAPATH"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export CURL_CA_PATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
+	fi
+fi
+
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} CURL_CA_BUNDLE CURL_CA_PATH"
-- 
2.34.1


