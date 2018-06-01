Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 69F9474FAA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 08:12:50 +0000 (UTC)
Received: from ted ([192.168.3.30]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w518Cdk9014204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 1 Jun 2018 09:12:51 +0100
Message-ID: <1527840759.16911.180.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 01 Jun 2018 09:12:39 +0100
In-Reply-To: <1527840158-99078-1-git-send-email-hongzhi.song@windriver.com>
References: <1527840158-99078-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] Meta runtime cases: add testcases for kernel sample
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
X-List-Received-Date: Fri, 01 Jun 2018 08:12:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-06-01 at 04:02 -0400, Hongzhi.Song wrote:
> We are going to let runtime test support kernel tests. Now we just
> add
> kernel self-contained sample tests. And we plan to add overall kernel
> tests in the future.
> 
> This patch is just add kernel samples test which contains about 13
> tests
> enabled by kernel-sample.scc. So it needs statement,
> KERNEL_FEATURES_append += " kernel-sample/kernel-sample.scc" in
> local.conf.
> 
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta/lib/oeqa/runtime/cases/ksample.py | 440
> +++++++++++++++++++++++++++++++++
>  1 file changed, 440 insertions(+)
>  create mode 100644 meta/lib/oeqa/runtime/cases/ksample.py
[...]
> +        # check config
> +        status, ret = self.target.run('zcat /proc/config.gz | grep CONFIG_TRACING_SUPPORT')
> +        result = "CONFIG_TRACING_SUPPORT=y" in ret
> +        if not result:
> +            self.skipTest("CONFIG error")
> +        # make sure if module exists
> +        status, ret = self.target.run('uname -r')
> +        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/trace_events/trace-events-sample.ko"
> +        status, output = self.target.run(cmd)
> +        if status != 0:
> +            self.skipTest("trace-events-sample.ko doesn't exist")


There looks to be a fair bit of copy and paste code in these tests such
as the code above to look at config.gz. Could you turn some of these
into shared functions please?

Also, do we want to include this kernel-sample feature to the qemu
machines by default so that we enable these tests?

Cheers,

Richard


