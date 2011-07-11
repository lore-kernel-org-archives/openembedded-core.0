Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QgJov-0004rO-Pt
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 18:58:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 09:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,516,1304319600"; d="scan'208";a="24517762"
Received: from vorpal.jf.intel.com (HELO [10.7.199.64]) ([10.7.199.64])
	by orsmga002.jf.intel.com with ESMTP; 11 Jul 2011 09:55:00 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 09:59:21 -0700
In-Reply-To: <1310399298.20015.969.camel@rex>
References: <1310399298.20015.969.camel@rex>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1310403561.2188.2.camel@vorpal.jf.intel.com>
Mime-Version: 1.0
Subject: Re: [PATCH] sstate: Improve performance by moving files rather than using copy and delete
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2011 16:58:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 16:48 +0100, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Joshua Lock <josh@linux.intel.com>

> ---
>  meta/classes/sstate.bbclass |   16 +++++++++++-----
>  1 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 0daaf48..62c7c43 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -147,6 +147,13 @@ def sstate_install(ss, d):
>  def sstate_installpkg(ss, d):
>      import oe.path
>  
> +    def prepdir(dir):
> +        # remove dir if it exists, ensure any parent directories do exist
> +        if os.path.exists(dir):
> +            oe.path.remove(dir)
> +        bb.mkdirhier(dir)
> +        oe.path.remove(dir)
> +
>      sstateinst = bb.data.expand("${WORKDIR}/sstate-install-%s/" % ss['name'], d)
>      sstatepkg = bb.data.getVar('SSTATE_PKG', d, True) + '_' + ss['name'] + ".tgz"
>  
> @@ -178,9 +185,8 @@ def sstate_installpkg(ss, d):
>              os.system("sed -i -e s:FIXMESTAGINGDIR:%s:g %s" % (staging, sstateinst + file))
>  
>      for state in ss['dirs']:
> -        if os.path.exists(state[1]):
> -            oe.path.remove(state[1])
> -        oe.path.copytree(sstateinst + state[0], state[1])
> +        prepdir(state[1])
> +        os.rename(sstateinst + state[0], state[1])
>      sstate_install(ss, d)
>  
>      for plain in ss['plaindirs']:
> @@ -188,8 +194,8 @@ def sstate_installpkg(ss, d):
>          src = sstateinst + "/" + plain.replace(workdir, '')
>          dest = plain
>          bb.mkdirhier(src)
> -        bb.mkdirhier(dest)
> -        oe.path.copytree(src, dest)
> +        prepdir(dest)
> +        os.rename(src, dest)
>  
>      return True
>  

-- 
Joshua Lock
        Yocto Project "Johannes Factotum"
        Intel Open Source Technology Centre



