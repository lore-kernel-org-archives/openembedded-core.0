Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5031C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:16:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.14777.1634670958475677892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0FC15C0004;
	Tue, 19 Oct 2021 19:15:55 +0000 (UTC)
Date: Tue, 19 Oct 2021 21:15:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Daiane Angolini <daiane.angolini@foundries.io>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] classes/lib/useradd: The option -P is deprecated
Message-ID: <YW8ZazwTRTxNVdiO@piout.net>
References: <20211018184455.437741-1-daiane.angolini@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018184455.437741-1-daiane.angolini@foundries.io>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:16:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157200

Hello Daiane,

On 18/10/2021 15:44:55-0300, Daiane Angolini wrote:
> Since [1] the option -P is not available, so remove it from parsing lib.
> 
> This is a partial fix for [YOCTO #14605].
> 
> During the do_rootfs, the error message when using -P is:
> 
>   useradd: unrecognized option '--clear-password'
> 
> Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
> ---
>  meta/lib/oe/useradd.py | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/lib/oe/useradd.py b/meta/lib/oe/useradd.py
> index 8fc77568ff..63768311ee 100644
> --- a/meta/lib/oe/useradd.py
> +++ b/meta/lib/oe/useradd.py
> @@ -45,7 +45,6 @@ def build_useradd_parser():
>      parser.add_argument("-N", "--no-user-group", dest="user_group", help="do not create a group with the same name as the user", action="store_const", const=False)
>      parser.add_argument("-o", "--non-unique", help="allow to create users with duplicate (non-unique UID)", action="store_true")
>      parser.add_argument("-p", "--password", metavar="PASSWORD", help="encrypted password of the new account")
> -    parser.add_argument("-P", "--clear-password", metavar="CLEAR_PASSWORD", help="use this clear password for the new account")

This causes an issue in useradd-staticids.bbclass

https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/847/steps/12/logs/stdio

File: '<code>', lineno: 20, function: <module>
     0016:__anon_177__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_siteinfo_bbclass(d)
     0017:__anon_63__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_update_rc_d_bbclass(d)
     0018:__anon_23__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_systemd_bbclass(d)
     0019:__anon_195__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_useradd_bbclass(d)
 *** 0020:__anon_311__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_useradd_staticids_bbclass(d)
     0021:__anon_114__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_update_alternatives_bbclass(d)
File: '/home/pokybuild/yocto-worker/reproducible-centos/build/meta/classes/useradd-staticids.bbclass', lineno: 307, function: __anon_311__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_useradd_staticids_bbclass
     0303:python __anonymous() {
     0304:    if not bb.data.inherits_class('nativesdk', d) \
     0305:        and not bb.data.inherits_class('native', d):
     0306:        try:
 *** 0307:            update_useradd_static_config(d)
     0308:        except NotImplementedError as f:
     0309:            bb.debug(1, "Skipping recipe %s: %s" % (d.getVar('PN'), f))
     0310:            raise bb.parse.SkipRecipe(f)
     0311:}
File: '/home/pokybuild/yocto-worker/reproducible-centos/build/meta/classes/useradd-staticids.bbclass', lineno: 271, function: update_useradd_static_config
     0267:        # is a bit of a waste -- only process useradd/groupadd
     0268:        useradd_param = d.getVar('USERADD_PARAM:%s' % pkg)
     0269:        if useradd_param:
     0270:            #bb.warn("Before: 'USERADD_PARAM:%s' - '%s'" % (pkg, useradd_param))
 *** 0271:            d.setVar('USERADD_PARAM:%s' % pkg, rewrite_useradd(useradd_param, True))
     0272:            #bb.warn("After:  'USERADD_PARAM:%s' - '%s'" % (pkg, d.getVar('USERADD_PARAM:%s' % pkg)))
     0273:
     0274:        groupadd_param = d.getVar('GROUPADD_PARAM:%s' % pkg)
     0275:        if groupadd_param:
File: '/home/pokybuild/yocto-worker/reproducible-centos/build/meta/classes/useradd-staticids.bbclass', lineno: 177, function: rewrite_useradd
     0173:            newparam += ['', ' --no-user-group'][uaargs.user_group is False]
     0174:            newparam += ['', ' --non-unique'][uaargs.non_unique]
     0175:            if uaargs.password != None:
     0176:                newparam += ['', ' --password %s' % uaargs.password][uaargs.password != None]
 *** 0177:            elif uaargs.clear_password:
     0178:                newparam += ['', ' --clear-password %s' % uaargs.clear_password][uaargs.clear_password != None]
     0179:            newparam += ['', ' --root %s' % uaargs.root][uaargs.root != None]
     0180:            newparam += ['', ' --system'][uaargs.system]
     0181:            newparam += ['', ' --shell %s' % uaargs.shell][uaargs.shell != None]
Exception: AttributeError: 'Namespace' object has no attribute 'clear_password'

>      parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
>      parser.add_argument("-r", "--system", help="create a system account", action="store_true")
>      parser.add_argument("-s", "--shell", metavar="SHELL", help="login shell of the new account")
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157090): https://lists.openembedded.org/g/openembedded-core/message/157090
> Mute This Topic: https://lists.openembedded.org/mt/86422106/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

