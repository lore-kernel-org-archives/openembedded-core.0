Return-Path: <prvs=85754256d=Mikko.Rapeli@bmw.de>
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id C343A77376
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 08:15:09 +0000 (UTC)
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 26 Feb 2016 09:14:57 +0100
Received: from unknown (HELO esabb5.muc) ([160.50.100.47]) by esagw6.muc with
	ESMTP/TLS; 26 Feb 2016 09:14:57 +0100
Received: from smuch51a.muc (HELO SMUCH51A.europe.bmw.corp) ([160.46.137.115])
	by esabb5.muc with ESMTP/TLS; 26 Feb 2016 09:14:56 +0100
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH51A.europe.bmw.corp ([160.46.137.115]) with mapi id 14.03.0248.002;
	Fri, 26 Feb 2016 09:14:55 +0100
From: <Mikko.Rapeli@bmw.de>
To: <mariano.lopez@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/3] Add initial capability to check CVEs for
	recipes
Thread-Index: AQHRb8YPTPKRB7zS1kqsvPG9SjQg2J88n/SAgAAQYICAAAu0AIABLzSA
Date: Fri, 26 Feb 2016 08:14:55 +0000
Message-ID: <20160226081455.GH6210@loska>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<20160225121421.GB6210@loska> <20160225122912.GC6210@loska>
	<20160225132748.GD6210@loska> <20160225140942.GE6210@loska>
In-Reply-To: <20160225140942.GE6210@loska>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.99]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Add initial capability to check CVEs for recipes
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
X-List-Received-Date: Fri, 26 Feb 2016 08:15:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <00905FD84BA9F649B6D0D3081D15CAAC@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On my developer machine the cve-check ran ok for dizzy but on build server
with sstate-cache and rmwork enabled it failed with what looks like a race
condition when scanning the patch files:

17:45:36 ERROR: Error executing a python function in /home/builder/src/base=
/poky/meta/recipes-extended/mailx/mailx_12.5.bb:
17:45:36=20
17:45:36 The stack trace of python calls that resulted in this exception/fa=
ilure was:
17:45:36 File: 'do_cve_check', lineno: 17, function: <module>
17:45:36      0013:    else:
17:45:36      0014:        bb.note("Failed to update CVE database, skipping=
 CVE check")
17:45:36      0015:
17:45:36      0016:
17:45:36  *** 0017:do_cve_check(d)
17:45:36      0018:
17:45:37 File: 'do_cve_check', lineno: 8, function: do_cve_check
17:45:37      0004:    Check recipe for patched and unpatched CVEs
17:45:37      0005:    """
17:45:37      0006:
17:45:37      0007:    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE", Tru=
e)):
17:45:37  *** 0008:        patched_cves =3D get_patches_cves(d)
17:45:37      0009:        patched, unpatched =3D check_cves(d, patched_cve=
s)
17:45:37      0010:        if patched or unpatched:
17:45:37      0011:            cve_data =3D get_cve_info(d, patched + unpat=
ched)
17:45:37      0012:            cve_write_data(d, patched, unpatched, cve_da=
ta)
17:45:37 File: 'cve-check.bbclass', lineno: 13, function: get_patches_cves
17:45:37      0009:    cve_match =3D re.compile("CVE:( CVE\-\d+\-\d+)+")
17:45:37      0010:    patched_cves =3D set()
17:45:37      0011:    for url in src_patches(d):
17:45:37      0012:        patch_file =3D bb.fetch.decodeurl(url)[2]
17:45:37  *** 0013:        with open(patch_file, "r") as f:
17:45:37      0014:            patch_text =3D f.read()
17:45:37      0015:
17:45:37      0016:        # Search for the "CVE: " line
17:45:37      0017:        match =3D cve_match.search(patch_text)
17:45:37 Exception: IOError: [Errno 2] No such file or directory: '/home/bu=
ilder/src/base/build/tmp/work/corei7-64-linux/mailx/12.5-r2/heirloom-mailx_=
12.5-1.diff'
17:45:37=20
17:45:37 ERROR: Function failed: do_cve_check

So could this be caused by cve-check changes or is this just a side effect
of some other recipe problems?

I could not see that kind of fixes in master.

-Mikko=

