Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7BEDA7E467
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 12:46:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p17so20777505wrf.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 05:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Zxnw26pXT7BWJoNZngNpcaJQUuXdH8knUN2cRx4JfbY=;
	b=sshcKQCgkdn9vBbj+odhAAl2n2GuTprEf8vRR3tr25DypBPn3EUFXTWwOovzZTnzi8
	hD8PZUtcTw5MUJMlxhRmBSI0iTNbvz1ZJU+S0VCJ23By+5PUN2c+JQWwsoS1XkL00caf
	QGJFFO8OoPgV62z6WzgLAhBZTCHu3wNaK0GDpthcT2F2Sm5MR1GRKqTao2Y4MbnqzB4x
	T6J2fL1AZElnefSwHzFfF4Sb9/8Hv7u1KQ+WGGOzgoSGjMKO9pOc16HuXNuppvnZ204n
	ip/LCg+HkAStBWjyNWnU6c68+S22/nZd8UcF6lRUAy/RMoKxng0eMt8NWIp/kvozGbOH
	fnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Zxnw26pXT7BWJoNZngNpcaJQUuXdH8knUN2cRx4JfbY=;
	b=IiHBKebXTHu6b9Wllpi53w4e57IgKlMNzykeK7cz/8IhOUrzufbWrv1lKGocmHV+nR
	00gNAcXQgqtRAa+VdKF5d9KznbHR6G7zf9WW/SpKua2P2FpTVL5EISQk+FMn6yxMdej/
	9xGqcUj3IOD+kalnTqj1LmRYHGRrGbrPFGpXNWrJ8HQWFYX4RZTcp3C5dXSOGw2EY9ff
	4SDQHnfv+YMCAa91Cs8P30EuWG8KJVaP7ydHn1CeoAkijdjZX4vDMk7o3b4Hh7JXtWyM
	uh42tLr3ociisydi4eNUQcw8zFt/Cbnfb55leA3Vyljf5OyE20NdcZReiHz3lBqnekLd
	9UFQ==
X-Gm-Message-State: APjAAAUwpm/OQkKaVKgfaIhvjxJO94l8nSbqUphh2J8au2lbx4bI88bR
	OFkmFXflZ72BCqjAnSNgKDpiNZLTMkY=
X-Google-Smtp-Source: APXvYqx/t+OUVC8/dpudM6yuh0q5QB5qC6Uo4Fx95H0PQCQp6b56ha1p8eVjUH7KftLJbM+2NtvQWg==
X-Received: by 2002:a5d:680d:: with SMTP id w13mr36669784wru.141.1563281207875;
	Tue, 16 Jul 2019 05:46:47 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t3sm13517989wmi.6.2019.07.16.05.46.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 05:46:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2019 13:46:43 +0100
Message-Id: <20190716124643.22183-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] cve-check: remove redundant readline CVE whitelisting
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
X-List-Received-Date: Tue, 16 Jul 2019 12:46:47 -0000
Content-Transfer-Encoding: 8bit

CVE-2014-2524 is a readline CVE that was fixed in 6.3patch3 onwards, but the
tooling wasn't able to detect this version.  As we now ship readline 8 we don't
need to manually whitelist it, and if we did then the whitelisting should be in
the readline recipe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index ffd624333f6..5979edf3d17 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -41,10 +41,15 @@ CVE_CHECK_PN_WHITELIST = "\
     glibc-locale \
 "
 
-# Whitelist for CVE and version of package
-CVE_CHECK_CVE_WHITELIST = "{\
-    'CVE-2014-2524': ('6.3','5.2',), \
-}"
+# Whitelist for CVE and version of package. If a CVE is found then the PV is
+# compared with the version list, and if found the CVE is considered
+# patched.
+#
+# The value should be valid Python in this format:
+# {
+#   'CVE-2014-2524': ('6.3','5.2')
+# }
+CVE_CHECK_CVE_WHITELIST ?= "{}"
 
 python do_cve_check () {
     """
-- 
2.20.1


