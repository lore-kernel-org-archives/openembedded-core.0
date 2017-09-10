Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id DDFB171D97
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 12:59:16 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id h4so3762382pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 05:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=XjPq+obOQfg9TrT3soFITHfJM/K7l+5OMA5QZjLIBck=;
	b=WVHCipMiRFABAcvSO4fYkLKSXM25HP6Hrc5qfEB6Giq4fnzZmlBU9pjVtx67mVBGLh
	QoQHszgaB5m0HxuUvj8va7wDUhjeUxmphp9qxZZOjDXnS3z9+TkC/6LPmfoxVWZ0lcAm
	a2GczZzyTaWHJ6QhSWzBV9O9uQF/Xe4vMS2yu6rZ4/IONKikfXVfjnZbNppH1LxSajIO
	nV/H3tpMhvyo7ynUkikmw7QHOv3B1NKJXdAIGkxExOeamzJA3Cc0QyagsxU326SQ1870
	zsrWO3ODjLioZs1R7Ula/rlpKMMNmHOrRx33HOWHJJjHkmvSYpZWWiIQboEfyB6NydtQ
	7Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=XjPq+obOQfg9TrT3soFITHfJM/K7l+5OMA5QZjLIBck=;
	b=hKzAR5vmRDdLqtdQkdXmiH8lr78wUxP4nHP3QERe3X1E0w4pWpG/A8w8V5PCm+YMH1
	yemp0Yh8kxKHqpIE03hDYgyD7dYaFDR6vp9zzBeDLe6go0Wn+3RYvOTkXFkfAkGd3EcE
	27qfO1fSMFZu0yR4mWa/vRfKMMrsUVzTxddiLxkhvBCVMXIq7r8XMnqDQz7f+PdNocpH
	Bm362vNw74dRQYoIlZVOuh8FbMRIbD6Z68hgOyy4avElF+vV848CWizwRFfdxJUAH/DN
	KA/BOjz7mL4w6ElKWdMwZEVeytsW7pxuxwHcLTMRuFCIBuKh4+fqT/9+9C6l0TZSOjTy
	CrcA==
X-Gm-Message-State: AHPjjUgFWKgH1M50NFEr6PWu/hlPLs6nE9FQGqS410vsG7h0B6OUFbjo
	96CWn5Cx8SOzbvtl7e9dKA==
X-Google-Smtp-Source: ADKCNb70OW1tVjXEbvl5iSc/N2L9+nne/Z5pP6AmMEAo4/Q4k/N791tHHvVujGPU9VsuRBOOU98zEQ==
X-Received: by 10.84.132.99 with SMTP id 90mr10078862ple.406.1505048358000;
	Sun, 10 Sep 2017 05:59:18 -0700 (PDT)
Received: from [127.0.1.1] (CPE-121-223-2-142.lnse2.cha.bigpond.net.au.
	[121.223.2.142]) by smtp.gmail.com with ESMTPSA id
	x128sm9988767pgb.6.2017.09.10.05.59.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Sep 2017 05:59:17 -0700 (PDT)
Date: Sun, 10 Sep 2017 22:59:08 +1000
Message-Id: <20170910125908.975-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] gawk: Enable native building
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
X-List-Received-Date: Sun, 10 Sep 2017 12:59:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Also update the ASSUME_PROVIDED in bitbake.conf to contain gawk-native
as the dependency is passed in via HOSTTOOLS for native builds.

This allows for recipes to depend on gawk-native, and have the
dependency met if not already provided by the host tools.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/conf/bitbake.conf                   | 1 +
 meta/recipes-extended/gawk/gawk_4.1.4.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8ce08340d7..3669067863 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -176,6 +176,7 @@ ASSUME_PROVIDED = "\
     chrpath-native \
     file-native \
     findutils-native \
+    gawk-native \
     git-native \
     grep-native \
     diffstat-native \
diff --git a/meta/recipes-extended/gawk/gawk_4.1.4.bb b/meta/recipes-extended/gawk/gawk_4.1.4.bb
index dda38ef1bb..04451f7ff8 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.4.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.4.bb
@@ -46,4 +46,4 @@ do_install_ptest() {
 	done
 }
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.14.1


