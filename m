Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.tian@intel.com>) id 1Q95H2-0004ws-UV
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Apr 2011 02:46:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Apr 2011 17:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,335,1299484800"; d="scan'208";a="907825354"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2011 17:41:36 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 11 Apr 2011 08:40:49 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 11 Apr 2011 08:40:49 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Mon, 11 Apr 2011 08:40:48 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2011 08:40:47 +0800
Thread-Topic: [OE-core] [PATCH 1/2] sstate: ensure an ordered mapping
	between	SSTATETASKS and SSTATETASKNAMES
Thread-Index: Acv11CIy4niQxbn9QF2K7Px+hH4v2gCDObUg
Message-ID: <625BA99ED14B2D499DC4E29D8138F1505A78CC0660@shsmsx502.ccr.corp.intel.com>
References: <cover.1302256139.git.dexuan.cui@intel.com>
	<22750afce467a2b203c9e21c3db6f392f0599816.1302256139.git.dexuan.cui@intel.com>
In-Reply-To: <22750afce467a2b203c9e21c3db6f392f0599816.1302256139.git.dexuan.cui@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Wang, Shane" <shane.wang@intel.com>, "Li, Susie" <susie.li@intel.com>
Subject: Re: [PATCH 1/2] sstate: ensure an ordered mapping between	SSTATETASKS and SSTATETASKNAMES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Apr 2011 00:46:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

good work to track this tricky stuff down. :-)

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Dexuan Cui
> Sent: Friday, April 08, 2011 6:00 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] sstate: ensure an ordered mapping between
> SSTATETASKS and SSTATETASKNAMES
>=20
> From: Dexuan Cui <dexuan.cui@intel.com>
>=20
> Fix [YOCTO #964]
>=20
> A recent commit 25a6e5f9(sstate: use only unique set of SSTATETASK) break=
s
> the ordered mapping between SSTATETASKS and SSTATETASKNAMES. As a
> result,
> in sstate_cleanall, the line
> taskname =3D tasks[namemap.index(name)]
> gets an incorrect result, and "bitbake -c cleanall" doesn't really remove
> the files populalted by do_populate_sysroot.
>=20
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  meta/classes/sstate.bbclass |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index cc0b866..be650c4 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -39,8 +39,10 @@ python () {
>          scan_cmd =3D "grep -Irl ${STAGING_DIR} ${SSTATE_BUILDDIR}"
>          bb.data.setVar('SSTATE_SCAN_CMD', scan_cmd, d)
>=20
> +    unique_tasks =3D set((bb.data.getVar('SSTATETASKS', d, True) or "").=
split())
> +    d.setVar('SSTATETASKS', " ".join(unique_tasks))
>      namemap =3D []
> -    for task in set((bb.data.getVar('SSTATETASKS', d, True) or "").split=
()):
> +    for task in unique_tasks:
>          namemap.append(bb.data.getVarFlag(task, 'sstate-name', d))
>          funcs =3D bb.data.getVarFlag(task, 'prefuncs', d) or ""
>          funcs =3D "sstate_task_prefunc " + funcs
> @@ -200,7 +202,7 @@ def sstate_clean_cachefile(ss, d):
>      oe.path.remove(sstatepkgfile)
>=20
>  def sstate_clean_cachefiles(d):
> -    for task in set((bb.data.getVar('SSTATETASKS', d, True) or "").split=
()):
> +    for task in (bb.data.getVar('SSTATETASKS', d, True) or "").split():
>          ss =3D sstate_state_fromvars(d, task[3:])
>          sstate_clean_cachefile(ss, d)
>=20
> --
> 1.7.2
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


