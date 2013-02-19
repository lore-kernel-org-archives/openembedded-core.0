Received: from mail-la0-f49.google.com ([209.85.215.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U7lng-0006Om-Ka
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 12:56:00 +0100
Received: by mail-la0-f49.google.com with SMTP id fs13so6288014lab.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 03:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9lJElOpRxtIqGpm0bcWjfANxoxnqQ5H730KOV6gKwuc=;
	b=QhjGCzrVxD752fVg75Nt1H4z3gr5MPuIZblHigFVG/Sbe8j+qbnN+mOAXbSj56aWGO
	XCZjHMBPXE/0OOIxuGCOc4xyPgK+GIOAgBbrZbI5GigMuc+s5QkSdZePE31n6QCHkvkM
	muBUT08Vbi2JaojlziQGiUWhxZwRv2b/qgwBfR9l0AMKKlR30BpABc02zB5jauM5cEUD
	9uQF0wMx1qpuMzrXtTxWJzKM/cqM7K8h0Btt3dAlOsoSIN1iOy50cpZGDmq+s0lPqutd
	8W4n13KblFuJN21jDA+g4+AVOsPFeSOk0PEmJtGcpZPzJH43OIMaPf8howAO73q+soYZ
	2YnQ==
MIME-Version: 1.0
X-Received: by 10.152.125.239 with SMTP id mt15mr13924295lab.26.1361273987287; 
	Tue, 19 Feb 2013 03:39:47 -0800 (PST)
Received: by 10.114.28.73 with HTTP; Tue, 19 Feb 2013 03:39:47 -0800 (PST)
In-Reply-To: <faa3ee348ac4e3d74d7f2f00d954ed6ee845bba1.1361258872.git.Qi.Chen@windriver.com>
References: <cover.1361258872.git.Qi.Chen@windriver.com>
	<faa3ee348ac4e3d74d7f2f00d954ed6ee845bba1.1361258872.git.Qi.Chen@windriver.com>
Date: Tue, 19 Feb 2013 12:39:47 +0100
Message-ID: <CAC1BbcQHHs+La4h=0GaHWWWsFzpe8EffJKHNyMdPWzNb+0znWw@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Qi.Chen@windriver.com
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] image.bbclass: add a hook funtion to support readonly rootfs
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
X-List-Received-Date: Tue, 19 Feb 2013 11:56:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 19 February 2013 08:38,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> read_only_rootfs_hook: this funtion is invoked only if 'read-only-rootfs'
> is in IMAGE_FEATURES. It tweaks some basic files and makes populate-
> volatile.sh script run at rootfs time.
>
> For now, it has real effect only if the init system is sysvinit.
>
> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image.bbclass |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index dd78acb..7d533b6 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -233,6 +233,24 @@ run_intercept_scriptlets () {
>         fi
>  }
>
> +# A hook function to support read-only-rootfs IMAGE_FEATURES
> +# Currently, it only supports sysvinit system.
> +read_only_rootfs_hook () {
> +       if ${@base_contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
> +               # Tweak the mount option in fstab
> +               sed -i '/rootfs/ s/defaults/ro/' ${IMAGE_ROOTFS}/etc/fstab

to be cautious i would say
sed -i -e '/^[#[:space:]]*rootfs/s/defaults/ro/' ${IMAGE_ROOTFS}/etc/fstab
for ro rootfs fs_passno should be set to 0, too, imo:
sed -i -e '/^[#[:space:]]*rootfs/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}'
${IMAGE_ROOTFS}/etc/fstab

> +               # Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
> +               if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
> +                       sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
> +               fi
> +               # Run populate-volatile.sh at rootfs time to set up basic files
> +               # and directories to support read-only rootfs.
> +               if [ -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then

-x if you want to execute it below.
> +                       ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
> +               fi
> +       fi
> +}
> +
>  fakeroot do_rootfs () {
>         #set -x
>         # When use the rpm incremental image generation, don't remove the rootfs


