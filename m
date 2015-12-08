Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 177EB60110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 16:33:30 +0000 (UTC)
Received: by pfdd184 with SMTP id d184so14433504pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 08:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=wQoN2/jt43gfKXXv1V+PnUy7TOMsEiLCgloQPVM4Btw=;
	b=tC+d8CDB6pQWj1DtGqpxyg1CwRapFB4dUjSj3S9LnGT4Q2t7AUuuShgZSPpPD1E6kS
	MMVebVx3PCI6ngi/ja5A2LarDQ664jijT3vCZf2kOqbdICf/FJKOpSgvZMVauu9EKUQ4
	ERzUPZIxcJdQEhKRwCZJFNhEVYDS1ecAncT9PkoergDDQ8wURYzN3NOEYq39qom5opEK
	vW+n2+ulRPLS5Q5gNzqefNRPWlKxwaC/Qr2GIvVSxkgFZ/vvoFIZB+UiIOcekAqcfRrN
	oHCyt3smhK66sdtDlZMCD7zjpSV7XIxX3LVWH7SyvsLCi+d5PWGyXtExuUz+auBZorrQ
	CWMw==
X-Received: by 10.98.79.206 with SMTP id f75mr6220747pfj.24.1449592411526;
	Tue, 08 Dec 2015 08:33:31 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:a1ff:59ed:52e8:f7de?
	([2601:202:4000:1239:a1ff:59ed:52e8:f7de])
	by smtp.googlemail.com with ESMTPSA id
	ry1sm5912461pab.30.2015.12.08.08.33.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Dec 2015 08:33:30 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1447263707-27696-1-git-send-email-akuster808@gmail.com>
	<1447263707-27696-2-git-send-email-akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56670658.3070109@gmail.com>
Date: Tue, 8 Dec 2015 08:33:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447263707-27696-2-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH 1/2] ldconfig: add method to extend ldconfig search dirs
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
X-List-Received-Date: Tue, 08 Dec 2015 16:33:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

ping

On 11/11/2015 09:41 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> this provides a method to extend the search path ldconfig-native
> uses when creating ls.so.cache.
> 
> To enable in recipe:
> 
> add:
> inherit ldconfig
> 
> LDSOCONF = "/opt/lib"
> 
> this will create a ld.so.conf file in work-shared/ldconfig/${PN}/
> 
> to create an image with these new search paths included, add to local.conf:
> 
> INHERIT += "image-ldconfig"
> 
> this will take all the ${PN}/ld.so.conf files and create a single ld.so.conf
> that will be used by ldconfig-native when building an image.
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/classes/image-ldconfig.bbclass | 26 ++++++++++++++++++++++++++
>  meta/classes/ldconfig.bbclass       | 27 +++++++++++++++++++++++++++
>  meta/conf/bitbake.conf              |  5 +++++
>  3 files changed, 58 insertions(+)
>  create mode 100644 meta/classes/image-ldconfig.bbclass
>  create mode 100644 meta/classes/ldconfig.bbclass
> 
> diff --git a/meta/classes/image-ldconfig.bbclass b/meta/classes/image-ldconfig.bbclass
> new file mode 100644
> index 0000000..e9946da
> --- /dev/null
> +++ b/meta/classes/image-ldconfig.bbclass
> @@ -0,0 +1,26 @@
> +#
> +# To enable, use INHERIT in local.conf:
> +#
> +#       INHERIT += "image-ldconfig"
> +
> +do_rootfs[depends] += "ldconfig-native:do_populate_sysroot"
> +
> +IMAGE_PREPROCESS_COMMAND += "ld_so_conf; "
> +
> +ld_so_conf() {
> +
> +    rm -f ${STAGING_DIR_NATIVE}${sysconfdir_native}/ld.so.conf
> +
> +    # save lib dirs as defined in recipes
> +    for file in `find ${STAGING_LDSO_CONF_DIR}/*/* -name "ld.so.conf"`;
> +    do
> +        cat ${file} >> ${STAGING_LDSO_CONF_DIR}/ld.so.conf
> +    done
> +
> +    # remove dups and sort
> +    cat ${STAGING_LDSO_CONF_DIR}/ld.so.conf | sort -u > ${IMAGE_ROOTFS}/etc/ld.so.conf
> +
> +    # this seems to work if at rootfs location.
> +    cd ${IMAGE_ROOTFS}
> +    ${STAGING_DIR_NATIVE}${bindir_native}/ldconfig -r . -c new -f etc/ld.so.conf 
> +}
> diff --git a/meta/classes/ldconfig.bbclass b/meta/classes/ldconfig.bbclass
> new file mode 100644
> index 0000000..558122f
> --- /dev/null
> +++ b/meta/classes/ldconfig.bbclass
> @@ -0,0 +1,27 @@
> +# Allows adding libs or alt lib locations to be included
> +# during ld.so.cache creation.
> +#
> +#
> +
> +do_package[postfuncs] += "save_ld_so_conf "
> +do_clean[cleandirs] += "${STAGING_LDSO_CONF_DIR}/${PN} "
> +
> +python save_ld_so_conf() {
> +    import os
> +
> +    if (d.getVar('USE_LDCONFIG', True) or "1") == "1":
> +        ldsodir = d.getVar('STAGING_LDSO_CONF_DIR', True)
> +        if not os.path.isdir(ldsodir):
> +            os.mkdir(ldsodir)
> +    
> +        staging_ld = os.path.join(ldsodir, d.expand("${PN}"))
> +        if not os.path.isdir(staging_ld):
> +            os.mkdir(staging_ld)
> +
> +        ldsofile = os.path.join(staging_ld, 'ld.so.conf')
> +
> +        ldconf = d.getVar('LDSOCONF', True).split()
> +        with open(ldsofile, 'w') as lsdo:
> +            for ldso_entry in ldconf:
> +                lsdo.write(ldso_entry+"\n")
> +}
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 06971da..f0471f4 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -811,3 +811,8 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
>  
>  MLPREFIX ??= ""
>  MULTILIB_VARIANTS ??= ""
> +
> +# 
> +# ldconfig stuff
> +#
> +STAGING_LDSO_CONF_DIR = "${TMPDIR}/work-shared/ldconfig"
> 

