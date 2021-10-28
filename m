Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947CBC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 14:24:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.13641.1635431052833271930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 07:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C742F1BF209;
	Thu, 28 Oct 2021 14:24:10 +0000 (UTC)
Date: Thu, 28 Oct 2021 16:24:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCHv2 2/2] insane.bbclass: Add a check for
 directories that are expected to be empty
Message-ID: <YXqyioSQw07XYzx4@piout.net>
References: <20211027180522.19680-1-pkj@axis.com>
 <20211027180522.19680-2-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027180522.19680-2-pkj@axis.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 14:24:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157597


Hi Peter,

This seems to fail on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/4544/steps/11/logs/stdio

The same failure is seen in other builds too.

On 27/10/2021 20:05:22+0200, Peter Kjellerstedt wrote:
> The empty-dirs QA check verifies that all directories specified in
> QA_EMPTY_DIRS are empty. It is possible to specify why a directory is
> expected to be empty by defining QA_EMPTY_DIRS_RECOMMENDATION:<path>,
> which will then be included in the error message if the directory is
> not empty. If it is not specified for a directory, then "but it is
> expected to be empty" will be used.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> 
> PATCHv2: No changes.
> 
>  meta/classes/insane.bbclass  | 33 ++++++++++++++++++++++++++++++++-
>  meta/conf/documentation.conf |  2 ++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 1e2f1b768a..1675adf6ac 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -37,7 +37,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              configure-gettext perllocalpod shebang-size \
>              already-stripped installed-vs-shipped ldflags compile-host-path \
>              install-host-path pn-overrides unknown-configure-option \
> -            useless-rpaths rpaths staticdev \
> +            useless-rpaths rpaths staticdev empty-dirs \
>              "
>  # Add usrmerge QA check based on distro feature
>  ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
> @@ -50,6 +50,21 @@ ALL_QA = "${WARN_QA} ${ERROR_QA}"
>  
>  UNKNOWN_CONFIGURE_WHITELIST ?= "--enable-nls --disable-nls --disable-silent-rules --disable-dependency-tracking --with-libtool-sysroot --disable-static"
>  
> +# This is a list of directories that are expected to be empty.
> +QA_EMPTY_DIRS ?= " \
> +    /dev/pts \
> +    /media \
> +    /proc \
> +    /run \
> +    /tmp \
> +    ${localstatedir}/run \
> +    ${localstatedir}/volatile \
> +"
> +# It is possible to specify why a directory is expected to be empty by defining
> +# QA_EMPTY_DIRS_RECOMMENDATION:<path>, which will then be included in the error
> +# message if the directory is not empty. If it is not specified for a directory,
> +# then "but it is expected to be empty" will be used.
> +
>  def package_qa_clean_path(path, d, pkg=None):
>      """
>      Remove redundant paths from the path for display.  If pkg isn't set then
> @@ -885,6 +900,22 @@ def package_qa_check_unlisted_pkg_lics(package, d, messages):
>                             "listed in LICENSE" % (package, ' '.join(unlisted)))
>      return False
>  
> +QAPKGTEST[empty-dirs] = "package_qa_check_empty_dirs"
> +def package_qa_check_empty_dirs(pkg, d, messages):
> +    """
> +    Check for the existence of files in directories that are expected to be
> +    empty.
> +    """
> +
> +    pkgd = oe.path.join(d.getVar('PKGDEST'), pkg)
> +    for dir in (d.getVar('QA_EMPTY_DIRS') or "").split():
> +        empty_dir = oe.path.join(pkgd, dir)
> +        if os.path.exists(empty_dir) and os.listdir(empty_dir):
> +            recommendation = (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' + dir) or
> +                              "but it is expected to be empty")
> +            msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
> +            oe.qa.add_message(messages, "empty-dirs", msg)
> +
>  def package_qa_check_encoding(keys, encode, d):
>      def check_encoding(key, enc):
>          sane = True
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 80ad8e10d5..45cd01374a 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -345,6 +345,8 @@ PYPI_SRC_URI[doc] = "The URI to use to fetch from pypi, default uses pythonhoste
>  
>  #Q
>  
> +QA_EMPTY_DIRS[doc] = "A list of directories that are expected to be empty."
> +QA_EMPTY_DIRS_RECOMMENDATION[doc] = "This specifies a recommendation for a directory why it must be empty, which will be included in the error message if the directory is not empty."
>  QMAKE_PROFILES[doc] = "Specifies your own subset of .pro files to be built for use with qmake."
>  
>  #R

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157564): https://lists.openembedded.org/g/openembedded-core/message/157564
> Mute This Topic: https://lists.openembedded.org/mt/86634477/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

