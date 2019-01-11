Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7DAD7C0AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 09:22:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0B9M432022694
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Jan 2019 01:22:05 -0800 (PST)
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 11 Jan 2019 01:22:04 -0800
To: <richard.purdie@linuxfoundation.org>
References: <20190104024910.674-1-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <69a099eb-d6ee-5464-ad35-a267895b2e58@windriver.com>
Date: Fri, 11 Jan 2019 17:22:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190104024910.674-1-kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: update test case test_qemu
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
X-List-Received-Date: Fri, 11 Jan 2019 09:22:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/1/4 上午10:49, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> It checks output of mount in wic test case test_qemu. But the outputs are
> different between sysvinit and systemd. Add assertion for systemd.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/lib/oeqa/selftest/cases/wic.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index 36ee5e5a14..a6bc566166 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -627,7 +627,10 @@ class Wic2(WicTestCase):
>           with runqemu('wic-image-minimal', ssh=False) as qemu:
>               cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' ' | sort"
>               status, output = qemu.run_serial(cmd)
> -            self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
> +            if 'sysvinit' in get_bb_var('DISTRO_FEATURES'):
> +                self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
> +            else:
> +                self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
>               cmd = "grep UUID= /etc/fstab"
>               status, output = qemu.run_serial(cmd)
>               self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))


Ping

-- 
Kai Kang


