Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5967E98FBC
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:16:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126102.1775715405749582231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SiP8SyMQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394NLqf4056978
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2026 23:16:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=MyLLFLTY2h/9q4dZmq3ZPJftCtv2McCXs6ZZ8nWUUr8=; b=SiP8SyMQI5WG
	Wg/IOfNSUk6dzoa8b7pxwzKe1UDL+YrJOWNKfLdgRcsgMxBW4p6nb49upWAXwrem
	axLsfs7CsyNqI46NpNaIfRPjpgBtgS6hHDUfQ++07hRuv40REoPhQluNb3I7EQN/
	SbD4P8eNm8w/M+TynrREqxIPpVH8v3d4LgY2zheSSSsngLr3ows5pN0b4u+g//SE
	WG5EgVbtjiL16g+rJq3bdx8a68wCV+eFXoJv6vfnFG4nrbDNd5/02Mxlu+bPSyJS
	MPY6lLcM11m+RWKlWh7NASDJ2pK3nL5YFN7sY64x31pyTFr95KIPwLEhngGY332C
	rxTYapD1MA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrykngw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 23:16:45 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:44 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:44 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 04/12] python3-ply: fix CVE-2025-56005
Date: Thu, 9 Apr 2026 14:16:31 +0800
Message-ID: <20260409061639.1688205-5-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: pmTO_E7LjuWPbYLyASqpvPr_OjmFNKjU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfXwbCJ2f2YIRYV
 i1cIHCvKvB3yV2kkvY1+8DI/W9dZPD8G5N9P+LWhC1MOTioGHAaA6G9V0OtqQyGu7oe/6/1N4DL
 3L4Wc2+TbugzgxpxlNACOlnP7uOctO1FtrWH16EDJTViyaAGoywJ3pUlX3uwTnM422C5iUyZP7c
 XEDxEd2u9K9l2ClxvXx79OF9JDzmhw1J3VdIhZuhrXxM+bI9NdYIZi0ymdt6INBLRPWNhiBi1Lo
 QGeY1HyE7F+co0vRibloOAHVU/f0PJTs3gM8oOQk2kPOBiuNsoWhvdUjhqkhSuN6gmXHQ4WVuI0
 X4TsK9/F56p1LXakhumBKPnxGMxgccp4uyGqZ68IWvqeXZdjlXk3Tsm7E0FDLq4ga/9WhqW7Sym
 vE5exCcVxEJ/F9w9kHjBinPP9meT+uD75pSlHzGE8nk/gzf8I0WQihSoYo9LpLMJ9oQj2Rum4Ut
 4+I00wQElSjLXfMCipw==
X-Proofpoint-GUID: pmTO_E7LjuWPbYLyASqpvPr_OjmFNKjU
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d7444d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8
 a=jHDvfUteGDQ5f6-WJRIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234880

From: Libo Chen <libo.chen.cn@windriver.com>

According to [1], An undocumented and unsafe feature in the PLY (Python
Lex-Yacc) library 3.11 allows Remote Code Execution (RCE) via the
`picklefile` parameter in the `yacc()` function. This parameter accepts
a `.pkl` file that is deserialized with `pickle.load()` without
validation. Because `pickle` allows execution of embedded code via
`__reduce__()`, an attacker can achieve code execution by passing a
malicious pickle file. The parameter is not mentioned in official
documentation or the GitHub repository, yet it is active in the PyPI
version. This introduces a stealthy backdoor and persistence risk.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-56005

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../python/python3-ply/CVE-2025-56005.patch   | 125 ++++++++++++++++++
 .../python/python3-ply_3.11.bb                |   4 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch

