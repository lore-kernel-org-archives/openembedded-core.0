Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD5B6D312
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 16:16:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 29 Oct 2013 09:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,594,1378882800"; d="scan'208";a="419197032"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.13])
	by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2013 09:16:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?S=E9bastien?= Mennetrier <s.mennetrier@innotis.org>
Date: Tue, 29 Oct 2013 16:16:33 +0000
Message-ID: <1416831.14LsivE7s1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1383062949-12318-1-git-send-email-s.mennetrier@innotis.org>
References: <1383062949-12318-1-git-send-email-s.mennetrier@innotis.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_rpm.bbclass : escape "%" in files and directories name
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
X-List-Received-Date: Tue, 29 Oct 2013 16:16:34 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi S=E9bastien,

On Tuesday 29 October 2013 17:09:09 S=E9bastien Mennetrier wrote:
> Fixes [YOCTO #5397]
>=20
> The rpm process replace all the "%name" in the spec file by the name =
of
> the package. So, if the package is composed of some files or director=
ies
> named "%name...", the rpm package process failed.
>=20
> Replace all "%" present in files or directories names by "[%]"
>=20
> Signed-off-by: S=E9bastien Mennetrier <s.mennetrier@innotis.org>
> ---
>  meta/classes/package_rpm.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/classes/package_rpm.bbclass
> b/meta/classes/package_rpm.bbclass index 36bad09..6c73e37 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -662,10 +662,13 @@ python write_specfile () {
>      def walk_files(walkpath, target, conffiles):
>          for rootpath, dirs, files in os.walk(walkpath):
>              path =3D rootpath.replace(walkpath, "")
> +            path =3D path.replace("%", "[%]")
>              for dir in dirs:
> +                dir =3D dir.replace("%", "[%]")
>                  # All packages own the directories their files are i=
n...
>                  target.append('%dir "' + path + '/' + dir + '"')
>              for file in files:
> +                file =3D file.replace("%", "[%]")
>                  if conffiles.count(path + '/' + file):
>                      target.append('%config "' + path + '/' + file + =
'"')
>                  else:

Are you sure this is correct? The documentation I have been able to dig=
 up via=20
google seems to suggest that %% is the correct way to escape a % sign i=
n a=20
spec file.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

