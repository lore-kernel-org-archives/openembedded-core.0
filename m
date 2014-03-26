Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB4C60E07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 16:38:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Mar 2014 09:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,736,1389772800"; d="scan'208";a="508072397"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2014 09:33:54 -0700
Received: from [10.237.108.98] (apalalax-mobl.ger.corp.intel.com
	[10.237.108.98])
	by linux.intel.com (Postfix) with ESMTP id AF5156A4083;
	Wed, 26 Mar 2014 09:33:39 -0700 (PDT)
Message-ID: <53330170.1070906@linux.intel.com>
Date: Wed, 26 Mar 2014 18:33:52 +0200
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
Organization: Intel OTC
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Corneliu Stoicescu <corneliux.stoicescu@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1395852491-32086-1-git-send-email-corneliux.stoicescu@intel.com>
In-Reply-To: <1395852491-32086-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: Re: [PATCH] selftest/bbtests.py: Fixed regex and added bitbake output to test_warnings_errors
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
X-List-Received-Date: Wed, 26 Mar 2014 16:38:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
On 3/26/2014 6:48 PM, Corneliu Stoicescu wrote:
> The test failed when more than 1 error or 1 warning is present.
> Also pasting the bitbake output when the test fails.
>
> Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
> ---
>   meta/lib/oeqa/selftest/bbtests.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
> index ee1f82a..d7dc127 100644
> --- a/meta/lib/oeqa/selftest/bbtests.py
> +++ b/meta/lib/oeqa/selftest/bbtests.py
> @@ -47,10 +47,10 @@ class BitbakeTests(oeSelfTest):
>
>       def test_warnings_errors(self):
>           result = bitbake('-b asdf', ignore_status=True)
> -        find_warnings = re.search("Summary: There was [1-9][0-9]* WARNING message shown.", result.output)
> -        find_errors = re.search("Summary: There was [1-9][0-9]* ERROR message shown.", result.output)
> -        self.assertTrue(find_warnings)
> -        self.assertTrue(find_errors)
> +        find_warnings = re.search("Summary: There wa.{1,2}? [1-9][0-9]* WARNING messages* shown", result.output)
> +        find_errors = re.search("Summary: There wa.{1,2}? [1-9][0-9]* ERROR messages* shown", result.output)
If more than one warning messages are encountered, the actual output is 
"Summary: There were 2 WARNING messages shown." and the search above 
doesn't match.
> +        self.assertTrue(find_warnings, msg="Did not find the mumber of warnings at the end of the build:\n" + result.output)
> +        self.assertTrue(find_errors, msg="Did not find the mumber of errors at the end of the build:\n" + result.output)
>
>       def test_invalid_patch(self):
>           self.write_recipeinc('man', 'SRC_URI += "file://man-1.5h1-make.patch"')
>

-- 
Alexandru Palalau

