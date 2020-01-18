Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D82297CBDF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 05:41:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y17so24614305wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6rzZ1cdd4vl4P5M2kWA9LylIp4fCv3mextt0qGZIno0=;
	b=rCi3ZpXQFbjwMsommwSgzt+OVFNuZmfXNNwLiIyOIuZ6zQlYRBvlwOIrvWPhcLLwyZ
	bjRRGJ4UP4Uz7KoOfx+Rgyf6zEJnQ4wUNnbCHT4KmPJLeE6uqOkmfI0YW7bQOlxnpcs4
	naz9iuJ+llVq6P6tUNaLmbcBPB208ye1bQQRjEQ3KcvpAbCl6TB/qP342WTbnukpH4LL
	hxy3t5RpQSknmmREVhlE2fqQ9wvLrLLfNthXWKDgtZg4jg8/RhQ3FTu91Dqx9HCwPigh
	MVQsECXU3sgvEbByTmHIfbfezgYPekENmo8Va1m+ZyZLRPoDIvnndCq8ESQkGqywWm4X
	1E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6rzZ1cdd4vl4P5M2kWA9LylIp4fCv3mextt0qGZIno0=;
	b=RITxbKFKx6QQ89q6cEc0IlN0bKifkTJDiBtS9MYAnQo6G4y9psX5u74mau1U0HgcM8
	F6tf+uLLMSonDkmV1RJIFqKU8xMrnOYxip4UoEp1Oh0jHBy9qpMojizoBst55/uIlzqp
	aAcYqhXIHGj8S1EER51JPlrLD4jc1Wk8XTd7kIytyXANKHlk4cNs9emrxIRkEFAk6BUm
	Jq3d0oKvK6NpAXBv0xv8H4ILPFNv0m4lPDDzfcgmvHuvF7ivqR4fwxVrNBLLmqlNLUVU
	w31mARU86Ws/ZCzCJYo8OIOzZHRuRENLqDBO9T+GaJQp+TLmczaH8BCMpT2d1itGaT0y
	zCAg==
X-Gm-Message-State: APjAAAVNcLubUXsVi7JssMKDm9CEky3xB28NZ/Iz90S/b9xZgEUZjjP+
	qmjsyAgZG0eqb0wjHVRKetrokIpx
X-Google-Smtp-Source: APXvYqyE5wHBsjFQOOtqQGQf1+tHag3cxuC/5Fz9QCmPxPys74qT41dhuKhVI3pz+WJcs+afvWdwLw==
X-Received: by 2002:a5d:4807:: with SMTP id l7mr6910567wrq.64.1579326073007;
	Fri, 17 Jan 2020 21:41:13 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id y7sm6211754wmd.1.2020.01.17.21.41.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 21:41:12 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 05:41:07 +0000
Message-Id: <20200118054107.101203-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] rootfs: Make BUILDNAME a weak default in reproducible_build_simple
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
X-List-Received-Date: Sat, 18 Jan 2020 05:41:13 -0000

11e45082ad00 ("rootfs-postcommands.bbclass: improve binary
reproducibility") fixed binary reproducibility of /etc/version, but with
the move to reproducibilty in all builds, setting /etc/version to
anything other than the default fixed timestamp is tricky because
rootfs_reproducible() runs very late.

rootfs.py uses BUILDNAME if set for /etc/version, so introduce a weak
default for BUILDNAME of "REPRODUCIBLE_TIMESTAMP_ROOTFS", when enabling
reproducible builds hence allowing BUILDNAME to be overridden elsewhere.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/reproducible_build_simple.bbclass | 1 +
 meta/classes/rootfs-postcommands.bbclass       | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classes/reproducible_build_simple.bbclass
index d0842f0f902a..153a07607219 100644
--- a/meta/classes/reproducible_build_simple.bbclass
+++ b/meta/classes/reproducible_build_simple.bbclass
@@ -7,5 +7,6 @@ export PERL_HASH_SEED = "0"
 export SOURCE_DATE_EPOCH ??= "1520598896"
 
 REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
+BUILDNAME ??= "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"
 
 inherit podfix
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index fdc63bb64d55..ebf96be7e85f 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -356,11 +356,6 @@ python rootfs_log_check_recommends() {
 # Perform any additional adjustments needed to make rootf binary reproducible
 rootfs_reproducible () {
 	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" != "" ]; then
-		# Convert UTC into %4Y%2m%2d%2H%2M%2S
-		sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
-		echo $sformatted > ${IMAGE_ROOTFS}/etc/version
-		bbnote "rootfs_reproducible: set /etc/version to $sformatted"
-
 		if [ -d ${IMAGE_ROOTFS}${sysconfdir}/gconf ]; then
 			find ${IMAGE_ROOTFS}${sysconfdir}/gconf -name '%gconf.xml' -print0 | xargs -0r \
 			sed -i -e 's@\bmtime="[0-9][0-9]*"@mtime="'${REPRODUCIBLE_TIMESTAMP_ROOTFS}'"@g'
-- 
2.17.1


