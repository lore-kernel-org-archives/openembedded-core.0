Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C413C83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 23:14:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.46384.1752362066152518329
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 16:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=928837c1c7=rob.woolley@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56CN6qJA2082624;
	Sat, 12 Jul 2025 16:14:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47uq7f8d7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 12 Jul 2025 16:14:25 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Sat, 12 Jul 2025 16:14:24 -0700
Received: from ala-lpggp3.wrs.com (10.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Sat, 12 Jul 2025 16:14:24 -0700
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Divya Chellam <divya.chellam@windriver.com>,
        Steve Sakoman
	<steve@sakoman.com>
Subject: [kirkstone][PATCH 0/1] ruby: correct fix for CVE-2024-43398
Date: Sat, 12 Jul 2025 16:13:03 -0700
Message-ID: <20250712231424.1840000-1-rob.woolley@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDA5MyBTYWx0ZWRfX2kH1TJh539to
 cGChIBz28VPi5/4J5qjA+NcCWgY/GiWdJs5EuH9p06mhhgHg9jnX2tDZ3fcE5sLGt4+mcSfapCj
 JqkldfskFPqsol+NmZU4RdjXmbMteYS7208iMFdXId0h2KEujY0H300fnqU3H07AgZld9ztG3Z7
 FauQcHPZyPT3m4dU/9cjpQBa0qS7rAS7HusElq6Mm2YWF7vkLOKYogJn74S1AIgYGTARx47Vcjd
 Py4XnQoEtL2UWnc051RNFxB0IbohhVfPhjTF+xwwluCUwyu4y/SIOhd9biSep1bLgFAQr5aCZXa
 Gp6BY4vhMen3sCRATl0KLh0iSuW16eGty6DFrf0rxibPjcSjApC/X2ix25/82Wy5gnfxgWEYPfR
 tELbMA+2
X-Proofpoint-ORIG-GUID: 7Jv0voKxydodLc7tiE4wAgXoVayTTOXN
X-Proofpoint-GUID: 7Jv0voKxydodLc7tiE4wAgXoVayTTOXN
X-Authority-Analysis: v=2.4 cv=cdfSrmDM c=1 sm=1 tr=0 ts=6872ec51 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=2iul454hvqmpFTSmTf4A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-12_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507120093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 23:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220197

After upgrading to the latest kirkstone release, I saw a build failure in the
sdformat recipe.  This recipe uses ruby as a native tool to parse XML files
with the REXML library.

----
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb:442:in `rescue in pull_event': #<NameError: undefined local variable or method `prefix' for #<REXML::Parsers::BaseParser:0x00007f595bb7ef10 @source=#<REXML::IOSource:0x00007f595bb7ebf0 @source=#<File:TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/git/sdf/1.5/world.sdf>, @er_source=#<File:TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/git/sdf/1.5/world.sdf>, @to_utf=false, @pending_buffer=nil, @orig="<el", @scanner=#<StringScanner fin>, @encoding="UTF-8", @line_break=">", @line=0, @force_utf8=false>, @closed=nil, @document_status=:in_element, @tags=[], @stack=[], @entities=[], @nsstack=[#<Set: {}>], @listeners=[], @entity_expansion_count=0, @attributes_scanner=#<StringScanner fin>> (REXML::ParseException)

unless prefix == "xmlns"
       ^^^^^^

Did you mean?  prefixes>
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb:645:in `parse_attributes'
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb:416:in `pull_event'
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb:206:in `pull'
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/treeparser.rb:23:in `parse'
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/document.rb:448:in `build'
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/document.rb:101:in `initialize'
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/git/tools/xmlschema.rb:288:in `new'
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/git/tools/xmlschema.rb:288:in `<main>'
Exception parsing
Line: 1
Position: 35
Last 80 unconsumed characters:
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb:366:in `pull_event'
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb:206:in `pull'
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/treeparser.rb:23:in `parse'
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/document.rb:448:in `build'
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/document.rb:101:in `initialize'
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/git/tools/xmlschema.rb:288:in `new'
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/git/tools/xmlschema.rb:288:in `<main>'
----

I tracked the exception back to the previous fix for CVE-2024-43398. There
were missing changes needed by the fixes that were missed in the backport.
This was the cause of the exception thrown by ruby when interpreting the
parser code.

Reference: https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/ruby?h=kirkstone&id=f23d1bfca0ea57150c397bc2e495191fb61423d0

I tested this 3 ways:
  (1) using ruby to successfully build sdformat,
  (2) by running the ptest-runner for ruby on-target (which did not seem to
      cover REXML),
  (3) by manually running a script that used REXML to parse an XML file with
      REXML::Document.new and print the object to standard output.

If there are any additional tests you would like me to run, please let me know.

Regards,
Rob

Rob Woolley (1):
  ruby: correct fix for CVE-2024-43398

 .../ruby/ruby/CVE-2024-43398-0001.patch       | 210 ++++++++++++++++++
 .../ruby/ruby/CVE-2024-43398-0002.patch       | 128 +++++++++++
 ...-43398.patch => CVE-2024-43398-0003.patch} |  23 +-
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   4 +-
 4 files changed, 351 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0002.patch
 rename meta/recipes-devtools/ruby/ruby/{CVE-2024-43398.patch => CVE-2024-43398-0003.patch} (87%)

-- 
2.49.0


