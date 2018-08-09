Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63FCD748D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 15:03:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w79F2u8n015649
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Aug 2018 08:03:39 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 9 Aug 2018 08:03:15 -0700
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180803094802.1896-1-hongzhi.song@windriver.com>
	<20180803094802.1896-3-hongzhi.song@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <8047e9e9-e10a-7bfb-48b2-1ce447a32a6b@windriver.com>
Date: Thu, 9 Aug 2018 11:03:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180803094802.1896-3-hongzhi.song@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH v3 2/2] runtime selftest: remove the case of hw breakpoint
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
X-List-Received-Date: Thu, 09 Aug 2018 15:03:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/03/2018 05:48 AM, Hongzhi.Song wrote:
> Hw breakpoint is based on hardware.

We need a better commit log explanation.

Was this test added in error originally?

Can you explain briefly whether their are any
qemu configurations would be able to efficiently
test the hardware breakpoint feature using these kernel
modules. For example, if you are running qemux86-64 with
the kvm-intel module in your host's kernel, then the tests
may work and even be efficient. Can you change the test
to detect if the hardware/qemu supports hardware breakpoint
and only run the test if it does?

../Randy

> 
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>   meta/lib/oeqa/runtime/cases/ksample.py | 16 ----------------
>   1 file changed, 16 deletions(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
> index 26fbe9d8cb..5e8699a2e2 100644
> --- a/meta/lib/oeqa/runtime/cases/ksample.py
> +++ b/meta/lib/oeqa/runtime/cases/ksample.py
> @@ -161,22 +161,6 @@ class KSampleTest(KSample):
>           # rmmod
>           self.cmd_and_check("rmmod trace-printk")
>   
> -    # hw breakpoint
> -    @OETestDepends(['ssh.SSHTest.test_ssh'])
> -    def test_hw_breakpoint_example(self):
> -        # check config
> -        self.check_config("CONFIG_KALLSYMS_ALL")
> -        # make sure if module exists
> -        self.check_module_exist("hw_breakpoint/", "data_breakpoint.ko")
> -        # modprobe
> -        self.cmd_and_check("modprobe data_breakpoint")
> -        # lsmod
> -        self.cmd_and_check("lsmod | grep data_breakpoint | cut -d\' \' -f1", "data_breakpoint")
> -        # check result
> -        self.cmd_and_check("cat /var/log/messages | grep sample_hbp_handler", "sample_hbp_handler")
> -        # rmmod
> -        self.cmd_and_check("rmmod data_breakpoint")
> -
>       @OETestDepends(['ssh.SSHTest.test_ssh'])
>       def test_configfs_sample(self):
>           # check config
> 


-- 
# Randy MacLeod
# Wind River Linux

