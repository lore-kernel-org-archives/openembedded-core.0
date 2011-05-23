Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QOWKl-0005PA-3R for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 16:42:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4NEdFIB018310
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 15:39:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12569-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 15:39:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4NEd9Ff018295
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 15:39:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <ba11e66609ecaad27a4c225ee1e21d60a330d8f9.1306089781.git.sgw@linux.intel.com>
References: <cover.1306089781.git.sgw@linux.intel.com>
	<ba11e66609ecaad27a4c225ee1e21d60a330d8f9.1306089781.git.sgw@linux.intel.com>
Date: Mon, 23 May 2011 15:39:07 +0100
Message-ID: <1306161547.3424.853.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/9] package_rpm.bbclass: create method for createrepo cmd
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
X-List-Received-Date: Mon, 23 May 2011 14:42:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

A couple of comments:

Firstly the commit message says what you changed, not why...

On Sun, 2011-05-22 at 11:48 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/package_rpm.bbclass |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 1d8c686..666eb54 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -15,6 +15,10 @@ python package_rpm_install () {
>  	bb.fatal("package_rpm_install not implemented!")
>  }
>  
> +package_createrepo () {
> +	createrepo ${DEPLOY_DIR_RPM}
> +}
> +
>  RPMCONF_TARGET_BASE = "${DEPLOY_DIR_RPM}/solvedb"
>  RPMCONF_HOST_BASE = "${DEPLOY_DIR_RPM}/solvedb-sdk"
>  #
> @@ -816,6 +820,6 @@ python do_package_write_rpm () {
>  do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
>  addtask package_write_rpm before do_package_write after do_package
>  
> -PACKAGEINDEXES += "package_update_index_rpm; createrepo ${DEPLOY_DIR_RPM};"
> +PACKAGEINDEXES += "package_update_index_rpm; package_createrepo"

Secondly this should end in a ;. I'd just add the
package_update_index_rpm call to package_createrepo to be honest.
package_createrepo could also do with rpm in the name somewhere just to
we're reminded its rpm specific in other contexts.

Cheers,

Richard



