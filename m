Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 41C6661222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 17:11:39 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2013 10:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,895,1367996400"; d="scan'208";a="282913436"
Received: from unknown (HELO [10.255.14.106]) ([10.255.14.106])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2013 10:11:39 -0700
Message-ID: <520E5D4B.5020201@linux.intel.com>
Date: Fri, 16 Aug 2013 10:11:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: wenzong.fan@windriver.com
References: <cover.1376377523.git.wenzong.fan@windriver.com>
	<27b0ee9bd74b6c95c3ddd11b673a56d8543cd5d6.1376377523.git.wenzong.fan@windriver.com>
In-Reply-To: <27b0ee9bd74b6c95c3ddd11b673a56d8543cd5d6.1376377523.git.wenzong.fan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] oe/path.py: call /bin/cp directly
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
X-List-Received-Date: Fri, 16 Aug 2013 17:11:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2013 12:09 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> This avoids running cp with interactive mode if defined:
>
>      alias cp='cp -i'
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   meta/lib/oe/path.py |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> index da044ba..6933977 100644
> --- a/meta/lib/oe/path.py
> +++ b/meta/lib/oe/path.py
> @@ -97,7 +97,7 @@ def copyhardlinktree(src, dst):
>           check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>           if os.path.isdir(src):
>               src = src + "/*"
> -        cmd = 'cp -afl %s %s' % (src, dst)
> +        cmd = '/bin/cp -afl %s %s' % (src, dst)

As Richard points out in the Consolidated Pull, this is the wrong way to 
go about this, there are possibly other places that will have similar 
issues and we can't fix then all this way.

A better solution is to add a sanity check and suggest that the user 
needs to fix their environment to ensure the build will succeed.

Sau!
>           check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>       else:
>           copytree(src, dst)
>

