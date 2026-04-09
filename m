Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C22E98FC0
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:16:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126097.1775715401826336390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ltdc5Ikq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395ubB3321392
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2026 23:16:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=S4EVM0ofi01md5Xluru6
	Aa3OMyFjkQmzTJBB37hlqxI=; b=Ltdc5Ikqg0S4SVzlrJMOFAWoIKrOHcwd7RL/
	6+QWAjBUNkdHHQDOdhGopA32+rNcTS901v1PuG5hrWZAHERIRz6mM95w2B73SVTs
	xjXOjU+vE7/rBXTmpYP6Fgmx/Gp1onfESAqfXzrriNUrYSot3EPg3Y/aRUM/iwb+
	YgWS+ALev9OEqIbzJSGqnnGvV43Sasdxerm+z2tczodb+p3ckpbvoXvY/yERcV4B
	BNnzlGNyKqhFYNaw7uuInczsrvBTBKm3xQqSRZTJB2RlyHml8qu3w+bYzHxvxH7g
	/QhBlAiRyvO9qiUzdWhymrmldEoOV89oNs3LdT0P2m9xHIYKgA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrykngu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 23:16:41 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:40 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:40 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 00/12] Fix multiple CVEs
Date: Thu, 9 Apr 2026 14:16:27 +0800
Message-ID: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: i9ZmtulDEGZFD9sPBTu3ZbYRi3pV5Yx3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfXwLmwBuvGOcsc
 zsPbFXkqsIFNEcDWR3rpU4clxnn2urrtrNhbuwIbiP+JW3b07S//Le6sETz+RkzHQbr+ZSGKJ0v
 tL6+TiMfjBhJBxzq39pLq6oz39xtpsPBAqmozo0AYf7Rqbw8ML+rtmHD2RjAyd+MSfrMYnUG7Oq
 E0VtLxTbNoJuZ+a7zNdd6CwaWy3s1Z8mvqq5Uk3gHXM9jW6nRYpmE86ePgo0sRHbRPw1JXlNbm1
 VvB8gQGQZBBeoSfk5smNvoAMRkENKZa7oF/65WpkwCzJ/1mPeZLd5/yhOa2Q4izDtQNesu9zr77
 2Zuh9dPH3lFcYv3DBfbtvmrqfQryesVBHal8aHsaGu1oNFCCcTOnVSAB6f0q7OwG7gxew0qY5hi
 vcI4VgPiD3n2/fcWMhGoKGmgPEf3e1W15Nm+1tr1qvTnb6i3RrZ+kAZjr7Nxt9wxxdRizo1ntX1
 UKAWfK4J5AD1plvessA==
X-Proofpoint-GUID: i9ZmtulDEGZFD9sPBTu3ZbYRi3pV5Yx3
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d74449 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=3gajGeMkTNr2YlGTeUsA:9 a=Izb4lU-XB475VSqZ:21
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
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
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234876

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

test steps:
bitbake world
built without introducing new building errors.

Note:
This libpcap 1.10.4 -> 1.10.6 upgrade introduces a new enum PCAP_SOCKET definition that conflicts with nmap in meta-openembedded. A corresponding fix has been submitted to the openembedded-devel mailing list to rename the conflicting enum in nmap.

Related patch: "[meta-oe] nmap: rename enum PCAP_SOCKET" submitted to openembedded-devel@lists.openembedded.org


Changqing Li (2):
  libsoup: fix CVE-2025-14523/CVE-2025-32049
  libsoup-2.4: fix CVE-2025-14523/CVE-2025-32049

Chen Qi (1):
  busybox: fix CVE-2026-26157 and CVE-2026-26158

Guocai He (2):
  python3-wheel: fix CVE-2026-24049
  gnupg: fix CVE-2026-24882

Jiaying Song (2):
  python3-pyasn1: fix CVE-2026-23490
  python3-pyasn1: fix CVE-2026-30922

Kai Kang (1):
  libpcap: 1.10.4 -> 1.10.6

Libo Chen (1):
  python3-ply: fix CVE-2025-56005

Liyin Zhang (1):
  zlib: upgrade 1.3.1 -> 1.3.2

Mingli Yu (1):
  libxml2: Fix CVE-2026-1757

Zhang Peng (1):
  gi-docgen: fix CVE-2025-11687

 .../libpcap/libpcap/CVE-2023-7256-pre1.patch  |  37 -
 .../libpcap/libpcap/CVE-2023-7256.patch       | 365 ---------
 .../libpcap/libpcap/CVE-2024-8006.patch       |  42 -
 .../libpcap/libpcap/CVE-2025-11961-01.patch   |  38 -
 .../libpcap/libpcap/CVE-2025-11961-02.patch   | 433 -----------
 .../libpcap/libpcap/CVE-2025-11964.patch      |  33 -
 .../{libpcap_1.10.4.bb => libpcap_1.10.6.bb}  |   8 +-
 ...-hardlink-components-GNU-tar-does-th.patch | 201 +++++
 ...nsafe-components-from-hardlinks-not-.patch |  39 +
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
 .../libxml/libxml2/CVE-2026-1757.patch        |  49 ++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
 ...configure-Pass-LDFLAGS-to-link-tests.patch |  78 --
 .../zlib/zlib/CVE-2026-27171.patch            |  63 --
 .../zlib/{zlib_1.3.1.bb => zlib_1.3.2.bb}     |   4 +-
 .../recipes-devtools/python/python-pyasn1.inc |   4 +-
 .../python/python3-ply/CVE-2025-56005.patch   | 125 +++
 .../python/python3-ply_3.11.bb                |   4 +
 .../python3-pyasn1/CVE-2026-23490.patch       | 136 ++++
 .../python3-pyasn1/CVE-2026-30922.patch       | 257 +++++++
 .../python/python3-wheel/CVE-2026-24049.patch |  73 ++
 .../python/python3-wheel_0.42.0.bb            |   2 +
 .../gi-docgen/files/CVE-2025-11687.patch      |  90 +++
 .../gi-docgen/gi-docgen_2023.3.bb             |   5 +-
 .../gnupg/gnupg/CVE-2026-24882-0001.patch     |  70 ++
 .../gnupg/gnupg/CVE-2026-24882-0002.patch     |  47 ++
 meta/recipes-support/gnupg/gnupg_2.4.8.bb     |   2 +
 .../libsoup/libsoup-2.4/CVE-2025-14523.patch  |  52 ++
 .../libsoup-2.4/CVE-2025-32049-1.patch        | 229 ++++++
 .../libsoup-2.4/CVE-2025-32049-2.patch        | 131 ++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   3 +
 .../libsoup-3.4.4/CVE-2025-14523.patch        | 715 ++++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32049-1.patch      | 229 ++++++
 .../libsoup-3.4.4/CVE-2025-32049-2.patch      |  34 +
 .../libsoup-3.4.4/CVE-2025-32049-3.patch      | 134 ++++
 .../libsoup-3.4.4/CVE-2025-32049-4.patch      | 292 +++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   5 +
 37 files changed, 2931 insertions(+), 1101 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.4.bb => libpcap_1.10.6.bb} (83%)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-1757.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
 rename meta/recipes-core/zlib/{zlib_1.3.1.bb => zlib_1.3.2.bb} (87%)
 create mode 100644 meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-23490.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
 create mode 100644 meta/recipes-devtools/python/python3-wheel/CVE-2026-24049.patch
 create mode 100644 meta/recipes-gnome/gi-docgen/files/CVE-2025-11687.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch

-- 
2.34.1


