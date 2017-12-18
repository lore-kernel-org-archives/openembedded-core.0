Return-Path: <adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6F771C71
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 17:42:36 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vBIHeLMQ031694; Mon, 18 Dec 2017 11:42:36 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2ew1vuw5d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 18 Dec 2017 11:42:36 -0600
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	vBIHgZGk013388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2017 11:42:35 -0600
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 18 Dec 2017 11:42:35 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 18 Dec 2017 11:42:35 -0600
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 18 Dec 2017 11:42:34 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Dec 2017 19:42:58 +0200
Message-ID: <20171218174258.23403-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-12-18_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=573 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1712180234
Subject: [PATCH] site/*-linux: don't cache ac_cv_sizeof_bool
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
X-List-Received-Date: Mon, 18 Dec 2017 17:42:36 -0000
Content-Type: text/plain

The value was hardcoded from the time it couldn't be computed, which
is no longer the case. After C99 'bool' is only defined if stdbool.h
is included, it's implementation defined and not required to be 1, so
caching it doesn't make sense and certain recipes whoose code test
ac_cv_sizeof_bool fail to build.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/site/arm-linux       | 1 -
 meta/site/nios2-linux     | 1 -
 meta/site/powerpc32-linux | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index 7bf073eb77..fb3c81d0e9 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -3,7 +3,6 @@ ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
 ac_cv_sizeof_wchar_t=${ac_cv_sizeof_wchar_t=1}
 ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
-ac_cv_sizeof_bool=${ac_cv_sizeof_bool=1}
 ac_cv_sizeof_char_p=${ac_cv_sizeof_int_p=4}
 ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
 ac_cv_sizeof_int_p=${ac_cv_sizeof_int_p=4}
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 24bc5b033a..67a3fc8a75 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -232,7 +232,6 @@ ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
 ac_cv_sizeof_wchar_t=${ac_cv_sizeof_wchar_t=1}
 ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
-ac_cv_sizeof_bool=${ac_cv_sizeof_bool=1}
 ac_cv_sizeof_char_p=${ac_cv_sizeof_int_p=4}
 ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
 ac_cv_sizeof_int_p=${ac_cv_sizeof_int_p=4}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 06d961f5ce..f37e915cb3 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -1,6 +1,5 @@
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
-ac_cv_sizeof_bool=${ac_cv_sizeof_bool=1}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
 ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
 ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
-- 
2.15.1


