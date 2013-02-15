Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1U6R1J-0004qy-J8
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 20:32:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1FJGPIe006010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Feb 2013 11:16:25 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.63]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0318.004;
	Fri, 15 Feb 2013 11:16:21 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] acpid: modify CFLAGS
Thread-Index: AQHOCtYN2qpovLk91k+SHIxZMjxezJh6UxyAgAD26bE=
Date: Fri, 15 Feb 2013 19:16:21 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8436F4BEC2@ALA-MBB.corp.ad.wrs.com>
References: <1360861770-30010-1-git-send-email-jslater@windriver.com>,
	<511D4811.2080401@linux.intel.com>
In-Reply-To: <511D4811.2080401@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.116.247]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] acpid: modify CFLAGS
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
X-List-Received-Date: Fri, 15 Feb 2013 19:32:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for looking at this so quickly.

If I set the optimization to DEBUG_OPTIMIZATION, I see -O0
in CFLAGS, but I see -O2 in log.do_compile.  In Makefile, itself,
I see

CFLAGS =3D -W -Wall -Werror -Wundef -Wshadow -D_GNU_SOURCE -O2 -g $(DEFS)

and rather than patch that, I thought it would be easier to just override i=
t.

I am using the acpid recipe from openembedded-core master branch.

Joe

________________________________________
From: Saul Wold [sgw@linux.intel.com]
Sent: Thursday, February 14, 2013 12:24 PM
To: Slater, Joseph
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] acpid: modify CFLAGS

On 02/14/2013 09:09 AM, Joe Slater wrote:
> Override the hard-coded CFLAGS used in Makefile
> to reference our CFLAGS.
>

Can you be clearer about this?

I just checked the output of the compile log and these flags are set
correctly. I also looked at the make -n output via a devshell.

This seems to be hardcoding the CFLAGS into this recipe.

Sounds like something else is going on.

Thanks
        Sau!


> Upstream-Status:  Pending
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   meta/recipes-bsp/acpid/acpid.inc |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/ac=
pid.inc
> index 3c0219f..1ffe6ff 100644
> --- a/meta/recipes-bsp/acpid/acpid.inc
> +++ b/meta/recipes-bsp/acpid/acpid.inc
> @@ -13,7 +13,9 @@ inherit update-rc.d
>   INITSCRIPT_NAME =3D "acpid"
>   INITSCRIPT_PARAMS =3D "defaults"
>
> -EXTRA_OEMAKE =3D ""
> +# Makefile ignores our CFLAGS, so override it.
> +#
> +EXTRA_OEMAKE =3D "CFLAGS=3D'-W -Wall -Werror -Wundef -Wshadow ${CFLAGS} =
$(DEFS)'"
>
>   do_compile () {
>       oe_runmake 'CC=3D${CC} -D_GNU_SOURCE' 'CROSS=3D${HOST_PREFIX}'
>=


