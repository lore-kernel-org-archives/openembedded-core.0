Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.21929.1586977217574182059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 12:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9368C40BAC;
	Wed, 15 Apr 2020 19:00:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axLb0u_dg_V4; Wed, 15 Apr 2020 19:00:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 756ED409AA;
	Wed, 15 Apr 2020 19:00:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 97B4F172565; Wed, 15 Apr 2020 15:00:14 -0400 (EDT)
Date: Wed, 15 Apr 2020 15:00:14 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Domarys Correa <domarys.correa@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2] insane.bbclass: Add test for shebang line length
Message-ID: <20200415190014.GE11927@denix.org>
References: <20200414182020.11777-1-domarys.correa@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20200414182020.11777-1-domarys.correa@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 03:20:20PM -0300, Domarys Correa wrote:
> Shebang lines longer than 128 characters can give an error
> depending on the operating system.
> This implements a test that signals an error when locating a
> faulty shebang.
> 
> YOCTO: #11053
> 
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
> ---

What are the changes from v1? Please mention briefly here to help with reviews.


>  meta/classes/insane.bbclass | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 9605ac2bae..bcb1464c91 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -34,7 +34,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              split-strip packages-list pkgv-undefined var-undefined \
>              version-going-backwards expanded-d invalid-chars \
>              license-checksum dev-elf file-rdeps configure-unsafe \
> -            configure-gettext perllocalpod \
> +            configure-gettext perllocalpod shebang-size \
>              "
>  # Add usrmerge QA check based on distro feature
>  ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
> @@ -82,6 +82,29 @@ def package_qa_add_message(messages, section, new_msg):
>      else:
>          messages[section] = messages[section] + "\n" + new_msg
>  
> +QAPATHTEST[shebang-size] = "package_qa_check_shebang_size"
> +def package_qa_check_shebang_size(path, name, d, elf, messages):
> +    if os.path.islink(path) or elf:
> +        return
> +
> +    try:
> +        with open(path, 'rb') as f:
> +            stanza = f.readline(130)
> +    except IOError:
> +        return
> +
> +    if stanza.startswith(b'#!'):
> +        #Shebang not found
> +        try:
> +            stanza = stanza.decode("utf-8")
> +        except UnicodeDecodeError:
> +            #If it is not a text file, it is not a script
> +            return
> +
> +        if len(stanza) > 129:
> +            package_qa_add_message(messages, "shebang-size", "%s: %s maximum shebang size exceeded, the maximum size is 128." % (name, package_qa_clean_path(path, d)))
> +            return
> +
>  QAPATHTEST[libexec] = "package_qa_check_libexec"
>  def package_qa_check_libexec(path,name, d, elf, messages):
>  
> -- 
> 2.17.1
> 

> 

