Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QFLU4-0006FN-0K
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 09:17:57 +0200
Received: by wwb17 with SMTP id 17so2236627wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2011 00:15:20 -0700 (PDT)
Received: by 10.227.28.8 with SMTP id k8mr3170190wbc.159.1303974920278;
	Thu, 28 Apr 2011 00:15:20 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id x1sm891586wbh.36.2011.04.28.00.15.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2011 00:15:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <C10D3FB0CD45994C8A51FEC1227CE22F2311C1C837@shsmsx502.ccr.corp.intel.com>
Date: Thu, 28 Apr 2011 09:15:16 +0200
Message-Id: <2CC91F61-B0AF-4E0F-AC34-EF901E8E4E2A@dominion.thruhere.net>
References: <C10D3FB0CD45994C8A51FEC1227CE22F2311C1C837@shsmsx502.ccr.corp.intel.com>
To: "Lu, Lianhao" <lianhao.lu@intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] RFC: design of network based PR service
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
X-List-Received-Date: Thu, 28 Apr 2011 07:17:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Adding oe-core list to CC:

Op 28 apr 2011, om 09:08 heeft Lu, Lianhao het volgende geschreven:

> Hi Guys,
>=20
> Here is the design of network based PR service, please help to review =
and=20
> give you comment. Thanks a lot!
>=20
> By changing the BB_SIGNATURE_HANDLER from "basic" to "basichash", the=20=

> task checksum will be in the stamp file, so this implies the end of PR =
bumps=20
> since whenever a recipe change happens, the checksum of the =
appropriate=20
> tasks will change so everything depends on that tasks will =
automatically got=20
> rebuilt. (The checksum mechanism was introduced here at =
https://lists.yoctoproject.org/pipermail/yocto/2011-March/001157.html).
>=20
> But there is one piece of building block missing there. Because the =
package=20
> feeds needs the PR bumps because some relevant fields in the package =
file(i.e.=20
> Version field in .ipk and .deb file, Release field in .rpm file) need =
it so the=20
> generated package feeds can be used to upgrade/install new packages in =
the=20
> user's linux distribution. So RP proposed this network based PR =
service at=20
> =
https://lists.yoctoproject.org/pipermail/poky/2011-January/002123.html.=20=

>=20
> Each embedded linux distribution entity using Yocto to build their =
distributions=20
> should have a single network based PR service. Multiple build sources =
could send=20
> the tuple (PN, task checksum) to this network based PR service. If the =
PR service=20
> finds the corresponding (PN, task checksum) in its database, it will =
return the PR=20
> values to the client. If not, it will bump the PR for that PN and =
return the new value=20
> to the client. The returned value will only goes into the generated =
package files.
>=20
> The PR network service will be a separate process other than bitbake, =
using the=20
> XMLPRC to communicate with the client(i.e. bitbake process) and =
sqlite3 as the=20
> backend database. The table definition would be something like
> (
>  PN TEXT,
>  CheckSum TEXT PRIMARY KEY,
>  PR INT
> )
>=20
> Because different type of package files are generated in different =
tasks, (e.g.
> do_package_write_ipk, do_package_write_rpm), we will use the task =
checksum=20
> of do_package to ask for PR value, so all the package files will have =
the same PR value.
>=20
> To be backward compatible, if the PR value is already set in the =
recipe, the final PR value=20
> that goes into the package files will be "PR in recipe.PR returned by =
the service".
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=

> Lianhao Lu
> OTC SSG, Intel APAC R&D Ltd.
> 86-21-61167139
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



