Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21EBC3DA4A
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 04:58:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.936.1746593912262332321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 21:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72228a98f6=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5474eWKa019660
	for <openembedded-core@lists.openembedded.org>; Wed, 7 May 2025 04:58:31 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46d8c143w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 04:58:31 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 6 May 2025 21:58:28 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][styhead][PATCH 1/3] ruby :fix CVE-2025-27219
Date: Wed, 7 May 2025 04:58:03 +0000
Message-ID: <20250507045805.1210982-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=NIjV+16g c=1 sm=1 tr=0 ts=681ae877 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8
 a=9-1OzCd99y-OyfAebhMA:9 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pxzWSwECzDv-e1yqALLotDakr3GTuz1L
X-Proofpoint-ORIG-GUID: pxzWSwECzDv-e1yqALLotDakr3GTuz1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA0MyBTYWx0ZWRfX9tw3BG3pOy67 kbtLvs17zVUDWyG3oE80aXNt205RgofuJjebBdZDLwPqAjMLVRqwcsZtWMzyR5VHSVCeNUT5kNz P/SxNl2plUA/8MF8OKhfv8r0J8af9/oR/qDwOklS3aocnvZvNl/UTMRftV99beqShrC5XRh/ssH
 hU6KFrf71NDrYC2RS0eAz/bhx4aB143mo1b1Zhz/f+LJMKr7qpVV/9vYdzIOQzWsQvEJ+GvotvQ Ag0l1MNv+zTKYu3VH9+GgppRUqE2b3F6bmxYUTGM8ZdzYFk5ytSuDm5C2OO02FTbbP/FxSpe4V0 FM9Y6iWQUskn7VdKPvr7V4mV4seppL9IHKqTdC/07IHxz2lQvYpMZlyBB066fZ+pA+GpL/dGHBg
 QQ/cc9GNJ1LDjCQkZuZYmecICxvZttgsuVYFJXETe3KZBwp7UGVaoIJDAEfeeLhuaI/u6T+A
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505070043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 04:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216087

From: Divya Chellam <divya.chellam@windriver.com>

In the CGI gem before 0.4.2 for Ruby, the CGI::Cookie.parse method in
the CGI library contains a potential Denial of Service (DoS) vulnerability.
The method does not impose any limit on the length of the raw cookie value
it processes. This oversight can lead to excessive resource consumption
when parsing extremely large cookies.In the CGI gem before 0.4.2 for Ruby,
the CGI::Cookie.parse method in the CGI library contains a potential Denial
of Service (DoS) vulnerability. The method does not impose any limit on the
length of the raw cookie value it processes. This oversight can lead to
excessive resource consumption when parsing extremely large cookies.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-27219

Upstream-patch:
https://github.com/ruby/cgi/commit/9907b76dad0777ee300de236dad4b559e07596ab

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../ruby/ruby/CVE-2025-27219.patch            | 36 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.3.4.bb      |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
new file mode 100644
index 0000000000..ed73e3ad41
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
@@ -0,0 +1,36 @@
+From 9907b76dad0777ee300de236dad4b559e07596ab Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 21 Feb 2025 16:01:17 +0900
+Subject: [PATCH] Use String#concat instead of String#+ for reducing cpu usage
+
+Co-authored-by: "Yusuke Endoh" <mame@ruby-lang.org>
+
+CVE: CVE-2025-27219
+
+Upstream-Status: Backport [https://github.com/ruby/cgi/commit/9907b76dad0777ee300de236dad4b559e07596ab]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ lib/cgi/cookie.rb | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/cgi/cookie.rb b/lib/cgi/cookie.rb
+index 9498e2f..1c4ef6a 100644
+--- a/lib/cgi/cookie.rb
++++ b/lib/cgi/cookie.rb
+@@ -190,9 +190,10 @@ class CGI
+         values ||= ""
+         values = values.split('&').collect{|v| CGI.unescape(v,@@accept_charset) }
+         if cookies.has_key?(name)
+-          values = cookies[name].value + values
++          cookies[name].concat(values)
++        else
++          cookies[name] = Cookie.new(name, *values)
+         end
+-        cookies[name] = Cookie.new(name, *values)
+       end
+ 
+       cookies
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.4.bb b/meta/recipes-devtools/ruby/ruby_3.3.4.bb
index d39b7ae520..a1a0aa5d31 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.4.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
+           file://CVE-2025-27219.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.40.0


