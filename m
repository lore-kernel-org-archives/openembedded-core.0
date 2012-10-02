Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TJ4MB-0004iM-5v
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 17:26:01 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Oct 2012 08:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,524,1344236400"; d="scan'208";a="151537783"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Oct 2012 08:12:58 -0700
Message-ID: <506B047A.4020107@linux.intel.com>
Date: Tue, 02 Oct 2012 08:12:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20120930125320.GA3419@jama.jama.net>
	<1349091702-13517-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1349091702-13517-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3] opkg: fix version constraints in conflicts, depends, replaces
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
X-List-Received-Date: Tue, 02 Oct 2012 15:26:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2012 04:41 AM, Martin Jansa wrote:
> * http://code.google.com/p/opkg/issues/detail?id=94
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   .../0009-pkg_depends-fix-version-constraints.patch | 188 +++++++++++++++++++++
>   ...depends-fix-version_constraints_satisfied.patch |  37 ++++
>   meta/recipes-devtools/opkg/opkg_svn.bb             |   4 +-
>   3 files changed, 228 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch
>   create mode 100644 meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch
>
Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch b/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch
> new file mode 100644
> index 0000000..f7aa4ea
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch
> @@ -0,0 +1,188 @@
> +From b93ce2249751e0d90dab38e91691a6e9f33c3512 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sat, 29 Sep 2012 11:38:03 +0200
> +Subject: [PATCH 09/10] pkg_depends: fix version constraints
> +
> +* factor parsing version constraint to str_to_constraint and use that
> +  from pkg (pkg_version_satisfied) and also pkg_depends (parseDepends)
> +* fix constraint_to_str(), for EARLIER and LATER it was using '<' and
> +  '>' which is parsed later as EARLIER_EQUAL and LATER_EQUAL
> +* show notice when deprecated '<' or '>' is used
> +
> +Upstream-Status: Submitted
> +http://code.google.com/p/opkg/issues/detail?id=94
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + libopkg/pkg.c         | 36 +++++++++++--------------
> + libopkg/pkg_depends.c | 73 +++++++++++++++++++++++++++++----------------------
> + libopkg/pkg_depends.h |  1 +
> + 3 files changed, 59 insertions(+), 51 deletions(-)
> +
> +diff --git a/libopkg/pkg.c b/libopkg/pkg.c
> +index 255c673..1e98b9c 100644
> +--- a/libopkg/pkg.c
> ++++ b/libopkg/pkg.c
> +@@ -968,28 +968,24 @@ pkg_version_satisfied(pkg_t *it, pkg_t *ref, const char *op)
> +      int r;
> +
> +      r = pkg_compare_versions(it, ref);
> ++     char *op2 = op;
> ++     enum version_constraint constraint = str_to_constraint(&op2);
> +
> +-     if (strcmp(op, "<=") == 0 || strcmp(op, "<") == 0) {
> +-	  return r <= 0;
> +-     }
> +-
> +-     if (strcmp(op, ">=") == 0 || strcmp(op, ">") == 0) {
> +-	  return r >= 0;
> +-     }
> +-
> +-     if (strcmp(op, "<<") == 0) {
> +-	  return r < 0;
> +-     }
> +-
> +-     if (strcmp(op, ">>") == 0) {
> +-	  return r > 0;
> +-     }
> +-
> +-     if (strcmp(op, "=") == 0) {
> +-	  return r == 0;
> ++     switch (constraint)
> ++     {
> ++     case EARLIER_EQUAL:
> ++          return r <= 0;
> ++     case LATER_EQUAL:
> ++          return r >= 0;
> ++     case EARLIER:
> ++          return r < 0;
> ++     case LATER:
> ++          return r > 0;
> ++     case EQUAL:
> ++          return r == 0;
> ++     case NONE:
> ++          opkg_msg(ERROR, "Unknown operator: %s.\n", op);
> +      }
> +-
> +-     opkg_msg(ERROR, "Unknown operator: %s.\n", op);
> +      return 0;
> + }
> +
> +diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
> +index a72eed7..3dd8240 100644
> +--- a/libopkg/pkg_depends.c
> ++++ b/libopkg/pkg_depends.c
> +@@ -781,7 +781,7 @@ constraint_to_str(enum version_constraint c)
> + 	case NONE:
> + 		return "";
> + 	case EARLIER:
> +-		return "< ";
> ++		return "<< ";
> + 	case EARLIER_EQUAL:
> + 	       return "<= ";
> + 	case EQUAL:
> +@@ -789,12 +789,51 @@ constraint_to_str(enum version_constraint c)
> + 	case LATER_EQUAL:
> + 	      return ">= ";
> + 	case LATER:
> +-	     return "> ";
> ++	     return ">> ";
> + 	}
> +
> + 	return "";
> + }
> +
> ++enum version_constraint
> ++str_to_constraint(char **str)
> ++{
> ++	if(!strncmp(*str, "<<", 2)){
> ++		*str += 2;
> ++		return EARLIER;
> ++	}
> ++	else if(!strncmp(*str, "<=", 2)){
> ++		*str += 2;
> ++		return EARLIER_EQUAL;
> ++	}
> ++	else if(!strncmp(*str, ">=", 2)){
> ++		*str += 2;
> ++		return LATER_EQUAL;
> ++	}
> ++	else if(!strncmp(*str, ">>", 2)){
> ++		*str += 2;
> ++		return LATER;
> ++	}
> ++	else if(!strncmp(*str, "=", 1)){
> ++		*str += 1;
> ++		return EQUAL;
> ++	}
> ++	/* should these be here to support deprecated designations; dpkg does */
> ++	else if(!strncmp(*str, "<", 1)){
> ++		*str += 1;
> ++		opkg_msg(NOTICE, "Deprecated version constraint '<' was used with the same meaning as '<='. Use '<<' for EARLIER constraint.\n");
> ++		return EARLIER_EQUAL;
> ++	}
> ++	else if(!strncmp(*str, ">", 1)){
> ++		*str += 1;
> ++		opkg_msg(NOTICE, "Deprecated version constraint '>' was used with the same meaning as '>='. Use '>>' for LATER constraint.\n");
> ++		return LATER_EQUAL;
> ++	}
> ++	else {
> ++		return NONE;
> ++	}
> ++}
> ++
> + /*
> +  * Returns a printable string for pkg's dependency at the specified idx. The
> +  * resultant string must be passed to free() by the caller.
> +@@ -949,35 +988,7 @@ static int parseDepends(compound_depend_t *compound_depend,
> + 	  /* extract constraint and version */
> + 	  if(*src == '('){
> + 	       src++;
> +-	       if(!strncmp(src, "<<", 2)){
> +-		    possibilities[i]->constraint = EARLIER;
> +-		    src += 2;
> +-	       }
> +-	       else if(!strncmp(src, "<=", 2)){
> +-		    possibilities[i]->constraint = EARLIER_EQUAL;
> +-		    src += 2;
> +-	       }
> +-	       else if(!strncmp(src, ">=", 2)){
> +-		    possibilities[i]->constraint = LATER_EQUAL;
> +-		    src += 2;
> +-	       }
> +-	       else if(!strncmp(src, ">>", 2)){
> +-		    possibilities[i]->constraint = LATER;
> +-		    src += 2;
> +-	       }
> +-	       else if(!strncmp(src, "=", 1)){
> +-		    possibilities[i]->constraint = EQUAL;
> +-		    src++;
> +-	       }
> +-	       /* should these be here to support deprecated designations; dpkg does */
> +-	       else if(!strncmp(src, "<", 1)){
> +-		    possibilities[i]->constraint = EARLIER_EQUAL;
> +-		    src++;
> +-	       }
> +-	       else if(!strncmp(src, ">", 1)){
> +-		    possibilities[i]->constraint = LATER_EQUAL;
> +-		    src++;
> +-	       }
> ++	       possibilities[i]->constraint = str_to_constraint(&src);
> +
> + 	       /* now we have any constraint, pass space to version string */
> + 	       while(isspace(*src)) src++;
> +diff --git a/libopkg/pkg_depends.h b/libopkg/pkg_depends.h
> +index ca0801f..685a722 100644
> +--- a/libopkg/pkg_depends.h
> ++++ b/libopkg/pkg_depends.h
> +@@ -87,6 +87,7 @@ pkg_vec_t * pkg_hash_fetch_conflicts(pkg_t * pkg);
> + int pkg_dependence_satisfiable(depend_t *depend);
> + int pkg_dependence_satisfied(depend_t *depend);
> + const char* constraint_to_str(enum version_constraint c);
> ++enum version_constraint str_to_constraint(char **str);
> + int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg);
> +
> + #endif
> +--
> +1.7.12
> +
> diff --git a/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch b/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch
> new file mode 100644
> index 0000000..a13d658
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch
> @@ -0,0 +1,37 @@
> +From e9add8fe4a63ef14aba8bd238ddde84d5470b611 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sat, 29 Sep 2012 18:56:01 +0200
> +Subject: [PATCH 10/10] pkg_depends: fix version_constraints_satisfied
> +
> +* with
> +  Package: a
> +  Version: 1
> +  and
> +  Conflicts: a (<< 1)
> +  we have comparison == 0, but constraint EARLIER is not satisfied!
> +
> +Upstream-Status: Submitted
> +http://code.google.com/p/opkg/issues/detail?id=94
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + libopkg/pkg_depends.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
> +index 3dd8240..be81b7f 100644
> +--- a/libopkg/pkg_depends.c
> ++++ b/libopkg/pkg_depends.c
> +@@ -464,7 +464,8 @@ int version_constraints_satisfied(depend_t * depends, pkg_t * pkg)
> +     else if((depends->constraint == LATER) &&
> + 	    (comparison > 0))
> + 	return 1;
> +-    else if(comparison == 0)
> ++    else if((depends->constraint == EQUAL) &&
> ++	    (comparison == 0))
> + 	return 1;
> +     else if((depends->constraint == LATER_EQUAL) &&
> + 	    (comparison >= 0))
> +--
> +1.7.12
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
> index 820a224..d89a3f6 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -9,6 +9,8 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
>     file://0006-detect-circular-dependencies.patch \
>     file://0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch \
>     file://0008-select_higher_version.patch \
> +  file://0009-pkg_depends-fix-version-constraints.patch \
> +  file://0010-pkg_depends-fix-version_constraints_satisfied.patch \
>   "
>
>   S = "${WORKDIR}/trunk"
> @@ -16,4 +18,4 @@ S = "${WORKDIR}/trunk"
>   SRCREV = "633"
>   PV = "0.1.8+svnr${SRCPV}"
>
> -PR = "${INC_PR}.4"
> +PR = "${INC_PR}.5"
>


