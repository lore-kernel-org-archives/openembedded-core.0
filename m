Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E67D66014F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 14:57:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2016 07:57:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718905227"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.155])
	([10.219.5.155])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 07:57:28 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20160614140357.6145-1-Martin.Jansa@gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <3308ab50-4cd1-c480-0fbb-c189159973a8@linux.intel.com>
Date: Tue, 14 Jun 2016 09:59:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20160614140357.6145-1-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] icecc.bbclass: replace os.popen with subprocess.check_output
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
X-List-Received-Date: Tue, 14 Jun 2016 14:57:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 06/14/2016 09:03 AM, Martin Jansa wrote:
> * otherwise there is a lot of warnings about missing close on file descriptor
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/classes/icecc.bbclass | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index e1c06c4..cb44007 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -47,7 +47,8 @@ def get_cross_kernel_cc(bb,d):
>   
>       # evaluate the expression by the shell if necessary
>       if '`' in kernel_cc or '$(' in kernel_cc:
> -        kernel_cc = os.popen("echo %s" % kernel_cc).read()[:-1]
> +        import subprocess
There are two imports like this, would it make sense to place just once 
on top?

Also, now that we switch to subprocess.check_output, I wonder if we need 
to convert it to string (the output of this method) before proceeding.
> +        kernel_cc = subprocess.check_output("echo %s" % kernel_cc, shell=True)
>   
>       kernel_cc = d.expand(kernel_cc)
>       kernel_cc = kernel_cc.replace('ccache', '').strip()
> @@ -220,9 +221,14 @@ def icecc_get_and_check_tool(bb, d, tool):
>       # PATH or icecc-create-env script will silently create an invalid
>       # compiler environment package.
>       t = icecc_get_tool(bb, d, tool)
> -    if t and os.popen("readlink -f %s" % t).read()[:-1] == get_icecc(d):
> -        bb.error("%s is a symlink to %s in PATH and this prevents icecc from working" % (t, get_icecc(d)))
> -        return ""
> +    if t:
> +        import subprocess
> +        link_path = subprocess.check_output("readlink -f %s" % t, shell=True)
> +        if link_path == get_icecc(d):
> +            bb.error("%s is a symlink to %s in PATH and this prevents icecc from working" % (t, get_icecc(d)))
> +            return ""
> +        else:
> +            return t
>       else:
>           return t
>   


