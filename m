Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web11.3496.1601023913551829842
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 01:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 8A6DE60D84;
	Fri, 25 Sep 2020 08:51:50 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
Subject: Re: [OE-core] [PATCH] openssh: Allow enable/disable of rng-tools recommendation on sshd
To: Otavio Salvador <otavio.salvador@gmail.com>,
 OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
References: <20200924195800.4164634-1-otavio@ossystems.com.br>
From: "Jack Mitchell" <ml@embed.me.uk>
Message-ID: <ca282af3-dcce-5d2a-3d4f-96068ec33ec7@embed.me.uk>
Date: Fri, 25 Sep 2020 09:51:47 +0100
MIME-Version: 1.0
In-Reply-To: <20200924195800.4164634-1-otavio@ossystems.com.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

On 24/09/2020 20:58, Otavio Salvador wrote:
> We are adding a new PACKAGECONFIG option ('rng-tools') to control if we
> wish the openssh-sshd to RRECOMMENDS the 'rng-tools' package. We are
> enabling it by default so there is no behavior change.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  meta/recipes-connectivity/openssh/openssh_8.3p1.bb | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
> index fad321898c..e007328704 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
> @@ -42,12 +42,15 @@ SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
>  
>  inherit autotools-brokensep ptest
>  
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "rng-tools"
>  PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
>  PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
>  PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
>  
> +# Add RRECOMMENDS to rng-tools for sshd package
> +PACKAGECONFIG[rng-tools] = ""
> +
>  EXTRA_AUTORECONF += "--exclude=aclocal"
>  
>  # login path is hardcoded in sshd
> @@ -149,7 +152,10 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
>  
>  RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>  RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> -RRECOMMENDS_${PN}-sshd_append_class-target = " rng-tools"
> +RRECOMMENDS_${PN}-sshd_append_class-target = "\
> +    ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
> +"
> +
>  # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
>  RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
>  
> 

While rng-tools has also been causing havoc with my images as it seems
ARM soc support for whatever underlying generator it uses is spotty,
this seems to be an abuse of packageconfig. Would something like:

BAD_RECOMMENDATIONS_pn-openssh = "rng-tools"

Not perform the same function?

Regards,
Jack.
