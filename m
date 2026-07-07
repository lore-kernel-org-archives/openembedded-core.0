Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2D2C43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 05:41:13 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167319.1783402871658705352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 22:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BTbPnZW8;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9677; q=dns/txt;
  s=iport01; t=1783402871; x=1784612471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fH2lCzbsXWPob9xT3DAcFkEFae1fh6pgoagcOaxpaVA=;
  b=BTbPnZW8GulbGZtUp4URaFYXq+h7vaplJTVg0S2JkVs5dzeZn5DyBGft
   hoRFrxsxbWrX+z/aGMW7wElMPz+Z1JTVF/fLbDZRl7EWf+qAlobAtP2R8
   vlZkwT+ixRFz9Wuf9G8BGt+c7O1Ka0wf4uvmdty5Kf04EtSx8126qVRQs
   WAbBux9zkCX7Pjmb+mKVlo9iIpoKeVB9GcKPhQVc71mgZVYEuT6AIMp0W
   WuukIs9hl4i9PF+K0m1SxlryWHcL9/Jm0VhOovhcSS824UmoUnBFdR9Up
   ZManatmokki4JTQ1RlLgJF+kGzrsrVpeTBt6h3gPfdEL3i9j8Pe//1d2Y
   Q==;
X-CSE-ConnectionGUID: k1DqLMCvRcqMBsKp9uK76Q==
X-CSE-MsgGUID: GQnjEqI8RFKqP1JLBR7Zvg==
X-IPAS-Result: =?us-ascii?q?A0BGAgD5j0xq/5H/Ja1aH4I6gld0X0JJA5ZIkU2MUYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUGAo1NAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgE1ARgBLSwDAQJaIyGDAgGCcwIBEQa3YoIsgQGDKAExA?=
 =?us-ascii?q?wsCQ1DbLAELFAEFgTOFP4gfWxgBhHwnGxuBcoEVgTuCLoEFgVwDARiBLoZdB?=
 =?us-ascii?q?IIigQyBWh6DH4wdSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFg?=
 =?us-ascii?q?R2Ba4EChHkjHwM5f4EwdUp5LYECARIeCoFSgVEDCxgNSBEsNxQbBD5uB40NF?=
 =?us-ascii?q?w+CECYFAgEsYQEpAQGBEXIRGBE9kmAbLo9egiGBNZ9aCiiDdYwhlToaM6psm?=
 =?us-ascii?q?QiOCpU0PyY3hGiBaDyBWXAVgyIJShkPVo1XCwuDYIUTyUckNQIBAQcDLwEBB?=
 =?us-ascii?q?wIHDgMLgWiRHWABAQ?=
IronPort-Data: A9a23:zG6oIaBkqZPBUhVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDtw1TQEx
 jQXDT/Qa/iJYTH3Ldknao23pkIOsMDRy4A3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD9hGYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwKxCFWUTFpMi8f9SK3pt7
 a0FC29TV0XW7w626OrTpuhEnM8vKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYyBPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FEpjOi1aoCEJbRmQ+16p0Cai
 3vnr17XIQgibf674wDawGyj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:1URWVqxTC3s8dXIUJgojKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AnHkocWuLsyFuvhlovVOZWcdv6IsmK1HE6FL7PXW?=
 =?us-ascii?q?zEENDU56NGEKzp/1dxp8=3D?=
X-Talos-MUID: 9a23:XCfJaQXIqgGA2gjq/BDVgjNPLeY42YqNEXhUs7EsgZa2KyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,153,1779148800"; 
   d="scan'208";a="504802297"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jul 2026 05:41:10 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 70E3B1800045E;
	Tue,  7 Jul 2026 05:41:10 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 035EDCC124B; Mon,  6 Jul 2026 22:41:09 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] samba: Fix CVE-2026-3012
Date: Mon,  6 Jul 2026 22:41:04 -0700
Message-Id: <20260707054105.2419361-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 05:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240349

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream Samba security backport for
CVE-2026-3012. The upstream security bundle is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers.

[1] https://www.samba.org/samba/ftp/patches/security/samba-4.22.9-security-2026-05-25.patch
[2] https://www.samba.org/samba/security/CVE-2026-3012.html

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../samba/samba/CVE-2026-3012_p1.patch        | 131 ++++++++++++++++++
 .../samba/samba/CVE-2026-3012_p2.patch        |  51 +++++++
 .../samba/samba_4.19.9.bb                     |   2 +
 3 files changed, 184 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p1.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p2.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p1.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p1.patch
