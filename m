Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4FB65C93
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 15:52:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s63FqlZQ024162; Thu, 3 Jul 2014 16:52:47 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id r0H78lqOBhBB; Thu,  3 Jul 2014 16:52:47 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s63Fqhsk024143
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 3 Jul 2014 16:52:45 +0100
Message-ID: <1404402757.6362.82.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Thu, 03 Jul 2014 16:52:37 +0100
In-Reply-To: <84fd3c3cb49d0ba85292dee3181b18a46c2081b1.1404110873.git.Qi.Chen@windriver.com>
References: <cover.1404110873.git.Qi.Chen@windriver.com>
	<84fd3c3cb49d0ba85292dee3181b18a46c2081b1.1404110873.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] shadow: upgrade from 4.1.4.3 to 4.2.1
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
X-List-Received-Date: Thu, 03 Jul 2014 15:52:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-06-30 at 14:48 +0800, Chen Qi wrote:
> Upgrade shadow from 4.1.4.3 to 4.2.1.
> 
> Changes during this upgrade are as following.
> 
> 1. Remove the "merged" patches. These patches are either merged or
>    the same functionality has been implemented upstream.
> 
>    add_root_cmd_groupmems.patch
>    add_root_cmd_options.patch
>    fix-etc-gshadow-reading.patch
>    shadow-4.1.4.2-env-reset-keep-locale.patch
>    shadow-4.1.4.2-groupmod-pam-check.patch
>    shadow-4.1.4.2-su_no_sanitize_env.patch
>    shadow.automake-1.11.patch
>    shadow_fix_for_automake-1.12.patch
>    useradd.patch
> 
> 2. Remove the unneeded patch.
>    The following patch has been removed because the logic in the related
>    codes of the new version has been changed. In specific, the codes now
>    can handle the 'NULL' return value. So there's no need for the following
>    patch.
> 
>    slackware_fix_for_glib-2.17_crypt.patch
> 
> 3. Teak the current patch to match the new version.
> 
>    allow-for-setting-password-in-clear-text.patch
> 
> 4. Add a patch to fix compilation failure.
> 
>    usermod-fix-compilation-failure-with-subids-disabled.patch
> 
> 5. Add a patch to fix the installation failure.
> 
>    fix-installation-failure-with-subids-disabled.patch
> 
> 5. Add a patch to fix the failure at rootfs time if extrausers is inherited.
> 
>    commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> 
> 6. Fix the bad section in the recipe.
> 
> 7. Disable the new subids feature in the new version as it doesn't support
>    cross compilation for now.
> 
> 8. Modify the pkg_postinst to `exit 1' if the `pwconv' or `grpconv' fails.
>    Also, fix the arguments to use '--root $D' instead of '--root=$D'.

I think this introduces the following issue:

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-logrotate/builds/154/steps/BuildImages/logs/stdio

since the shutdown group is probably now installed in the core?

Cheers,

Richard


