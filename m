Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QFNT9-0007Q7-T9
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 11:25:08 +0200
Received: by bwz5 with SMTP id 5so2382639bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2011 02:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6bGjhHTTNgyHjc8F+ACBLOpqDTpEwDkDYLrboavX5IQ=;
	b=qqDoBc5OdWNoQZOgz60+5qITlDZyKppaDityBisVWuCPGo1QzPiHH/1ZzuJQX7e+FJ
	1kgsnfFdvRoMnK9Xh7EVa1gc2x8LU1et9H+uII7IP6BE0DupyT1fncwcoxDe+GDYodYW
	gp0B9896lpxaDctqIa9Qz5huNT/HxwDDJCIE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Kbc+h/8h5nc+8ih9St70XmsIoUqfm3SPr8VOmFyfirbbRrgSVvf+fBVmzLlNqUMFi7
	CjOZ8qGZRAXgzfjNtNSH0wbgO47PZFkQ9Sm3WnhvzTLz8z1fCP5hMBoaTGy3BHBW9qAw
	uTMO3AzgF4W0h38foHegd/+SbMy9ac+UpqGn4=
Received: by 10.204.19.5 with SMTP id y5mr1926124bka.194.1303982556257;
	Thu, 28 Apr 2011 02:22:36 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id l1sm901354bkl.1.2011.04.28.02.22.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2011 02:22:34 -0700 (PDT)
Date: Thu, 28 Apr 2011 11:22:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Lu, Lianhao" <lianhao.lu@intel.com>
Message-ID: <20110428092232.GA3259@jama.jama.net>
References: <C10D3FB0CD45994C8A51FEC1227CE22F2311C1C837@shsmsx502.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <C10D3FB0CD45994C8A51FEC1227CE22F2311C1C837@shsmsx502.ccr.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 28 Apr 2011 09:25:08 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 03:08:03PM +0800, Lu, Lianhao wrote:
> Hi Guys,
>=20
> Here is the design of network based PR service, please help to review and=
=20
> give you comment. Thanks a lot!

Hi,

looks good, just wondering if we can use the same mechanism for
LOCALCOUNT numbers in SRCPV, we can even use same table if we prefix
first column ie LOCALCOUNT_${PN} and CheckSum in 2nd column would be
actuall git hash (from SRCREV or HEAD for AUTOREV) or 2nd table with
similar structure.

But it wont work very well if one builder is using AUTOREV and another
one isn't, but that can be resolved by allowing only trusted builders
with same configuration (wrt AUTOREV) to send such tuples.

Do we have at least 2 groups of "users".
1) trusted which increments PR when hash is not found
2) public which can query PR for given hash (not sure what they should
   do if hash is not found)

Regards,

> By changing the BB_SIGNATURE_HANDLER from "basic" to "basichash", the=20
> task checksum will be in the stamp file, so this implies the end of PR bu=
mps=20
> since whenever a recipe change happens, the checksum of the appropriate=
=20
> tasks will change so everything depends on that tasks will automatically =
got=20
> rebuilt. (The checksum mechanism was introduced here at https://lists.yoc=
toproject.org/pipermail/yocto/2011-March/001157.html).
>=20
> But there is one piece of building block missing there. Because the packa=
ge=20
> feeds needs the PR bumps because some relevant fields in the package file=
(i.e.=20
> Version field in .ipk and .deb file, Release field in .rpm file) need it =
so the=20
> generated package feeds can be used to upgrade/install new packages in th=
e=20
> user's linux distribution. So RP proposed this network based PR service a=
t=20
> https://lists.yoctoproject.org/pipermail/poky/2011-January/002123.html.=
=20
>=20
> Each embedded linux distribution entity using Yocto to build their distri=
butions=20
> should have a single network based PR service. Multiple build sources cou=
ld send=20
> the tuple (PN, task checksum) to this network based PR service. If the PR=
 service=20
> finds the corresponding (PN, task checksum) in its database, it will retu=
rn the PR=20
> values to the client. If not, it will bump the PR for that PN and return =
the new value=20
> to the client. The returned value will only goes into the generated packa=
ge files.
>=20
> The PR network service will be a separate process other than bitbake, usi=
ng the=20
> XMLPRC to communicate with the client(i.e. bitbake process) and sqlite3 a=
s the=20
> backend database. The table definition would be something like
> (
>   PN TEXT,
>   CheckSum TEXT PRIMARY KEY,
>   PR INT
> )
>=20
> Because different type of package files are generated in different tasks,=
 (e.g.
> do_package_write_ipk, do_package_write_rpm), we will use the task checksu=
m=20
> of do_package to ask for PR value, so all the package files will have the=
 same PR value.
>=20
> To be backward compatible, if the PR value is already set in the recipe, =
the final PR value=20
> that goes into the package files will be "PR in recipe.PR returned by the=
 service".
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+HP7ph2BbKc20aGI--
