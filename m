Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TvRj7-0007iJ-87 for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 13:04:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GBmtdl023752;
	Wed, 16 Jan 2013 11:48:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20832-02; Wed, 16 Jan 2013 11:48:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GBmoNJ023746
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 16 Jan 2013 11:48:51 GMT
Message-ID: <1358336929.3276.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Date: Wed, 16 Jan 2013 11:48:49 +0000
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
X-List-Received-Date: Wed, 16 Jan 2013 12:04:49 -0000
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
> +
>      if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
>          """
>          If package type is not 'srpm' then add tasks to move archive packages of
> @@ -30,6 +37,10 @@ python () {
>          recrdeptask += ' do_archive_configured_sources '
>          d.setVarFlag('do_build', 'recrdeptask', recrdeptask)
>  
> +        deps = d.getVarFlag('do_archive_scripts_logs', 'deps') or []
> +        deps.append(write_package_task)
> +        d.setVarFlag('do_archive_scripts_logs', 'deps', deps)

Looking at the patch series, this is code introducing users of the
'deps' flag outside of externalsrc.bbclass (which has some nasty reasons
it currently pokes bitbake internals).

I'd like to not introduce usage of the flag so can you please change
these references to things like:

d.appendVarFlag('do_archive_scripts_logs', 'deps', ' do_package_write_' + packaging)

Use of appendVarFlag applies anywhere you currently do a set, append,
set operation, its just neater code and gives us some scope to optmise
the implementation in bitbake at a later date.

This applies to both this patch and the other one.

Thanks,

Richard



