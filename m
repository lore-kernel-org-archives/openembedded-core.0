Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 766DA7823B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 08:29:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 26 Jul 2017 01:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,414,1496127600"; d="scan'208";a="882941123"
Received: from jlock-mobl1.ger.corp.intel.com (HELO [10.252.22.9])
	([10.252.22.9])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2017 01:29:22 -0700
To: openembedded-core@lists.openembedded.org
References: <20170725194217.41657-1-jose.perez.carranza@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
Message-ID: <7f0b7925-c623-665e-a96c-114ef7f75576@linux.intel.com>
Date: Wed, 26 Jul 2017 09:29:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170725194217.41657-1-jose.perez.carranza@linux.intel.com>
Subject: Re: [PATCH] oeqa/buildperf: Add 'bitbake -m' on sync function to ensure bitbake is unloaded
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
X-List-Received-Date: Wed, 26 Jul 2017 08:29:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25/07/2017 20:42, jose.perez.carranza@linux.intel.com wrote:
> From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
> 
> Add 'bitbake -m' to the sync method and ensure all process related to
> bitbake are correctly unloaded before doing the different measurements.
> Also add a call to sync funtion on Test4 before final measurment of
> eSDK deploy dir disk usage.
> 
> Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
> ---
>   meta/lib/oeqa/buildperf/base.py       | 1 +
>   meta/lib/oeqa/buildperf/test_basic.py | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
> index 6e62b279c1..7b2b4aa2a4 100644
> --- a/meta/lib/oeqa/buildperf/base.py
> +++ b/meta/lib/oeqa/buildperf/base.py
> @@ -485,6 +485,7 @@ class BuildPerfTestCase(unittest.TestCase):
>       @staticmethod
>       def sync():
>           """Sync and drop kernel caches"""
> +        runCmd2('bitbake -m', ignore_status=True)

Looks like the indentation is out here?

>           log.debug("Syncing and dropping kernel caches""")
>           KernelDropCaches.drop()
>           os.sync()
> diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
> index a9e4a5b731..0033ee4815 100644
> --- a/meta/lib/oeqa/buildperf/test_basic.py
> +++ b/meta/lib/oeqa/buildperf/test_basic.py
> @@ -121,5 +121,7 @@ class Test4(BuildPerfTestCase):
>           self.sync()
>           self.measure_cmd_resources([installer, '-y', '-d', deploy_dir],
>                                      'deploy', 'eSDK deploy')
> +        #make sure bitbake is unloaded
> +        #self.sync()

Is this sync() call supposed to be commented out?

Thanks,

Joshua

>           self.measure_disk_usage(deploy_dir, 'deploy_dir', 'deploy dir',
>                                   apparent_size=True)
> 

