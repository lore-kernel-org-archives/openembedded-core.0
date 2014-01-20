Return-Path: <Ting.Wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC8E61011
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 05:29:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0K5TUxH020922
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 21:29:31 -0800 (PST)
Received: from [128.224.158.200] (128.224.158.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 19 Jan 2014 21:29:30 -0800
Message-ID: <52DCB309.4000603@windriver.com>
Date: Mon, 20 Jan 2014 13:24:25 +0800
From: wangting <ting.wang@windriver.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1389255953-8202-1-git-send-email-ting.wang@windriver.com>
In-Reply-To: <1389255953-8202-1-git-send-email-ting.wang@windriver.com>
X-Originating-IP: [128.224.158.200]
Subject: Re: [oeqa][PATCH] lib/oeqa/runtime: add test for gzip
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
X-List-Received-Date: Mon, 20 Jan 2014 05:29:31 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 7bit

Any issues about this case ?

Thanks
Ting

ting.wang@windriver.com wrote:
> From: Ting Wang <ting.wang@windriver.com>
>
> Function tests:
> 1)gzip compress file
> 2)compressed file integrity check
> 3)zcat compress file
> 4)gzip decompress file
> ---
>  meta/classes/testimage.bbclass |    4 ++--
>  meta/lib/oeqa/runtime/gzip.py  |   32 ++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 2 deletions(-)
>  create mode 100644 meta/lib/oeqa/runtime/gzip.py
>
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index 4777e14..0d861e6 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -27,8 +27,8 @@ TEST_LOG_DIR ?= "${WORKDIR}/testimage"
>  
>  DEFAULT_TEST_SUITES = "ping auto"
>  DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
> -DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date rpm smart dmesg python"
> -DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc rpm smart kernelmodule dmesg python"
> +DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date rpm smart dmesg python gzip"
> +DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc rpm smart kernelmodule dmesg python gzip"
>  
>  TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
>  
> diff --git a/meta/lib/oeqa/runtime/gzip.py b/meta/lib/oeqa/runtime/gzip.py
> new file mode 100644
> index 0000000..50e3b8f
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/gzip.py
> @@ -0,0 +1,32 @@
> +import unittest
> +import os
> +from oeqa.oetest import oeRuntimeTest, skipModule
> +from oeqa.utils.decorators import *
> +
> +class GzipFunctionTest(oeRuntimeTest):
> +
> +    @skipUnlessPassed('test_ssh')
> +    def test_gzip_create_testfile(self):
> +        (status, output) = self.target.run('echo It is a test file > /tmp/testfile.gzip')
> +        self.assertEqual(status, 0, msg="gzip test file create failed")
> +
> +    @skipUnlessPassed('test_gzip_create_testfile')
> +    def test_gzip_fun1_compress(self):
> +        (status, output) = self.target.run('gzip /tmp/testfile.gzip')
> +        self.assertEqual(status, 0, msg="gzip compress file failed.")
> +
> +    def test_gzip_fun2_integrity_check(self):
> +        (status, output) = self.target.run('gzip -t /tmp/testfile.gzip.gz')
> +        self.assertEqual(status, 0, msg="Check the compressed file integrity failed")
> +
> +    def test_gzip_fun3_zcat(self):
> +        (status, output) = self.target.run('zcat /tmp/testfile.gzip.gz')
> +        self.assertEqual(output, "It is a test file", msg="Incorrect output: %s" % output)
> +
> +    def test_gzip_fun4_decompress(self):
> +        (status, output) = self.target.run('gunzip /tmp/testfile.gzip.gz && ls /tmp/testfile.gzip')
> +        self.assertEqual(status, 0, msg="gzip decompress file failed.")
> +
> +    @classmethod
> +    def tearDownClass(self):
> +        oeRuntimeTest.tc.target.run("rm /tmp/testfile.gzip")
>   


