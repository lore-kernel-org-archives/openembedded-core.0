Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0y9Q-0005MS-Ih for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 17:37:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OGTLWE008610
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:29:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08112-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:29:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OGTDrr008604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:29:14 GMT
Message-ID: <1330100954.5477.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 16:29:14 +0000
In-Reply-To: <f52803bfc127eb77b31587e998f91f296254a205.1330051744.git.lianhao.lu@intel.com>
References: <cover.1330051744.git.lianhao.lu@intel.com>
	<f52803bfc127eb77b31587e998f91f296254a205.1330051744.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] bitbake.conf: Added new variable BBINCLUDES
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
X-List-Received-Date: Fri, 24 Feb 2012 16:37:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-24 at 11:00 +0800, Lianhao Lu wrote:
> The new variable BBINCLUDES contains the file dependency information. It
> exposes the bitbake internal variable '__depends' and '__base_depends'.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/conf/bitbake.conf |    2 ++
>  meta/lib/oe/utils.py   |    9 +++++++++
>  2 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 90e5f7a..04851e5 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -731,3 +731,5 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_
>  
>  MLPREFIX ??= ""
>  MULTILIB_VARIANTS ??= ""
> +
> +BBINCLUDES = "${@oe.utils.get_file_depends(d)}"
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 02d5442..b4dcc4f 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -88,3 +88,12 @@ def param_bool(cfg, field, dflt = None):
>  def inherits(d, *classes):
>      """Return True if the metadata inherits any of the specified classes"""
>      return any(bb.data.inherits_class(cls, d) for cls in classes)
> +
> +def get_file_depends(d):
> +    '''Return the dependent files'''
> +    dep_files = []
> +    depends = d.getVar('__depends', True) or set()
> +    depends = depends.union(d.getVar('__base_depends', True) or set())
> +    for (fn, ctime) in depends:
> +        dep_files.append(os.path.abspath(fn))
> +    return " ".join(dep_files)


My big concern with this is that we're teaching lib/oe about bitbake
internals like the layout and existence of those two variables. I think
we need to do this within bitbake, maybe in ast.py:finalize() just
before we fire the RecipeParsed() event.

Having thought more about it, I think we should call this variable
BBINCLUDED since that more accurately reflects its contents.

Cheers,

Richard






