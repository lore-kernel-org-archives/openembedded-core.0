Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6C41F76740
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 11:31:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2015 04:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,629,1432623600"; d="scan'208";a="537704278"
Received: from jsmcbrid-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.24.154])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2015 04:31:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Costin Constantin <costin.c.constantin@intel.com>
Date: Fri, 07 Aug 2015 12:31:19 +0100
Message-ID: <1970887.P8p8M1ymWY@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1438946222-3447-1-git-send-email-costin.c.constantin@intel.com>
References: <1438946222-3447-1-git-send-email-costin.c.constantin@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] selftest/buildoptions.py: correct small mistake cleanupworkdir ---> cleanup-workdir
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
X-List-Received-Date: Fri, 07 Aug 2015 11:31:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Costin,

On Friday 07 August 2015 14:17:02 Costin Constantin wrote:
> Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
> ---
>  meta/lib/oeqa/selftest/buildoptions.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/buildoptions.py
> b/meta/lib/oeqa/selftest/buildoptions.py index 483803b..655b5da 100644
> --- a/meta/lib/oeqa/selftest/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/buildoptions.py
> @@ -128,7 +128,7 @@ class BuildImagesTest(oeSelfTest):
>          This method is used to test the build of directfb image for arm
> arch. In essence we build a coreimagedirectfb and test the exitcode of
> bitbake that in case of success is 0. """
> -        self.add_command_to_tearDown('cleanupworkdir')
> +        self.add_command_to_tearDown('cleanup-workdir')
>          self.write_config("DISTRO_FEATURES_remove =
> \"x11\"\nDISTRO_FEATURES_append = \" directfb\"\nMACHINE ??= \"qemuarm\"")
> res = bitbake("core-image-directfb", ignore_status=True)
>          self.assertEqual(res.status, 0, "\ncoreimagedirectfb failed to
> build. Please check logs for further details.\nbitbake output %s" %
> res.output) @@ -139,7 +139,7 @@ class ArchiverTest(oeSelfTest):
>          """
>          Test for archiving the work directory and exporting the source
> files. """
> -        self.add_command_to_tearDown('cleanupworkdir')
> +        self.add_command_to_tearDown('cleanup-workdir')
>          self.write_config("INHERIT = \"archiver\"\nARCHIVER_MODE[src] =
> \"original\"\nARCHIVER_MODE[srpm] = \"1\"") res =
> bitbake("xcursor-transparent-theme", ignore_status=True)
> self.assertEqual(res.status, 0, "\nCouldn't build
> xcursortransparenttheme.\nbitbake output %s" % res.output)

I think we talked about this in another test - we shouldn't be calling 
cleanup-workdir as part of any of our tests. If we need to clean specific 
recipes that were built by the tests that's fine, but cleanup-workdir blasts 
everything away which isn't really appropriate.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

