Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 10E8760107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:52:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 12:52:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="85264559"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2017 12:52:06 -0700
To: jose.perez.carranza@linux.intel.com,
	openembedded-core@lists.openembedded.org
References: <20170510193809.2356-1-jose.perez.carranza@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bd532acb-3dda-ac74-37d8-892fc797a407@linux.intel.com>
Date: Wed, 10 May 2017 22:52:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170510193809.2356-1-jose.perez.carranza@linux.intel.com>
Subject: Re: [PATCH] runtime/dnf: Add new dnf test cases
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
X-List-Received-Date: Wed, 10 May 2017 19:52:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2017 10:38 PM, jose.perez.carranza@linux.intel.com wrote:
> +    def test_dnf_installroot(self):
> +        rootpath = '/home/root/chroot/test'
> +        self.dnf_with_repo('install --installroot=%s --allowerasing -v -y busybox run-postinsts' % rootpath)
> +        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
> +        self.assertEqual(0, status, output)

You could also check there that the files from installed packages are 
indeed there (e.g. /home/root/chroot/test/bin/sh and such). Just in case. :)

> +    def test_dnf_exclude(self):
> +        excludepkg = 'run-postinsts-dev'
> +        self.dnf_with_repo('remove -y run-postinsts')
> +        self.dnf_with_repo('install -y --exclude=%s run-postinsts' % excludepkg)
> +        self.dnf('list %s' % excludepkg, 1)

How does this test work? I do not understand. First run-postinsts is 
removed, then it is installed again with --exclude=run-postinsts-dev, 
then we check that run-postinst-dev is not installed. Would it have been 
installed without the --exclude option? Why, if we're only asking for 
run-postinsts?

If it would, should you test that it does indeed happen, to make sure 
there is indeed a difference in the outcome when --exclude is present 
and absent?

Alex


