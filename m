Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F33466F57F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:02:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s23F2bSN020089
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Mar 2014 07:02:37 -0800 (PST)
Received: from [147.11.119.201] (147.11.119.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 3 Mar 2014 07:02:37 -0800
Message-ID: <5314998B.8050102@windriver.com>
Date: Mon, 3 Mar 2014 09:02:35 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1393839480.git.laurentiu.palcu@intel.com>
	<bb06f92710d0567d5019cf13d6c11caa1fc91d32.1393839480.git.laurentiu.palcu@intel.com>
In-Reply-To: <bb06f92710d0567d5019cf13d6c11caa1fc91d32.1393839480.git.laurentiu.palcu@intel.com>
Subject: Re: [PATCH 2/2] package_manager.py: RpmPM: don't add smart channel if already added
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
X-List-Received-Date: Mon, 03 Mar 2014 15:02:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/3/14, 3:43 AM, Laurentiu Palcu wrote:
> Make sure the channel was not already added, before attempting to add.
>
> [YOCTO #5890]

When generating the rootfs/etc/rpm/platform file, the order should be in the 
order of highest to lowest priority as well.

Smart uses this order (via an RPM API) to help determine scores when two 
packages from repositories at the same priority (with different architectures) 
are selected.

--Mark

> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>   meta/lib/oe/package_manager.py |    6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 6c133c3..ee42952 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -604,11 +604,11 @@ class RpmPM(PackageManager):
>           # self._invoke_smart('config --set rpm-log-level=debug')
>           # cmd = 'config --set rpm-log-file=/tmp/smart-debug-logfile'
>           # self._invoke_smart(cmd)
> -
> +        ch_already_added = []
>           for canonical_arch in platform_extra:
>               arch = canonical_arch.split('-')[0]
>               arch_channel = os.path.join(self.deploy_dir, arch)
> -            if os.path.exists(arch_channel):
> +            if os.path.exists(arch_channel) and not arch in ch_already_added:
>                   bb.note('Note: adding Smart channel %s (%s)' %
>                           (arch, channel_priority))
>                   self._invoke_smart('channel --add %s type=rpm-md baseurl=%s -y'
> @@ -617,6 +617,8 @@ class RpmPM(PackageManager):
>                                      (arch, channel_priority))
>                   channel_priority -= 5
>
> +                ch_already_added.append(arch)
> +
>           bb.note('adding Smart RPM DB channel')
>           self._invoke_smart('channel --add rpmsys type=rpm-sys -y')
>
>


