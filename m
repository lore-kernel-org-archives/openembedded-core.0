Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S8ZoH-0000CR-Ed
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:15:21 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Mar 2012 09:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="140000726"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2012 09:06:32 -0700
Message-ID: <4F636508.2090908@linux.intel.com>
Date: Fri, 16 Mar 2012 09:06:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331848750.git.dvhart@linux.intel.com>
	<5ca651eb19c3fcb64de2ce405de0bc7fa2a8c90b.1331848750.git.dvhart@linux.intel.com>
In-Reply-To: <5ca651eb19c3fcb64de2ce405de0bc7fa2a8c90b.1331848750.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] rt-tests: Add src/backfire to FILES_${PN}
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
X-List-Received-Date: Fri, 16 Mar 2012 16:15:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2012 03:00 PM, Darren Hart wrote:
> Fixes [YOCTO #2114]
>
> The rt-tests recipe was issuing the following WARNINGs:
>
> WARNING: For recipe rt-tests, the following files/directories were installed
> but not shipped in any package:
> WARNING:   /usr/src
> WARNING:   /usr/src/backfire
> WARNING:   /usr/src/backfire/backfire.c
> WARNING:   /usr/src/backfire/Makefile
>
> Add ${prefix}/src/backfire to FILES_${PN} to include these files in the package.
> These depend on the target kernel and are meant to be able to be rebuilt as
> needed.  Ideally we would also build this module and include it with rt-tests or
> the linux-yocto-rt kernel. For now, conform with the intent of the rt-tests
> Makefile and avoid the WARNINGs.
>
> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> ---
>   meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> index 78d51b3..6425027 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> +++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> @@ -11,6 +11,7 @@ SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
>
>   # git ->  0.83 needs a PE bump
>   PE = "1"
> +PR = "r1"
>
>   SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
>
> @@ -25,3 +26,5 @@ do_install() {
>           oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} \
>                              INCLUDEDIR=${includedir}
>   }
> +
> +FILES_${PN} += "${prefix}/src/backfire"
Darren,

I looked closer and you need you use ${D}${prefix}/src here instead, 
that will get you what you want.

Sau!


