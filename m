Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7D51F71A36
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 16:06:11 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w53G6Aw4020649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 3 Jun 2018 17:06:11 +0100
Message-ID: <7322b07893a6cbd35771d0c132ff907d2ee7a338.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 03 Jun 2018 17:06:10 +0100
In-Reply-To: <1527868891-231168-1-git-send-email-hongzhi.song@windriver.com>
References: <1527868891-231168-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [meta][lib/oeqa][PATCH v2] Meta runtime cases: add testcases for kernel sample
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
X-List-Received-Date: Sun, 03 Jun 2018 16:06:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-01 at 12:01 -0400, Hongzhi.Song wrote:
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
>  meta/lib/oeqa/runtime/cases/ksample.py     | 272
> +++++++++++++++++++++++++++++
>  meta/lib/oeqa/runtime/cases/ksample_abs.py | 272
> +++++++++++++++++++++++++++++
>  2 files changed, 544 insertions(+)
>  create mode 100644 meta/lib/oeqa/runtime/cases/ksample.py
>  create mode 100644 meta/lib/oeqa/runtime/cases/ksample_abs.py
> 
> diff --git a/meta/lib/oeqa/runtime/cases/ksample.py
> b/meta/lib/oeqa/runtime/cases/ksample.py
> new file mode 100644
> index 0000000..719f1a0
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/ksample.py
> @@ -0,0 +1,272 @@
> +import os
> +import time
> +
> +from oeqa.runtime.case import OERuntimeTestCase
> +from oeqa.core.decorator.depends import OETestDepends
> +from oeqa.core.decorator.oeid import OETestID
> +from oeqa.core.decorator.data import skipIfNotFeature
> +
> +class KSample(OERuntimeTestCase):
> +    def send_cmd(self, cmd='', content=''):
> +        comd = cmd + " " + content
> +        status, ret = self.target.run(comd)
> +        msg = '%s failed, %s' % (comd, ret)
> +        self.assertEqual(status, 0, msg=msg)

Looks much better but KSample appears to be duplicated in the two
files. Can you avoid that duplication please!

Cheers,

Richard

