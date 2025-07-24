Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC814C87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 20:12:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3526.1753387931951250335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 13:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9300b17871=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56OJP28a1652417;
	Thu, 24 Jul 2025 20:12:10 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 483txk81mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 24 Jul 2025 20:12:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 24 Jul 2025 13:12:09 -0700
Received: from ala-lpggp3.wrs.com (10.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 24 Jul 2025 13:12:09 -0700
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Divya Chellam <divya.chellam@windriver.com>,
        Steve Sakoman
	<steve@sakoman.com>
Subject: [kirkstone][PATCH v2 0/1] ruby: correct fix for CVE-2024-43398
Date: Thu, 24 Jul 2025 13:12:07 -0700
Message-ID: <20250724201208.2332757-1-rob.woolley@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Y9j4sgeN c=1 sm=1 tr=0 ts=6882939a cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=2iul454hvqmpFTSmTf4A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: XhHZiLYWirALTf6awJP_LOAalW1OpWbX
X-Proofpoint-ORIG-GUID: XhHZiLYWirALTf6awJP_LOAalW1OpWbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE1NiBTYWx0ZWRfXzOg98dNMBtSR
 0RieONWrfrIobZCpcHMLo5N0uEL3xuxD6A6KEBGP10QNisGNkDZ/8ms2R6vElOuV4/yChGkVYxE
 tf6LI4RdyNSUU+74X0nbQH4HJMsVFEUXgqTJ/kgG9GuqF0k+3+VcQCJBGHdMxDxCZl8/brBm+sG
 bVXhvLqKzqOTssh2UkHl1hlJrrdw4YHylS1p4QwFa4ewVBNAqb4RXvnN47ecc0FX2+epYMWfdwn
 mBiVxMnuozszpftgjTX3Z60Tg0TgSb5HL2zcC+pf/uAFMpI052ldyOp5Llsq0bCVaBZaIf9Af1z
 3VeEjSIFzAwfzEAu402oLk9sAvoH1mQ2RFAhTYsQ8+eCQ2g7iafO1X8h/I2KeVtazb2shjVA/xl
 CsBXO5Z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507240150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 20:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220870

After upgrading to the latest kirkstone release, I saw a build failure in t=
he=0D
sdformat recipe.  This recipe uses ruby as a native tool to parse XML files=
=0D
with the REXML library.=0D
=0D
----=0D
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-=
native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/baseparse=
r.rb:442:in `rescue in pull_event': #<NameError: undefined local variable o=
r method `prefix' for #<REXML::Parsers::BaseParser:0x00007f595bb7ef10 @sour=
ce=3D#<REXML::IOSource:0x00007f595bb7ebf0 @source=3D#<File:TOPDIR/tmp-glibc=
/work/cortexa76-oe-linux/sdformat/12.8.0-r0/git/sdf/1.5/world.sdf>, @er_sou=
rce=3D#<File:TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/gi=
t/sdf/1.5/world.sdf>, @to_utf=3Dfalse, @pending_buffer=3Dnil, @orig=3D"<el"=
, @scanner=3D#<StringScanner fin>, @encoding=3D"UTF-8", @line_break=3D">", =
@line=3D0, @force_utf8=3Dfalse>, @closed=3Dnil, @document_status=3D:in_elem=
ent, @tags=3D[], @stack=3D[], @entities=3D[], @nsstack=3D[#<Set: {}>], @lis=
teners=3D[], @entity_expansion_count=3D0, @attributes_scanner=3D#<StringSca=
nner fin>> (REXML::ParseException)=0D
=0D
unless prefix =3D=3D "xmlns"=0D
       ^^^^^^=0D
=0D
Did you mean?  prefixes>=0D
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-=
native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/baseparse=
r.rb:645:in `parse_attributes'=0D
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-=
native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/baseparse=
r.rb:416:in `pull_event'=0D
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-=
native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/baseparse=
r.rb:206:in `pull'=0D
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-=
native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/parsers/treeparse=
r.rb:23:in `parse'=0D
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-=
native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/document.rb:448:i=
n `build'=0D
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/recipe-sysroot-=
native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/document.rb:101:i=
n `initialize'=0D
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/git/tools/xmlsc=
hema.rb:288:in `new'=0D
TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/git/tools/xmlsc=
hema.rb:288:in `<main>'=0D
Exception parsing=0D
Line: 1=0D
Position: 35=0D
Last 80 unconsumed characters:=0D
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/re=
cipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/pars=
ers/baseparser.rb:366:in `pull_event'=0D
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/re=
cipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/pars=
ers/baseparser.rb:206:in `pull'=0D
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/re=
cipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/pars=
ers/treeparser.rb:23:in `parse'=0D
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/re=
cipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/docu=
ment.rb:448:in `build'=0D
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/re=
cipe-sysroot-native/usr/lib/ruby/gems/3.1.0/gems/rexml-3.2.5/lib/rexml/docu=
ment.rb:101:in `initialize'=0D
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/gi=
t/tools/xmlschema.rb:288:in `new'=0D
        from TOPDIR/tmp-glibc/work/cortexa76-oe-linux/sdformat/12.8.0-r0/gi=
t/tools/xmlschema.rb:288:in `<main>'=0D
----=0D
=0D
I tracked the exception back to the previous fix for CVE-2024-43398. There=
=0D
were missing changes needed by the fixes that were missed in the backport.=
=0D
This was the cause of the exception thrown by ruby when interpreting the=0D
parser code.=0D
=0D
Reference: https://git.openembedded.org/openembedded-core/commit/meta/recip=
es-devtools/ruby?h=3Dkirkstone&id=3Df23d1bfca0ea57150c397bc2e495191fb61423d=
0=0D
=0D
I tested this 3 ways:=0D
  (1) using ruby to successfully build sdformat,=0D
  (2) by running the ptest-runner for ruby on-target (which did not seem to=
=0D
      cover REXML),=0D
  (3) by manually running a script that used REXML to parse an XML file wit=
h=0D
      REXML::Document.new and print the object to standard output.=0D
=0D
If there are any additional tests you would like me to run, please let me k=
now.=0D
=0D
Regards,=0D
Rob=0D
=0D
Rob Woolley (1):=0D
  ruby: correct fix for CVE-2024-43398=0D
=0D
 .../ruby/ruby/CVE-2024-43398-0001.patch       | 210 ++++++++++++++++++=0D
 .../ruby/ruby/CVE-2024-43398-0002.patch       | 128 +++++++++++=0D
 ...-43398.patch =3D> CVE-2024-43398-0003.patch} |  23 +-=0D
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   4 +-=0D
 4 files changed, 351 insertions(+), 14 deletions(-)=0D
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0001.pat=
ch=0D
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0002.pat=
ch=0D
 rename meta/recipes-devtools/ruby/ruby/{CVE-2024-43398.patch =3D> CVE-2024=
-43398-0003.patch} (87%)=0D
=0D
-- =0D
2.49.0=0D

