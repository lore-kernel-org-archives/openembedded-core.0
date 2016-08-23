Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2F5473199
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 20:57:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7NKvrfv014465
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:57:54 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 23 Aug 2016 13:57:52 -0700
To: <openembedded-core@lists.openembedded.org>
References: <CAFkk2KRmMbNhL=V82H-vuYmvRBDMxKOE7c-J=u2=YGHBPmYYSg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <797474f6-d18c-3173-2fd5-189b831e27d2@windriver.com>
Date: Tue, 23 Aug 2016 15:57:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFkk2KRmMbNhL=V82H-vuYmvRBDMxKOE7c-J=u2=YGHBPmYYSg@mail.gmail.com>
Subject: Re: [PATCH] useradd.bblass: Simplify target overrides
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
X-List-Received-Date: Tue, 23 Aug 2016 20:57:55 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/8/16 8:48 PM, Ulf Magnusson wrote:
> The current style might be a leftover from when _class-target did not
> exist.
> 
> Also change the assignment to SSTATECLEANFUNCS to an append, which makes
> more sense. useradd.bbclass is the only user of SSTATECLEANFUNCS as of
> writing, so it won't make any functional difference.

Commit is also missing the 'signed-off-by line'.

I don't have any objection.  original version of this was written before
'class-target' existed, thus all of the duplication... nice to get that cleaned up.

--Mark

> ---
>  meta/classes/useradd.bbclass | 31 ++++++++-----------------------
>  1 file changed, 8 insertions(+), 23 deletions(-)
> 
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 8d51fb5..25526ef 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -3,11 +3,7 @@ inherit useradd_base
>  # base-passwd-cross provides the default passwd and group files in the
>  # target sysroot, and shadow -native and -sysroot provide the utilities
>  # and support files needed to add and modify user and group accounts
> -DEPENDS_append = "${USERADDDEPENDS}"
> -USERADDDEPENDS = " base-files shadow-native shadow-sysroot shadow"
> -USERADDDEPENDS_class-cross = ""
> -USERADDDEPENDS_class-native = ""
> -USERADDDEPENDS_class-nativesdk = ""
> +DEPENDS_append_class-target = " base-files shadow-native shadow-sysroot shadow"
> 
>  # This preinstall function can be run in four different contexts:
>  #
> @@ -157,28 +153,17 @@ if test "x${STAGING_DIR_TARGET}" != "x"; then
>  fi
>  }
> 
> -SSTATECLEANFUNCS = "userdel_sysroot_sstate"
> -SSTATECLEANFUNCS_class-cross = ""
> -SSTATECLEANFUNCS_class-native = ""
> -SSTATECLEANFUNCS_class-nativesdk = ""
> +SSTATECLEANFUNCS_append_class-target = " userdel_sysroot_sstate"
> 
>  do_install[prefuncs] += "${SYSROOTFUNC}"
> -SYSROOTFUNC = "useradd_sysroot"
> -SYSROOTFUNC_class-cross = ""
> -SYSROOTFUNC_class-native = ""
> -SYSROOTFUNC_class-nativesdk = ""
> -SSTATEPREINSTFUNCS += "${SYSROOTPOSTFUNC}"
> -SYSROOTPOSTFUNC = "useradd_sysroot_sstate"
> -SYSROOTPOSTFUNC_class-cross = ""
> -SYSROOTPOSTFUNC_class-native = ""
> -SYSROOTPOSTFUNC_class-nativesdk = ""
> -
> -USERADDSETSCENEDEPS =
> "${MLPREFIX}base-passwd:do_populate_sysroot_setscene
> pseudo-native:do_populate_sysroot_setscene
> shadow-native:do_populate_sysroot_setscene
> ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
> -USERADDSETSCENEDEPS_class-cross = ""
> -USERADDSETSCENEDEPS_class-native = ""
> -USERADDSETSCENEDEPS_class-nativesdk = ""
> +SYSROOTFUNC_class-target = "useradd_sysroot"
> +SYSROOTFUNC = ""
> +
> +SSTATEPREINSTFUNCS_append_class-target = " useradd_sysroot_sstate"
> +
>  do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
>  do_populate_sysroot_setscene[depends] += "${USERADDSETSCENEDEPS}"
> +USERADDSETSCENEDEPS_class-target =
> "${MLPREFIX}base-passwd:do_populate_sysroot_setscene
> pseudo-native:do_populate_sysroot_setscene
> shadow-native:do_populate_sysroot_setscene
> ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
> 
>  # Recipe parse-time sanity checks
>  def update_useradd_after_parse(d):
> 


