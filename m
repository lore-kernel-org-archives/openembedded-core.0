Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoewJ-0006GO-I7
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 20:13:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Jul 2012 11:02:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="163893512"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2012 11:02:23 -0700
Message-ID: <4FFC6E2F.6030806@linux.intel.com>
Date: Tue, 10 Jul 2012 11:02:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341937252.git.paul.eggleton@linux.intel.com>
	<bf72d68147740f83d08227f37d334ac924542e3c.1341937252.git.paul.eggleton@linux.intel.com>
In-Reply-To: <bf72d68147740f83d08227f37d334ac924542e3c.1341937252.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] opkg: fix installation of dev / dbg packages
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
X-List-Received-Date: Tue, 10 Jul 2012 18:13:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2012 09:22 AM, Paul Eggleton wrote:
> OE-Core revision ffe93e2a099e4cadb1829dc12a58a6d7bef9a5a7 moved opkg's
> configuration file into /etc/opkg, and opkg always reads all files under
> this directory even if -f is specified (as it is during do_rootfs in
> order to specify our own generated config file), and this means that
> after opkg-collateral is installed into the rootfs, this version of the
> config is used, resulting in opkg ignoring the list of packages it has
> already downloaded (since it now sees list_dir as /var/lib/opkg instead
> of the default /var/lib/opkg/lists) and thus it fails to install any of
> the "attemptonly" packages (including *-dev, *-dbg, etc.).
>
> If we change the -f option to ignore configuration files in /etc/opkg
> then we no longer have this problem.
>
> Fixes [YOCTO #2595].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   .../recipes-devtools/opkg/opkg/conf_override.patch |   91 ++++++++++++++++++++
>   meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
>   2 files changed, 93 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/opkg/opkg/conf_override.patch
>
Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-devtools/opkg/opkg/conf_override.patch b/meta/recipes-devtools/opkg/opkg/conf_override.patch
> new file mode 100644
> index 0000000..b1698d8
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/conf_override.patch
> @@ -0,0 +1,91 @@
> +From 45d0468f7f9e9be633b2819aa43ab9b6287b8e6a Mon Sep 17 00:00:00 2001
> +From: Paul Eggleton <paul.eggleton@linux.intel.com>
> +Date: Mon, 9 Jul 2012 11:01:15 +0100
> +Subject: [PATCH] Do not read /etc/opkg/*.conf if -f is specified
> +
> +If a configuration file is specified on the command line, we should
> +assume it contains all of the configuration and not try to read the
> +configuration in /etc/opkg.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +---
> + libopkg/opkg_conf.c |   55 ++++++++++++++++++++++++++-------------------------
> + 1 file changed, 28 insertions(+), 27 deletions(-)
> +
> +diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
> +index 4711ce7..1e65bad 100644
> +--- a/libopkg/opkg_conf.c
> ++++ b/libopkg/opkg_conf.c
> +@@ -473,39 +473,40 @@ opkg_conf_load(void)
> + 				&conf->pkg_src_list, &conf->dist_src_list))
> + 			goto err1;
> + 	}
> +-
> +-	if (conf->offline_root)
> +-		sprintf_alloc(&etc_opkg_conf_pattern, "%s/etc/opkg/*.conf", conf->offline_root);
> + 	else {
> +-		const char *conf_file_dir = getenv("OPKG_CONF_DIR");
> +-		if (conf_file_dir == NULL)
> +-			conf_file_dir = OPKG_CONF_DEFAULT_CONF_FILE_DIR;
> +-			sprintf_alloc(&etc_opkg_conf_pattern, "%s/*.conf", conf_file_dir);
> +-	}
> +-
> +-	memset(&globbuf, 0, sizeof(globbuf));
> +-	glob_ret = glob(etc_opkg_conf_pattern, 0, glob_errfunc, &globbuf);
> +-	if (glob_ret && glob_ret != GLOB_NOMATCH) {
> +-		free(etc_opkg_conf_pattern);
> +-		globfree(&globbuf);
> +-		goto err1;
> +-	}
> +-
> +-	free(etc_opkg_conf_pattern);
> ++		if (conf->offline_root)
> ++			sprintf_alloc(&etc_opkg_conf_pattern, "%s/etc/opkg/*.conf", conf->offline_root);
> ++		else {
> ++			const char *conf_file_dir = getenv("OPKG_CONF_DIR");
> ++			if (conf_file_dir == NULL)
> ++				conf_file_dir = OPKG_CONF_DEFAULT_CONF_FILE_DIR;
> ++				sprintf_alloc(&etc_opkg_conf_pattern, "%s/*.conf", conf_file_dir);
> ++		}
> +
> +-	for (i = 0; i < globbuf.gl_pathc; i++) {
> +-		if (globbuf.gl_pathv[i])
> +-			if (conf->conf_file &&
> +-					!strcmp(conf->conf_file, globbuf.gl_pathv[i]))
> +-				continue;
> +-		if ( opkg_conf_parse_file(globbuf.gl_pathv[i],
> +-			&conf->pkg_src_list, &conf->dist_src_list)<0) {
> ++		memset(&globbuf, 0, sizeof(globbuf));
> ++		glob_ret = glob(etc_opkg_conf_pattern, 0, glob_errfunc, &globbuf);
> ++		if (glob_ret && glob_ret != GLOB_NOMATCH) {
> ++			free(etc_opkg_conf_pattern);
> + 			globfree(&globbuf);
> + 			goto err1;
> + 		}
> +-	}
> +
> +-	globfree(&globbuf);
> ++		free(etc_opkg_conf_pattern);
> ++
> ++		for (i = 0; i < globbuf.gl_pathc; i++) {
> ++			if (globbuf.gl_pathv[i])
> ++				if (conf->conf_file &&
> ++						!strcmp(conf->conf_file, globbuf.gl_pathv[i]))
> ++					continue;
> ++			if ( opkg_conf_parse_file(globbuf.gl_pathv[i],
> ++				&conf->pkg_src_list, &conf->dist_src_list)<0) {
> ++				globfree(&globbuf);
> ++				goto err1;
> ++			}
> ++		}
> ++
> ++		globfree(&globbuf);
> ++	}
> +
> + 	if (conf->offline_root)
> + 		sprintf_alloc (&lock_file, "%s/%s", conf->offline_root, OPKGLOCKFILE);
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
> index c07d393..faf0ba3 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -6,6 +6,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
>              file://fix_installorder.patch \
>              file://offline_postinstall.patch\
>              file://track_parents.patch \
> +           file://conf_override.patch \
>   "
>
>   S = "${WORKDIR}/trunk"
> @@ -13,4 +14,4 @@ S = "${WORKDIR}/trunk"
>   SRCREV = "633"
>   PV = "0.1.8+svnr${SRCPV}"
>
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>



