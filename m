Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 39C9B6B302
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 09:08:44 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 02:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,940,1367996400"; d="scan'208";a="285759218"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 02:08:27 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.157]) with mapi id
	14.03.0123.003; Fri, 23 Aug 2013 10:07:29 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/3] builder: register directories with pcmanfm
Thread-Index: AQHOncPBwOYiZHtfe0CWkTKIGP0iPZmihKxQ
Date: Fri, 23 Aug 2013 09:07:28 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C1968D@IRSMSX105.ger.corp.intel.com>
References: <cover.1377014441.git.cristian.iorga@intel.com>
	<7e1d9bb3b42c08f4337e717e959326014f0144c5.1377014441.git.cristian.iorga@intel.com>
	<52139B76.4090608@linux.intel.com>
In-Reply-To: <52139B76.4090608@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] builder: register directories with pcmanfm
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
X-List-Received-Date: Fri, 23 Aug 2013 09:08:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hmm, of course it should be builder.
Let me check what happened.
Regards,
Cristian

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Tuesday, August 20, 2013 7:38 PM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] builder: register directories with pcman=
fm

On 08/20/2013 09:05 AM, Cristian Iorga wrote:
> Register directories to be opened with PCManFM filemanager using=20
> xdg-open in Build Appliance.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-graphics/builder/builder_0.1.bb             | 2 +-
>   meta/recipes-graphics/builder/files/builder_hob_start.sh | 9 +++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/builder/builder_0.1.bb=20
> b/meta/recipes-graphics/builder/builder_0.1.bb
> index 78d41e5..1e8c977 100644
> --- a/meta/recipes-graphics/builder/builder_0.1.bb
> +++ b/meta/recipes-graphics/builder/builder_0.1.bb
> @@ -1,7 +1,7 @@
>   SUMMARY =3D "New user to do specific job"
>   DESCRIPTION =3D "This recipe create a new user named ${PN}, who is used=
 for specific jobs like building. The task can be auto started via mini X"
>   SECTION =3D "x11"
> -PR =3D "r6"
> +PR =3D "r7"
No PR Bumps!

>   LICENSE =3D "MIT"
>   LIC_FILES_CHKSUM =3D "file://builder_hob_start.sh;endline=3D5;md5=3D847=
96c3c41785d86100fdabcbdade00e"
>
> diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh=20
> b/meta/recipes-graphics/builder/files/builder_hob_start.sh
> index 40616f5..b3a0540 100644
> --- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
> +++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
> @@ -9,6 +9,15 @@ export PSEUDO_LOCALSTATEDIR=3D/home/builder/pseudo
>   export PSEUDO_LIBDIR=3D/usr/lib/pseudo/lib64
>   export GIT_PROXY_COMMAND=3D/home/builder/poky/scripts/oe-git-proxy
>
> +#start pcmanfm in daemon mode to allow asynchronous launch pcmanfm=20
> +-d&
> +
> +#register folders to open with PCManFM filemanager if [ ! -d=20
> +/home/ubik/tmp/.local/share/applications ]; then
                   ^^^^^
What's that user?  Should it be builder?

> +    mkdir -p /home/builder/.local/share/applications/
> +    xdg-mime default pcmanfm.desktop inode/directory fi
> +
>   cd /home/builder/poky
>   . ./oe-init-build-env
>
>

