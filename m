Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T7aCo-00043L-Mp
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Sep 2012 01:00:50 +0200
Received: by eekb57 with SMTP id b57so1166884eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 15:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KzMauhyMYfXMrCyCKzy4avD2888dDcV90AX4vYtRo2w=;
	b=jdXqbODfkhECTLpm6MewpK09iQC+gVa/up7TcYIQXXg9HH+CRMDd5XC0D7yIiuafsd
	jNNFmer7DZsAx1Ai9zibjQY9DcwoVilciZvDxySJytEEbKK50QdQPkk/v7buB0qs5HIS
	ifKN2atl2PyyukDTZnMuzMIkLhPQUKqvvuQqMwgMqBsWLbNjzmaNk2M89EJOeXWlAyjz
	YoaGHWRndRwHgKVnIuj6MvOU3iIgckqvphTSpH0n63N96XItEyGWtNgFsFdUref6qAwM
	aWUNsJf9UgDFDdhTpbQnXFj4h5rx7Wz3r2cJYkm4RFbj9ikOtEIPKRdY3HlWUhHmpsu1
	XtbA==
Received: by 10.14.5.67 with SMTP id 43mr12929410eek.15.1346453313637; Fri, 31
	Aug 2012 15:48:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 31 Aug 2012 15:48:01 -0700 (PDT)
In-Reply-To: <1346449092-22410-1-git-send-email-sgw@linux.intel.com>
References: <1346449092-22410-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2012 15:48:01 -0700
Message-ID: <CAMKF1spwWGOoRYcQOZfQD4-RDFqsAH3DexZsvVyxFG2XiTp3fw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: remove duplicate rquota files
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
X-List-Received-Date: Fri, 31 Aug 2012 23:00:50 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 31, 2012 at 2:38 PM, Saul Wold <sgw@linux.intel.com> wrote:
> The /usr/include/rpcsvc/rquota* files are provided by both eglibc
> and the quota package. Quota's version is newer and a superset of
> eglibc's
>

looks good in general. Make sure that anybody who depended on rquota header
now has dependency on quota.

> [YOCTO #238]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc |    1 +
>  meta/recipes-core/eglibc/eglibc_2.16.bb     |    2 +-
>  2 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index af78456..056ef23 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -86,6 +86,7 @@ do_install_append () {
>         if [ -f ${D}${bindir}/mtrace ]; then
>                 sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' -e '2s,exec.*perl,exec ${USRBINPATH}/env perl,' ${D}${bindir}/mtrace
>         fi
> +       rm -rf ${D}${includedir}/rpcsvc/rquota*
>  }
>
>  do_install_locale () {
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
> index 69803f7..c6fde6e 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>  SRCREV = "20393"
>
>  DEPENDS += "gperf-native"
> -PR = "r6"
> +PR = "r7"
>  PR_append = "+svnr${SRCPV}"
>
>  EGLIBC_BRANCH="eglibc-2_16"
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


