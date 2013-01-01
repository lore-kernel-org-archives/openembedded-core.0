Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tq6YU-0006Il-GL
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Jan 2013 19:27:23 +0100
Received: by mail-ob0-f180.google.com with SMTP id wd20so12439004obb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jan 2013 10:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=+O95G7jVmg0ChbMsG3pVqKVX6MC71xsgDbiQ2vJcIL8=;
	b=y719qot2cSyuL+qz73/SEozEbDm7Sh6fXm697iAG6mTRn5Mo12Y1J64qP90ouToo58
	nXMDM8vjCmXhnb20qqOOUGiOXfoDHllf8VTsiBmtG6yu7cYA/oSBZFLOWYU6RW+2IFTz
	1kBcZpZaf4ygRJ2mnA9HzqDL+QsteYSGcLVq7scwaA/0vL8RuCY/BBBr3UowJdSTfRQQ
	I9sYBzqXB7JyZDfRQFVfVUtFc+XYz60hL4UTtgONYUdbEg/tRJPOVGB5jXbt+sxKjhbd
	SACzJzWkj9CNZ4nyPtOI5asGVyUftout76TNABWSQ0T4z7FMhAREvFehvbTS1DUqRUqx
	I/kQ==
MIME-Version: 1.0
Received: by 10.182.54.103 with SMTP id i7mr36219046obp.62.1357063932796; Tue,
	01 Jan 2013 10:12:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Tue, 1 Jan 2013 10:12:12 -0800 (PST)
In-Reply-To: <b809c41a8171f0b113f4f6dd506d52ee0e18cd3d.1356919994.git.Qi.Chen@windriver.com>
References: <cover.1356919994.git.Qi.Chen@windriver.com>
	<b809c41a8171f0b113f4f6dd506d52ee0e18cd3d.1356919994.git.Qi.Chen@windriver.com>
Date: Tue, 1 Jan 2013 16:12:12 -0200
X-Google-Sender-Auth: wWLitNKT1p2k8eplueJ4M1LCHk8
Message-ID: <CAP9ODKoCGGj8wEhpgJ2UziQar_pc45t7P76DSQJSSjSf4LFyRw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V5 2/4] image.bbclass: add two hook funtions
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
X-List-Received-Date: Tue, 01 Jan 2013 18:27:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 31, 2012 at 12:16 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> read_only_rootfs_hook: this funtion is invoked only if 'read-only-rootfs'
> is in IMAGE_FEATURES. It tweaks some basic files and makes populate-
> volatile.sh script run at rootfs time.
>
> choose_volatile_conf_file: this function is invoked no matter
> 'read-only-rootfs' is in IMAGE_FEATURES or not, it properly chooses
> the right conf file for volatile storage handling according to the
> IMAGE_FEATURES.
>
> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image.bbclass |   30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index d3a416d..57bd0e3 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -396,6 +396,36 @@ zap_root_password () {
>         mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
>  }
>
> +# A hook function to support read-only-rootfs IMAGE_FEATURES
> +read_only_rootfs_hook () {
> +       # Tweak the mount option in fstab
> +       sed -i '/rootfs/ s/defaults/ro/' ${IMAGE_ROOTFS}/etc/fstab

Maybe use 'defaults,ro' in fstab?

> +       # Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
> +       if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
> +               sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
> +       fi
> +       # Run populate-volatile.sh at rootfs time to set up basic files
> +       # and directories to support read-only rootfs.
> +       if [ -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
> +               ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
> +       fi
> +}
> +
> +# Choose the correct config file for volatile storage handling according to the image type
> +choose_volatile_conf_file () {
> +       if ${@base_contains("IMAGE_FEATURES", "x11-sato", "true", "false" ,d)}; then
> +               if [ -e ${IMAGE_ROOTFS}/etc/default/volatiles_stage/volatiles-readonly-sato ]; then
> +                       cp ${IMAGE_ROOTFS}/etc/default/volatiles_stage/volatiles-readonly-sato \
> +                               ${IMAGE_ROOTFS}/etc/default/volatiles/00_core_readonly
> +               fi
> +       else
> +               if [ -e ${IMAGE_ROOTFS}/etc/default/volatiles_stage/volatiles-readonly-minimal ]; then
> +                       cp ${IMAGE_ROOTFS}/etc/default/volatiles_stage/volatiles-readonly-minimal \
> +                               ${IMAGE_ROOTFS}/etc/default/volatiles/00_core_readonly
> +               fi
> +       fi

Wouldn't be better to have a package which provides the need valatile
config? this makes it easy to reuse for other images.

> +}
> +
>  # allow openssh accept login with empty password string
>  openssh_allow_empty_password () {
>         if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
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


