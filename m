Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
	[209.85.217.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED8F7FA35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 09:29:44 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id x123so22382758vsc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 01:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8BjCyCppeUJCnWHsZ345dQ1wD3Pfx338DHuaPPrwR/Q=;
	b=ukKZScg7DA0T48ti5NLew2gz1lUVjRbkiI9LKJFG3rBW5E8CvQsqKBdEjqdOfcr+xM
	bjyZlpWF66bK6noPe5+fHLU+SpIDLeYgFJVzkbiztmHHiyYotucA6coGeQs8MTaqqdlU
	9na/i4Nq0IT611xty/6RLtW3rppfVdYgr284RAFR0khF3XLU5exJq6/ufAmA4PvRSuZR
	lr2tBjffp2oIwK8snQRea+3j17O+/5t0G4ZszpPoc5TUKuSO8+cJxP3kTd790RM8w7qx
	/mmhrn/Q4RPWhOAk9ddIBuU1gahSvLZqlMHk/dlYnX8faNrf1omHZCMQKTBO6kNUh0mp
	/lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8BjCyCppeUJCnWHsZ345dQ1wD3Pfx338DHuaPPrwR/Q=;
	b=XYEuuUH2GxmbbNnAhqz3EsMb4DUQUChlEVyOSDW8ojTOujGUYO4xum4ZNQcFFHMEyk
	016jIdqjxidY85dUaS4AzE0RatN4T1EyjY131D8KjkFbMwE6Yew2RsQiAMSF7jJwE4VS
	owCtgN124/mksXpDaRtRPFNIBGpZuft50Cf3OVoJRsFLla1ZHTD2p0gpemHgyXI1TfeQ
	5Jn7x7tJ5ea1hgseiIjHiyRZjSySoS27QmJ9Ccp4/+WZ1eLQxx8xoyapcy5p4j1Gzkqq
	5FjDnWAXyLImB3L7jxINQoqhYiJSB+plRrYKhrn+ZSqKnDsyEMRFm+SBPLawcm1eGw5h
	ZTNw==
X-Gm-Message-State: APjAAAW9QENV0viy+EGCWSbeok2MFOsIs+lnniwHts6wBZJsUoNkOOyZ
	6LBljrxDr139+02a/O+E/+9X7kEIr5rsevbpIQA=
X-Google-Smtp-Source: APXvYqwVJMFVNU5bcKwEJkGh6cldD56k71erNaddVH81xY4IxE0fQsKNjEPwwAAW2VvYMjzMcLeblj68OaX7lvwAB34=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr37187966vsq.94.1577784585173; 
	Tue, 31 Dec 2019 01:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20191231083315.19828-1-n.merinov@inango-systems.com>
In-Reply-To: <20191231083315.19828-1-n.merinov@inango-systems.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 31 Dec 2019 12:29:34 +0300
Message-ID: <CANNYZj81SBio8vA1eeP5-17kAZ0OHnd0TCB2RC_pNO7uPyA66g@mail.gmail.com>
To: Nikolai Merinov <n.merinov@inango-systems.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: allow to compile from root in user namespaces
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
X-List-Received-Date: Tue, 31 Dec 2019 09:29:44 -0000
Content-Type: multipart/alternative; boundary="000000000000bb3ebf059afc9900"

--000000000000bb3ebf059afc9900
Content-Type: text/plain; charset="UTF-8"

I believe it should be possible to create a regular user inside the
container and then run bitbake as that user?

The patch effectively disables the host contamination check, fixes one
recipe that breaks, and likely introduces other issues; the assumption (and
automated testing) throughout the build is that it's run under a regular
user.

Alex

On Tue, 31 Dec 2019 at 11:40, Nikolai Merinov via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> New rootless container subsystems rely on the "user namespaces"
> Linux feature. In order to create a container from a regular user the
> user uid and subuids mapped to the uid space inside of container.
>
> There are different default configurations used for different
> container subsystems:
>
>  1. Rootless Docker[1] maps the user ID to 0, the subuids to range
>     starting from 1.
>  2. Rootless RunC[2] from OCI by default maps the user ID to 0 and
>     ignores the subuids.
>  3. LXC[3] maps the subuids to range from 0. UID not participates
>     in the mapping.
>
> The LXC variant does not allow to work on same files simultaneusly
> inside and outside of a container. Variant suggested by other
> container susbsystems assumes that files owned by user should be
> owned by root in a container environment.
>
> In order to simplify Yocto compilation in such rootless containers I
> want to allow to start the bitbake from root user in user namespace
> and allow software compilation from root user in the described
> configuration. Additionally I want to provide minimal dockerfile
> suitable for the core-image-sato image compilation.
>
> --
> [1] https://docs.docker.com/engine/security/rootless/
> [2] https://github.com/opencontainers/runc#rootless-containers
> [3]
> https://linuxcontainers.org/lxc/getting-started/#creating-unprivileged-containers-as-a-user
> ---
>  meta/classes/insane.bbclass                   |  4 ++--
>  meta/classes/sanity.bbclass                   | 10 +++++++-
>  meta/recipes-core/coreutils/coreutils_8.31.bb |  1 +
>  scripts/docker/Dockerfile                     | 19 +++++++++++++++
>  scripts/docker/oe-rootless-docker             | 24 +++++++++++++++++++
>  5 files changed, 55 insertions(+), 3 deletions(-)
>  create mode 100644 scripts/docker/Dockerfile
>  create mode 100755 scripts/docker/oe-rootless-docker
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 0564f9c2a4..3599ce3e6a 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -876,12 +876,12 @@ def package_qa_check_host_user(path, name, d, elf,
> messages):
>              raise
>      else:
>          check_uid = int(d.getVar('HOST_USER_UID'))
> -        if stat.st_uid == check_uid:
> +        if check_uid != 0 and stat.st_uid == check_uid:
>              package_qa_add_message(messages, "host-user-contaminated",
> "%s: %s is owned by uid %d, which is the same as the user running bitbake.
> This may be due to host contamination" % (pn, package_qa_clean_path(path,
> d, name), check_uid))
>              return False
>
>          check_gid = int(d.getVar('HOST_USER_GID'))
> -        if stat.st_gid == check_gid:
> +        if check_gid != 0 and stat.st_gid == check_gid:
>              package_qa_add_message(messages, "host-user-contaminated",
> "%s: %s is owned by gid %d, which is the same as the user running bitbake.
> This may be due to host contamination" % (pn, package_qa_clean_path(path,
> d, name), check_gid))
>              return False
>      return True
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 63ab6cf3df..a1eba62589 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -742,7 +742,15 @@ def check_sanity_everybuild(status, d):
>      # it makes sense to always run them.
>
>      if 0 == os.getuid():
> -        raise_sanity_error("Do not use Bitbake as root.", d)
> +        userns = False
> +        with open("/proc/self/uid_map") as f:
> +            for line in f:
> +                fields = line.split()
> +                if fields[0] == "0" and fields[1] != "0":
> +                    userns = True
> +                    break
> +        if not userns:
> +            raise_sanity_error("Do not use Bitbake as root.", d)
>
>      # Check the Python version, we now have a minimum of Python 3.4
>      import sys
> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb
> b/meta/recipes-core/coreutils/coreutils_8.31.bb
> index 57b2c1bdba..2f8009331a 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> @@ -28,6 +28,7 @@ SRC_URI[sha256sum] =
> "ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3
>  EXTRA_OECONF_class-native = "--without-gmp"
>  EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname
> --libexecdir=${libdir}"
>  EXTRA_OECONF_class-nativesdk = "--enable-install-program=arch,hostname"
> +EXTRA_OECONF_append = " FORCE_UNSAFE_CONFIGURE=1"
>
>  # acl and xattr are not default features
>  #
> diff --git a/scripts/docker/Dockerfile b/scripts/docker/Dockerfile
> new file mode 100644
> index 0000000000..4a143d6aa1
> --- /dev/null
> +++ b/scripts/docker/Dockerfile
> @@ -0,0 +1,19 @@
> +FROM ubuntu:18.04
> +
> +RUN DEBIAN_FRONTEND=noninteractive apt-get -y update --fix-missing
> +
> +# Configure locale for Python3
> +RUN DEBIAN_FRONTEND=noninteractive apt-get -y install locales ; \
> +    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales && \
> +        locale-gen en_US.UTF-8 && \
> +        update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
> +
> +ENV LANG=en_US.UTF-8
> +ENV LC_ALL=en_US.UTF-8
> +
> +# Install Yocto native dependencies
> +RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
> +        wget git-core diffstat unzip texinfo gcc-multilib \
> +        build-essential chrpath socat cpio python python3 python3-pip
> python3-pexpect \
> +        xz-utils debianutils iputils-ping python3-git python3-jinja2
> libegl1-mesa libsdl1.2-dev \
> +        pylint3 xterm gawk
> diff --git a/scripts/docker/oe-rootless-docker
> b/scripts/docker/oe-rootless-docker
> new file mode 100755
> index 0000000000..1efcc82280
> --- /dev/null
> +++ b/scripts/docker/oe-rootless-docker
> @@ -0,0 +1,24 @@
> +#!/bin/sh
> +
> +usage () {
> +CMD=$(basename $0)
> +cat <<EOF
> +Usage: $CMD [docker-build|docker-run]
> +  docker-build  Build Dockerfile locally
> +  docker-run    Run rootless docker image suitable for image compilation
> +EOF
> +}
> +
> +if ! [ -n "${DOCKER_HOST}" -a "$(stat -c '%U' "${DOCKER_HOST#*://}"
> 2>/dev/null)" = "$(whoami)" ] ; then
> +       echo "Install rootless docker according to the
> https://docs.docker.com/engine/security/rootless/"
> +       exit 1
> +fi
> +
> +if [ "$1" = "docker-build" ]; then
> +       docker build -t poky-docker $(dirname $(readlink -f $0))
> +elif [ "$1" = "docker-run" ]; then
> +       docker run -ti -v ${HOME}:${HOME} -v ${PWD}:${PWD} --workdir
> ${PWD} -e HOME poky-docker
> +else
> +       usage
> +       exit 0
> +fi
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000bb3ebf059afc9900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I believe it should be possible to create a regular u=
ser inside the container and then run bitbake as that user?=C2=A0</div><div=
><br></div><div>The patch effectively disables the host contamination check=
, fixes one recipe that breaks, and likely introduces other issues; the ass=
umption (and automated testing) throughout the build is that it&#39;s run u=
nder a regular user.</div><div><br></div><div>Alex</div></div><br><div clas=
s=3D"gmail_quote"><div class=3D"gmail_attr" dir=3D"ltr">On Tue, 31 Dec 2019=
 at 11:40, Nikolai Merinov via Openembedded-core &lt;<a href=3D"mailto:open=
embedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);bo=
rder-left-width:1px;border-left-style:solid">New rootless container subsyst=
ems rely on the &quot;user namespaces&quot;<br>
Linux feature. In order to create a container from a regular user the<br>
user uid and subuids mapped to the uid space inside of container.<br>
<br>
There are different default configurations used for different<br>
container subsystems:<br>
<br>
=C2=A01. Rootless Docker[1] maps the user ID to 0, the subuids to range<br>
=C2=A0 =C2=A0 starting from 1.<br>
=C2=A02. Rootless RunC[2] from OCI by default maps the user ID to 0 and<br>
=C2=A0 =C2=A0 ignores the subuids.<br>
=C2=A03. LXC[3] maps the subuids to range from 0. UID not participates<br>
=C2=A0 =C2=A0 in the mapping.<br>
<br>
The LXC variant does not allow to work on same files simultaneusly<br>
inside and outside of a container. Variant suggested by other<br>
container susbsystems assumes that files owned by user should be<br>
owned by root in a container environment.<br>
<br>
In order to simplify Yocto compilation in such rootless containers I<br>
want to allow to start the bitbake from root user in user namespace<br>
and allow software compilation from root user in the described<br>
configuration. Additionally I want to provide minimal dockerfile<br>
suitable for the core-image-sato image compilation.<br>
<br>
--<br>
[1] <a href=3D"https://docs.docker.com/engine/security/rootless/" target=3D=
"_blank" rel=3D"noreferrer">https://docs.docker.com/engine/security/rootles=
s/</a><br>
[2] <a href=3D"https://github.com/opencontainers/runc#rootless-containers" =
target=3D"_blank" rel=3D"noreferrer">https://github.com/opencontainers/runc=
#rootless-containers</a><br>
[3] <a href=3D"https://linuxcontainers.org/lxc/getting-started/#creating-un=
privileged-containers-as-a-user" target=3D"_blank" rel=3D"noreferrer">https=
://linuxcontainers.org/lxc/getting-started/#creating-unprivileged-container=
s-as-a-user</a><br>
---<br>
=C2=A0meta/classes/insane.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0meta/classes/sanity.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++++-<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" targ=
et=3D"_blank" rel=3D"noreferrer">coreutils_8.31.bb</a> |=C2=A0 1 +<br>
=C2=A0scripts/docker/Dockerfile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++++++++++++<br>
=C2=A0scripts/docker/oe-rootless-docker=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 24 +++++++++++++++++++<br>
=C2=A05 files changed, 55 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 scripts/docker/Dockerfile<br>
=C2=A0create mode 100755 scripts/docker/oe-rootless-docker<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index 0564f9c2a4..3599ce3e6a 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -876,12 +876,12 @@ def package_qa_check_host_user(path, name, d, elf, me=
ssages):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_uid =3D int(d.getVar(&#39;HOST_USER=
_UID&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if stat.st_uid =3D=3D check_uid:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if check_uid !=3D 0 and stat.st_uid =3D=3D che=
ck_uid:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0package_qa_add_message(mess=
ages, &quot;host-user-contaminated&quot;, &quot;%s: %s is owned by uid %d, =
which is the same as the user running bitbake. This may be due to host cont=
amination&quot; % (pn, package_qa_clean_path(path, d, name), check_uid))<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_gid =3D int(d.getVar(&#39;HOST_USER=
_GID&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if stat.st_gid =3D=3D check_gid:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if check_gid !=3D 0 and stat.st_gid =3D=3D che=
ck_gid:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0package_qa_add_message(mess=
ages, &quot;host-user-contaminated&quot;, &quot;%s: %s is owned by gid %d, =
which is the same as the user running bitbake. This may be due to host cont=
amination&quot; % (pn, package_qa_clean_path(path, d, name), check_gid))<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
=C2=A0 =C2=A0 =C2=A0return True<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index 63ab6cf3df..a1eba62589 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -742,7 +742,15 @@ def check_sanity_everybuild(status, d):<br>
=C2=A0 =C2=A0 =C2=A0# it makes sense to always run them.<br>
<br>
=C2=A0 =C2=A0 =C2=A0if 0 =3D=3D os.getuid():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise_sanity_error(&quot;Do not use Bitbake as=
 root.&quot;, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 userns =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(&quot;/proc/self/uid_map&quot;) as f=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fields =3D line.sp=
lit()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fields[0] =3D=
=3D &quot;0&quot; and fields[1] !=3D &quot;0&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user=
ns =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not userns:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise_sanity_error(&quot;Do not =
use Bitbake as root.&quot;, d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Check the Python version, we now have a minimum of Py=
thon 3.4<br>
=C2=A0 =C2=A0 =C2=A0import sys<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.b=
b" target=3D"_blank" rel=3D"noreferrer">coreutils_8.31.bb</a> b/meta/recipe=
s-core/coreutils/<a href=3D"http://coreutils_8.31.bb" target=3D"_blank" rel=
=3D"noreferrer">coreutils_8.31.bb</a><br>
index 57b2c1bdba..2f8009331a 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" targ=
et=3D"_blank" rel=3D"noreferrer">coreutils_8.31.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" targ=
et=3D"_blank" rel=3D"noreferrer">coreutils_8.31.bb</a><br>
@@ -28,6 +28,7 @@ SRC_URI[sha256sum] =3D &quot;ff7a9c918edce6b4f4b2725e3f9b=
37b0c4d193531cac49a48b56c4d0d3<br>
=C2=A0EXTRA_OECONF_class-native =3D &quot;--without-gmp&quot;<br>
=C2=A0EXTRA_OECONF_class-target =3D &quot;--enable-install-program=3Darch,h=
ostname --libexecdir=3D${libdir}&quot;<br>
=C2=A0EXTRA_OECONF_class-nativesdk =3D &quot;--enable-install-program=3Darc=
h,hostname&quot;<br>
+EXTRA_OECONF_append =3D &quot; FORCE_UNSAFE_CONFIGURE=3D1&quot;<br>
<br>
=C2=A0# acl and xattr are not default features<br>
=C2=A0#<br>
diff --git a/scripts/docker/Dockerfile b/scripts/docker/Dockerfile<br>
new file mode 100644<br>
index 0000000000..4a143d6aa1<br>
--- /dev/null<br>
+++ b/scripts/docker/Dockerfile<br>
@@ -0,0 +1,19 @@<br>
+FROM ubuntu:18.04<br>
+<br>
+RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get -y update --fix-missing<br>
+<br>
+# Configure locale for Python3<br>
+RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get -y install locales ; \<br>
+=C2=A0 =C2=A0 DEBIAN_FRONTEND=3Dnoninteractive dpkg-reconfigure locales &a=
mp;&amp; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 locale-gen en_US.UTF-8 &amp;&amp; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 update-locale LC_ALL=3Den_US.UTF-8 LANG=3Den_U=
S.UTF-8<br>
+<br>
+ENV LANG=3Den_US.UTF-8<br>
+ENV LC_ALL=3Den_US.UTF-8<br>
+<br>
+# Install Yocto native dependencies<br>
+RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get -y install \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wget git-core diffstat unzip texinfo gcc-multi=
lib \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 build-essential chrpath socat cpio python pyth=
on3 python3-pip python3-pexpect \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xz-utils debianutils iputils-ping python3-git =
python3-jinja2 libegl1-mesa libsdl1.2-dev \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pylint3 xterm gawk<br>
diff --git a/scripts/docker/oe-rootless-docker b/scripts/docker/oe-rootless=
-docker<br>
new file mode 100755<br>
index 0000000000..1efcc82280<br>
--- /dev/null<br>
+++ b/scripts/docker/oe-rootless-docker<br>
@@ -0,0 +1,24 @@<br>
+#!/bin/sh<br>
+<br>
+usage () {<br>
+CMD=3D$(basename $0)<br>
+cat &lt;&lt;EOF<br>
+Usage: $CMD [docker-build|docker-run]<br>
+=C2=A0 docker-build=C2=A0 Build Dockerfile locally<br>
+=C2=A0 docker-run=C2=A0 =C2=A0 Run rootless docker image suitable for imag=
e compilation<br>
+EOF<br>
+}<br>
+<br>
+if ! [ -n &quot;${DOCKER_HOST}&quot; -a &quot;$(stat -c &#39;%U&#39; &quot=
;${DOCKER_HOST#*://}&quot; 2&gt;/dev/null)&quot; =3D &quot;$(whoami)&quot; =
] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Install rootless docker according to=
 the <a href=3D"https://docs.docker.com/engine/security/rootless/" target=
=3D"_blank" rel=3D"noreferrer">https://docs.docker.com/engine/security/root=
less/</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
+fi<br>
+<br>
+if [ &quot;$1&quot; =3D &quot;docker-build&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0docker build -t poky-docker $(dirname $(readlin=
k -f $0))<br>
+elif [ &quot;$1&quot; =3D &quot;docker-run&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0docker run -ti -v ${HOME}:${HOME} -v ${PWD}:${P=
WD} --workdir ${PWD} -e HOME poky-docker<br>
+else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 0<br>
+fi<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank" rel=3D"noreferrer">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000bb3ebf059afc9900--
