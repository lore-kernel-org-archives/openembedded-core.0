Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2390365E47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:46:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Jul 2014 09:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="574169279"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2014 09:46:37 -0700
Message-ID: <53C6AC6D.60900@linux.intel.com>
Date: Wed, 16 Jul 2014 09:46:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1405405388.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1405405388.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH V4 0/1] shadow: upgrade from 4.1.4.3 to 4.2.1
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
X-List-Received-Date: Wed, 16 Jul 2014 16:46:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/14/2014 11:27 PM, Chen Qi wrote:
> Test Case:
>
> Fire a clean build for core-image-sato with the following lines in local.conf:
> INHERIT += "extrausers"
> EXTRA_USERS_PARAMS = "usermod -P 'root' root; \
>                        useradd -P 'test' --create-home test; \
>                        groupadd -g 1314 no-zuo-no-die;"
>
>

There seems to be a failure with PAM enabled.  We see this failure with 
the sanity tests enabled.

We enable pam via DISTRO_FEATURES_append = " pam" and the sanity tests 
as follows:
INHERIT += "testimage"
TEST_SUITES_append = " pam"

bitbake core-image-sato and then bitbake core-image-sato -c testimage



>
> | ======================================================================
> | FAIL: test_pam (oeqa.runtime.pam.PamBasicTest)
> | ----------------------------------------------------------------------
> | Traceback (most recent call last):
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-pam/build/meta/lib/oeqa/utils/decorators.py", line 50, in wrapped_f
> |     return f(*args)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-pam/build/meta/lib/oeqa/runtime/pam.py", line 20, in test_pam
> |     self.assertEqual(status, 6, msg = "passwd command does not work as expected. Status and output:%s and %s" %(status, output))
> | AssertionError: 0 != 6 : passwd command does not work as expected. Status and output:0 and Usage: passwd [options] [LOGIN]
> |
> | Options:
> |   -a, --all                     report password status on all accounts
> |   -d, --delete                  delete the password for the named account
> |   -e, --expire                  force expire the password for the named account
> |   -h, --help                    display this help message and exit
> |   -k, --keep-tokens             change password only if expired
> |   -i, --inactive INACTIVE       set password inactive after expiration
> |                                 to INACTIVE
> |   -l, --lock                    lock the password of the named account
> |   -n, --mindays MIN_DAYS        set minimum number of days before password
> |                                 change to MIN_DAYS
> |   -q, --quiet                   quiet mode
> |   -r, --repository REPOSITORY   change password in REPOSITORY repository
> |   -R, --root CHROOT_DIR         directory to chroot into
> |   -S, --status                  report password status on the named account
> |   -u, --unlock                  unlock the password of the named account
> |   -w, --warndays WARN_DAYS      set expiration warning days to WARN_DAYS
> |   -x, --maxdays MAX_DAYS        set maximum number of days before password
> |                                 change to MAX_DAYS



> The following changes since commit fa325e44f5b429b4038022b31285af9c94672943:
>
>    insane: Ensure do_package_qa happens after do_packagedata (2014-07-11 23:19:18 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/shadow-4.2.1
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/shadow-4.2.1
>
> Chen Qi (1):
>    shadow: upgrade from 4.1.4.3 to 4.2.1
>
>   ...-create-parent-directories-when-necessary.patch |  109 ++
>   .../shadow/files/add_root_cmd_groupmems.patch      |   75 --
>   .../shadow/files/add_root_cmd_options.patch        | 1384 --------------------
>   .../allow-for-setting-password-in-clear-text.patch |  215 ++-
>   ...fix-unexpected-open-failure-in-chroot-env.patch |   46 +
>   .../shadow/files/fix-etc-gshadow-reading.patch     |   36 -
>   ...installation-failure-with-subids-disabled.patch |   28 +
>   .../shadow-4.1.4.2-env-reset-keep-locale.patch     |   31 -
>   .../files/shadow-4.1.4.2-groupmod-pam-check.patch  |   36 -
>   .../files/shadow-4.1.4.2-su_no_sanitize_env.patch  |   31 -
>   .../shadow/files/shadow.automake-1.11.patch        |  106 --
>   .../files/shadow_fix_for_automake-1.12.patch       |   23 -
>   .../files/slackware_fix_for_glib-2.17_crypt.patch  |   63 -
>   meta/recipes-extended/shadow/files/useradd.patch   |   17 -
>   ...-compilation-failure-with-subids-disabled.patch |   33 +
>   ...uretty_4.1.4.3.bb => shadow-securetty_4.2.1.bb} |    0
>   ...-sysroot_4.1.4.3.bb => shadow-sysroot_4.2.1.bb} |    0
>   meta/recipes-extended/shadow/shadow.inc            |   36 +-
>   .../shadow/{shadow_4.1.4.3.bb => shadow_4.2.1.bb}  |    0
>   19 files changed, 333 insertions(+), 1936 deletions(-)
>   create mode 100644 meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_options.patch
>   create mode 100644 meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
>   create mode 100644 meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/shadow.automake-1.11.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/useradd.patch
>   create mode 100644 meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch
>   rename meta/recipes-extended/shadow/{shadow-securetty_4.1.4.3.bb => shadow-securetty_4.2.1.bb} (100%)
>   rename meta/recipes-extended/shadow/{shadow-sysroot_4.1.4.3.bb => shadow-sysroot_4.2.1.bb} (100%)
>   rename meta/recipes-extended/shadow/{shadow_4.1.4.3.bb => shadow_4.2.1.bb} (100%)
>

