Return-Path: <reinette.chatre@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 97D4D605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 23:05:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 17 Apr 2015 16:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,597,1422950400"; d="scan'208";a="715483787"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2015 16:05:20 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 17 Apr 2015 16:05:19 -0700
Received: from orsmsx111.amr.corp.intel.com ([169.254.11.59]) by
	ORSMSX156.amr.corp.intel.com ([10.22.240.22]) with mapi id
	14.03.0224.002; Fri, 17 Apr 2015 16:05:18 -0700
From: "Chatre, Reinette" <reinette.chatre@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: dpkg:do_patch failure with today's updates to dizzy branch
Thread-Index: AdB5Yvi8wjLxENehTcW5E+H0UJTHNg==
Date: Fri, 17 Apr 2015 23:05:18 +0000
Message-ID: <0D818C7A2259ED42912C1E04120FDE26710A76BB@ORSMSX111.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: dpkg:do_patch failure with today's updates to dizzy branch
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
X-List-Received-Date: Fri, 17 Apr 2015 23:05:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Today there was an update to the dizzy branch that includes the patch below=
:

commit f77133783e5145858ac94b9bae1576852a7e838d
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sat Mar 28 08:50:27 2015 +0000

    dpkg-native: Avoid 'file changed' errors from tar
   =20
    Hardlink count duing do_package_write_deb can change causing dpkg-deb
    failures. We don't care about this error case so avoid it by checking
    the tar exit code.
   =20
    [YOCTO #7529]
   =20
    (From OE-Core rev: 8ee36a5f2f9367550d28bf271afc53bca6ff3d5f)
   =20
    (From OE-Core rev: bcb124931af57dc2f9d8fe9cbbabd5f8ee58e414)
   =20
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


Unfortunately the patch introduced by this commit does not apply cleanly to=
 the version of dpkg that can be found in dizzy release. It seems that the =
patch was generated against dpkg version 1.17.21 while dizzy uses version 1=
.17.4. The build fails with:

NOTE: Applying patch 'tar-error-code.patch' (../meta/recipes-devtools/dpkg/=
dpkg/tar-error-code.patch)
ERROR: Command Error: exit status: 1  Output:
Applying patch tar-error-code.patch
patching file dpkg-deb/build.c
Hunk #1 succeeded at 443 (offset 45 lines).
Hunk #2 FAILED at 493.
Hunk #3 FAILED at 581.
2 out of 3 hunks FAILED -- rejects in file dpkg-deb/build.c
Patch tar-error-code.patch does not apply (enforce with -f)

Reinette

