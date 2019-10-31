Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 97C227F8BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:54:39 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id o28so5695893wro.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Br/VBFqAF/wpcKrmwDEdO9V9lpckC8FoSep0xyoJk7w=;
	b=kWaoYslGDNlFEPWPMWgY5kXtA6DEIzwRRS1kQ36PBwrHXXqyf+MPe3YptdKCH2cY+V
	8qNH4EGAVBcw32aNAKJ43Yd9kIrP1vX0RQ/TlSET6/emjsJfJGWF7yKizn6V9+KGzNm4
	XSiUF9fOhgO7PFiQ1+WbIveCGLmAbDCEV5vCMc5htrOG3HNxEaOSOabA0bUIbHJpcH7R
	0ceK56doh6GvcOcgPFhZu9m02MS56l2+PVMqouE8snQULnLIsJgXyNg/3f+6sB3o+o2i
	7Ron7cIGi43XASwjhW7zBZXK7nUIVGuJcuHsWq+RVzTKS0OhXnaVq1hcWQ7YLs1C1Lgl
	XnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Br/VBFqAF/wpcKrmwDEdO9V9lpckC8FoSep0xyoJk7w=;
	b=IcBgwgzca3Kr7MsEvkXuaJQdewDriQm7EqmT027gILDuZqVCLX2EBOFpDGLqpg5LNl
	o3HtX3PoNNhl6Cj+Lq9qxnglCUlU3a3TV9/DtxEBJsKDykdSHkevlgtKjaq1qlqN7v4x
	odBenmlvr5Fu0xhm8CnPmZhbWACuPQU3CT3UDfPQfK04VEvp2zg8g/qg4pNWXBiHcAhd
	jX4hWdw+UYc/thAg/evBOBJVT3mGi9HIK5GYN5ugG3lOkN7C14nrV30jjcM+F6qklPP1
	Sze7Rnh9aCmE3FOQjFLTegFtHSlcjMyiZCYO4eLHyFD+iKudUpMUC3HeI/8zWutefE5S
	1+Sw==
X-Gm-Message-State: APjAAAVD2l3uNmov5zm658Zuo06WQVxrxvDUJf+Legzz8mqtS0/7YgQ5
	PHlLOoXyr6/bnI+VTEMcfS/6ZkIdTkg=
X-Google-Smtp-Source: APXvYqzQvKxueU4J+4RaYie8KJaAVF3CdWB9Gn87g2BnRkcET1ZCVX1/mPZMjzRbs6OEohdx8uCsPg==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr4838612wrn.307.1572519280159; 
	Thu, 31 Oct 2019 03:54:40 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t24sm3992341wra.55.2019.10.31.03.54.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 03:54:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:54:37 +0000
Message-Id: <20191031105437.7545-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] cve-check: ensure all known CVEs are in the report
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
X-List-Received-Date: Thu, 31 Oct 2019 10:54:40 -0000
Content-Transfer-Encoding: 8bit

CVEs that are whitelisted or were not vulnerable when there are version
comparisons were not included in the report, so alter the logic to ensure that
all relevant CVEs are in the report for completeness.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c00d2910be1..f87bcc9dc61 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -208,12 +208,14 @@ def check_cves(d, patched_cves):
 
             if cve in cve_whitelist:
                 bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
+                # TODO: this should be in the report as 'whitelisted'
+                patched_cves.add(cve)
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
             else:
                 to_append = False
                 if (operator_start == '=' and pv == version_start):
-                    cves_unpatched.append(cve)
+                    to_append = True
                 else:
                     if operator_start:
                         try:
@@ -243,8 +245,11 @@ def check_cves(d, patched_cves):
                         to_append = to_append_start or to_append_end
 
                 if to_append:
+                    bb.note("%s-%s is vulnerable to %s" % (product, pv, cve))
                     cves_unpatched.append(cve)
-                bb.debug(2, "%s-%s is not patched for %s" % (product, pv, cve))
+                else:
+                    bb.note("%s-%s is not vulnerable to %s" % (product, pv, cve))
+                    patched_cves.add(cve)
     conn.close()
 
     return (list(patched_cves), cves_unpatched)
-- 
2.20.1


