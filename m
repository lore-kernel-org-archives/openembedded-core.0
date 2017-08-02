Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id C96F4780A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 14:53:12 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id y43so19739973wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Aug 2017 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0Lz/mo7Y6ovruWZvn4DhEXmDgf+CA7IbPtUHAVjQqHc=;
	b=d67Npn9505ttTUTvZCX+hjA63VJXv1ElGUCd2uCa/vOU7KWxi6woZg9+eR88wi4/DP
	l+KEjdZPxgnCoV2xtPudHH7N3bJfxXjmeLFHm9fyrve7zmC+KkUIzARnJJ6wUhlz0+R+
	hA8VkNp0daDDJVrtNBmSXb7LG0bO5kPVJ2+X1SrxabWGVV4zzKtuaETx7CvbG9fjqLTU
	R3bhHHsJxK3GtltPiOxFmqIJjzYIEonJqmlmClhdDQuEqZHvMqxCjR59MBBuFMScOa+2
	Od8Wm2si+9IRul7UquAO8K2f4tvsTbUMw+XZP+ZAaUk+2Yvq0dHoEi0wwgURoCoiGeMh
	AafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0Lz/mo7Y6ovruWZvn4DhEXmDgf+CA7IbPtUHAVjQqHc=;
	b=sIh45qWambdU/sXzetG1FK9EWf7xEk6/eTuUwYK6bdskgnVf55sIYBG+5KpaOWftQh
	ULGu6pxu/kL2MqDw/LwzVzQdcXsNyGhhLXbpnb33ArFU7mqpVFIaU4f/AzM6vWfXYqdT
	fKDxyIp9ndUmzAnklvlFsMJOaphLGfQVT2C9YLyUevh5WoOH4FcA1+2C6FnekscEdY+l
	tqodlS5fbZv1loK6s8rbYD0lX8IUyTMuZtf2DNu0fUFmnkR5mWTufQZ9I3dGV1EnfolR
	2ktEpC8463rNqHRyBNBUgHXpolWC0SAu050Dkn4lUEQO4ON52JKPYjB3JWLQLr8QYj8m
	yZXQ==
X-Gm-Message-State: AIVw112fYImImDLML3TLhAV7xThN1n09Cve8jjepsAb8fqDNWxHmF3Fu
	oyIngX8WFsbtEq/OFCs=
X-Received: by 10.223.132.164 with SMTP id 33mr17316449wrg.204.1501685593451; 
	Wed, 02 Aug 2017 07:53:13 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e21sm3203377wme.17.2017.08.02.07.53.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 07:53:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Aug 2017 15:53:06 +0100
Message-Id: <20170802145308.19074-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] ca-certificates: use host Python 3 instead of Python 2
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
X-List-Received-Date: Wed, 02 Aug 2017 14:53:15 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../ca-certificates/ca-certificates/use-py3.patch            | 12 ++++++++++++
 .../ca-certificates/ca-certificates_20161130.bb              |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/use-py3.patch

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/use-py3.patch b/meta/recipes-support/ca-certificates/ca-certificates/use-py3.patch
new file mode 100644
index 00000000000..4a09dfde4df
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/use-py3.patch
@@ -0,0 +1,12 @@
+Use the host Python 3 instead of Python 2.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/mozilla/Makefile b/mozilla/Makefile
+index 6f46118..f98877c 100644
+--- a/mozilla/Makefile
++++ b/mozilla/Makefile
+@@ -6 +6 @@ all:
+-	python certdata2pem.py
++	python3 certdata2pem.py
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
index 42088b98994..c976e689d98 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
@@ -20,7 +20,8 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://update-ca-certificates-support-Toybox.patch \
            file://default-sysroot.patch \
-           file://sbindir.patch"
+           file://sbindir.patch \
+           file://use-py3.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