new file mode 100644
index 0000000000..ce54b2916f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p1.patch
@@ -0,0 +1,131 @@
+From f21f87e0f64dc4aea8c9537f182282077ae6a37b Mon Sep 17 00:00:00 2001
+From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Date: Mon, 23 Feb 2026 11:01:57 +1300
+Subject: [PATCH] CVE-2026-3012: do not fetch certificate over http
+
+In the case where a certificate was found via HTTP, it was trusted
+without verification and put in the global CA store.
+
+There is no means to check the certificate other than by comparing it
+to certificates we may have gathered via LDAP, but in that case there
+is no advantage over just using the LDAP-derived certificates.
+
+Using the LDAP certificates was already the fallback case if HTTP
+failed, so we just make it the default.
+
+The HTTP fetch depends on the NDES service, which is a variant of
+Simple Certificate Enrolment Protocol (SCEP, RFC8894), but in fact
+Samba implements none of that protocol other than the HTTP fetch. SCEP
+is for clients that are not true domain members. Domain members can
+access to certificates over LDAP. This patch is not reducing SCEP
+client support because Samba never had it.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16003
+
+Reported-by: Arad Inbar, DREAM Security Research Team
+Reported-by: Nir Somech, DREAM Security Research Team
+Reported-by: Ben Grinberg, DREAM Security Research Team
+
+CVE: CVE-2026-3012
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/f21f87e0f64dc4aea8c9537f182282077ae6a37b]
+
+Backport Changes:
+- Adapted python/samba/gp/gp_cert_auto_enroll_ext.py hunks to
+  Samba 4.19.9 context.
+- Omitted selftest/knownfail.d/gpo-auto-enrol because the Yocto
+  recipe does not run upstream Samba selftest.
+
+Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Reviewed-by: Jennifer Sutton <jennifersutton@catalyst.net.nz>
+(cherry picked from commit f21f87e0f64dc4aea8c9537f182282077ae6a37b)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+diff --git a/python/samba/gp/gp_cert_auto_enroll_ext.py b/python/samba/gp/gp_cert_auto_enroll_ext.py
+index df3b472..31de4b1 100644
+--- a/python/samba/gp/gp_cert_auto_enroll_ext.py
++++ b/python/samba/gp/gp_cert_auto_enroll_ext.py
+@@ -16,7 +16,6 @@
+
+ import os
+ import operator
+-import requests
+ from samba.gp.gpclass import gp_pol_ext, gp_applier, GPOSTATE
+ from samba import Ldb
+ from ldb import SCOPE_SUBTREE, SCOPE_BASE
+@@ -200,56 +199,24 @@ def get_supported_templates(server):
+     return out.strip().split()
+
+
+-def getca(ca, url, trust_dir):
+-    """Fetch Certificate Chain from the CA."""
++def getca(ca, trust_dir):
++    """Fetch a certificate from LDAP."""
+     root_cert = os.path.join(trust_dir, '%s.crt' % ca['name'])
+     root_certs = []
+
+-    try:
+-        r = requests.get(url=url, params={'operation': 'GetCACert',
+-                                          'message': 'CAIdentifier'})
+-    except requests.exceptions.ConnectionError:
+-        log.warn('Failed to establish a new connection')
+-        r = None
+-    if r is None or r.content == b'' or r.headers['Content-Type'] == 'text/html':
+-        log.warn('Failed to fetch the root certificate chain.')
+-        log.warn('The Network Device Enrollment Service is either not' +
+-                 ' installed or not configured.')
+-        if 'cACertificate' in ca:
+-            log.warn('Installing the server certificate only.')
+-            der_certificate = base64.b64decode(ca['cACertificate'])
+-            try:
+-                cert = load_der_x509_certificate(der_certificate)
+-            except TypeError:
+-                cert = load_der_x509_certificate(der_certificate,
+-                                                 default_backend())
+-            cert_data = cert.public_bytes(Encoding.PEM)
+-            with open(root_cert, 'wb') as w:
+-                w.write(cert_data)
+-            root_certs.append(root_cert)
+-        return root_certs
+-
+-    if r.headers['Content-Type'] == 'application/x-x509-ca-cert':
++    if 'cACertificate' in ca:
++        log.warn('Installing the server certificate only.')
++        der_certificate = base64.b64decode(ca['cACertificate'])
+         # Older versions of load_der_x509_certificate require a backend param
+         try:
+-            cert = load_der_x509_certificate(r.content)
++            cert = load_der_x509_certificate(der_certificate)
+         except TypeError:
+-            cert = load_der_x509_certificate(r.content, default_backend())
++            cert = load_der_x509_certificate(der_certificate,
++                                             default_backend())
+         cert_data = cert.public_bytes(Encoding.PEM)
+         with open(root_cert, 'wb') as w:
+             w.write(cert_data)
+         root_certs.append(root_cert)
+-    elif r.headers['Content-Type'] == 'application/x-x509-ca-ra-cert':
+-        certs = load_der_pkcs7_certificates(r.content)
+-        for i in range(0, len(certs)):
+-            cert = certs[i].public_bytes(Encoding.PEM)
+-            filename, extension = root_cert.rsplit('.', 1)
+-            dest = '%s.%d.%s' % (filename, i, extension)
+-            with open(dest, 'wb') as w:
+-                w.write(cert)
+-            root_certs.append(dest)
+-    else:
+-        log.warn('getca: Wrong (or missing) MIME content type')
+
+     return root_certs
+
+@@ -273,8 +240,7 @@ def changed(new_data, old_data):
+ def cert_enroll(ca, ldb, trust_dir, private_dir, auth='Kerberos'):
+     """Install the root certificate chain."""
+     data = dict({'files': [], 'templates': []}, **ca)
+-    url = 'http://%s/CertSrv/mscep/mscep.dll/pkiclient.exe?' % ca['hostname']
+-    root_certs = getca(ca, url, trust_dir)
++    root_certs = getca(ca, trust_dir)
+     data['files'].extend(root_certs)
+     global_trust_dir = find_global_trust_dir()
+     for src in root_certs:
+--
+2.43.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p2.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p2.patch
new file mode 100644
index 0000000000..e2989dc075
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p2.patch
@@ -0,0 +1,51 @@
+From 7337d99ed55c01cd5837029485cd971a48f761c2 Mon Sep 17 00:00:00 2001
+From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Date: Thu, 26 Feb 2026 14:21:01 +1300
+Subject: [PATCH] CVE-2026-3012: gp_auto_enrol: skip CAs not found in
+ LDAP
+
+If a certificate is mentioned in a GPO but is not present as a
+cACertificate attribute on a pKIEnrollmentService object, we have no way
+of obtaining it, so we might as well forget it.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16003
+
+CVE: CVE-2026-3012
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/7337d99ed55c01cd5837029485cd971a48f761c2]
+
+Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Reviewed-by: Jennifer Sutton <jennifersutton@catalyst.net.nz>
+(cherry picked from commit 7337d99ed55c01cd5837029485cd971a48f761c2)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ python/samba/gp/gp_cert_auto_enroll_ext.py | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/python/samba/gp/gp_cert_auto_enroll_ext.py b/python/samba/gp/gp_cert_auto_enroll_ext.py
+index 815436e11e9c..de8b310afd95 100644
+--- a/python/samba/gp/gp_cert_auto_enroll_ext.py
++++ b/python/samba/gp/gp_cert_auto_enroll_ext.py
+@@ -452,11 +452,21 @@ class gp_cert_auto_enroll_ext(gp_pol_ext, gp_applier):
+                     # This is a basic configuration.
+                     cas = fetch_certification_authorities(ldb)
+                     for _ca in cas:
++                        if 'cACertificate' not in _ca:
++                            log.warning(f"ignoring CA '{_ca['name']}' with no "
++                                        "cACertificate in LDAP.")
++                            continue
++
+                         self.apply(guid, _ca, cert_enroll, _ca, ldb, trust_dir,
+                                    private_dir)
+                         ca_names.append(_ca['name'])
+                 # If EndPoint.URI starts with "HTTPS//":
+                 elif ca['URL'].lower().startswith('https://'):
++                    if 'cACertificate' not in ca:
++                        log.warning(f"ignoring CA '{ca['name']}' "
++                                    f"({ca['URL']}) with no "
++                                    "cACertificate in LDAP.")
++                        continue
+                     self.apply(guid, ca, cert_enroll, ca, ldb, trust_dir,
+                                private_dir, auth=ca['auth'])
+                     ca_names.append(ca['name'])
+--
+2.43.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
index d50d9f5155..055e404bb9 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
@@ -24,6 +24,8 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
            file://0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
+           file://CVE-2026-3012_p1.patch \
+           file://CVE-2026-3012_p2.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.35.6


