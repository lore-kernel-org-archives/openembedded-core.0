Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0EAC433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 15:54:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.32724.1635695640601604801
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 08:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PNfIxAMV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 133so2550899wme.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Or4eTzqCSKzsOIKg1FZ25JEWyH7FCYb3Xk1qn6p3rJk=;
        b=PNfIxAMV5Xr/E/JdCr7LNRoDIogYaXp+cOPSOEUnxUnO8FLd8fdO4cArnF6V6ZzVH6
         QVqTq69RzIUbL0QP7fiXY2loE+aFAX3BZa3/Xv/IICXdCIkmWQfbMLnUa4oRrHV0UdHB
         xUeJs5vVi1TdRBGA8eyLLL8Bg7u9sSPVoxxvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Or4eTzqCSKzsOIKg1FZ25JEWyH7FCYb3Xk1qn6p3rJk=;
        b=nfTaWOCawgyQ1KU7W2RKTtA8E0nUY1WNS40TFG2ISNBQ1JMWm0i+XvtcWizA33qtVj
         W82+h+srzzpWp5e42HLWnYPAvgXvZzHC9BJaeoZo3ex1sPT3QNLHi7Pqj2o15cOMjSgv
         ezNl10Y5oFRBXqKCUKtThFUQ5JAritjOdtR2KuiG9K6k8vfRo7jpxTnwX1lX1KWWzRWK
         ZubrFqnShr2pW3tscX03BZ7iNyNdyEh6Ff4ZxhNtRa+TiFpxWxNWhB5tfE9if1xbRZma
         c0Vez27CIfTuk9KH9YyXRdhJYa83mS9wwXsJzqVWH9ln1NiNw48XAgMOKi9l7V3PGKbq
         e8IA==
X-Gm-Message-State: AOAM530L9i6azwWH/fxPXUUhgIUAHlhgOwuDs1Diy24rlux+vIn+/z3j
	8XdnuVwRsKv120+N14iLRQ4LRA==
X-Google-Smtp-Source: 
 ABdhPJxdeKBfpQ02lL2uq3PjHCrarFdPl91aJmOaCptC4u1Cy13VmiQuD/tFb3cs9fxRdix63U2OSA==
X-Received: by 2002:a05:600c:19cf:: with SMTP id
 u15mr25666180wmq.45.1635695639011;
        Sun, 31 Oct 2021 08:53:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b85c:77c5:c945:ad1c?
 ([2001:8b0:aba:5f3c:b85c:77c5:c945:ad1c])
        by smtp.gmail.com with ESMTPSA id
 k14sm8365850wms.21.2021.10.31.08.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 08:53:58 -0700 (PDT)
Message-ID: 
 <691a2a5f543e8f0ab881167d0cea452407b1dd59.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv3 3/3] insane.bbclass: Add a check for
 directories that are expected to be empty
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 31 Oct 2021 15:53:55 +0000
In-Reply-To: <20211029212918.16283-3-pkj@axis.com>
References: <20211029212918.16283-1-pkj@axis.com>
	 <20211029212918.16283-3-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 15:54:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157657

On Fri, 2021-10-29 at 23:29 +0200, Peter Kjellerstedt wrote:
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
> PATCHv3: No changes.
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

This triggered:

ERROR: apt-2.2.4-r0 do_package_qa: QA Issue: apt installs files in /var/volatile, but it is expected to be empty [empty-dirs]
ERROR: apt-2.2.4-r0 do_package_qa: Fatal QA errors were found, failing task.

https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/915/steps/12/logs/stdio


Cheers,

Richard


