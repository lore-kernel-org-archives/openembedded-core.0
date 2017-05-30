Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1498171A30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 21:44:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 May 2017 14:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,420,1491289200"; d="scan'208";a="1176244035"
Received: from achiok-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.161.51])
	by fmsmga002.fm.intel.com with ESMTP; 30 May 2017 14:44:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 09:44:51 +1200
Message-ID: <25361915.iMGSdRZ62z@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <809a5f4b005795fd76e2f2b198852ae8a0072022.1496143079.git.daniel@lublin.se>
References: <809a5f4b005795fd76e2f2b198852ae8a0072022.1496143079.git.daniel@lublin.se>
MIME-Version: 1.0
Cc: Daniel Lublin <daniel@lublin.se>
Subject: Re: [PATCH] devtool: deploy-target: Let script continue even if rm fails
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
X-List-Received-Date: Tue, 30 May 2017 21:44:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 30 May 2017 11:17:59 PM NZST Daniel Lublin wrote:
> The remote script is run with `set -e`, so doing rm without -f on a
> $file that is already gone will exit the whole script, failing any
> redeployment. Assume a use case where packages sometimes produces
> certain test binaries stored on volatile media (tmpfs), and where the
> system is occasionally rebooted.
> 
> Signed-off-by: Daniel Lublin <daniel@lublin.se>
> ---
>  scripts/lib/devtool/deploy.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
> index b3730ae833..cdc7db0b29 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -64,7 +64,7 @@ def _prepare_remote_script(deploy, verbose=False, 
dryrun=False, undeployall=Fals
>          lines.append('                rmdir $file > /dev/null 2>&1 || 
true')
>          lines.append('            fi')
>          lines.append('        else')
> -        lines.append('            rm $file')
> +        lines.append('            rm -f $file')
>          lines.append('        fi')
>      lines.append('    done')
>      if not dryrun:
> 

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

