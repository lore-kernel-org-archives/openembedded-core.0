Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 080B971A30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 21:48:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 May 2017 14:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,420,1491289200"; d="scan'208";a="1176245180"
Received: from achiok-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.161.51])
	by fmsmga002.fm.intel.com with ESMTP; 30 May 2017 14:48:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Daniel Lublin <daniel@lublin.se>
Date: Wed, 31 May 2017 09:48:02 +1200
Message-ID: <1861530.boQY0dQVon@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <2c1e2d8665b76fcc438deeab9f98df1e15fd8053.1496155243.git.daniel@lublin.se>
References: <2c1e2d8665b76fcc438deeab9f98df1e15fd8053.1496155243.git.daniel@lublin.se>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: deploy-target: Don't use find -exec
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
X-List-Received-Date: Tue, 30 May 2017 21:48:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Daniel,

On Wednesday, 31 May 2017 2:40:43 AM NZST Daniel Lublin wrote:
> find may be provided by busybox, which might be compiled without support
> for -exec.
> 
> Signed-off-by: Daniel Lublin <daniel@lublin.se>
> ---
>  scripts/lib/devtool/deploy.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
> index b3730ae833..af367d2985 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -119,7 +119,10 @@ def _prepare_remote_script(deploy, verbose=False, 
dryrun=False, undeployall=Fals
>          # Put any preserved files back
>          lines.append('if [ -d $preservedir ] ; then')
>          lines.append('    cd $preservedir')
> -        lines.append('    find . -type f -exec mv {} /{} \;')
> +        lines.append('    find . -type f | while read file')
> +        lines.append('    do')
> +        lines.append('        mv $file /$file')
> +        lines.append('    done')
>          lines.append('    cd /')
>          lines.append('    rm -rf $preservedir')
>          lines.append('fi')
> 

Looks good, but could you please add a short comment above this just to make 
it obvious why we are doing it this way?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

