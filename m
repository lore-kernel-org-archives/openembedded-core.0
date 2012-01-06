Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rj9de-000216-41 for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 14:15:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06D7sHC020682
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 13:07:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20193-04 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 13:07:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06D7mIK020676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 13:07:48 GMT
Message-ID: <1325855269.20759.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 13:07:49 +0000
In-Reply-To: <93c736cc566ed205d532bea9390d64bec86f8dae.1325302234.git.lianhao.lu@intel.com>
References: <cover.1325302234.git.lianhao.lu@intel.com>
	<93c736cc566ed205d532bea9390d64bec86f8dae.1325302234.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PRService/meta V2 2/3] package.bbclass: per recipe PRSERV_HOST support
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
X-List-Received-Date: Fri, 06 Jan 2012 13:15:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-12-31 at 11:31 +0800, Lianhao Lu wrote:
> [YOCTO #1126]
> Added per recipe PRSERV_HOST PRSERV_PORT support.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/classes/package.bbclass |    8 ++++++++
>  meta/conf/bitbake.conf       |    2 +-
>  2 files changed, 9 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 65e6571..f8f0a12 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -350,6 +350,14 @@ def runtime_mapping_rename (varname, d):
>  #
>  
>  python package_get_auto_pr() {
> +	# per recipe PRSERV_HOST PRSERV_PORT
> +	pn = d.getVar('PN', True)
> +	host = d.getVar("PRSERV_HOST_" + pn, True)
> +	port = d.getVar("PRSERV_PORT_" + pn, True)
> +	if not (host is None):
> +		d.setVar("PRSERV_HOST", host)
> +	if not (port is None):
> +		d.setVar("PRSERV_PORT", port)
>  	if d.getVar('USE_PR_SERV', True) != "0":
>  		try:
>  			auto_pr=prserv_get_pr_auto(d)
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 31a722e..6b1744f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -190,7 +190,7 @@ BP = "${BPN}-${PV}"
>  #
>  # network based PR service
>  #
> -USE_PR_SERV = "${@[1,0][((d.getVar('PRSERV_HOST',1) is None) or (d.getVar('PRSERV_PORT',1) is None)) and (d.getVar('PRSERV_LOCKDOWN',1) is None)]}"
> +USE_PR_SERV = "${@[1,0][((d.getVar('PRSERV_HOST',1) is None) or (d.getVar('PRSERV_HOST',1) == "") or (d.getVar('PRSERV_PORT',1) is None) or (d.getVar('PRSERV_PORT',1) == "")) and (d.getVar('PRSERV_LOCKDOWN',1) is None)]}"

Instead of:

(d.getVar('PRSERV_HOST',1) is None) or (d.getVar('PRSERV_HOST',1) == "")

you should just be able to say

(not d.getVar('PRSERV_HOST', True))

since both None and "" evaluate to False.

Please also use True instead of 1 and False instead of 0. I appreciate
there are bad examples around but we're trying to clean them up.

Cheers,

Richard




