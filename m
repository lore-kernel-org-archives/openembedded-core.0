Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S1yA0-0005zB-Kb for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 11:50:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1RAg4us025991
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 10:42:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24840-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 10:41:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1RAfnsc025985
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 10:41:53 GMT
Message-ID: <1330339310.4593.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 27 Feb 2012 10:41:50 +0000
In-Reply-To: <62993ba45601c619fad5813647787b7fdbc17f7d.1330329283.git.dongxiao.xu@intel.com>
References: <cover.1330329283.git.dongxiao.xu@intel.com>
	<62993ba45601c619fad5813647787b7fdbc17f7d.1330329283.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] bitbake.conf: Add DATE and TIME to BB_HASH_WHITELIST
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
X-List-Received-Date: Mon, 27 Feb 2012 10:50:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-02-27 at 15:58 +0800, Dongxiao Xu wrote:
> DATE and TIME are not needed when calculating cache's hash value.
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  meta/conf/bitbake.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 7d0e0d8..d817bcc 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -736,7 +736,7 @@ BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
>  
>  # Setup our default hash policy
>  BB_SIGNATURE_HANDLER ?= "OEBasic"
> -BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN"
> +BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN DATE TIME"
>  
>  MLPREFIX ??= ""
>  MULTILIB_VARIANTS ??= ""

I think this patch highlights a major difference between your hashing
policy for bitbake's base configuration cache and the hash policy needed
for the signatures and other sstate related pieces.

With siggen, we know we have a target variable (usually a task like
do_compile) and we figure out all its dependencies which we create a
hash of. Its perfectly valid to have that hash depend on DATE or TIME,
if it uses them and we don't want to exclude them.

For the base configuration cache, we don't want to depend on DATE or
TIME. We also don't have one target variable to figure out the
dependencies for, we need to hash every variable with some exclusion
list.

My point is therefore that the above list is very different to the one
bitbake needs for its cache's hash. With that in mind, we probably need
to add a new variable which does something like:

BB_HASHCONFIG_WHITELIST ?= "DATE TIME ${BB_HASHBASE_WHITELIST}"

?

Cheers,

Richard





