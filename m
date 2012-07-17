Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrBzz-00049o-Ts
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:55:52 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2012 10:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="194025757"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2012 10:44:30 -0700
Message-ID: <5005A47E.1040403@linux.intel.com>
Date: Tue, 17 Jul 2012 10:44:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342544558.git.andrei@gherzan.ro>
	<e969330666db04439a57a1bada8a315c1f71445a.1342544558.git.andrei@gherzan.ro>
In-Reply-To: <e969330666db04439a57a1bada8a315c1f71445a.1342544558.git.andrei@gherzan.ro>
Subject: Re: [PATCH V4 3/4] connman: Add patches to fix connman on fs with no d_type support
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
X-List-Received-Date: Tue, 17 Jul 2012 17:55:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 10:06 AM, Andrei Gherzan wrote:
> When there is not d_type avalaible on filesystem, fstatat (stat)
> can be used to check if the path is a directory.
> storage.c and timezone.c were modified accordingly.
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>   ...If-there-is-no-d_type-support-use-fstatat.patch |   57 ++++++++++++++++++++
>   ...If-there-is-no-d_type-support-use-fstatat.patch |   45 ++++++++++++++++
>   meta/recipes-connectivity/connman/connman_1.3.bb   |    6 ++-
>   3 files changed, 106 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
>   create mode 100644 meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
>

These patches are missing Upstream-Status: and SOBs.

Thanks
	Sau!
> diff --git a/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch b/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
> new file mode 100644
> index 0000000..2e2f615
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
> @@ -0,0 +1,57 @@
> +From f2094e6b2e4542adf458d8fa58d7bccd5edb762e Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei@gherzan.ro>
> +Date: Tue, 17 Jul 2012 17:27:39 +0300
> +Subject: [PATCH V3 1/2] timezone.c: If there is no d_type support use
> + fstatat()
> +
> +This is useful for filesystems where d_type is always DT_UNKNOWN.
> +In this case use fstatat() function.
> +---
> + src/timezone.c |   24 ++++++++++++++++++++++++
> + 1 file changed, 24 insertions(+)
> +
> +diff --git a/src/timezone.c b/src/timezone.c
> +index 173d658..f951f6b 100644
> +--- a/src/timezone.c
> ++++ b/src/timezone.c
> +@@ -157,6 +157,8 @@ static char *find_origin(void *src_map, struct stat *src_st,
> + 	DIR *dir;
> + 	struct dirent *d;
> + 	char *str, pathname[PATH_MAX];
> ++	struct stat buf;
> ++	int ret;
> +
> + 	if (subpath == NULL)
> + 		strncpy(pathname, basepath, sizeof(pathname));
> +@@ -205,6 +207,28 @@ static char *find_origin(void *src_map, struct stat *src_st,
> + 				return str;
> + 			}
> + 			break;
> ++		case DT_UNKNOWN:
> ++			/*
> ++			 * If there is no d_type support use stat()
> ++			 * to check if directory
> ++			 */
> ++			ret = fstatat(dirfd(dir), d->d_name, &buf, 0);
> ++			if (ret < 0)
> ++				continue;
> ++			if (!(buf.st_mode & S_IFDIR))
> ++				continue;
> ++			if (subpath == NULL)
> ++				strncpy(pathname, d->d_name, sizeof(pathname));
> ++			else
> ++				snprintf(pathname, sizeof(pathname),
> ++						"%s/%s", subpath, d->d_name);
> ++
> ++			str = find_origin(src_map, src_st, basepath, pathname);
> ++			if (str != NULL) {
> ++				closedir(dir);
> ++				return str;
> ++			}
> ++			break;
> + 		}
> + 	}
> +
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
> new file mode 100644
> index 0000000..0103e60
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
> @@ -0,0 +1,45 @@
> +From 7007ef32a959ac4717c19339a24fd90a68638a19 Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei@gherzan.ro>
> +Date: Tue, 17 Jul 2012 16:07:17 +0300
> +Subject: [PATCH V3 2/2] storage.c: If there is no d_type support use
> + fstatat()
> +
> +This is useful for filesystems where d_type is always DT_UNKNOWN.
> +In this case use fstatat() function.
> +---
> + src/storage.c |   19 +++++++++++++++++++
> + 1 file changed, 19 insertions(+)
> +
> +diff --git a/src/storage.c b/src/storage.c
> +index 47bd0cb..0491a52 100644
> +--- a/src/storage.c
> ++++ b/src/storage.c
> +@@ -206,6 +206,25 @@ gchar **connman_storage_get_services()
> +
> + 			g_string_append_printf(result, "%s/", d->d_name);
> + 			break;
> ++		case DT_UNKNOWN:
> ++			/*
> ++			 * If there is no d_type support use stat()
> ++			 * to check if directory
> ++			 */
> ++			ret = fstatat(dirfd(dir), d->d_name, &buf, 0);
> ++			if (ret < 0)
> ++				continue;
> ++			if (!(buf.st_mode & S_IFDIR))
> ++				continue;
> ++			str = g_strdup_printf("%s/%s/settings", STORAGEDIR,
> ++							d->d_name);
> ++			ret = stat(str, &buf);
> ++			g_free(str);
> ++			if (ret < 0)
> ++				continue;
> ++
> ++			g_string_append_printf(result, "%s/", d->d_name);
> ++			break;
> + 		}
> + 	}
> +
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-connectivity/connman/connman_1.3.bb b/meta/recipes-connectivity/connman/connman_1.3.bb
> index 1e3d138..a98b46c 100644
> --- a/meta/recipes-connectivity/connman/connman_1.3.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.3.bb
> @@ -5,6 +5,8 @@ SRCREV = "3c0fa84091524c7cd6237744f2088ffee2f1d5ad"
>   SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
>               file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
>               file://add_xuser_dbus_permission.patch \
> -            file://connman"
> +            file://connman \
> +            file://0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch \
> +            file://0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch"
>   S = "${WORKDIR}/git"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>



