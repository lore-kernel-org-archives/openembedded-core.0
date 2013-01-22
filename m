Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TxgMa-0003Y0-KR for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 17:06:17 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0MFjJAZ025601; Tue, 22 Jan 2013 15:45:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GGHVa0Istqp7; Tue, 22 Jan 2013 15:45:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0MFO8TJ023916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 22 Jan 2013 15:45:13 GMT
Message-ID: <1358869272.6356.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Date: Tue, 22 Jan 2013 15:41:12 +0000
In-Reply-To: <1358856653-17049-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1358856653-17049-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 v3] archiver class: Use tasks instead of pre/post funcs with sstate
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
X-List-Received-Date: Tue, 22 Jan 2013 16:06:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-01-22 at 17:10 +0500, Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> 
> * Add tasks to move sources, script/logs and diff/env files in
>   deploy directory.
> * Enable SSTATE for 'do_archive_scripts_logs' task
> * Enable SSTATE for 'do_dumpdata_create_diff_gz' task
> * SSTATE is not used for sources/patches archiver task because source
>   archive package can result into a very large file. It will be an
>   unnecessary overhead to keep sources in DL_DIR and cached-binaries.
> * If 'SOURCE_ARCHIVE_PACKAGE_TYPE' is 'srpm' then use pre/post functions
>   because in this case we do not want to use tasks to move sources/logs
>   in DEPLOY_DIR. 'do_package_write_rpm' is responsible for handling
>   archiver packages.
> 
> [YOCTO #3449]
> 
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/archive-configured-source.bbclass |   47 ++++++++++++++++++++++--
>  meta/classes/archive-original-source.bbclass   |   47 ++++++++++++++++++++++--
>  meta/classes/archive-patched-source.bbclass    |   47 ++++++++++++++++++++++--
>  meta/classes/archiver.bbclass                  |   40 ++++++++++++++------
>  4 files changed, 161 insertions(+), 20 deletions(-)
> 
> diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
> index 1eaaf4c..ae70be3 100644
> --- a/meta/classes/archive-configured-source.bbclass
> +++ b/meta/classes/archive-configured-source.bbclass
> @@ -8,10 +8,51 @@
>  inherit archiver
>  
>  # Get archiving package with configured sources including patches
> -do_configure[postfuncs] += "do_archive_configured_sources "
> +addtask do_archive_configured_sources after do_configure
>  
>  # Get archiving package with temp(logs) and scripts(.bb and inc files)
> -do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
> +addtask do_archive_scripts_logs after do_package_write_rpm
>  
>  # Get dump date and create diff file 
> -do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
> +addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
> +
> +python () {
> +    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
> +        """
> +        If package type is not 'srpm' then add tasks to move archive packages of
> +        configured sources and scripts/logs in ${DEPLOY_DIR}/sources.
> +        """
> +        d.appendVarFlag('do_compile', 'deps', ['do_archive_configured_sources'])
> +        d.appendVarFlag('do_build', 'recrdeptask', ' do_archive_configured_sources')
> +        d.appendVarFlag('do_build', 'deps', ['do_archive_scripts_logs'])
> +

Did you try using deptask instead of deps as I suggested in the previous
feedback?

Cheers,

Richard





