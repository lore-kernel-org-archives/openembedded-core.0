Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 678BC60034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 05:15:03 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so52594384iec.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 22:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FXI0JA1/j1gGyL2eld+2Bhcs7hDvaOzHzPDR2I/26os=;
	b=TcIOiaogtYhgCpoKopoKGahUY3igl3s45ZaFrQFdGgi9qirxucKP7O2Q+Z2EHfjN/y
	11hrLG76Gr06DNtIl5bMBlR+08JrB4OpI9PRsF+4cJKUKZE1x266J74Fzdr/WuYI7rx2
	5+rY/6xQcxM580ozIlV+KhixgdnGstmflpTROdMJvLxKbKFFqXJLyJeegA+IkN9a6irp
	/NadiZkZ/3MLleedMbkrDibXVT9lbFp5nOIRBmmkgRn0g5ec56xIuh3xy8I2H3r/zdaS
	oinDtUsnNFqNovG8NP3hXh+T3dblRN+eorV/KGbF0LlFZrX75Q8gLwCjGTSRz+xwl2Jh
	MdlA==
X-Received: by 10.107.149.210 with SMTP id x201mr3534793iod.33.1427174104402; 
	Mon, 23 Mar 2015 22:15:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Mon, 23 Mar 2015 22:14:34 -0700 (PDT)
In-Reply-To: <1427156894-24614-3-git-send-email-randy.e.witt@linux.intel.com>
References: <1427156894-24614-1-git-send-email-randy.e.witt@linux.intel.com>
	<1427156894-24614-3-git-send-email-randy.e.witt@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Mar 2015 22:14:34 -0700
Message-ID: <CAMKF1srT2URjkAjC4uEA6GFiAQqywgfBewS8t=Aoemym-rKuew@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] image.bbclass: Empty /var/volatile if it is a mount point
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
X-List-Received-Date: Tue, 24 Mar 2015 05:15:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 23, 2015 at 5:28 PM, Randy Witt
<randy.e.witt@linux.intel.com> wrote:
> If /var/volatile is a mount point it shouldn't contain any files before
> mount time. If files are there, they will no longer be able to be accessed
> once the tmpfs gets mounted at /var/volatile.

why not use copy-bind when mounting it second time as tmpfs ?

>
> This problem can be seen for instance when systemd creates
> /var/volatile/log/journal as part of its package installation. It then
> assumes the journal is persistent even though /var/volatile/log/journal
> goes away shortly thereafter.
>
> This change makes sure that there are no files in /var/volatile if it is
> to be used as a mount point.
>
> [Yocto #7388]
>
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>  meta/classes/image.bbclass | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 89eb5f3..dfedf9d 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -181,6 +181,8 @@ POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
>  SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
>
> +ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
> +
>  # some default locales
>  IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
>
> @@ -377,6 +379,20 @@ set_systemd_default_target () {
>         fi
>  }
>
> +# If /var/volatile is not empty, we have seen problems where programs such as the
> +# journal make assumptions based on the contents of /var/volatile. The journal
> +# would then write to /var/volatile before it was mounted, thus hiding the
> +# items previously written.
> +#
> +# This change is to attempt to fix those types of issues in a way that doesn't
> +# affect users that may not be using /var/volatile.
> +empty_var_volatile () {
> +       match=`awk '$1 !~ "#" && $2 ~ /\/var\/volatile/{print $2}' ${IMAGE_ROOTFS}/etc/fstab 2> /dev/null`
> +       if [ -n "$match" ]; then
> +               find ${IMAGE_ROOTFS}/var/volatile -mindepth 1 -delete
> +       fi
> +}
> +
>  # Turn any symbolic /sbin/init link into a file
>  remove_init_link () {
>         if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

