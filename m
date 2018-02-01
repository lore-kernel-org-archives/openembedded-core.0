Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Feb 2018 20:50:45 UTC
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 7CFCF78846
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 20:50:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 12:41:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="197977325"
Received: from ateh1-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.64.10])
	by orsmga005.jf.intel.com with ESMTP; 01 Feb 2018 12:41:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Fri, 02 Feb 2018 09:41:08 +1300
Message-ID: <19458201.5gAgVaIamb@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/20] oe-selftest: add a test for recipes without maintainers
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
X-List-Received-Date: Thu, 01 Feb 2018 20:50:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

On Friday, 2 February 2018 7:01:51 AM NZDT Alexander Kanavin wrote:
> 'bitbake -c checkpkg world' is moved to class initializer to avoid
> it being run twice in a row.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/distrodata.py | 32 +++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
> index 12540adc7d8..dd0760cce93 100644
> --- a/meta/lib/oeqa/selftest/cases/distrodata.py
> +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
> @@ -9,6 +9,12 @@ class Distrodata(OESelftestTestCase):
>      @classmethod
>      def setUpClass(cls):
>          super(Distrodata, cls).setUpClass()
> +        feature = 'INHERIT += "distrodata"\n'
> +        feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
> +
> +        cls.write_config(cls, feature)
> +        bitbake('-c checkpkg world')
> +
>  
>      @OETestID(1902)
>      def test_checkpkg(self):
> @@ -18,11 +24,6 @@ class Distrodata(OESelftestTestCase):
>          Product:     oe-core
>          Author:      Alexander Kanavin <alexander.kanavin@intel.com>
>          """
> -        feature = 'INHERIT += "distrodata"\n'
> -        feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
> -
> -        self.write_config(feature)
> -        bitbake('-c checkpkg world')
>          checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
>          regressed_failures = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'UNKNOWN_BROKEN']
>          regressed_successes = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'KNOWN_BROKEN']
> @@ -40,3 +41,24 @@ The following packages have been checked successfully for upstream versions,
>  but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please remove that line from the recipes.
>  """ + "\n".join(regressed_successes)
>          self.assertTrue(len(regressed_failures) == 0 and len(regressed_successes) == 0, msg)
> +
> +    def test_maintainers(self):
> +        """
> +        Summary:     Test that recipes have a maintainer
> +        Expected:    All recipes (except a few special static/testing ones) should have a maintainer listed in maintainers.inc file.
> +        Product:     oe-core
> +        Author:      Alexander Kanavin <alexander.kanavin@intel.com>
> +        """
> +        def is_exception(pkg):
> +            exceptions = ["packagegroup-", "initramfs-", "systemd-machine-units", "container-image-testpkg", "postinst", "devtool-test-", "selftest-ed", "target-sdk-provides-dummy"]
> +            for i in exceptions:
> +                 if i in pkg:
> +                     return True
> +            return False
> +
> +        checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
> +        no_maintainer_list = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[14] == '' and not is_exception(pkg_data[0])]
> +        msg = """
> +The following packages do not have a maintainer assigned to them. Please
> add an entry to meta/conf/distro/include/maintainers.inc file.
> +""" + "\n".join(no_maintainer_list)
> +        self.assertTrue(len(no_maintainer_list) == 0, msg)
> 

I understand the intention, but I don't think oe-selftest is the right place to be
doing this. It's going to fail for sure if you have any non-OE-Core layers in
your configuration.

One thing I have continued to campaign for (and I'm aware that not everyone
completely agrees) is that oe-selftest should be able to be run with people's
own configurations, we shouldn't necessarily assume that it's only our default
being tested - that way we maximise oe-selftest's utility and audience. Of
course there's a limit to that, if someone's esoteric configuration breaks it
they get to keep the pieces - but this will definitely break with anyone's
custom configuration, esoteric or otherwise.

By all means let's have a script that does this - it's even trivial to write one
with tinfoil.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

