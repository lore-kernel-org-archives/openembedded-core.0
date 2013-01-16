Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Muhammad_Shakeel@mentor.com>) id 1TvUgh-0004oj-IT
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 16:14:25 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1TvURo-00051x-SU from Muhammad_Shakeel@mentor.com ;
	Wed, 16 Jan 2013 06:58:36 -0800
Received: from SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 16 Jan 2013 06:58:36 -0800
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.64]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.01.0289.001; Wed, 16 Jan 2013 14:58:34 +0000
From: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 2/2 v2] archive-*-source.bbclass: Handle all
	package classes
Thread-Index: AQHN8l3X+Ebvg+mw0kWqc80By7IPv5hL2imAgAAzbfw=
Date: Wed, 16 Jan 2013 14:58:34 +0000
Message-ID: <A8A2F4C5E3D3D0468DDA3544476725F85BC890E1@EU-MBX-04.mgc.mentorg.com>
References: <1358171300-970-1-git-send-email-muhammad_shakeel@mentor.com>,
	<1358336929.3276.16.camel@ted>
In-Reply-To: <1358336929.3276.16.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Jan 2013 14:58:36.0568 (UTC)
	FILETIME=[F625A180:01CDF3F9]
Cc: "Larson, Chris" <Chris_Larson@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] archive-*-source.bbclass: Handle all package classes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 15:14:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for your valuable feedback. I will rework the patch as per your sugg=
estion and will send a v3 after testing.=0A=
=0A=
Regards,=0A=
--Shakeel=0A=
________________________________________=0A=
From: Richard Purdie [richard.purdie@linuxfoundation.org]=0A=
Sent: Wednesday, January 16, 2013 4:48 PM=0A=
To: Shakeel, Muhammad=0A=
Cc: openembedded-core@lists.openembedded.org; Larson, Chris=0A=
Subject: Re: [OE-core] [PATCH 2/2 v2] archive-*-source.bbclass: Handle all =
package classes=0A=
=0A=
On Mon, 2013-01-14 at 18:48 +0500, Shakeel, Muhammad wrote:=0A=
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>=0A=
>=0A=
> * Add archiver tasks correctly for any 'IMAGE_PKGTYPE'.=0A=
>=0A=
> [YOCTO #3449]=0A=
>=0A=
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>=0A=
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>=0A=
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>=0A=
> ---=0A=
>  meta/classes/archive-configured-source.bbclass |   15 +++++++++++++--=0A=
>  meta/classes/archive-original-source.bbclass   |   15 +++++++++++++--=0A=
>  meta/classes/archive-patched-source.bbclass    |   15 +++++++++++++--=0A=
>  3 files changed, 39 insertions(+), 6 deletions(-)=0A=
>=0A=
> diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classe=
s/archive-configured-source.bbclass=0A=
> index 64799e3..50838e6 100644=0A=
> --- a/meta/classes/archive-configured-source.bbclass=0A=
> +++ b/meta/classes/archive-configured-source.bbclass=0A=
> @@ -11,12 +11,19 @@ inherit archiver=0A=
>  addtask do_archive_configured_sources after do_configure=0A=
>=0A=
>  # Get archiving package with temp(logs) and scripts(.bb and inc files)=
=0A=
> -addtask do_archive_scripts_logs after do_package_write_rpm=0A=
> +addtask do_archive_scripts_logs=0A=
>=0A=
>  # Get dump date and create diff file=0A=
> -addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_=
build=0A=
> +addtask do_dumpdata_create_diff_gz before do_build=0A=
>=0A=
>  python () {=0A=
> +    packaging =3D d.getVar('IMAGE_PKGTYPE', True)=0A=
> +    write_package_task =3D 'do_package_write_' + packaging=0A=
> +=0A=
> +    deps =3D d.getVarFlag('do_dumpdata_create_diff_gz', 'deps') or []=0A=
> +    deps.append(write_package_task)=0A=
> +    d.setVarFlag('do_dumpdata_create_diff_gz', 'deps', deps)=0A=
> +=0A=
>      if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) !=3D 'srpm':=0A=
>          """=0A=
>          If package type is not 'srpm' then add tasks to move archive pac=
kages of=0A=
> @@ -30,6 +37,10 @@ python () {=0A=
>          recrdeptask +=3D ' do_archive_configured_sources '=0A=
>          d.setVarFlag('do_build', 'recrdeptask', recrdeptask)=0A=
>=0A=
> +        deps =3D d.getVarFlag('do_archive_scripts_logs', 'deps') or []=
=0A=
> +        deps.append(write_package_task)=0A=
> +        d.setVarFlag('do_archive_scripts_logs', 'deps', deps)=0A=
=0A=
Looking at the patch series, this is code introducing users of the=0A=
'deps' flag outside of externalsrc.bbclass (which has some nasty reasons=0A=
it currently pokes bitbake internals).=0A=
=0A=
I'd like to not introduce usage of the flag so can you please change=0A=
these references to things like:=0A=
=0A=
d.appendVarFlag('do_archive_scripts_logs', 'deps', ' do_package_write_' + p=
ackaging)=0A=
=0A=
Use of appendVarFlag applies anywhere you currently do a set, append,=0A=
set operation, its just neater code and gives us some scope to optmise=0A=
the implementation in bitbake at a later date.=0A=
=0A=
This applies to both this patch and the other one.=0A=
=0A=
Thanks,=0A=
=0A=
Richard=0A=
=0A=


