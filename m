Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E10E360557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 07:30:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L7ULWP008360
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Aug 2015 00:30:21 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.3.206]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0235.001;
	Fri, 21 Aug 2015 00:30:20 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "OHLY, PATRICK" <patrick.ohly@intel.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [RFC PATCH 1/1] classes/whitelist: add class to
	allow whitelisting recipes from a layer
Thread-Index: AQHQ207T+DxMWLkefkC4R6ZQpemTy54WBcHA
Date: Fri, 21 Aug 2015 07:30:19 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAFC70B83C@ALA-MBB.corp.ad.wrs.com>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
	<d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
	<1440078442.17136.60.camel@intel.com>
In-Reply-To: <1440078442.17136.60.camel@intel.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.153]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Fri, 21 Aug 2015 07:30:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of Patrick Ohly
> Sent: Thursday, August 20, 2015 9:47 PM
> To: Paul Eggleton
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [RFC PATCH 1/1] classes/whitelist: add class to al=
low whitelisting recipes from a
> layer
>=20
> On Wed, 2015-08-19 at 14:34 +0100, Paul Eggleton wrote:
> > Allow restricting recipes brought from a layer to a specified list.
> > This is similar in operation to blacklist.bbclass, but instead
> > specifies a per-layer whitelist of recipes (matched by BPN) that are
> > able to be built from the layer - anything else is skipped. This is
> > potentially useful where you want to bring in a select set of recipes
> > from a larger layer e.g. meta-oe.
>=20
> Worked for all of my tests. I added all layers in meta-openembedded and t=
hen white-listed just gmock
> in meta-oe (aka openembedded-layer):

This worked for my tests as well, there are 160 recipes in my whitelist and=
 there are 3 different cases:

1) All recipes are needed: nothing need to be done here.
2) No recipe is needed:
PNWHITELIST_efl-layer =3D "Nothing"
PNWHITELIST_filesystems-layer =3D "Nothing"
PNWHITELIST_gpe-layer =3D "Nothing"
PNWHITELIST_meta-initramfs =3D "Nothing"
PNWHITELIST_multimedia-layer =3D "Nothing"
PNWHITELIST_ruby-layer =3D "Nothing"
PNWHITELIST_systemd-layer =3D "Nothing"
PNWHITELIST_toolchain-layer =3D "Nothing"

3) Some of the recipes are whitelisted, take gnome-layer for example:
PNWHITELIST_gnome-layer =3D "\
    gnome-disk-utility \
    gnome-keyring \
    gsettings-desktop-schemas \
    gvfs \
    gvfs-gdu-volume-monitor \
    libgnome-keyring \
    libgtop \
    libwnck \
    libwnck3 \
    libxklavier \
    metacity \
"

I also test to put some recipes both in whitelist and blacklist, and it tur=
ned out that
the blacklist's priority is higher than whitelist.

>=20
> INHERIT +=3D "whitelist"
>=20
> PNWHITELIST_efl-layer =3D "no-recipe-enabled"
> PNWHITELIST_filesystems-layer =3D "no-recipe-enabled"
> PNWHITELIST_gnome-layer =3D "no-recipe-enabled"
> PNWHITELIST_gpe-layer =3D "no-recipe-enabled"
> PNWHITELIST_meta-initramfs =3D "no-recipe-enabled"
> PNWHITELIST_meta-python =3D "no-recipe-enabled"
> PNWHITELIST_multimedia-layer =3D "no-recipe-enabled"
> PNWHITELIST_networking-layer =3D "no-recipe-enabled"
> PNWHITELIST_openembedded-layer =3D "gmock"
> PNWHITELIST_perl-layer =3D "no-recipe-enabled"
> PNWHITELIST_ruby-layer =3D "no-recipe-enabled"
> PNWHITELIST_systemd-layer =3D "no-recipe-enabled"
> PNWHITELIST_toolchain-layer =3D "no-recipe-enabled"
> PNWHITELIST_webserver =3D "no-recipe-enabled"
> PNWHITELIST_xfce-layer =3D "no-recipe-enabled"
>=20
> I got warnings for several of the layers, but strangely not for all of
> them:
>=20
> WARNING: No bb files matched BBFILE_PATTERN_efl-layer '^/work/meta-openem=
bedded/meta-efl/'
> WARNING: No bb files matched BBFILE_PATTERN_filesystems-layer '^/work/met=
a-
> openembedded/meta-filesystems/'
> WARNING: No bb files matched BBFILE_PATTERN_gpe-layer '^/work/meta-openem=
bedded/meta-
> gpe/'
> WARNING: No bb files matched BBFILE_PATTERN_meta-initramfs '^/work/meta-
> openembedded/meta-initramfs/'
> WARNING: No bb files matched BBFILE_PATTERN_multimedia-layer '^/work/meta=
-
> openembedded/meta-multimedia/'
> WARNING: No bb files matched BBFILE_PATTERN_networking-layer '^/work/meta=
-
> openembedded/meta-networking/'
> WARNING: No bb files matched BBFILE_PATTERN_perl-layer '^/work/meta-opene=
mbedded/meta-
> perl/'
> WARNING: No bb files matched BBFILE_PATTERN_meta-python '^/work/meta-
> openembedded/meta-python/'
> WARNING: No bb files matched BBFILE_PATTERN_ruby-layer '^/work/meta-opene=
mbedded/meta-
> ruby/'
> WARNING: No bb files matched BBFILE_PATTERN_webserver '^/work/meta-openem=
bedded/meta-
> webserver/'
> WARNING: No bb files matched BBFILE_PATTERN_xfce-layer '^/work/meta-opene=
mbedded/meta-
> xfce/'
>=20
> Note that gnome-layer is not warned about, although none of its recipes a=
re enabled (checked with
> "bitbake-layers show-recipes -f | grep -v '(skipped)' | grep meta-gnome")=
. Any idea why?
>=20
> One more comment: it would be slightly nicer if empty whitelist could be =
distinguished from no
> whitelist, with "empty" meaning "enable no recipes". In other words, repl=
ace "if whitelist" with "if
> whitelist is not None".
>=20
> I want to list all PNWHITELIST_xxx values for meta-openembedded, even whe=
n the layer is not (yet) in
> bblayers.sample.conf, in order to be prepared for adding it later. Doing =
that with an empty string is
> more readable than with a fake recipe name to make the variable non-empty=
.

I vote for this suggestion, it's better than a fake recipe name.

Thanks,
Jackie

>=20
> --
> Best Regards, Patrick Ohly
>=20
> The content of this message is my personal opinion only and although I am=
 an employee of Intel, the
> statements I make here in no way represent Intel's position on the issue,=
 nor am I authorized to speak
> on behalf of Intel on this matter.
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

