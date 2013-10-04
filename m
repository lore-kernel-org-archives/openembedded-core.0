Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id C6BD760FA4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 17:21:36 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id gx14so3443732lab.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Oct 2013 10:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tEfCjG+l60iOqLAFRozOGzBSqolnDKaqDgYw2sQlc7U=;
	b=LTZ99LgRvR/yj67P39Eq0G3PbimdQc2M5IYTptMliqiMZipLmSCBvzYg8ISLWlaA55
	Hq3xHJ9lOaTMjIWlj3o1MVwJZ2aIlBjkExnpO1r9rSXWFbZDsIK61Y63q8fxvwnaBqFl
	g7qosFJiZH0gx4hfHexwjUo0sxiDvVXKupsD7JBou63cY0WkR3ZX9Yo4W7gQNZxeINMc
	s0SfZCQ9H5e0jMQDmR+xn/FgOW1EHquLE2icYTksjBx8xBZ+RLJiDIDKfveI6zbn1RqR
	68gS/puCYO1LxojzubwmLSYiDXWbANpuJGQ4Ax8T5bnkFAdwKRQWn0YSCX4/EpB2SvXO
	aKKw==
MIME-Version: 1.0
X-Received: by 10.112.0.173 with SMTP id 13mr12395896lbf.8.1380907297746; Fri,
	04 Oct 2013 10:21:37 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Fri, 4 Oct 2013 10:21:37 -0700 (PDT)
In-Reply-To: <1380901699-18760-1-git-send-email-mark.hatle@windriver.com>
References: <1380901699-18760-1-git-send-email-mark.hatle@windriver.com>
Date: Fri, 4 Oct 2013 13:21:37 -0400
Message-ID: <CADkTA4MhEVy+n_tNs+kPVdhCFpDsaFMMRunJ-eemgU0FUqwqOA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] run-postinst: Ensure that the postinsts are ordered
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
X-List-Received-Date: Fri, 04 Oct 2013 17:21:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 4, 2013 at 11:48 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> The postinst files were being generated using purely the name of the package,
> this unfortunately meant the run order would be based on the name of the
> package and not the order in which it was installed on the filesystem.
>
> If package A requires package Z to be fully installed, this causes a problem.
>
> Note:
>
> rpm - as the rpm based install proceeds the order is defined and captured.
>       so the problem is resolved there.
>
> ipk - this unfortunately does not appear to solve the problem for ipk, as
>       the status file is not ordered in any appreciable way.  This does not
>       cause any regressions however and sets the stage for a proper fix.

I can confirm that it does solve rpm, and ipk it makes things
"better". No matter
what, I prefer the bit of ordering over the alphabetical ordering.

Tested-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> deb - this -may- fix the deb install.  Early testing indicates at least some
>       ordering to the status file.  But it's unclear if it completely resolves
>       the issue.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package_rpm.bbclass | 14 ++++++++++----
>  meta/classes/rootfs_deb.bbclass  |  7 ++++++-
>  meta/classes/rootfs_ipk.bbclass  |  7 ++++++-
>  3 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 98aa98b..36bad09 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -391,6 +391,10 @@ EOF
>         fi
>
>         # Construct install scriptlet wrapper
> +       # Scripts need to be ordered when executed, this ensures numeric order
> +       # If we ever run into needing more the 899 scripts, we'll have to
> +       # change num to start with 1000.
> +       #
>         cat << EOF > ${WORKDIR}/scriptlet_wrapper
>  #!/bin/bash
>
> @@ -406,11 +410,13 @@ export NATIVE_ROOT=${STAGING_DIR_NATIVE}
>  if [ \$? -ne 0 ]; then
>    if [ \$4 -eq 1 ]; then
>      mkdir -p \$1/etc/rpm-postinsts
> +    num=100
> +    while [ -e \$1/etc/rpm-postinsts/\${num}-* ]; do num=\$((num + 1)); done
>      name=\`head -1 \$1/\$3 | cut -d' ' -f 2\`
> -    echo "#!\$2" > \$1/etc/rpm-postinsts/\${name}
> -    echo "# Arg: \$4" >> \$1/etc/rpm-postinsts/\${name}
> -    cat \$1/\$3 >> \$1/etc/rpm-postinsts/\${name}
> -    chmod +x \$1/etc/rpm-postinsts/\${name}
> +    echo "#!\$2" > \$1/etc/rpm-postinsts/\${num}-\${name}
> +    echo "# Arg: \$4" >> \$1/etc/rpm-postinsts/\${num}-\${name}
> +    cat \$1/\$3 >> \$1/etc/rpm-postinsts/\${num}-\${name}
> +    chmod +x \$1/etc/rpm-postinsts/\${num}-\${name}
>    else
>      echo "Error: pre/post remove scriptlet failed"
>    fi
> diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
> index 0161f7a..b1c52f9 100644
> --- a/meta/classes/rootfs_deb.bbclass
> +++ b/meta/classes/rootfs_deb.bbclass
> @@ -107,9 +107,14 @@ delayed_postinsts () {
>  }
>
>  save_postinsts () {
> +       # Scripts need to be ordered when executed, this ensures numeric order
> +       # If we ever run into needing more the 899 scripts, we'll have to
> +       # change num to start with 1000.
> +       num=100
>         for p in $(delayed_postinsts); do
>                 install -d ${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts
> -               cp ${IMAGE_ROOTFS}/var/lib/dpkg/info/$p.postinst ${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts/$p
> +               cp ${IMAGE_ROOTFS}/var/lib/dpkg/info/$p.postinst ${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts/$num-$p
> +               num=`echo \$((num+1))`
>         done
>  }
>
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> index a37ab14..b0805dc 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -106,9 +106,14 @@ delayed_postinsts () {
>  }
>
>  save_postinsts () {
> +       # Scripts need to be ordered when executed, this ensures numeric order
> +       # If we ever run into needing more the 899 scripts, we'll have to
> +       # change num to start with 1000.
> +       num=100
>         for p in $(delayed_postinsts); do
>                 install -d ${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts
> -               cp ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/info/$p.postinst ${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts/$p
> +               cp ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/info/$p.postinst ${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts/$num-$p
> +               num=`echo \$((num+1))`
>         done
>  }
>
> --
> 1.8.1.2.545.g2f19ada
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

