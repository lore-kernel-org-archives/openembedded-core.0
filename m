Return-Path: <tomaz.canabrava@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5B159605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 19:11:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2015 11:07:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,661,1418112000"; d="scan'208";a="684508235"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2015 11:11:50 -0800
Received: from crsmsx152.amr.corp.intel.com (172.18.7.35) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Fri, 27 Feb 2015 11:11:50 -0800
Received: from crsmsx101.amr.corp.intel.com ([169.254.1.220]) by
	CRSMSX152.amr.corp.intel.com ([169.254.5.100]) with mapi id
	14.03.0224.002; Fri, 27 Feb 2015 13:11:49 -0600
From: "Canabrava, Tomaz" <tomaz.canabrava@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] Fake python2 env if python3 is the one found in /env
Thread-Index: AQHQUsE82RRgrliyEUW5Of2t+xJV6A==
Date: Fri, 27 Feb 2015 19:11:48 +0000
Message-ID: <040082D7AEE4DB4C97F6A371B20485EC083C9346@CRSMSX101.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.41]
MIME-Version: 1.0
Subject: [PATCH] Fake python2 env if python3 is the one found in /env
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
X-List-Received-Date: Fri, 27 Feb 2015 19:11:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

commit efb963f900951e0bfe2256331626f1715a582e11=0A=
Author: Tomaz Canabrava <tomaz.canabrava@intel.com>=0A=
Date:   Tue Feb 24 11:30:46 2015 -0300=0A=
=0A=
    Add a call to python-virtualenv2 if the py3 is the default one=0A=
    =0A=
    This patch adds a call to python-virtualenv to run python2 instead=0A=
    of python3 ( wich used to give an error ) when python3 is the default=
=0A=
    python executable, but python 2 is also installed on the system.=0A=
    =0A=
    It works by faking the pythonpath for the current session only.=0A=
    =0A=
    Signed-off-by: Tomaz Canabrava <tomaz.canabrava@intel.com>=0A=
=0A=
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal=0A=
index bba6f8f..5d2c58f 100755=0A=
--- a/scripts/oe-buildenv-internal=0A=
+++ b/scripts/oe-buildenv-internal=0A=
@@ -35,9 +35,10 @@ fi=0A=
 # can offer a meaningful error message.=0A=
 py_v3_check=3D`/usr/bin/env python --version 2>&1 | grep "Python 3"`=0A=
 if [ "$py_v3_check" !=3D "" ]; then=0A=
-       echo >&2 "Bitbake is not compatible with python v3"=0A=
-       echo >&2 "Please set up python v2 as your default python interprete=
r"=0A=
-       return 1=0A=
+       command -v virtualenv2 >/dev/null 2>&1 || { echo >&2 "The system py=
thon is v3, we need python-virtualenv2 to use the correct one,  Aborting.";=
 exit 1; }=0A=
+       py2_virtualenv_check=3D`virtualenv2 --version`=0A=
+       virtualenv2 venv=0A=
+       source venv/bin/activate=0A=
 fi=0A=
 =0A=

