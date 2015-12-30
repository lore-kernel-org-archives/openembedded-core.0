Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E800260290
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 10:25:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 30 Dec 2015 02:25:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,500,1444719600"; d="scan'208";a="625657019"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Dec 2015 02:25:13 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E56F56A4007;
	Wed, 30 Dec 2015 03:13:11 -0800 (PST)
Date: Wed, 30 Dec 2015 11:53:43 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <20151230095343.GA7457@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1450368555-20921-1-git-send-email-joshua.lock@collabora.co.uk>
	<1450381421-25856-1-git-send-email-joshua.lock@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <1450381421-25856-1-git-send-email-joshua.lock@collabora.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [[PATCH v2] oeqa/selftest/wic: add test case for sparse images
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
X-List-Received-Date: Wed, 30 Dec 2015 10:25:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joshua,

Thank you for the patch!

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

On Thu, Dec 17, 2015 at 07:43:41PM +0000, Joshua Lock wrote:
> Add a testcase to build a directdisk image and check that the
> used disk size is less than the apparent size, as wic now
> assembles images as sparse files.
> 
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  meta/lib/oeqa/selftest/wic.py | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
> index 55f6f82..9050d28 100644
> --- a/meta/lib/oeqa/selftest/wic.py
> +++ b/meta/lib/oeqa/selftest/wic.py
> @@ -264,3 +264,16 @@ class Wic(oeSelfTest):
>          self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
>                                     % image).status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
> +
> +    def test_sparseness(self):
> +        """Test that assembled images are sparse; apparent size > disk usage"""
> +        self.assertEqual(0, runCmd("wic create directdisk "
> +                                   "--image-name core-image-minimal").status)
> +        images = glob(self.resultdir + "directdisk-*.direct")
> +        self.assertEqual(1, len(images))
> +
> +        imagestat = os.stat(images.pop())
> +        # st_blocks is the "number of 512-byte blocks allocated for file"
> +        used = imagestat.st_blocks*512
> +        apparent = imagestat.st_size
> +        self.assertLess(used, apparent)

--
Regards,
Ed

