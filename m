Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7D178869
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 09:19:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6K9JRok003340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 02:19:28 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 20 Jul 2018 02:19:27 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1532072564-170200-1-git-send-email-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <f068eb3f-dce2-94bc-aa6d-f169cc52a9f6@windriver.com>
Date: Fri, 20 Jul 2018 17:21:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1532072564-170200-1-git-send-email-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.198]
Subject: Re: [meta][PATCH] runtime selftest: test_trace_events_sample of ksample.py
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
X-List-Received-Date: Fri, 20 Jul 2018 09:19:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please ignore it.

--Hongzhi


On 2018年07月20日 15:42, Hongzhi.Song wrote:
> The debug info can not be written to trace buffer immediately
> by thread. So we should sleep some seconds.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>   meta/lib/oeqa/runtime/cases/ksample.py | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
> index 260bc3c..3e9cfc6 100644
> --- a/meta/lib/oeqa/runtime/cases/ksample.py
> +++ b/meta/lib/oeqa/runtime/cases/ksample.py
> @@ -18,7 +18,8 @@ class KSample(OERuntimeTestCase):
>           else:
>               # check result
>               result = ("%s" % match_string) in output
> -            self.assertTrue(result)
> +            msg = output
> +            self.assertTrue(result, msg)
>               self.assertEqual(status, 0, cmd)
>   
>       def check_config(self, config_opt=''):
> @@ -126,7 +127,16 @@ class KSampleTest(KSample):
>           self.cmd_and_check("echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable")
>           self.cmd_and_check("cat /sys/kernel/debug/tracing/events/sample-trace/enable")
>           # check result
> -        self.cmd_and_check("cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d\':\' -f2", " foo_bar")
> +        status = 1
> +        count = 0
> +        while status != 0:
> +            time.sleep(1)
> +            status, output = self.target.run('cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d\':\' -f2')
> +            if " foo_bar" in output:
> +                break
> +            count = count + 1
> +            if count > 5:
> +                self.skipTest("Time out for check result")
>           # disable trace
>           self.cmd_and_check("echo 0 > /sys/kernel/debug/tracing/events/sample-trace/enable")
>           # clean up trace


