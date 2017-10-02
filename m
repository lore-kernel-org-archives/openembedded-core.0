Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id EE95E77B27
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 17:19:53 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 02 Oct 2017 10:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,470,1500966000"; d="scan'208";a="158472055"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2017 10:19:54 -0700
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <20171002165631.12423-1-otavio@ossystems.com.br>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1ee400f9-4d4a-4c89-1961-fbf1bd7eddc2@linux.intel.com>
Date: Mon, 2 Oct 2017 20:16:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171002165631.12423-1-otavio@ossystems.com.br>
Subject: Re: [PATCH v5] lib/oe/package_manager.py (rpm): Allow use of non-signed packages
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
X-List-Received-Date: Mon, 02 Oct 2017 17:19:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/02/2017 07:56 PM, Otavio Salvador wrote:

> @@ -548,11 +548,13 @@ class RpmPM(PackageManager):
>           if feed_uris == "":
>               return
>   
> +        gpg_opts = ''
>           if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
> -            gpg_opts = 'repo_gpgcheck=1\n'
> +            gpg_opts += 'repo_gpgcheck=1\n'
>               gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
> -        else:
> -            gpg_opts = ''
> +
> +        if self.d.getVar('RPM_SIGN_PACKAGES') == '0':
> +            gpg_opts += 'gpgcheck=0\n'
>   
>           bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
>           remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
> 

This one looks good, thanks for persevering :)

Alex

