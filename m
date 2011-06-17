Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@intel.com>) id 1QXd8h-0004gF-DE
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 19:47:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2011 10:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,382,1304319600"; d="scan'208";a="19538527"
Received: from unknown (HELO helios.localnet) ([10.255.16.248])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2011 10:42:50 -0700
From: Paul Eggleton <paul.eggleton@intel.com>
To: "openembedded-core" <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jun 2011 18:42:49 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <33AB447FBD802F4E932063B962385B3554AE4989@shsmsx501.ccr.corp.intel.com>
In-Reply-To: <33AB447FBD802F4E932063B962385B3554AE4989@shsmsx501.ccr.corp.intel.com>
MIME-Version: 1.0
Message-Id: <201106171842.49291.paul.eggleton@intel.com>
Subject: Re: [PATCH] RFC - combo layer repo tool
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
X-List-Received-Date: Fri, 17 Jun 2011 17:47:30 -0000
Content-Type: Text/Plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi Ke,

Great work. Here's my review so far:

On Monday 13 June 2011 14:15:04 Yu, Ke wrote:
> --- /dev/null
> +++ b/scripts/combo-layer-hook-default.sh
> @@ -0,0 +1,14 @@
> +#!/bin/sh
> +# Take a patch from bitbake and apply to poky

This text should be a bit more generic. Maybe "Hook to add source=20
component/revision info to commit message"

> --- /dev/null
> +++ b/scripts/combo-layer.conf.example
> @@ -0,0 +1,38 @@
> +# repo name

This should be "component name"

> +# leave it empty if no commit updated yet, and then the tool
> +# will start from the first commit

Change this to "If empty, the tool will start from the first commit"

> +# hook: if provided, the tool will call the hook to proceed the generated
> patch from upstream,=20

proceed -> process

> --- /dev/null
> +++ b/scripts/combo-layer.py

Remove the .py extension from the script name, to match our other scripts.=20
(The hook script extension can stay however, it's not meant to be executed=20
directly.)

> +        # Step 2: generate the patch list stored in patch dir
> +        if dest_dir !=3D ".":
> +            prefix =3D "--src-prefix=3Da/%s/ --dst-prefix=3Db/%s/" % (de=
st_dir,
> dest_dir) +        else:
> +            prefix =3D ""
> +        if repo['last_revision'] =3D=3D "":
> +            logger.info("Warning: last_revision of repo %s is not set, so
> start from the first commit" % name) +            patch_cmd_range =3D
> "--root master"
> +            rev_cmd_range =3D "master"
> +        else:
> +            patch_cmd_range =3D "master"
> +            rev_cmd_range =3D "%s..master" % repo['last_revision']

I tested the tool by checking out an older revision of poky, and setting up=20
components for oe-core and bitbake in the config file with last_revisions b=
ased=20
on the most recent revisions merged into in my older poky checkout. After=20
running init then update, no changes were applied. Once I changed the "else=
:"=20
part of the above code to make patch_cmd_range =3D rev_cmd_range instead of=20
"master" the update process worked.

I haven't yet tested the filtering or splitpatch but I will do so and let y=
ou=20
know the results.

Some other suggestions:
* During update, print out which component it is updating from as it goes=20
through them (in case the operation fails)
* The tool should clean up the temporary patch subdirectory after finishing

Cheers,
Paul
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.



