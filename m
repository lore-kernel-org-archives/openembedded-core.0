Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C00C7198E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 23:53:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7FNrk3Q028168
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 16:53:47 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 16:53:46 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20170815214002.55130-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <62f0c732-87f3-9af6-3380-b9fd863f216c@windriver.com>
Date: Tue, 15 Aug 2017 18:53:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170815214002.55130-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [PATCH] gpg_sign: perform rpm signing serially
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
X-List-Received-Date: Tue, 15 Aug 2017 23:53:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It would probably be better if this was configurable with a 'safe' default.

Moving from parallel to single will greatly affect the overall performance on
larger build machines (lots of memory and cores) that can handle the load vs a
typical development machine.

--Mark

On 8/15/17 4:40 PM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> gpg signing in file batches (which was default to 100) is a memory expensive
> computation, causing trouble in some host machines (even on production AB
> as seen on the bugzilla ID). Also, in terms of performance, there is no real
> gain when rpm signing is done in batches. Considering the latter issues, perform the
> rpm signing serially.
> 
> Log showing errors observed recently at AB workers:
> 
>     | gpg: signing failed: Cannot allocate memory
>     | gpg: signing failed: Cannot allocate memory
>     | error: gpg exec failed (2)
>     | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.5.29-r0/deploy-rpms/core2_64/base-passwd-dev-3.5.29-r0.core2_64.rpm:
> 
> [YOCTO #11914]
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/lib/oe/gpg_sign.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index f4d8b10e4b..5c7985a856 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -45,9 +45,9 @@ class LocalSigner(object):
>              if fsk_password:
>                  cmd += "--define '_file_signing_key_password %s' " % fsk_password
>  
> -        # Sign in chunks of 100 packages
> -        for i in range(0, len(files), 100):
> -            status, output = oe.utils.getstatusoutput(cmd + ' '.join(files[i:i+100]))
> +        # Sign packages
> +        for f in files:
> +            status, output = oe.utils.getstatusoutput(cmd + ' ' + f)
>              if status:
>                  raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output)
>  
> 


