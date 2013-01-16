Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TvRaZ-00077L-0I for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 12:55:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GBe5O8023674;
	Wed, 16 Jan 2013 11:40:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20832-01; Wed, 16 Jan 2013 11:40:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GBdp4j023656
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 16 Jan 2013 11:39:54 GMT
Message-ID: <1358336389.3276.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Date: Wed, 16 Jan 2013 11:39:49 +0000
In-Reply-To: <1358171300-970-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1358171300-970-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2 v2] archive-*-source.bbclass: Handle all package classes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 11:55:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-14 at 18:48 +0500, Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> 
> * Add archiver tasks correctly for any 'IMAGE_PKGTYPE'.
> 
> [YOCTO #3449]
> 
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/archive-configured-source.bbclass |   15 +++++++++++++--
>  meta/classes/archive-original-source.bbclass   |   15 +++++++++++++--
>  meta/classes/archive-patched-source.bbclass    |   15 +++++++++++++--
>  3 files changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
> index 64799e3..50838e6 100644
> --- a/meta/classes/archive-configured-source.bbclass
> +++ b/meta/classes/archive-configured-source.bbclass
> @@ -11,12 +11,19 @@ inherit archiver
>  addtask do_archive_configured_sources after do_configure
>  
>  # Get archiving package with temp(logs) and scripts(.bb and inc files)
> -addtask do_archive_scripts_logs after do_package_write_rpm
> +addtask do_archive_scripts_logs
>  
>  # Get dump date and create diff file 
> -addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
> +addtask do_dumpdata_create_diff_gz before do_build
>  
>  python () {
> +    packaging = d.getVar('IMAGE_PKGTYPE', True)
> +    write_package_task = 'do_package_write_' + packaging
> +
> +    deps = d.getVarFlag('do_dumpdata_create_diff_gz', 'deps') or []
> +    deps.append(write_package_task)
> +    d.setVarFlag('do_dumpdata_create_diff_gz', 'deps', deps)

I'd not previously noticed bitbake was exposing this "deps" flag as a
list. I'd previously assumed we interacted with strings through the
deptask flag so we'd use something like:

d.appendVarFlag('do_dumpdata_create_diff_gz', 'deptask', ' do_package_write_' + packaging)

We should probably make a decision whether deps is meant to be exposed
or whether we should be using deptask. I appreciate this patch isn't at
fault, its the archiver code in general doing this. I agree the API is
less optimal using strings but it is also more consistent with every
other set of flags...

Cheers,

Richard






