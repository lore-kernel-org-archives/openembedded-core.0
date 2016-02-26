Return-Path: <prvs=85754256d=Mikko.Rapeli@bmw.de>
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id C3F847744D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:57:02 +0000 (UTC)
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 26 Feb 2016 15:57:02 +0100
Received: from unknown (HELO esabb1.muc) ([160.50.100.31]) by esagw5.muc with
	ESMTP/TLS; 26 Feb 2016 15:57:02 +0100
Received: from smuch54b.muc (HELO SMUCH54B.europe.bmw.corp) ([160.46.137.112])
	by esabb1.muc with ESMTP/TLS; 26 Feb 2016 15:57:03 +0100
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH54B.europe.bmw.corp ([160.46.137.112]) with mapi id 14.03.0248.002;
	Fri, 26 Feb 2016 15:57:02 +0100
From: <Mikko.Rapeli@bmw.de>
To: <mariano.lopez@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/3] Add initial capability to check CVEs for
	recipes
Thread-Index: AQHRb8YPTPKRB7zS1kqsvPG9SjQg2J88n/SAgAAQYICAAAu0AIABLzSAgABuDICAAAIhAIAAACyA
Date: Fri, 26 Feb 2016 14:57:01 +0000
Message-ID: <20160226145701.GK6210@loska>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<20160225121421.GB6210@loska> <20160225122912.GC6210@loska>
	<20160225132748.GD6210@loska> <20160225140942.GE6210@loska>
	<20160226081455.GH6210@loska> <56D065CF.9060303@linux.intel.com>
	<20160226145624.GJ6210@loska>
In-Reply-To: <20160226145624.GJ6210@loska>
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
X-List-Received-Date: Fri, 26 Feb 2016 14:57:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7CAB5E81576725428463AB7ACACACCD3@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2016 at 03:56:24PM +0100, Mikko Rapeli wrote:
> On Fri, Feb 26, 2016 at 08:48:47AM -0600, Mariano Lopez wrote:
> > On 02/26/2016 02:14 AM, Mikko.Rapeli@bmw.de wrote:
> > >Hi,
> > >
> > >On my developer machine the cve-check ran ok for dizzy but on build se=
rver
> > >with sstate-cache and rmwork enabled it failed with what looks like a =
race
> > >condition when scanning the patch files:
> > >
> > >17:45:36 ERROR: Error executing a python function in /home/builder/src=
/base/poky/meta/recipes-extended/mailx/mailx_12.5.bb:
> > >17:45:36
> > >17:45:36 The stack trace of python calls that resulted in this excepti=
on/failure was:
> > >17:45:36 File: 'do_cve_check', lineno: 17, function: <module>
> > >17:45:36      0013:    else:
> > >17:45:36      0014:        bb.note("Failed to update CVE database, ski=
pping CVE check")
> > >17:45:36      0015:
> > >17:45:36      0016:
> > >17:45:36  *** 0017:do_cve_check(d)
> > >17:45:36      0018:
> > >17:45:37 File: 'do_cve_check', lineno: 8, function: do_cve_check
> > >17:45:37      0004:    Check recipe for patched and unpatched CVEs
> > >17:45:37      0005:    """
> > >17:45:37      0006:
> > >17:45:37      0007:    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE"=
, True)):
> > >17:45:37  *** 0008:        patched_cves =3D get_patches_cves(d)
> > >17:45:37      0009:        patched, unpatched =3D check_cves(d, patche=
d_cves)
> > >17:45:37      0010:        if patched or unpatched:
> > >17:45:37      0011:            cve_data =3D get_cve_info(d, patched + =
unpatched)
> > >17:45:37      0012:            cve_write_data(d, patched, unpatched, c=
ve_data)
> > >17:45:37 File: 'cve-check.bbclass', lineno: 13, function: get_patches_=
cves
> > >17:45:37      0009:    cve_match =3D re.compile("CVE:( CVE\-\d+\-\d+)+=
")
> > >17:45:37      0010:    patched_cves =3D set()
> > >17:45:37      0011:    for url in src_patches(d):
> > >17:45:37      0012:        patch_file =3D bb.fetch.decodeurl(url)[2]
> > >17:45:37  *** 0013:        with open(patch_file, "r") as f:
> > >17:45:37      0014:            patch_text =3D f.read()
> > >17:45:37      0015:
> > >17:45:37      0016:        # Search for the "CVE: " line
> > >17:45:37      0017:        match =3D cve_match.search(patch_text)
> > >17:45:37 Exception: IOError: [Errno 2] No such file or directory: '/ho=
me/builder/src/base/build/tmp/work/corei7-64-linux/mailx/12.5-r2/heirloom-m=
ailx_12.5-1.diff'
> > >17:45:37
> > >17:45:37 ERROR: Function failed: do_cve_check
> > >
> > >So could this be caused by cve-check changes or is this just a side ef=
fect
> > >of some other recipe problems?
> > >
> > >I could not see that kind of fixes in master.
> > >
> > >-Mikko
> >=20
> > The changes in patch series were minimal and actually this part of the =
code
> > wasn't touched at all. That part of the code will look for all the file=
s in
> > the SRC_URI variable and will look for the "CVE:" tag in order to find
> > patches that solve CVEs.
>=20
> Yep, the code seems straight forward.
>=20
> > It seems the problem is with the bitbake fetcher, or the recipe;
> > unfortunately the fetcher is one of the components that most change bet=
ween
> > releases. Another thing to check is that if actually there is a
> > heirloom-mailx_12.5-1.diff file in the paths that the fetcher look for.=
 You
> > can check this in the cve_check or patch log in the work directory of t=
he
> > recipe.
>=20
> Unfortunately the file is there if I check with devshell but I have now
> four different CI runs with this failure. Only difference to my developer
> machine is sstate cache. Build machines maintain their own sstate cache.

Last two runs were with v2 patches.

-Mikko=

