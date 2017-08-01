Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id EBAE97834D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 11:07:34 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id v127so6320772itd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7haP9tLjz8seq822cSHeg+2SZsCygvDFd20SSs/XYEw=;
	b=Z1uumGDDuQbxrklZr5MXYkEzKBhhP7YGGZplAqP6Lo1zFR5rcl4lLnhG1RrQBVfbU1
	19dy/Uf8j6fhj67upa9TmI0N7dnBGbMdATfc+0XJjj/qPLalUhQyYPaG/E31THs3SMa+
	wgKU5Js38pch1BSnan8IXpRFqvizkJ4QU7/CJwt1HsLRMmdFjijYxPS600zETgUSzYWb
	UjFvFRKyXXO1ks0o9MK1zlBp0Z3QON9jl9Xkpb6C5eiN8ijlNZBp6g8IOC//oJNbxr5L
	YXFSazjI+dkX1mRq0K2wrvhYJjf8AN4CD7BR0atdJUJyMlMu0XZ0jd5ZKdwuW33YFWLr
	mHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7haP9tLjz8seq822cSHeg+2SZsCygvDFd20SSs/XYEw=;
	b=PMURSxFCI2NTocyE+AaichSMxsHKJudaZVMkiZwSt8h3ekLoExfFRok0PxwWjJh4ew
	sYIjazbnU8ImvoHnsYXi4LF+QadTI8W6RffTkluPKIay8xptTO65+p74jkl6RtSX7NNA
	dcF1nOqj4F5PWxt90ZHqUC17zQxbPWpntJ7plAudqK57p0Lp07+Nq2LwRr+QW4p04X3d
	avlW3KOpcA1Q8n3hauSc/6x1RmGq7MhV4D415j5X/jCToCmTPRdRbH9Mz0cuTdWUonXx
	T/FFGPuPTxz77Yg6RnaNFnE9CEyqK+xLbybyrmhTIiHmsKwDfyKGl8GZI/cVCZsJV4Tv
	e4ug==
X-Gm-Message-State: AIVw111HOezmE3o8g4eQ7kybOVGa1PEgLEaRGCUjMmcJDwXjbat3LGVu
	g8imPIk0rGSoh4C/7cOQhxFcNlB1r+zw
X-Received: by 10.36.26.13 with SMTP id 13mr1230026iti.87.1501585655813; Tue,
	01 Aug 2017 04:07:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 1 Aug 2017 04:07:15 -0700 (PDT)
In-Reply-To: <1500949398.19503.0.camel@gmail.com>
References: <20170629123022.4580-1-JPEWhacker@gmail.com>
	<20170704011818.724-1-JPEWhacker@gmail.com>
	<1500949398.19503.0.camel@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Aug 2017 12:07:15 +0100
Message-ID: <CAJTo0LZPFUEskGphbk8PnTK1aSOOCSt3JuCTxYGbkiQiKPnPuA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openssh: Fix key generation with systemd
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
X-List-Received-Date: Tue, 01 Aug 2017 11:07:35 -0000
Content-Type: multipart/alternative; boundary="001a11441b5c9d615b0555af279b"

--001a11441b5c9d615b0555af279b
Content-Type: text/plain; charset="UTF-8"

Sorry didn't notice the v2.  In staging now.

Ross

On 25 July 2017 at 03:23, Joshua Watt <jpewhacker@gmail.com> wrote:

