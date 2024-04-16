Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8DDC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 10:39:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17088.1713263967137754981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 03:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ls2gR7nD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=483636700f=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43G5FGcR030355
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 10:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=7BJa+
	SOprRt8TpAnFTfhjlf/30eA02h7xSkuhHjKPkE=; b=ls2gR7nDrJIFHzRQurxcX
	CflDOvCiBg21MR1QyVh/4n66KiY7Plch1yamy5ooepqyiAm/yhlz97zxsnyrWdDK
	7/ikYsP1BX5FPYVqOzQAIcSUy+MUBGoaC59+XsyAMqzQx/cVu/Xkp1RYCmkEnkSQ
	77+mbUy1MOSsXBPdlukq+xB5yEAWmH3WYhv1WlurGjQ+jVfizlie9ZbujxBWD4ee
	VHlYcAhww3VEsqg/k0gWxOCD/brBU6yogdX5fzhfmtPyL6Hlz5alYuahUE/EicgT
	mN2yL31sCFm7FRYdHuw+dN0AurjynQXmQvAlky/oJWJpdDOh1XuF90KRHwsuhVBO
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xff8yaqp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 10:39:26 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 16 Apr 2024 03:39:23 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] ruby: fix CVE-2024-27281
Date: Tue, 16 Apr 2024 10:39:05 +0000
Message-ID: <20240416103905.2336142-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 6G_PKV1V2jFZ57GEy6ngX_eQLGseDOro
X-Proofpoint-ORIG-GUID: 6G_PKV1V2jFZ57GEy6ngX_eQLGseDOro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_08,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=987 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404160064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 10:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198434

From: Yogita Urade <yogita.urade@windriver.com>

ruby: RCE vulnerability with .rdoc_options in RDoc

References:
https://github.com/ruby/ruby/pull/10316
https://security-tracker.debian.org/tracker/CVE-2024-27281

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../ruby/ruby/CVE-2024-27281.patch            | 97 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
new file mode 100644
index 0000000000..6f4b35a786
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
@@ -0,0 +1,97 @@
+From da7a0c7553ef7250ca665a3fecdc01dbaacbb43d Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Mon, 15 Apr 2024 11:40:00 +0000
+Subject: [PATCH] Filter marshaled objets
+
+CVE: CVE-2024-27281
+Upstream-Status: Backport [https://github.com/ruby/rdoc/commit/da7a0c7553ef7250ca665a3fecdc01dbaacbb43d]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/rdoc/store.rb | 45 ++++++++++++++++++++++++++-------------------
+ 1 file changed, 26 insertions(+), 19 deletions(-)
+
+diff --git a/lib/rdoc/store.rb b/lib/rdoc/store.rb
+index 5ba671c..c793e49 100644
+--- a/lib/rdoc/store.rb
++++ b/lib/rdoc/store.rb
+@@ -556,9 +556,7 @@ class RDoc::Store
+   def load_cache
+     #orig_enc = @encoding
+
+-    File.open cache_path, 'rb' do |io|
+-      @cache = Marshal.load io.read
+-    end
++    @cache = marshal_load(cache_path)
+
+     load_enc = @cache[:encoding]
+
+@@ -615,9 +613,7 @@ class RDoc::Store
+   def load_class_data klass_name
+     file = class_file klass_name
+
+-    File.open file, 'rb' do |io|
+-      Marshal.load io.read
+-    end
++    marshal_load(file)
+   rescue Errno::ENOENT => e
+     error = MissingFileError.new(self, file, klass_name)
+     error.set_backtrace e.backtrace
+@@ -630,14 +626,10 @@ class RDoc::Store
+   def load_method klass_name, method_name
+     file = method_file klass_name, method_name
+
+-    File.open file, 'rb' do |io|
+-      obj = Marshal.load io.read
+-      obj.store = self
+-      obj.parent =
+-        find_class_or_module(klass_name) || load_class(klass_name) unless
+-          obj.parent
+-      obj
+-    end
++    obj = marshal_load(file)
++    obj.store = self
++    obj.parent ||= find_class_or_module(klass_name) || load_class(klass_name)
++    obj
+   rescue Errno::ENOENT => e
+     error = MissingFileError.new(self, file, klass_name + method_name)
+     error.set_backtrace e.backtrace
+@@ -650,11 +642,9 @@ class RDoc::Store
+   def load_page page_name
+     file = page_file page_name
+
+-    File.open file, 'rb' do |io|
+-      obj = Marshal.load io.read
+-      obj.store = self
+-      obj
+-    end
++    obj = marshal_load(file)
++    obj.store = self
++    obj
+   rescue Errno::ENOENT => e
+     error = MissingFileError.new(self, file, page_name)
+     error.set_backtrace e.backtrace
+@@ -976,4 +966,21 @@ class RDoc::Store
+     @unique_modules
+   end
+
++  private
++  def marshal_load(file)
++    File.open(file, 'rb') {|io| Marshal.load(io, MarshalFilter)}
++  end
++
++  MarshalFilter = proc do |obj|
++    case obj
++    when true, false, nil, Array, Class, Encoding, Hash, Integer, String, Symbol, RDoc::Text
++    else
++      unless obj.class.name.start_with?("RDoc::")
++        raise TypeError, "not permitted class: #{obj.class.name}"
++      end
++    end
++    obj
++  end
++  private_constant :MarshalFilter
++
+ end
+--
+2.35.5
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 1f43d8f167..4f7c9cb10b 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2023-28755.patch \
            file://CVE-2023-36617_1.patch \
            file://CVE-2023-36617_2.patch \
+           file://CVE-2024-27281.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.35.5