diff --git a/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch b/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
new file mode 100644
index 0000000000..3f1e62b766
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
@@ -0,0 +1,125 @@
+From bfaebcc33a5af77f2701581638aa31a1bf918302 Mon Sep 17 00:00:00 2001
+From: Libo Chen <libo.chen.cn@windriver.com>
+Date: Tue, 27 Jan 2026 13:58:57 +0800
+Subject: [PATCH] python3-ply: fix CVE-2025-56005
+
+Deprecate and disable the unsafe picklefile parameter and related
+pickle serialization/deserialization functions to prevent RCE attacks.
+
+The picklefile parameter in yacc() now issues a DeprecationWarning
+and is ignored. The read_pickle() and pickle_table() methods are
+stubbed out to issue warnings and raise NotImplementedError, following
+Python's standard practice for security-deprecated APIs.
+
+CVE: CVE-2025-56005
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ ply/yacc.py | 72 +++++++++++++++++++++--------------------------------
+ 1 file changed, 28 insertions(+), 44 deletions(-)
+
+diff --git a/ply/yacc.py b/ply/yacc.py
+index 88188a1..5103566 100644
+--- a/ply/yacc.py
++++ b/ply/yacc.py
+@@ -1998,31 +1998,15 @@ class LRTable(object):
+         return parsetab._lr_signature
+ 
+     def read_pickle(self, filename):
+-        try:
+-            import cPickle as pickle
+-        except ImportError:
+-            import pickle
+-
+-        if not os.path.exists(filename):
+-          raise ImportError
+-
+-        in_f = open(filename, 'rb')
+-
+-        tabversion = pickle.load(in_f)
+-        if tabversion != __tabversion__:
+-            raise VersionError('yacc table file version is out of date')
+-        self.lr_method = pickle.load(in_f)
+-        signature      = pickle.load(in_f)
+-        self.lr_action = pickle.load(in_f)
+-        self.lr_goto   = pickle.load(in_f)
+-        productions    = pickle.load(in_f)
+-
+-        self.lr_productions = []
+-        for p in productions:
+-            self.lr_productions.append(MiniProduction(*p))
+-
+-        in_f.close()
+-        return signature
++        import warnings
++        warnings.warn(
++            "read_pickle() is deprecated and disabled due to security vulnerability CVE-2025-56005. "
++            "Pickle deserialization can lead to arbitrary code execution. "
++            "This function is no longer supported.",
++            DeprecationWarning,
++            stacklevel=2
++        )
++        raise NotImplementedError("read_pickle() is disabled for security reasons (CVE-2025-56005)")
+ 
+     # Bind all production function names to callable objects in pdict
+     def bind_callables(self, pdict):
+@@ -2845,27 +2829,19 @@ del _lr_goto_items
+     # pickle_table()
+     #
+     # This function pickles the LR parsing tables to a supplied file object
++    # DEPRECATED: Disabled due to CVE-2025-56005
+     # -----------------------------------------------------------------------------
+ 
+     def pickle_table(self, filename, signature=''):
+-        try:
+-            import cPickle as pickle
+-        except ImportError:
+-            import pickle
+-        with open(filename, 'wb') as outf:
+-            pickle.dump(__tabversion__, outf, pickle_protocol)
+-            pickle.dump(self.lr_method, outf, pickle_protocol)
+-            pickle.dump(signature, outf, pickle_protocol)
+-            pickle.dump(self.lr_action, outf, pickle_protocol)
+-            pickle.dump(self.lr_goto, outf, pickle_protocol)
+-
+-            outp = []
+-            for p in self.lr_productions:
+-                if p.func:
+-                    outp.append((p.str, p.name, p.len, p.func, os.path.basename(p.file), p.line))
+-                else:
+-                    outp.append((str(p), p.name, p.len, None, None, None))
+-            pickle.dump(outp, outf, pickle_protocol)
++        import warnings
++        warnings.warn(
++            "pickle_table() is deprecated and disabled due to security vulnerability CVE-2025-56005. "
++            "Pickle serialization can lead to arbitrary code execution when deserialized. "
++            "This function is no longer supported.",
++            DeprecationWarning,
++            stacklevel=2
++        )
++        raise NotImplementedError("pickle_table() is disabled for security reasons (CVE-2025-56005)")
+ 
+ # -----------------------------------------------------------------------------
+ #                            === INTROSPECTION ===
+@@ -3225,7 +3201,15 @@ def yacc(method='LALR', debug=yaccdebug, module=None, tabmodule=tab_module, star
+ 
+     # If pickling is enabled, table files are not created
+     if picklefile:
+-        write_tables = 0
++        import warnings
++        warnings.warn(
++            "The 'picklefile' parameter is deprecated and disabled due to security vulnerability CVE-2025-56005. "
++            "Pickle deserialization can lead to arbitrary code execution. "
++            "The parameter will be ignored and standard table files will be used instead.",
++            DeprecationWarning,
++            stacklevel=2
++        )
++        picklefile = None
+ 
+     if errorlog is None:
+         errorlog = PlyLogger(sys.stderr)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index a05bd6702d..41bcac2be8 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -8,6 +8,10 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719
 SRC_URI[md5sum] = "6465f602e656455affcd7c5734c638f8"
 SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
 
+SRC_URI += " \
+    file://CVE-2025-56005.patch \
+"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN}:class-target += "\
-- 
2.34.1


