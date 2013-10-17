Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A849160EB6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 06:54:11 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Oct 2013 23:54:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,512,1378882800"; d="scan'208";a="308937494"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Oct 2013 23:54:12 -0700
Date: Thu, 17 Oct 2013 09:54:11 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Konrad Scherer <konrad.scherer@windriver.com>
Message-ID: <20131017065410.GA11504@lpalcu-linux>
References: <1381938299-19599-1-git-send-email-konrad.scherer@windriver.com>
	<1381938299-19599-2-git-send-email-konrad.scherer@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1381938299-19599-2-git-send-email-konrad.scherer@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] relocate_sdk.py: Allow script to work with Python 2.4 and 3.
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
X-List-Received-Date: Thu, 17 Oct 2013 06:54:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2013 at 11:44:59AM -0400, Konrad Scherer wrote:
> From: Konrad Scherer <Konrad.Scherer@windriver.com>
> 
> Python 2.4 does not support the 'b' string literal or the
> keyword 'as' in exception handling. Python 3 does not accept
> the old method of exception handling and defaults to unicode.
> The b() function converts strings to bytes on Python 3 and
> using sys.exc_info() avoids the exception handling syntax.
> 
> Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
> ---
>  scripts/relocate_sdk.py | 43 ++++++++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
> index fe6e4e0..a15302d 100755
> --- a/scripts/relocate_sdk.py
> +++ b/scripts/relocate_sdk.py
> @@ -31,7 +31,15 @@ import os
>  import re
>  import errno
>  
> -old_prefix = re.compile(b"##DEFAULT_INSTALL_DIR##")
> +if sys.version < '3':
> +    def b(x):
> +        return x
> +else:
> +    import codecs
I can drop this import.

Thanks,
Laurentiu

> +    def b(x):
> +        return x.encode(sys.getfilesystemencoding())
> +
> +old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
>  


