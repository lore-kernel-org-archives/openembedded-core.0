Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3FA660767
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:33:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I3XFgQ000736
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:33:15 -0700 (PDT)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 20:33:14 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1500348040.git.liezhi.yang@windriver.com>
	<ca9c07df013e7bad906842f21ea4372cd534f19d.1500348040.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <a1e399d3-57fa-94f8-7488-dddef99777e7@windriver.com>
Date: Tue, 18 Jul 2017 11:33:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <ca9c07df013e7bad906842f21ea4372cd534f19d.1500348040.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 4/5] runqemu: validate combos
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
X-List-Received-Date: Tue, 18 Jul 2017 03:33:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/18/2017 11:21 AM, Robert Yang wrote:
> Error out ealier if the combos is invalid, e.g.:
> $ runqemu tmp/deploy/images/qemux86/bzImage-qemux86.bin tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic
>
> This will fail at kernel panic, no we check and error out early. We can
> add other checkings in the future.
>
> [YOCTO #11286]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/runqemu | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index bdb559f82ff..e9ed890bb27 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1209,6 +1209,10 @@ class BaseConfig(object):
>              self.bitbake_e = ''
>              logger.warn("Couldn't run 'bitbake -e' to gather environment information:\n%s" % err.output.decode('utf-8'))
>
> +    def validate_combos(self):
> +        if (self.fstype in self.vmtypes) and self.kernel:
> +            raise Exception("%s doesn't need kernel %s!" % (self.fstype, self.kernel))

I just found that here should be raise RunQemuError(), updated it in the repo.

// Robert

> +
>      @property
>      def bindir_native(self):
>          result = self.get('STAGING_BINDIR_NATIVE')
> @@ -1240,6 +1244,8 @@ def main():
>          config.check_args()
>          config.read_qemuboot()
>          config.check_and_set()
> +        # Check whether the combos is valid or not
> +        config.validate_combos()
>          config.print_config()
>          config.setup_network()
>          config.setup_rootfs()
>

