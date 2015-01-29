Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B3E1F6012B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 17:43:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jan 2015 09:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,487,1418112000"; d="scan'208";a="658724843"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.57])
	([10.219.4.57])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2015 09:43:27 -0800
Message-ID: <54CA7145.1090605@linux.intel.com>
Date: Thu, 29 Jan 2015 11:43:33 -0600
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1422498020.git.Qi.Chen@windriver.com>
	<b35561e993f50d52ae592feddd907881b940f312.1422498020.git.Qi.Chen@windriver.com>
In-Reply-To: <b35561e993f50d52ae592feddd907881b940f312.1422498020.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] package_manager.py: fix rootfs failure with multilib enabled
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
X-List-Received-Date: Thu, 29 Jan 2015 17:43:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chen,

I tested the patch and is ok can contain (when merge),

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>

Also the same issue is presented in dizzy and the patch needs to be 
backported.

Best regards,
     alimon

On 28/01/15 20:22, Chen Qi wrote:
> With the current code, if we use debian package backend and enable
> multilib support, the do_rootfs process would always fail with error
> messages like below.
>
>      E: Unable to locate package packagegroup-core-boot
>
> This patch fixes the above problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/lib/oe/package_manager.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 69100f1..6f49c69 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -1723,9 +1723,12 @@ class DpkgPM(PackageManager):
>               with open(self.d.expand("${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample")) as apt_conf_sample:
>                   for line in apt_conf_sample.read().split("\n"):
>                       match_arch = re.match("  Architecture \".*\";$", line)
> +                    architectures = ""
>                       if match_arch:
>                           for base_arch in base_arch_list:
> -                            apt_conf.write("  Architecture \"%s\";\n" % base_arch)
> +                            architectures += "\"%s\";" % base_arch
> +                        apt_conf.write("  Architectures {%s};\n" % architectures);
> +                        apt_conf.write("  Architecture \"%s\";\n" % base_archs)
>                       else:
>                           line = re.sub("#ROOTFS#", self.target_rootfs, line)
>                           line = re.sub("#APTCONF#", self.apt_conf_dir, line)


