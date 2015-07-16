Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 075CB73BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 17:46:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2015 10:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,488,1432623600"; d="scan'208";a="730219905"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2015 10:46:59 -0700
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1436970934-4635-1-git-send-email-daniel.alexandrux.istrate@intel.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <55A7EE13.50203@linux.intel.com>
Date: Thu, 16 Jul 2015 10:46:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <1436970934-4635-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: Re: [PATCH] oeqa/runtime: Added one runtime testcase in connman.
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
X-List-Received-Date: Thu, 16 Jul 2015 17:47:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel and Alex,


On 07/15/2015 07:35 AM, Daniel Istrate wrote:
> (testcase 223) Check that only one connmand runs in background.
>
> Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> ---
>   meta/lib/oeqa/runtime/connman.py | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime/connman.py
> index cc537f7..b040400 100644
> --- a/meta/lib/oeqa/runtime/connman.py
> +++ b/meta/lib/oeqa/runtime/connman.py
> @@ -28,3 +28,26 @@ class ConnmanTest(oeRuntimeTest):
>           if status != 0:
>               print self.service_status("connman")
>               self.fail("No connmand process running")
> +
> +    @testcase(223)
> +    def test_only_one_connmand_in_background(self):
> +        """
> +        Summary:     Only one connmand in background
> +        Expected:    There will be only one connmand instance in background.
> +        Product:     BSPs
> +        Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
> +        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> +        """
> +
> +        # Make sure that 'connmand' is running in background
> +        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand')
> +        self.assertEqual(0, status, 'Failed to find "connmand" process running in background.')
> +
> +        # Start a new instance of 'connmand'
> +        (status, output) = self.target.run('connmand')
> +        self.assertEqual(0, status, 'Failed to start a new "connmand" process.')

If multiple instances of connmand can run, is that not a bug it connmand rather 
than in our configuration? I'm asking because it seems like this would be more 
suited as a connman test that would be part of ptest.

Otherwise, why not test all daemons for multiple instances?

