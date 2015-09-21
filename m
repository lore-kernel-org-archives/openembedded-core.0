Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 547CC73243
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 08:37:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2015 01:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,566,1437462000"; d="scan'208";a="809620691"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2015 01:37:45 -0700
Received: from irsmsx155.ger.corp.intel.com (163.33.192.3) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 21 Sep 2015 09:37:42 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.84]) by
	irsmsx155.ger.corp.intel.com ([169.254.14.173]) with mapi id
	14.03.0248.002; Mon, 21 Sep 2015 09:37:42 +0100
From: "Istrate, Daniel AlexandruX" <daniel.alexandrux.istrate@intel.com>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V2] selftest/buildoptions: pexpect not a
	builtin	module
Thread-Index: AQHQ8jAkz3uCEuKyAESksLGu5//EbJ5GrBLQ
Date: Mon, 21 Sep 2015 08:37:42 +0000
Message-ID: <174AD7CFE5F468498ACCFE3FEE0EF1EB142C089D@IRSMSX102.ger.corp.intel.com>
References: <6871706.tbebiTIoD4@peggleto-mobl.ger.corp.intel.com>
	<1442565245-16632-1-git-send-email-benjamin.esquivel@linux.intel.com>
In-Reply-To: <1442565245-16632-1-git-send-email-benjamin.esquivel@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH V2] selftest/buildoptions: pexpect not a builtin	module
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
X-List-Received-Date: Mon, 21 Sep 2015 08:37:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin, Paul,

Just want to point out that 'pexpect' is an unused import in buildoptions.p=
y. Unused imports are also unittest and logging.
Instead of try-catch an import that is not used I think it's best to get ri=
d of them.

--Daniel=20

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Benjamin Esquivel
Sent: Friday, September 18, 2015 11:34
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@linux.intel.com
Subject: [OE-core] [PATCH V2] selftest/buildoptions: pexpect not a builtin =
module

put the import of pexpect around a try statement so it can tell you why it =
failed to import when in a system that has the module unreachable

the message that outputs is:

"No module named pexpect, import failed"
"Please install pexpect (python-pexpect)"

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftes=
t/buildoptions.py
index 483803b..1fa4802 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -3,7 +3,14 @@ import os
 import logging
 import re
 import glob as g
-import pexpect as p
+
+try:
+    import pexpect as p
+except  ImportError as e:
+    import sys
+    sys.stderr.write("{}, import failed\n".format(e))
+    sys.stderr.write("Please install pexpect (python-pexpect)\n")
+    raise e
=20
 from oeqa.selftest.base import oeSelfTest  from oeqa.selftest.buildhistory=
 import BuildhistoryBase
--
2.5.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

