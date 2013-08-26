Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4876BACB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 15:54:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7QFsnX4011758
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 08:54:49 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 26 Aug 2013 08:54:49 -0700
Message-ID: <521B7A4A.6030306@windriver.com>
Date: Mon, 26 Aug 2013 10:54:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1377477606-17591-1-git-send-email-pab@pabigot.com>
In-Reply-To: <1377477606-17591-1-git-send-email-pab@pabigot.com>
Subject: Re: [PATCH] pseudo: fix memory leak and missed privilege drop
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Aug 2013 15:54:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/13 7:40 PM, Peter A. Bigot wrote:
> From: "Peter A. Bigot" <pab@pabigot.com>
>
> qemu.bbclass adds PSEUDO_UNLOAD=1 in qemu_run_binary to avoid reference to
> pseudo functions that may not exist in the target environment.  This patch
> detects the addition of that variable within the environment to which the
> call applies, even if not present in the parent environment.
>
> As a side effect it fixes a memory leak.

Pseudo maintainer is on vacation this week.. so I'm not sure if he'll respond or 
not.  But I'll take a whack at it.

> [YOCTO #4843]
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>   .../0001-pseudo_has_unload-add-function.patch      |  190 ++++++++++++++++++++
>   meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |    7 +-
>   2 files changed, 195 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch
>
> diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch b/meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch
> new file mode 100644
> index 0000000..b5c81c9
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch
> @@ -0,0 +1,190 @@
> +From be97cb958f2934fa398fc8e344b25b84ebd4e90c Mon Sep 17 00:00:00 2001
> +From: "Peter A. Bigot" <pab@pabigot.com>
> +Date: Sun, 25 Aug 2013 19:22:09 -0500
> +Subject: [PATCH] pseudo_has_unload: add function
> +
> +Various wrappers checked for a non-null pseudo_get_value("PSEUDO_UNLOAD") to
> +determine whether the environment should include the pseudo variables.  None
> +of those checks freed the returned value when it was not null.  The new
> +check function does.
> +
> +The new check function also sees whether PSEUDO_UNLOAD was defined in the
> +environment that should be used in the wrapped system call.  This allows
> +pkg_postinst scripts to strip out the LD_PRELOAD setting, for example before
> +invoking qemu to execute commands in an environment that does not have
> +libpseudo.so.
> +
> +[YOCTO #4843]
> +
> +Upstream-Status: Pending
> +Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> +---
> + ports/common/guts/execv.c              |    2 +-
> + ports/common/guts/execve.c             |    2 +-
> + ports/common/guts/execvp.c             |    2 +-
> + ports/common/guts/fork.c               |    2 +-
> + ports/linux/newclone/pseudo_wrappers.c |    2 +-
> + ports/linux/oldclone/pseudo_wrappers.c |    2 +-
> + ports/unix/guts/popen.c                |    2 +-
> + ports/unix/guts/system.c               |    2 +-
> + pseudo.h                               |    1 +
> + pseudo_util.c                          |   27 +++++++++++++++++++++++++++
> + 10 files changed, 36 insertions(+), 8 deletions(-)
> +
> +diff --git a/ports/common/guts/execv.c b/ports/common/guts/execv.c
> +index 763e1f9..3e1f820 100644
> +--- a/ports/common/guts/execv.c
> ++++ b/ports/common/guts/execv.c
> +@@ -19,7 +19,7 @@
> + 	}
> +
> + 	pseudo_setupenv();
> +-	if (pseudo_get_value("PSEUDO_UNLOAD"))
> ++	if (pseudo_has_unload(NULL))

Ya, there is definitely a memory leak here.. the pseudo_get_value says:

/* Caller must free memory! */
char *
pseudo_get_value(const char *key) {


....

> +diff --git a/pseudo_util.c b/pseudo_util.c
> +index 8d0969e..16c70e0 100644
> +--- a/pseudo_util.c
> ++++ b/pseudo_util.c
> +@@ -95,6 +95,33 @@ dump_env(char **envp) {
> + }
> + #endif
> +
> ++int
> ++pseudo_has_unload(char * const *envp) {
> ++	static const char unload[] = "PSEUDO_UNLOAD";
> ++	static size_t unload_len = strlen(unload);
> ++	size_t i = 0;
> ++
> ++	/* Is it in the caller environment? */
> ++	if (NULL != getenv(unload))
> ++		return 1;

We actually want to use the pseudo_get_value as that ensures that the internal 
environment configuration is sane at all times.  The issue is that applications 
can do odd things to the environment, and just checking the environment itself 
may not always give sane results.

The rule for variables is:

* PSEUDO Variables are loaded ASAP into a cache.  This way if the user or 
program clear or modify the environment we maintain the variable.

* To 'reset' the variables to different values an exec needs to be performed. 
(Prior to the exec we also restore any missing variables that have been cached 
to the environment.)

-however- PSEUDO_UNLOAD is supposed to be special and acted on at the vary next 
exec...  So something like the following:

int
pseudo_has_unload(char * const *envp) {
	static const char unload[] = "PSEUDO_UNLOAD";
	static size_t unload_len = strlen(unload);
	char * value = NULL;
	size_t i = 0;

	value = pseudo_get_value(unload)
	if (value) {
		free(value);
		return 1;
	}
	free(value);

	/* Is it in the caller environment? */
	if (NULL != getenv(unload))
		return 1;

	/* Is it in the operational environment? */
	while (envp && *envp) {
		if ((!strncmp(*envp, unload, unload_len)) && ('=' == (*envp)[unload_len]))
			return 1;
		++envp;
	}
	return 0;
}

This is -almost- the same as what you had.  The difference is that we check the 
cached value first, and use the get_value function which does all of the setup 
and comparison using the common function.  This ensures that the environment 
cache is properly configured as early as possible, only one accessor of the 
cache is used and it also checks the running and operation cache for the 
alternative value (in the same way your patch did it).

--Mark