> On Mon, 2017-07-03 at 20:18 -0500, Joshua Watt wrote:
> > 106b59d9 broke SSH host key generation when systemd and a read-only
> > root file
> > system are in use because there isn't a way for systemd to get the
> > optional
> > weak assigment of SYSCONFDIR from /etc/default/sshd and still provide
> > a default
> > value if it is not specified. Instead, move the logic for determining
> > if keys
> > need to be created to a helper script that both the SysV init script
> > and the
> > systemd unit file can reference.
> >
> > This does mean that the systemd unit file can't check for file
> > existence to
> > know if it should start the service, but it wasn't able to do that
> > correctly
> > anyway anymore. This should be a problem since the serivce is only
> > run once per
> > power cycle by systemd, and should exit quickly if the keys already
> > exist
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/recipes-connectivity/openssh/openssh/init     | 69 +-----------
> > ----------
> >  .../openssh/openssh/sshd_check_keys                | 64
> > ++++++++++++++++++++
> >  .../openssh/openssh/sshdgenkeys.service            | 16 +----
> >  meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  8 +++
> >  4 files changed, 76 insertions(+), 81 deletions(-)
> >  create mode 100644 meta/recipes-
> > connectivity/openssh/openssh/sshd_check_keys
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh/init
> > b/meta/recipes-connectivity/openssh/openssh/init
> > index 386628a..34ba0f8 100644
> > --- a/meta/recipes-connectivity/openssh/openssh/init
> > +++ b/meta/recipes-connectivity/openssh/openssh/init
> > @@ -19,25 +19,6 @@ fi
> >  [ -z "$SYSCONFDIR" ] && SYSCONFDIR=/etc/ssh
> >  mkdir -p $SYSCONFDIR
> >
> > -parse_sshd_opts() {
> > -    set -- ${SSHD_OPTS} --
> > -    sshd_config=/etc/ssh/sshd_config
> > -    while true ; do
> > -        case "$1" in
> > -        -f*) if [ "$1" = "-f" ] ; then
> > -                 sshd_config="$2"
> > -                 shift
> > -             else
> > -                 sshd_config="${1#-f}"
> > -             fi
> > -             shift
> > -             ;;
> > -        --) shift; break;;
> > -        *) shift;;
> > -        esac
> > -    done
> > -}
> > -
> >  check_for_no_start() {
> >      # forget it if we're trying to start, and
> > /etc/ssh/sshd_not_to_be_run exists
> >      if [ -e $SYSCONFDIR/sshd_not_to_be_run ]; then
> > @@ -58,57 +39,13 @@ check_config() {
> >       /usr/sbin/sshd -t $SSHD_OPTS || exit 1
> >  }
> >
> > -check_keys() {
> > -     # parse location of keys
> > -     local HOST_KEY_RSA
> > -     local HOST_KEY_DSA
> > -     local HOST_KEY_ECDSA
> > -     local HOST_KEY_ED25519
> > -
> > -     parse_sshd_opts
> > -     HOST_KEY_RSA=$(grep ^HostKey "${sshd_config}" | grep _rsa_ |
> > tail -1 | awk ' { print $2 } ')
> > -     [ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$(grep HostKey
> > "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
> > -     [ -z "${HOST_KEY_RSA}" ] &&
> > HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
> > -     HOST_KEY_DSA=$(grep ^HostKey "${sshd_config}" | grep _dsa_ |
> > tail -1 | awk ' { print $2 } ')
> > -     [ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$(grep HostKey
> > "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
> > -     [ -z "${HOST_KEY_DSA}" ] &&
> > HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
> > -     HOST_KEY_ECDSA=$(grep ^HostKey "${sshd_config}" | grep
> > _ecdsa_ | tail -1 | awk ' { print $2 } ')
> > -     [ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$(grep HostKey
> > "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
> > -     [ -z "${HOST_KEY_ECDSA}" ] &&
> > HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
> > -     HOST_KEY_ED25519=$(grep ^HostKey "${sshd_config}" | grep
> > _ed25519_ | tail -1 | awk ' { print $2 } ')
> > -     [ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$(grep
> > HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | awk ' { print
> > $2 } ')
> > -     [ -z "${HOST_KEY_ED25519}" ] &&
> > HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
> > -
> > -     # create keys if necessary
> > -     if [ ! -f $HOST_KEY_RSA ]; then
> > -             echo "  generating ssh RSA key..."
> > -             mkdir -p $(dirname $HOST_KEY_RSA)
> > -             ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
> > -     fi
> > -     if [ ! -f $HOST_KEY_ECDSA ]; then
> > -             echo "  generating ssh ECDSA key..."
> > -             mkdir -p $(dirname $HOST_KEY_ECDSA)
> > -             ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
> > -     fi
> > -     if [ ! -f $HOST_KEY_DSA ]; then
> > -             echo "  generating ssh DSA key..."
> > -             mkdir -p $(dirname $HOST_KEY_DSA)
> > -             ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
> > -     fi
> > -     if [ ! -f $HOST_KEY_ED25519 ]; then
> > -             echo "  generating ssh ED25519 key..."
> > -             mkdir -p $(dirname $HOST_KEY_ED25519)
> > -             ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
> > -     fi
> > -}
> > -
> >  export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
> >
> >  case "$1" in
> >    start)
> >       check_for_no_start
> >       echo "Starting OpenBSD Secure Shell server: sshd"
> > -     check_keys
> > +     @LIBEXECDIR@/sshd_check_keys
> >       check_privsep_dir
> >       start-stop-daemon -S -p $PIDFILE -x /usr/sbin/sshd --
> > $SSHD_OPTS
> >          echo "done."
> > @@ -121,7 +58,7 @@ case "$1" in
> >
> >    reload|force-reload)
> >       check_for_no_start
> > -     check_keys
> > +     @LIBEXECDIR@/sshd_check_keys
> >       check_config
> >          echo -n "Reloading OpenBSD Secure Shell server's
> > configuration"
> >       start-stop-daemon -K -p $PIDFILE -s 1 -x /usr/sbin/sshd
> > @@ -129,7 +66,7 @@ case "$1" in
> >       ;;
> >
> >    restart)
> > -     check_keys
> > +     @LIBEXECDIR@/sshd_check_keys
> >       check_config
> >          echo -n "Restarting OpenBSD Secure Shell server: sshd"
> >       start-stop-daemon -K -p $PIDFILE --oknodo -x /usr/sbin/sshd
> > diff --git a/meta/recipes-
> > connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-
> > connectivity/openssh/openssh/sshd_check_keys
> > new file mode 100644
> > index 0000000..f5bba53
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
> > @@ -0,0 +1,64 @@
> > +#! /bin/sh
> > +
> > +# /etc/default/ssh may set SYSCONFDIR and SSHD_OPTS
> > +if test -f /etc/default/ssh; then
> > +    . /etc/default/ssh
> > +fi
> > +
> > +[ -z "$SYSCONFDIR" ] && SYSCONFDIR=/etc/ssh
> > +mkdir -p $SYSCONFDIR
> > +
> > +# parse sshd options
> > +set -- ${SSHD_OPTS} --
> > +sshd_config=/etc/ssh/sshd_config
> > +while true ; do
> > +    case "$1" in
> > +    -f*) if [ "$1" = "-f" ] ; then
> > +            sshd_config="$2"
> > +            shift
> > +        else
> > +            sshd_config="${1#-f}"
> > +        fi
> > +        shift
> > +        ;;
> > +    --) shift; break;;
> > +    *) shift;;
> > +    esac
> > +done
> > +
> > +# parse location of keys
> > +HOST_KEY_RSA=$(grep ^HostKey "${sshd_config}" | grep _rsa_ | tail -1
> > | awk ' { print $2 } ')
> > +[ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$(grep HostKey
> > "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
> > +[ -z "${HOST_KEY_RSA}" ] &&
> > HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
> > +HOST_KEY_DSA=$(grep ^HostKey "${sshd_config}" | grep _dsa_ | tail -1
> > | awk ' { print $2 } ')
> > +[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$(grep HostKey
> > "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
> > +[ -z "${HOST_KEY_DSA}" ] &&
> > HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
> > +HOST_KEY_ECDSA=$(grep ^HostKey "${sshd_config}" | grep _ecdsa_ |
> > tail -1 | awk ' { print $2 } ')
> > +[ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$(grep HostKey
> > "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
> > +[ -z "${HOST_KEY_ECDSA}" ] &&
> > HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
> > +HOST_KEY_ED25519=$(grep ^HostKey "${sshd_config}" | grep _ed25519_ |
> > tail -1 | awk ' { print $2 } ')
> > +[ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$(grep HostKey
> > "${sshd_config}" | grep _ed25519_ | tail -1 | awk ' { print $2 } ')
> > +[ -z "${HOST_KEY_ED25519}" ] &&
> > HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
> > +
> > +# create keys if necessary
> > +if [ ! -f $HOST_KEY_RSA ]; then
> > +    echo "  generating ssh RSA key..."
> > +    mkdir -p $(dirname $HOST_KEY_RSA)
> > +    ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
> > +fi
> > +if [ ! -f $HOST_KEY_ECDSA ]; then
> > +    echo "  generating ssh ECDSA key..."
> > +    mkdir -p $(dirname $HOST_KEY_ECDSA)
> > +    ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
> > +fi
> > +if [ ! -f $HOST_KEY_DSA ]; then
> > +    echo "  generating ssh DSA key..."
> > +    mkdir -p $(dirname $HOST_KEY_DSA)
> > +    ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
> > +fi
> > +if [ ! -f $HOST_KEY_ED25519 ]; then
> > +    echo "  generating ssh ED25519 key..."
> > +    mkdir -p $(dirname $HOST_KEY_ED25519)
> > +    ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
> > +fi
> > +
> > diff --git a/meta/recipes-
> > connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-
> > connectivity/openssh/openssh/sshdgenkeys.service
> > index 148e6ad..603c337 100644
> > --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > @@ -1,22 +1,8 @@
> >  [Unit]
> >  Description=OpenSSH Key Generation
> >  RequiresMountsFor=/var /run
> > -ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
> > -ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
> > -ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
> > -ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
> >
> >  [Service]
> > -Environment="SYSCONFDIR=/etc/ssh"
> > -EnvironmentFile=-/etc/default/ssh
> > -ExecStart=@BASE_BINDIR@/mkdir -p $SYSCONFDIR
> > -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_rsa_key
> > -N '' -t rsa
> > -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_dsa_key
> > -N '' -t dsa
> > -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ecdsa_key
> > -N '' -t ecdsa
> > -ExecStart=@BINDIR@/ssh-keygen -q -f
> > ${SYSCONFDIR}/ssh_host_ed25519_key -N '' -t ed25519
> > +ExecStart=@LIBEXECDIR@/sshd_check_keys
> >  Type=oneshot
> >  RemainAfterExit=yes
> > diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > index 7bd313b..fdbee85 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > @@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenS
> > SH/portable/openssh-${PV}.tar
> >             file://openssh-7.1p1-conditional-compile-des-in-
> > cipher.patch \
> >             file://openssh-7.1p1-conditional-compile-des-in-
> > pkcs11.patch \
> >             file://fix-potential-signed-overflow-in-pointer-
> > arithmatic.patch \
> > +           file://sshd_check_keys \
> >             "
> >
> >  PAM_SRC_URI = "file://sshd"
> > @@ -118,7 +119,13 @@ do_install_append () {
> >       sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> >               -e 's,@SBINDIR@,${sbindir},g' \
> >               -e 's,@BINDIR@,${bindir},g' \
> > +             -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> >               ${D}${systemd_unitdir}/system/sshd.socket
> > ${D}${systemd_unitdir}/system/*.service
> > +
> > +     sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> > +             ${D}${sysconfdir}/init.d/sshd
> > +
> > +     install -D -m 0755 ${WORKDIR}/sshd_check_keys
> > ${D}${libexecdir}/${BPN}/sshd_check_keys
> >  }
> >
> >  do_install_ptest () {
> > @@ -133,6 +140,7 @@ FILES_${PN}-scp = "${bindir}/scp.${BPN}"
> >  FILES_${PN}-ssh = "${bindir}/ssh.${BPN}
> > ${sysconfdir}/ssh/ssh_config"
> >  FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd
> > ${systemd_unitdir}/system"
> >  FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli
> > ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly
> > ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
> > +FILES_${PN}-sshd += "${libexecdir}/${BPN}/sshd_check_keys"
> >  FILES_${PN}-sftp = "${bindir}/sftp"
> >  FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
> >  FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
>
> Ping?
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11441b5c9d615b0555af279b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry didn&#39;t notice the v2.=C2=A0 In staging now.<div>=
<br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 25 July 2017 at 03:23, Joshua Watt <span dir=3D"ltr">&lt;<=
a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HO=
EnZb"><div class=3D"h5">On Mon, 2017-07-03 at 20:18 -0500, Joshua Watt wrot=
e:<br>
&gt; 106b59d9 broke SSH host key generation when systemd and a read-only<br=
>
&gt; root file<br>
&gt; system are in use because there isn&#39;t a way for systemd to get the=
<br>
&gt; optional<br>
&gt; weak assigment of SYSCONFDIR from /etc/default/sshd and still provide<=
br>
&gt; a default<br>
&gt; value if it is not specified. Instead, move the logic for determining<=
br>
&gt; if keys<br>
&gt; need to be created to a helper script that both the SysV init script<b=
r>
&gt; and the<br>
&gt; systemd unit file can reference.<br>
&gt;<br>
&gt; This does mean that the systemd unit file can&#39;t check for file<br>
&gt; existence to<br>
&gt; know if it should start the service, but it wasn&#39;t able to do that=
<br>
&gt; correctly<br>
&gt; anyway anymore. This should be a problem since the serivce is only<br>
&gt; run once per<br>
&gt; power cycle by systemd, and should exit quickly if the keys already<br=
>
&gt; exist<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
>JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/<wbr>openssh/openssh/init=C2=A0 =C2=A0=
 =C2=A0| 69 +-----------<br>
&gt; ----------<br>
&gt;=C2=A0 .../openssh/openssh/sshd_<wbr>check_keys=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 64<br>
&gt; ++++++++++++++++++++<br>
&gt;=C2=A0 .../openssh/openssh/<wbr>sshdgenkeys.service=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 16 +----<br>
&gt;=C2=A0 meta/recipes-connectivity/<wbr>openssh/<a href=3D"http://openssh=
_7.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_7.5p1.bb</a> |=C2=
=A0 8 +++<br>
&gt;=C2=A0 4 files changed, 76 insertions(+), 81 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-<br>
&gt; connectivity/openssh/openssh/<wbr>sshd_check_keys<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/<wbr>openssh/openssh/init<br>
&gt; b/meta/recipes-connectivity/<wbr>openssh/openssh/init<br>
&gt; index 386628a..34ba0f8 100644<br>
&gt; --- a/meta/recipes-connectivity/<wbr>openssh/openssh/init<br>
&gt; +++ b/meta/recipes-connectivity/<wbr>openssh/openssh/init<br>
&gt; @@ -19,25 +19,6 @@ fi<br>
&gt;=C2=A0 [ -z &quot;$SYSCONFDIR&quot; ] &amp;&amp; SYSCONFDIR=3D/etc/ssh<=
br>
&gt;=C2=A0 mkdir -p $SYSCONFDIR<br>
&gt;<br>
&gt; -parse_sshd_opts() {<br>
&gt; -=C2=A0 =C2=A0 set -- ${SSHD_OPTS} --<br>
&gt; -=C2=A0 =C2=A0 sshd_config=3D/etc/ssh/sshd_<wbr>config<br>
&gt; -=C2=A0 =C2=A0 while true ; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$1&quot; in<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 -f*) if [ &quot;$1&quot; =3D &quot;-f&quo=
t; ] ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sshd_co=
nfig=3D&quot;$2&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shift<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sshd_co=
nfig=3D&quot;${1#-f}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shift<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 --) shift; break;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *) shift;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; -=C2=A0 =C2=A0 done<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 check_for_no_start() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # forget it if we&#39;re trying to start, and<br>
&gt; /etc/ssh/sshd_not_to_be_run exists<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if [ -e $SYSCONFDIR/sshd_not_to_be_run ]; then<br>
&gt; @@ -58,57 +39,13 @@ check_config() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/sbin/sshd -t $SSHD_OPTS || exit 1<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -check_keys() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# parse location of keys<br>
&gt; -=C2=A0 =C2=A0 =C2=A0local HOST_KEY_RSA<br>
&gt; -=C2=A0 =C2=A0 =C2=A0local HOST_KEY_DSA<br>
&gt; -=C2=A0 =C2=A0 =C2=A0local HOST_KEY_ECDSA<br>
&gt; -=C2=A0 =C2=A0 =C2=A0local HOST_KEY_ED25519<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0parse_sshd_opts<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HOST_KEY_RSA=3D$(grep ^HostKey &quot;${sshd_confi=
g}&quot; | grep _rsa_ |<br>
&gt; tail -1 | awk &#39; { print $2 } &#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ -z &quot;${HOST_KEY_RSA}&quot; ] &amp;&amp; HOS=
T_KEY_RSA=3D$(grep HostKey<br>
&gt; &quot;${sshd_config}&quot; | grep _rsa_ | tail -1 | awk &#39; { print =
$2 } &#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ -z &quot;${HOST_KEY_RSA}&quot; ] &amp;&amp;<br>
&gt; HOST_KEY_RSA=3D$SYSCONFDIR/ssh_<wbr>host_rsa_key<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HOST_KEY_DSA=3D$(grep ^HostKey &quot;${sshd_confi=
g}&quot; | grep _dsa_ |<br>
&gt; tail -1 | awk &#39; { print $2 } &#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ -z &quot;${HOST_KEY_DSA}&quot; ] &amp;&amp; HOS=
T_KEY_DSA=3D$(grep HostKey<br>
&gt; &quot;${sshd_config}&quot; | grep _dsa_ | tail -1 | awk &#39; { print =
$2 } &#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ -z &quot;${HOST_KEY_DSA}&quot; ] &amp;&amp;<br>
&gt; HOST_KEY_DSA=3D$SYSCONFDIR/ssh_<wbr>host_dsa_key<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HOST_KEY_ECDSA=3D$(grep ^HostKey &quot;${sshd_con=
fig}&quot; | grep<br>
&gt; _ecdsa_ | tail -1 | awk &#39; { print $2 } &#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ -z &quot;${HOST_KEY_ECDSA}&quot; ] &amp;&amp; H=
OST_KEY_ECDSA=3D$(grep HostKey<br>
&gt; &quot;${sshd_config}&quot; | grep _ecdsa_ | tail -1 | awk &#39; { prin=
t $2 } &#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ -z &quot;${HOST_KEY_ECDSA}&quot; ] &amp;&amp;<b=
r>
&gt; HOST_KEY_ECDSA=3D$SYSCONFDIR/<wbr>ssh_host_ecdsa_key<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HOST_KEY_ED25519=3D$(grep ^HostKey &quot;${sshd_c=
onfig}&quot; | grep<br>
&gt; _ed25519_ | tail -1 | awk &#39; { print $2 } &#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ -z &quot;${HOST_KEY_ED25519}&quot; ] &amp;&amp;=
 HOST_KEY_ED25519=3D$(grep<br>
&gt; HostKey &quot;${sshd_config}&quot; | grep _ed25519_ | tail -1 | awk &#=
39; { print<br>
&gt; $2 } &#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ -z &quot;${HOST_KEY_ED25519}&quot; ] &amp;&amp;=
<br>
&gt; HOST_KEY_ED25519=3D$SYSCONFDIR/<wbr>ssh_host_ed25519_key<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# create keys if necessary<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ ! -f $HOST_KEY_RSA ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=C2=A0 gen=
erating ssh RSA key...&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(dirname $H=
OST_KEY_RSA)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh-keygen -q -f $HOS=
T_KEY_RSA -N &#39;&#39; -t rsa<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ ! -f $HOST_KEY_ECDSA ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=C2=A0 gen=
erating ssh ECDSA key...&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(dirname $H=
OST_KEY_ECDSA)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh-keygen -q -f $HOS=
T_KEY_ECDSA -N &#39;&#39; -t ecdsa<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ ! -f $HOST_KEY_DSA ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=C2=A0 gen=
erating ssh DSA key...&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(dirname $H=
OST_KEY_DSA)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh-keygen -q -f $HOS=
T_KEY_DSA -N &#39;&#39; -t dsa<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ ! -f $HOST_KEY_ED25519 ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=C2=A0 gen=
erating ssh ED25519 key...&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(dirname $H=
OST_KEY_ED25519)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh-keygen -q -f $HOS=
T_KEY_ED25519 -N &#39;&#39; -t ed25519<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 export PATH=3D&quot;${PATH:+$PATH:}/usr/<wbr>sbin:/sbin&quot;<br=
>
&gt;<br>
&gt;=C2=A0 case &quot;$1&quot; in<br>
&gt;=C2=A0 =C2=A0 start)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0check_for_no_start<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Starting OpenBSD Secure Shell ser=
ver: sshd&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0check_keys<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@LIBEXECDIR@/sshd_check_keys<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0check_privsep_dir<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon -S -p $PIDFILE -x /usr/sbi=
n/sshd --<br>
&gt; $SSHD_OPTS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;done.&quot;<br>
&gt; @@ -121,7 +58,7 @@ case &quot;$1&quot; in<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 reload|force-reload)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0check_for_no_start<br>
&gt; -=C2=A0 =C2=A0 =C2=A0check_keys<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@LIBEXECDIR@/sshd_check_keys<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0check_config<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo -n &quot;Reloading OpenBSD Secu=
re Shell server&#39;s<br>
&gt; configuration&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon -K -p $PIDFILE -s 1 -x /us=
r/sbin/sshd<br>
&gt; @@ -129,7 +66,7 @@ case &quot;$1&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 restart)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0check_keys<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@LIBEXECDIR@/sshd_check_keys<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0check_config<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo -n &quot;Restarting OpenBSD Sec=
ure Shell server: sshd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon -K -p $PIDFILE --oknodo -x=
 /usr/sbin/sshd<br>
&gt; diff --git a/meta/recipes-<br>
&gt; connectivity/openssh/openssh/<wbr>sshd_check_keys b/meta/recipes-<br>
&gt; connectivity/openssh/openssh/<wbr>sshd_check_keys<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f5bba53<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/<wbr>openssh/openssh/sshd_check_<wbr>k=
eys<br>
&gt; @@ -0,0 +1,64 @@<br>
&gt; +#! /bin/sh<br>
&gt; +<br>
&gt; +# /etc/default/ssh may set SYSCONFDIR and SSHD_OPTS<br>
&gt; +if test -f /etc/default/ssh; then<br>
&gt; +=C2=A0 =C2=A0 . /etc/default/ssh<br>
&gt; +fi<br>
&gt; +<br>
&gt; +[ -z &quot;$SYSCONFDIR&quot; ] &amp;&amp; SYSCONFDIR=3D/etc/ssh<br>
&gt; +mkdir -p $SYSCONFDIR<br>
&gt; +<br>
&gt; +# parse sshd options<br>
&gt; +set -- ${SSHD_OPTS} --<br>
&gt; +sshd_config=3D/etc/ssh/sshd_<wbr>config<br>
&gt; +while true ; do<br>
&gt; +=C2=A0 =C2=A0 case &quot;$1&quot; in<br>
&gt; +=C2=A0 =C2=A0 -f*) if [ &quot;$1&quot; =3D &quot;-f&quot; ] ; then<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sshd_config=3D&quot;$2&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sshd_config=3D&quot;${1#-f}=
&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shift<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 --) shift; break;;<br>
&gt; +=C2=A0 =C2=A0 *) shift;;<br>
&gt; +=C2=A0 =C2=A0 esac<br>
&gt; +done<br>
&gt; +<br>
&gt; +# parse location of keys<br>
&gt; +HOST_KEY_RSA=3D$(grep ^HostKey &quot;${sshd_config}&quot; | grep _rsa=
_ | tail -1<br>
&gt; | awk &#39; { print $2 } &#39;)<br>
&gt; +[ -z &quot;${HOST_KEY_RSA}&quot; ] &amp;&amp; HOST_KEY_RSA=3D$(grep H=
ostKey<br>
&gt; &quot;${sshd_config}&quot; | grep _rsa_ | tail -1 | awk &#39; { print =
$2 } &#39;)<br>
&gt; +[ -z &quot;${HOST_KEY_RSA}&quot; ] &amp;&amp;<br>
&gt; HOST_KEY_RSA=3D$SYSCONFDIR/ssh_<wbr>host_rsa_key<br>
&gt; +HOST_KEY_DSA=3D$(grep ^HostKey &quot;${sshd_config}&quot; | grep _dsa=
_ | tail -1<br>
&gt; | awk &#39; { print $2 } &#39;)<br>
&gt; +[ -z &quot;${HOST_KEY_DSA}&quot; ] &amp;&amp; HOST_KEY_DSA=3D$(grep H=
ostKey<br>
&gt; &quot;${sshd_config}&quot; | grep _dsa_ | tail -1 | awk &#39; { print =
$2 } &#39;)<br>
&gt; +[ -z &quot;${HOST_KEY_DSA}&quot; ] &amp;&amp;<br>
&gt; HOST_KEY_DSA=3D$SYSCONFDIR/ssh_<wbr>host_dsa_key<br>
&gt; +HOST_KEY_ECDSA=3D$(grep ^HostKey &quot;${sshd_config}&quot; | grep _e=
cdsa_ |<br>
&gt; tail -1 | awk &#39; { print $2 } &#39;)<br>
&gt; +[ -z &quot;${HOST_KEY_ECDSA}&quot; ] &amp;&amp; HOST_KEY_ECDSA=3D$(gr=
ep HostKey<br>
&gt; &quot;${sshd_config}&quot; | grep _ecdsa_ | tail -1 | awk &#39; { prin=
t $2 } &#39;)<br>
&gt; +[ -z &quot;${HOST_KEY_ECDSA}&quot; ] &amp;&amp;<br>
&gt; HOST_KEY_ECDSA=3D$SYSCONFDIR/<wbr>ssh_host_ecdsa_key<br>
&gt; +HOST_KEY_ED25519=3D$(grep ^HostKey &quot;${sshd_config}&quot; | grep =
_ed25519_ |<br>
&gt; tail -1 | awk &#39; { print $2 } &#39;)<br>
&gt; +[ -z &quot;${HOST_KEY_ED25519}&quot; ] &amp;&amp; HOST_KEY_ED25519=3D=
$(grep HostKey<br>
&gt; &quot;${sshd_config}&quot; | grep _ed25519_ | tail -1 | awk &#39; { pr=
int $2 } &#39;)<br>
&gt; +[ -z &quot;${HOST_KEY_ED25519}&quot; ] &amp;&amp;<br>
&gt; HOST_KEY_ED25519=3D$SYSCONFDIR/<wbr>ssh_host_ed25519_key<br>
&gt; +<br>
&gt; +# create keys if necessary<br>
&gt; +if [ ! -f $HOST_KEY_RSA ]; then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;=C2=A0 generating ssh RSA key...&quot;<br>
&gt; +=C2=A0 =C2=A0 mkdir -p $(dirname $HOST_KEY_RSA)<br>
&gt; +=C2=A0 =C2=A0 ssh-keygen -q -f $HOST_KEY_RSA -N &#39;&#39; -t rsa<br>
&gt; +fi<br>
&gt; +if [ ! -f $HOST_KEY_ECDSA ]; then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;=C2=A0 generating ssh ECDSA key...&quot;<br>
&gt; +=C2=A0 =C2=A0 mkdir -p $(dirname $HOST_KEY_ECDSA)<br>
&gt; +=C2=A0 =C2=A0 ssh-keygen -q -f $HOST_KEY_ECDSA -N &#39;&#39; -t ecdsa=
<br>
&gt; +fi<br>
&gt; +if [ ! -f $HOST_KEY_DSA ]; then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;=C2=A0 generating ssh DSA key...&quot;<br>
&gt; +=C2=A0 =C2=A0 mkdir -p $(dirname $HOST_KEY_DSA)<br>
&gt; +=C2=A0 =C2=A0 ssh-keygen -q -f $HOST_KEY_DSA -N &#39;&#39; -t dsa<br>
&gt; +fi<br>
&gt; +if [ ! -f $HOST_KEY_ED25519 ]; then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;=C2=A0 generating ssh ED25519 key...&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 mkdir -p $(dirname $HOST_KEY_ED25519)<br>
&gt; +=C2=A0 =C2=A0 ssh-keygen -q -f $HOST_KEY_ED25519 -N &#39;&#39; -t ed2=
5519<br>
&gt; +fi<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-<br>
&gt; connectivity/openssh/openssh/<wbr>sshdgenkeys.service b/meta/recipes-<=
br>
&gt; connectivity/openssh/openssh/<wbr>sshdgenkeys.service<br>
&gt; index 148e6ad..603c337 100644<br>
&gt; --- a/meta/recipes-connectivity/<wbr>openssh/openssh/sshdgenkeys.<wbr>=
service<br>
&gt; +++ b/meta/recipes-connectivity/<wbr>openssh/openssh/sshdgenkeys.<wbr>=
service<br>
&gt; @@ -1,22 +1,8 @@<br>
&gt;=C2=A0 [Unit]<br>
&gt;=C2=A0 Description=3DOpenSSH Key Generation<br>
&gt;=C2=A0 RequiresMountsFor=3D/var /run<br>
&gt; -ConditionPathExists=3D!/var/<wbr>run/ssh/ssh_host_rsa_key<br>
&gt; -ConditionPathExists=3D!/var/<wbr>run/ssh/ssh_host_dsa_key<br>
&gt; -ConditionPathExists=3D!/var/<wbr>run/ssh/ssh_host_ecdsa_key<br>
&gt; -ConditionPathExists=3D!/var/<wbr>run/ssh/ssh_host_ed25519_key<br>
&gt; -ConditionPathExists=3D!/etc/<wbr>ssh/ssh_host_rsa_key<br>
&gt; -ConditionPathExists=3D!/etc/<wbr>ssh/ssh_host_dsa_key<br>
&gt; -ConditionPathExists=3D!/etc/<wbr>ssh/ssh_host_ecdsa_key<br>
&gt; -ConditionPathExists=3D!/etc/<wbr>ssh/ssh_host_ed25519_key<br>
&gt;<br>
&gt;=C2=A0 [Service]<br>
&gt; -Environment=3D&quot;SYSCONFDIR=3D/etc/<wbr>ssh&quot;<br>
&gt; -EnvironmentFile=3D-/etc/<wbr>default/ssh<br>
&gt; -ExecStart=3D@BASE_BINDIR@/mkdir -p $SYSCONFDIR<br>
&gt; -ExecStart=3D@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_rsa_key<=
br>
&gt; -N &#39;&#39; -t rsa<br>
&gt; -ExecStart=3D@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_dsa_key<=
br>
&gt; -N &#39;&#39; -t dsa<br>
&gt; -ExecStart=3D@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ecdsa_<w=
br>key<br>
&gt; -N &#39;&#39; -t ecdsa<br>
&gt; -ExecStart=3D@BINDIR@/ssh-keygen -q -f<br>
&gt; ${SYSCONFDIR}/ssh_host_<wbr>ed25519_key -N &#39;&#39; -t ed25519<br>
&gt; +ExecStart=3D@LIBEXECDIR@/sshd_<wbr>check_keys<br>
&gt;=C2=A0 Type=3Doneshot<br>
&gt;=C2=A0 RemainAfterExit=3Dyes<br>
&gt; diff --git a/meta/recipes-connectivity/<wbr>openssh/<a href=3D"http://=
openssh_7.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_7.5p1.bb</a>=
<br>
&gt; b/meta/recipes-connectivity/<wbr>openssh/<a href=3D"http://openssh_7.5=
p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_7.5p1.bb</a><br>
&gt; index 7bd313b..fdbee85 100644<br>
&gt; --- a/meta/recipes-connectivity/<wbr>openssh/<a href=3D"http://openssh=
_7.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_7.5p1.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/<wbr>openssh/<a href=3D"http://openssh=
_7.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_7.5p1.bb</a><br>
&gt; @@ -25,6 +25,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.openbsd.org/=
pub/OpenBSD/OpenS" rel=3D"noreferrer" target=3D"_blank">http://ftp.openbsd.=
org/pub/<wbr>OpenBSD/OpenS</a><br>
&gt; SH/portable/openssh-${PV}.tar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssh-7.1p1-<w=
br>conditional-compile-des-in-<br>
&gt; cipher.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssh-7.1p1-<w=
br>conditional-compile-des-in-<br>
&gt; pkcs11.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-potential-si=
gned-<wbr>overflow-in-pointer-<br>
&gt; arithmatic.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sshd_check_keys \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 PAM_SRC_URI =3D &quot;file://sshd&quot;<br>
&gt; @@ -118,7 +119,13 @@ do_install_append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,@BASE_BINDIR@,${base_<wbr>b=
indir},g&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,@SBIND=
IR@,${sbindir},g&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,@BINDI=
R@,${bindir},g&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,@LIBEXECDIR=
@,${libexecdir}/<wbr>${BPN},g&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${systemd_un=
itdir}/system/<wbr>sshd.socket<br>
&gt; ${D}${systemd_unitdir}/system/<wbr>*.service<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,@LIBEXECDIR@,${libexecdir}/<wbr>=
${BPN},g&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${sysconfdir}/ini=
t.d/sshd<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0install -D -m 0755 ${WORKDIR}/sshd_check_keys<br>
&gt; ${D}${libexecdir}/${BPN}/sshd_<wbr>check_keys<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_install_ptest () {<br>
&gt; @@ -133,6 +140,7 @@ FILES_${PN}-scp =3D &quot;${bindir}/scp.${BPN}&quo=
t;<br>
&gt;=C2=A0 FILES_${PN}-ssh =3D &quot;${bindir}/ssh.${BPN}<br>
&gt; ${sysconfdir}/ssh/ssh_config&quot;<br>
&gt;=C2=A0 FILES_${PN}-sshd =3D &quot;${sbindir}/sshd ${sysconfdir}/init.d/=
sshd<br>
&gt; ${systemd_unitdir}/system&quot;<br>
&gt;=C2=A0 FILES_${PN}-sshd +=3D &quot;${sysconfdir}/ssh/moduli<br>
&gt; ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_<wbr>reado=
nly<br>
&gt; ${sysconfdir}/default/<wbr>volatiles/99_sshd ${sysconfdir}/pam.d/sshd&=
quot;<br>
&gt; +FILES_${PN}-sshd +=3D &quot;${libexecdir}/${BPN}/sshd_<wbr>check_keys=
&quot;<br>
&gt;=C2=A0 FILES_${PN}-sftp =3D &quot;${bindir}/sftp&quot;<br>
&gt;=C2=A0 FILES_${PN}-sftp-server =3D &quot;${libexecdir}/sftp-server&quot=
;<br>
&gt;=C2=A0 FILES_${PN}-misc =3D &quot;${bindir}/ssh* ${libexecdir}/ssh*&quo=
t;<br>
<br>
</div></div>Ping?<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a11441b5c9d615b0555af279b--
