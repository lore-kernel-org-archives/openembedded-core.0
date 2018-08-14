Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C40AA7904F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 17:43:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7EHhL5d001751
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:43:21 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 14 Aug 2018 10:43:20 -0700
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180813052336.43281-1-hongzhi.song@windriver.com>
	<20180813052336.43281-3-hongzhi.song@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <ba8a82d4-d749-5adb-db0a-389c54297572@windriver.com>
Date: Tue, 14 Aug 2018 13:43:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180813052336.43281-3-hongzhi.song@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH v3 2/2] runtime selftest: optimize the case of hw_breakpoint
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
X-List-Received-Date: Tue, 14 Aug 2018 17:43:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Subject:
    Re: [OE-core] [oe-core][PATCH v3 2/2] runtime selftest: optimize the 
case of hw_breakpoint

The subject/short log should be:
   runtime selftest: limit kernel hw bp arches


Hongzhi.Song wrote:
 >
 > 1. So far, only qemux86 can support hw breakpoint

When I first read this, I thought that you really meant only
qemux86 and NOT qemux86-64. Of course you mean: qemux86* so
please say so using '*' or qemux86[-64].

Does this work with and without the host using the kvm module?

 > qemuppc: Runqemu uses G4 as the default cpu. But qemu doesn't simulate
 > the hw breakpoint register for G4, which belong to 74xx series.

Okay. Please change the wording to something like:

qemuppc: The oe-core configuration uses a PPC G4 system as the
default cpu but qemu doesn't simulate the hw breakpoint register for G4.

 >
 > qemuarm: The arch more than v7 supports hw breakpoint, however arm use
 > v5 as default.

What about qemuarm64 and qemumips* ?

I don't care about mips so much but it would be nice if
qemuarm64 had this emulation. Oh, the patch code also allows
testing aarch64 so I guess qemuarm64 works. Please mention
that in the log in your first sentence.

 >
 > 2. Rsyslog maybe not started, so we use dmesg to confirm.
s/Rsyslog/syslog/

There are several syslog implementations so just refer to the
generic function.

 >
 > 3. Adding the operation of 'ls' triggers hardware breakpoint.

s/Adding the operation of 'ls' triggers hardware breakpoint.
  /Run 'ls' to trigger the hardware breakpoint test.
  /


Please take the numbering out of your long log.

If you read through the oe-core commits, you'll see that
people rarely number each statement. Numbered lists can be
used in cases such as:
    5a7cf32967 openssl_1.0.2n: improve reproducibility


Almost done! :)
Other than the host kvm module question, and a clean-up
commit log, I think this is fine now.

I suspect that the glibc-2.28 upgrade is getting more attention
than this and other work so once the glibc upgrade is in master,
I'd hope that your V4 will be merged.

Thanks,

../Randy

> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>   meta/lib/oeqa/runtime/cases/ksample.py | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
> index 26fbe9d8cb..eb8713351a 100644
> --- a/meta/lib/oeqa/runtime/cases/ksample.py
> +++ b/meta/lib/oeqa/runtime/cases/ksample.py
> @@ -164,6 +164,11 @@ class KSampleTest(KSample):
>       # hw breakpoint
>       @OETestDepends(['ssh.SSHTest.test_ssh'])
>       def test_hw_breakpoint_example(self):
> +        # check arch
> +        status, output = self.target.run("uname -m")
> +        result = ("x86" in output) or ("aarch64" in output)
> +        if not result:
> +            self.skipTest("the arch doesn't support hw breakpoint" % output)
>           # check config
>           self.check_config("CONFIG_KALLSYMS_ALL")
>           # make sure if module exists
> 


-- 
# Randy MacLeod
# Wind River Linux

