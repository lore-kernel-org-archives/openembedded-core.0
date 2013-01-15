Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tv4tZ-0000fb-GM
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 12:41:42 +0100
Received: by mail-oa0-f51.google.com with SMTP id n12so5031042oag.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 03:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=TDah8ckkLo2sqModc2OZJuwVumcPFfeCdzMIk2h5DP4=;
	b=N8yc5b4/tXTcfLWJ2g/LNgjc1/lEMgrkFcKo+en7fnfaHGgz17+Q+AWcIDwyVx3wjQ
	XR1uZUsmWpa/rDJyxC0ixsvUZa6+4jJY9c+Cc5CjzljdDgrWl6tlA2gUcG3/SICRHiqK
	ljDGbF4uMpg7znflqIAsWWXzRJs+rLWXwTRao9jG81FeM8yDzqlRIY6alP5xT8BkiftC
	FYeo3upGhb08561rMXxNSKwCYmjxRYcPBpHpc6sl2fDQ8C8m+7NPWZlNxKJdwJl4oiIt
	M3SSR0CLXJ+bwafvVXHFAfOWCch55Dhq1APLyA2g8h0BnsDXDPMFsNBYVZwPTcIu8H9i
	H6pg==
MIME-Version: 1.0
Received: by 10.60.171.133 with SMTP id au5mr54403652oec.90.1358249172681;
	Tue, 15 Jan 2013 03:26:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Tue, 15 Jan 2013 03:26:12 -0800 (PST)
In-Reply-To: <1358216103-2735-1-git-send-email-Qi.Chen@windriver.com>
References: <1358216103-2735-1-git-send-email-Qi.Chen@windriver.com>
Date: Tue, 15 Jan 2013 09:26:12 -0200
X-Google-Sender-Auth: PTt3-iPxY_pJZ2eauVuFNG54Vrg
Message-ID: <CAP9ODKq6X6o0yRLRUuSFsAPpfqc-9uA7AbtBMyi4qrZgvcFgsA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V7 6/6] volatile-conf-sato: add recipe
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
X-List-Received-Date: Tue, 15 Jan 2013 11:41:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 15, 2013 at 12:15 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> This recipe provides a config file for core-image-sato.
> The config file is used to handle volatile storage in case of a
> read-only-rootfs image.
>
> Also, let core-image-sato.bb depend on this recipe.
>
> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-sato/images/core-image-sato.bb        |    3 +++
>  .../files/volatiles-readonly-sato                  |   14 ++++++++++++++
>  .../volatile-conf-sato_1.0.bb                      |   15 +++++++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato
>  create mode 100644 meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb

Please name the package and the dir the same. It will be confusing for
user to try to guess where the .bb file is otherwise.

> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> index f52a1a5..a3d3d27 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -6,6 +6,9 @@ IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-dropbe
>
>  LICENSE = "MIT"
>
> +RDEPENDS += "volatile-conf-sato"
> +
>  inherit core-image
>
>  IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
> +IMAGE_INSTALL += "volatile-conf-sato"
> diff --git a/meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato b/meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato
> new file mode 100644
> index 0000000..4a56b81
> --- /dev/null
> +++ b/meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato
> @@ -0,0 +1,14 @@
> +# This configuration file lists filesystem objects specific to sato image
> +# with read-only rootfs.
> +# This configuration file will only be applied if the image is sato and the
> +# rootfs is read-only.
> +# For the detailed format information, refer to /etc/default/volatiles/00_core.
> +d root root 0755 /var/volatile/lib/ none
> +d root root 0755 /var/volatile/lib/urandom/ none
> +d root root 0755 /var/volatile/lib/dropbear/ none
> +d root root 0755 /var/volatile/lib/nfs/ none
> +d root root 0755 /var/volatile/lib/dbus/ none
> +l root root 0755 /var/lib/urandom /var/volatile/lib/urandom
> +l root root 0755 /var/lib/dropbear /var/volatile/lib/dropbear
> +l root root 0755 /var/lib/nfs /var/volatile/lib/nfs
> +l root root 0755 /var/lib/dbus /var/volatile/lib/dbus
> diff --git a/meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb b/meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb
> new file mode 100644
> index 0000000..acc8901
> --- /dev/null
> +++ b/meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Provide config files for core-image-sato"
> +DESCRIPTION = "This package contains a config file for core-image-sato. \
> +It is used to handle volatile storage in case of a read-only rootfs."
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +SRC_URI = "file://volatiles-readonly-sato"
> +
> +PR = "r1"
> +
> +do_install () {
> +       install -d ${D}${sysconfdir}/default/volatiles
> +       install -m 0644 ${WORKDIR}/volatiles-readonly-sato ${D}${sysconfdir}/default/volatiles/00_core_readonly
> +}
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


