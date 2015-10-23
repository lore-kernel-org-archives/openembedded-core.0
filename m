Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id A0B1F606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 08:49:48 +0000 (UTC)
Received: by wijp11 with SMTP id p11so67181319wij.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 01:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RQWIwozBZulkKoS5uQ5qQvEXkL7n5nrZSpA+JYO4R6w=;
	b=l6hRGm+ItjTg9x3AGip0B3GaRiJbIJ60TTfNqGeFnLSWSDwUood07MALNn6v4POPej
	EacW/hPZ52rPcID3jAEnUulGCq2J0bW+UQMI28NSyi2u9GiyBhgwfobNHQ5JTxcEp837
	77Bae8sVjTSqjp9hniQfaAm4a0tNfXgALQc0nF/3NhsHhUNWhA3F2aa6rHJyvDCCp3i+
	JkiYukNSXh1KXB4g+PUMQ16NlGAqdQSCLw0sgZF2n957dOEK64s6C3NME+QEJP2gWExn
	JrbTo73Pq+IbF1E5GS/ji3CZ4EhuXJ1HU6MGrUSdRdfgwbvvyqAZZYI7YJJ516Nl4j0x
	CFyQ==
X-Gm-Message-State: ALoCoQndHJYbLxQnWq95Ncp0LMy1caqpetl7878e5JyiEc7RMhAOi3YrYJfgObqCiho2D8tx6XGP
X-Received: by 10.194.79.9 with SMTP id f9mr130934wjx.130.1445590188377; Fri,
	23 Oct 2015 01:49:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.186.69 with HTTP; Fri, 23 Oct 2015 01:49:18 -0700 (PDT)
In-Reply-To: <1445585686-41410-1-git-send-email-wenzong.fan@windriver.com>
References: <1445585686-41410-1-git-send-email-wenzong.fan@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 23 Oct 2015 11:49:18 +0300
Message-ID: <CAHiDW_HpQFMVnh5Zrty1zhjN2z8_vdKqLJLg73PNrttsWA0dUA@mail.gmail.com>
To: wenzong.fan@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: Restore TCP wrappers support
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
X-List-Received-Date: Fri, 23 Oct 2015 08:49:50 -0000
Content-Type: multipart/alternative; boundary=047d7bb03ed2ab65ff0522c1b144

--047d7bb03ed2ab65ff0522c1b144
Content-Type: text/plain; charset=UTF-8

On 23 October 2015 at 10:34, <wenzong.fan@windriver.com> wrote:

> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> The /etc/hosts.deny doesn't work for sshd without tcp-wrappers support,
> apply below patch from Debian to fix it:
>

I get that hosts.deny not doing anything after updating is a nasty surprise
(mentioning this in the release notes certainly makes sense) but ... is
bringing tcp-wrappers-support back (especially as default) the correct
solution here?

The dependencies for this feature have been described as 'poor quality
abandonware' years ago already, and there are certainly other ways to limit
access.... Is there a use case where ssh+tcpwrappers is so crucial that it
warrants going against upstream opinion on security?

 - Jussi



>   From 1850a2c93f3dcfa3d682eaa85d1593c01d170429 Mon Sep 17 00:00:00 2001
>   From: Colin Watson <cjwatson@debian.org>
>   Date: Tue, 7 Oct 2014 13:22:41 +0100
>   Subject: Restore TCP wrappers support
>
>   Support for TCP wrappers was dropped in OpenSSH 6.7.  See this message
>   and thread:
>
>
> https://lists.mindrot.org/pipermail/openssh-unix-dev/2014-April/032497.html
>
>   It is true that this reduces preauth attack surface in sshd.  On the
>   other hand, this support seems to be quite widely used, and abruptly
>   dropping it (from the perspective of users who don't read
>   openssh-unix-dev) could easily cause more serious problems in practice.
> Link to patch file:
>   http://anonscm.debian.org/cgit/pkg-ssh/openssh.git/tree/debian/ \
>     patches/restore-tcp-wrappers.patch
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../openssh/openssh/restore-tcp-wrappers.patch     | 174
> +++++++++++++++++++++
>  meta/recipes-connectivity/openssh/openssh_7.1p1.bb |   4 +
>  2 files changed, 178 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch
>
> diff --git
> a/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch
> b/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch
> new file mode 100644
> index 0000000..1d819fa
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch
> @@ -0,0 +1,174 @@
> +From 1850a2c93f3dcfa3d682eaa85d1593c01d170429 Mon Sep 17 00:00:00 2001
> +From: Colin Watson <cjwatson@debian.org>
> +Date: Tue, 7 Oct 2014 13:22:41 +0100
> +Subject: Restore TCP wrappers support
> +
> +Support for TCP wrappers was dropped in OpenSSH 6.7.  See this message
> +and thread:
> +
> +
> https://lists.mindrot.org/pipermail/openssh-unix-dev/2014-April/032497.html
> +
> +It is true that this reduces preauth attack surface in sshd.  On the
> +other hand, this support seems to be quite widely used, and abruptly
> +dropping it (from the perspective of users who don't read
> +openssh-unix-dev) could easily cause more serious problems in practice.
> +
> +It's not entirely clear what the right long-term answer for Debian is,
> +but it at least probably doesn't involve dropping this feature shortly
> +before a freeze.
> +
> +Forwarded: not-needed
> +Last-Update: 2014-10-07
> +
> +Upstream-Status: Inappropriate
> +
> +Patch-Name: restore-tcp-wrappers.patch
> +---
> + configure.ac | 57
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> + sshd.8       |  7 +++++++
> + sshd.c       | 25 +++++++++++++++++++++++++
> + 3 files changed, 89 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index df21693..4d55c46 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1448,6 +1448,62 @@ AC_ARG_WITH([skey],
> +       ]
> + )
> +
> ++# Check whether user wants TCP wrappers support
> ++TCPW_MSG="no"
> ++AC_ARG_WITH([tcp-wrappers],
> ++      [  --with-tcp-wrappers[[=PATH]] Enable tcpwrappers support
> (optionally in PATH)],
> ++      [
> ++              if test "x$withval" != "xno" ; then
> ++                      saved_LIBS="$LIBS"
> ++                      saved_LDFLAGS="$LDFLAGS"
> ++                      saved_CPPFLAGS="$CPPFLAGS"
> ++                      if test -n "${withval}" && \
> ++                          test "x${withval}" != "xyes"; then
> ++                              if test -d "${withval}/lib"; then
> ++                                      if test -n "${need_dash_r}"; then
> ++                                              LDFLAGS="-L${withval}/lib
> -R${withval}/lib ${LDFLAGS}"
> ++                                      else
> ++                                              LDFLAGS="-L${withval}/lib
> ${LDFLAGS}"
> ++                                      fi
> ++                              else
> ++                                      if test -n "${need_dash_r}"; then
> ++                                              LDFLAGS="-L${withval}
> -R${withval} ${LDFLAGS}"
> ++                                      else
> ++                                              LDFLAGS="-L${withval}
> ${LDFLAGS}"
> ++                                      fi
> ++                              fi
> ++                              if test -d "${withval}/include"; then
> ++                                      CPPFLAGS="-I${withval}/include
> ${CPPFLAGS}"
> ++                              else
> ++                                      CPPFLAGS="-I${withval} ${CPPFLAGS}"
> ++                              fi
> ++                      fi
> ++                      LIBS="-lwrap $LIBS"
> ++                      AC_MSG_CHECKING([for libwrap])
> ++                      AC_LINK_IFELSE([AC_LANG_PROGRAM([[
> ++#include <sys/types.h>
> ++#include <sys/socket.h>
> ++#include <netinet/in.h>
> ++#include <tcpd.h>
> ++int deny_severity = 0, allow_severity = 0;
> ++                              ]], [[
> ++      hosts_access(0);
> ++                              ]])], [
> ++                                      AC_MSG_RESULT([yes])
> ++                                      AC_DEFINE([LIBWRAP], [1],
> ++                                              [Define if you want
> ++                                              TCP Wrappers support])
> ++                                      SSHDLIBS="$SSHDLIBS -lwrap"
> ++                                      TCPW_MSG="yes"
> ++                              ], [
> ++                                      AC_MSG_ERROR([*** libwrap missing])
> ++
> ++                      ])
> ++                      LIBS="$saved_LIBS"
> ++              fi
> ++      ]
> ++)
> ++
> + # Check whether user wants to use ldns
> + LDNS_MSG="no"
> + AC_ARG_WITH(ldns,
> +@@ -4928,6 +4984,7 @@ echo "                 KerberosV support: $KRB5_MSG"
> + echo "                   SELinux support: $SELINUX_MSG"
> + echo "                 Smartcard support: $SCARD_MSG"
> + echo "                     S/KEY support: $SKEY_MSG"
> ++echo "              TCP Wrappers support: $TCPW_MSG"
> + echo "              MD5 password support: $MD5_MSG"
> + echo "                   libedit support: $LIBEDIT_MSG"
> + echo "  Solaris process contract support: $SPC_MSG"
> +diff --git a/sshd.8 b/sshd.8
> +index dcf20f0..5afd10f 100644
> +--- a/sshd.8
> ++++ b/sshd.8
> +@@ -853,6 +853,12 @@ the user's home directory becomes accessible.
> + This file should be writable only by the user, and need not be
> + readable by anyone else.
> + .Pp
> ++.It Pa /etc/hosts.allow
> ++.It Pa /etc/hosts.deny
> ++Access controls that should be enforced by tcp-wrappers are defined here.
> ++Further details are described in
> ++.Xr hosts_access 5 .
> ++.Pp
> + .It Pa /etc/hosts.equiv
> + This file is for host-based authentication (see
> + .Xr ssh 1 ) .
> +@@ -956,6 +962,7 @@ The content of this file is not sensitive; it can be
> world-readable.
> + .Xr ssh-keygen 1 ,
> + .Xr ssh-keyscan 1 ,
> + .Xr chroot 2 ,
> ++.Xr hosts_access 5 ,
> + .Xr login.conf 5 ,
> + .Xr moduli 5 ,
> + .Xr sshd_config 5 ,
> +diff --git a/sshd.c b/sshd.c
> +index 6b85e6c..186ad55 100644
> +--- a/sshd.c
> ++++ b/sshd.c
> +@@ -129,6 +129,13 @@
> + #include <Security/AuthSession.h>
> + #endif
> +
> ++#ifdef LIBWRAP
> ++#include <tcpd.h>
> ++#include <syslog.h>
> ++int allow_severity;
> ++int deny_severity;
> ++#endif /* LIBWRAP */
> ++
> + #ifndef O_NOCTTY
> + #define O_NOCTTY      0
> + #endif
> +@@ -2141,6 +2148,24 @@ main(int ac, char **av)
> + #ifdef SSH_AUDIT_EVENTS
> +       audit_connection_from(remote_ip, remote_port);
> + #endif
> ++#ifdef LIBWRAP
> ++      allow_severity = options.log_facility|LOG_INFO;
> ++      deny_severity = options.log_facility|LOG_WARNING;
> ++      /* Check whether logins are denied from this host. */
> ++      if (packet_connection_is_on_socket()) {
> ++              struct request_info req;
> ++
> ++              request_init(&req, RQ_DAEMON, __progname, RQ_FILE,
> sock_in, 0);
> ++              fromhost(&req);
> ++
> ++              if (!hosts_access(&req)) {
> ++                      debug("Connection refused by tcp wrapper");
> ++                      refuse(&req);
> ++                      /* NOTREACHED */
> ++                      fatal("libwrap refuse returns");
> ++              }
> ++      }
> ++#endif /* LIBWRAP */
> +
> +       /* Log the connection. */
> +       laddr = get_local_ipaddr(sock_in);
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
> b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
> index 40938cc..b621f62 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
> @@ -20,6 +20,7 @@ SRC_URI = "
> ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>             file://sshdgenkeys.service \
>             file://volatiles.99_sshd \
>             file://add-test-support-for-busybox.patch \
> +           file://restore-tcp-wrappers.patch \
>             file://run-ptest"
>
>  PAM_SRC_URI = "file://sshd"
> @@ -53,6 +54,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
>                  --disable-strip \
>                  "
>
> +PACKAGECONFIG ??= "tcp-wrappers"
> +PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
> +
>  # Since we do not depend on libbsd, we do not want configure to use it
>  # just because it finds libutil.h.  But, specifying --disable-libutil
>  # causes compile errors, so...
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bb03ed2ab65ff0522c1b144
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
3 October 2015 at 10:34,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenzong.f=
an@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex">From: Wenzong Fan &lt;<a href=3D"mailto:wenzon=
g.fan@windriver.com">wenzong.fan@windriver.com</a>&gt;<br>
<br>
The /etc/hosts.deny doesn&#39;t work for sshd without tcp-wrappers support,=
<br>
apply below patch from Debian to fix it:<br></blockquote><div><br></div><di=
v>I get that hosts.deny not doing anything after updating is a nasty surpri=
se (mentioning this in the release notes certainly makes sense) but ... is =
bringing tcp-wrappers-support back (especially as default) the correct solu=
tion here?</div><div><br></div><div>The dependencies for this feature have =
been described as &#39;poor quality abandonware&#39; years ago already, and=
 there are certainly other ways to limit access.... Is there a use case whe=
re ssh+tcpwrappers is so crucial that it warrants going against upstream op=
inion on security?</div><div><br></div><div>=C2=A0- Jussi</div><div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex">
=C2=A0 From 1850a2c93f3dcfa3d682eaa85d1593c01d170429 Mon Sep 17 00:00:00 20=
01<br>
=C2=A0 From: Colin Watson &lt;<a href=3D"mailto:cjwatson@debian.org">cjwats=
on@debian.org</a>&gt;<br>
=C2=A0 Date: Tue, 7 Oct 2014 13:22:41 +0100<br>
=C2=A0 Subject: Restore TCP wrappers support<br>
<br>
=C2=A0 Support for TCP wrappers was dropped in OpenSSH 6.7.=C2=A0 See this =
message<br>
=C2=A0 and thread:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://lists.mindrot.org/pipermail/openssh-unix-d=
ev/2014-April/032497.html" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.mindrot.org/pipermail/openssh-unix-dev/2014-April/032497.html</a><br>
<br>
=C2=A0 It is true that this reduces preauth attack surface in sshd.=C2=A0 O=
n the<br>
=C2=A0 other hand, this support seems to be quite widely used, and abruptly=
<br>
=C2=A0 dropping it (from the perspective of users who don&#39;t read<br>
=C2=A0 openssh-unix-dev) could easily cause more serious problems in practi=
ce.<br>
Link to patch file:<br>
=C2=A0 <a href=3D"http://anonscm.debian.org/cgit/pkg-ssh/openssh.git/tree/d=
ebian/" rel=3D"noreferrer" target=3D"_blank">http://anonscm.debian.org/cgit=
/pkg-ssh/openssh.git/tree/debian/</a> \<br>
=C2=A0 =C2=A0 patches/restore-tcp-wrappers.patch<br>
<br>
Signed-off-by: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriver.com"=
>wenzong.fan@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../openssh/openssh/restore-tcp-wrappers.patch=C2=A0 =C2=A0 =C2=A0| 1=
74 +++++++++++++++++++++<br>
=C2=A0meta/recipes-connectivity/openssh/<a href=3D"http://openssh_7.1p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_7.1p1.bb</a> |=C2=A0 =C2=A04 =
+<br>
=C2=A02 files changed, 178 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssh/openssh/restore-=
tcp-wrappers.patch<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers=
.patch b/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.pat=
ch<br>
new file mode 100644<br>
index 0000000..1d819fa<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch<=
br>
@@ -0,0 +1,174 @@<br>
+From 1850a2c93f3dcfa3d682eaa85d1593c01d170429 Mon Sep 17 00:00:00 2001<br>
+From: Colin Watson &lt;<a href=3D"mailto:cjwatson@debian.org">cjwatson@deb=
ian.org</a>&gt;<br>
+Date: Tue, 7 Oct 2014 13:22:41 +0100<br>
+Subject: Restore TCP wrappers support<br>
+<br>
+Support for TCP wrappers was dropped in OpenSSH 6.7.=C2=A0 See this messag=
e<br>
+and thread:<br>
+<br>
+=C2=A0 <a href=3D"https://lists.mindrot.org/pipermail/openssh-unix-dev/201=
4-April/032497.html" rel=3D"noreferrer" target=3D"_blank">https://lists.min=
drot.org/pipermail/openssh-unix-dev/2014-April/032497.html</a><br>
+<br>
+It is true that this reduces preauth attack surface in sshd.=C2=A0 On the<=
br>
+other hand, this support seems to be quite widely used, and abruptly<br>
+dropping it (from the perspective of users who don&#39;t read<br>
+openssh-unix-dev) could easily cause more serious problems in practice.<br=
>
+<br>
+It&#39;s not entirely clear what the right long-term answer for Debian is,=
<br>
+but it at least probably doesn&#39;t involve dropping this feature shortly=
<br>
+before a freeze.<br>
+<br>
+Forwarded: not-needed<br>
+Last-Update: 2014-10-07<br>
+<br>
+Upstream-Status: Inappropriate<br>
+<br>
+Patch-Name: restore-tcp-wrappers.patch<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
<br>
+ sshd.8=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
+ sshd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 +++++++++++++++++++++++++<br>
+ 3 files changed, 89 insertions(+)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index df21693..4d55c46 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -1448,6 +1448,62 @@ AC_ARG_WITH([skey],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
+ )<br>
+<br>
++# Check whether user wants TCP wrappers support<br>
++TCPW_MSG=3D&quot;no&quot;<br>
++AC_ARG_WITH([tcp-wrappers],<br>
++=C2=A0 =C2=A0 =C2=A0 [=C2=A0 --with-tcp-wrappers[[=3DPATH]] Enable tcpwra=
ppers support (optionally in PATH)],<br>
++=C2=A0 =C2=A0 =C2=A0 [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x$withval&=
quot; !=3D &quot;xno&quot; ; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 saved_LIBS=3D&quot;$LIBS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 saved_LDFLAGS=3D&quot;$LDFLAGS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 saved_CPPFLAGS=3D&quot;$CPPFLAGS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if test -n &quot;${withval}&quot; &amp;&amp; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 test &quot;x${withval}&quot; !=3D &quot;xyes&quot;; then<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -d &quot;${withval}/lib&quot;; then=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quo=
t;${need_dash_r}&quot;; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 LDFLAGS=3D&quot;-L${withval}/lib -R${withval}/lib ${LDFLAGS}&=
quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 LDFLAGS=3D&quot;-L${withval}/lib ${LDFLAGS}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quo=
t;${need_dash_r}&quot;; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 LDFLAGS=3D&quot;-L${withval} -R${withval} ${LDFLAGS}&quot;<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 LDFLAGS=3D&quot;-L${withval} ${LDFLAGS}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -d &quot;${withval}/include&quot;; =
then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quo=
t;-I${withval}/include ${CPPFLAGS}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quo=
t;-I${withval} ${CPPFLAGS}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 LIBS=3D&quot;-lwrap $LIBS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AC_MSG_CHECKING([for libwrap])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AC_LINK_IFELSE([AC_LANG_PROGRAM([[<br>
++#include &lt;sys/types.h&gt;<br>
++#include &lt;sys/socket.h&gt;<br>
++#include &lt;netinet/in.h&gt;<br>
++#include &lt;tcpd.h&gt;<br>
++int deny_severity =3D 0, allow_severity =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]], [[<br>
++=C2=A0 =C2=A0 =C2=A0 hosts_access(0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])], [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([=
yes])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_DEFINE([LIBW=
RAP], [1],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 [Define if you want<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 TCP Wrappers support])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSHDLIBS=3D&quo=
t;$SSHDLIBS -lwrap&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCPW_MSG=3D&quo=
t;yes&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ], [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([*=
** libwrap missing])<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 LIBS=3D&quot;$saved_LIBS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 ]<br>
++)<br>
++<br>
+ # Check whether user wants to use ldns<br>
+ LDNS_MSG=3D&quot;no&quot;<br>
+ AC_ARG_WITH(ldns,<br>
+@@ -4928,6 +4984,7 @@ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0KerberosV support: $KRB5_MSG&quot;<br>
+ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0SELinux support: $SELINUX_MSG&quot;<br>
+ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Smartcard support: $SCARD_MSG&quot;<br>
+ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0S/KEY support: $SKEY_MSG&quot;<br>
++echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCP Wrappers =
support: $TCPW_MSG&quot;<br>
+ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MD5 password =
support: $MD5_MSG&quot;<br>
+ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0libedit support: $LIBEDIT_MSG&quot;<br>
+ echo &quot;=C2=A0 Solaris process contract support: $SPC_MSG&quot;<br>
+diff --git a/sshd.8 b/sshd.8<br>
+index dcf20f0..5afd10f 100644<br>
+--- a/sshd.8<br>
++++ b/sshd.8<br>
+@@ -853,6 +853,12 @@ the user&#39;s home directory becomes accessible.<br>
+ This file should be writable only by the user, and need not be<br>
+ readable by anyone else.<br>
+ .Pp<br>
++.It Pa /etc/hosts.allow<br>
++.It Pa /etc/hosts.deny<br>
++Access controls that should be enforced by tcp-wrappers are defined here.=
<br>
++Further details are described in<br>
++.Xr hosts_access 5 .<br>
++.Pp<br>
+ .It Pa /etc/hosts.equiv<br>
+ This file is for host-based authentication (see<br>
+ .Xr ssh 1 ) .<br>
+@@ -956,6 +962,7 @@ The content of this file is not sensitive; it can be w=
orld-readable.<br>
+ .Xr ssh-keygen 1 ,<br>
+ .Xr ssh-keyscan 1 ,<br>
+ .Xr chroot 2 ,<br>
++.Xr hosts_access 5 ,<br>
+ .Xr login.conf 5 ,<br>
+ .Xr moduli 5 ,<br>
+ .Xr sshd_config 5 ,<br>
+diff --git a/sshd.c b/sshd.c<br>
+index 6b85e6c..186ad55 100644<br>
+--- a/sshd.c<br>
++++ b/sshd.c<br>
+@@ -129,6 +129,13 @@<br>
+ #include &lt;Security/AuthSession.h&gt;<br>
+ #endif<br>
+<br>
++#ifdef LIBWRAP<br>
++#include &lt;tcpd.h&gt;<br>
++#include &lt;syslog.h&gt;<br>
++int allow_severity;<br>
++int deny_severity;<br>
++#endif /* LIBWRAP */<br>
++<br>
+ #ifndef O_NOCTTY<br>
+ #define O_NOCTTY=C2=A0 =C2=A0 =C2=A0 0<br>
+ #endif<br>
+@@ -2141,6 +2148,24 @@ main(int ac, char **av)<br>
+ #ifdef SSH_AUDIT_EVENTS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0audit_connection_from(remote_ip, remote_port);<=
br>
+ #endif<br>
++#ifdef LIBWRAP<br>
++=C2=A0 =C2=A0 =C2=A0 allow_severity =3D options.log_facility|LOG_INFO;<br=
>
++=C2=A0 =C2=A0 =C2=A0 deny_severity =3D options.log_facility|LOG_WARNING;<=
br>
++=C2=A0 =C2=A0 =C2=A0 /* Check whether logins are denied from this host. *=
/<br>
++=C2=A0 =C2=A0 =C2=A0 if (packet_connection_is_on_socket()) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct request_info req;=
<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 request_init(&amp;req, R=
Q_DAEMON, __progname, RQ_FILE, sock_in, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fromhost(&amp;req);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!hosts_access(&amp;r=
eq)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 debug(&quot;Connection refused by tcp wrapper&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 refuse(&amp;req);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* NOTREACHED */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fatal(&quot;libwrap refuse returns&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++#endif /* LIBWRAP */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Log the connection. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0laddr =3D get_local_ipaddr(sock_in);<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_7.=
1p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_7.1p1.bb</a> b/meta/re=
cipes-connectivity/openssh/<a href=3D"http://openssh_7.1p1.bb" rel=3D"noref=
errer" target=3D"_blank">openssh_7.1p1.bb</a><br>
index 40938cc..b621f62 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_7.1p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_7.1p1.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_7.1p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_7.1p1.bb</a><br>
@@ -20,6 +20,7 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.openbsd.org/pub/Op=
enBSD/OpenSSH/portable/openssh-${PV}.tar" rel=3D"noreferrer" target=3D"_bla=
nk">ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar</a=
>.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sshdgenkeys.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://volatiles.99_sshd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://add-test-support-for-busyb=
ox.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://restore-tcp-wrappers.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest&quot;<br>
<br>
=C2=A0PAM_SRC_URI =3D &quot;file://sshd&quot;<br>
@@ -53,6 +54,9 @@ EXTRA_OECONF =3D &quot;&#39;LOGIN_PROGRAM=3D${base_bindir=
}/login&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-str=
ip \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+PACKAGECONFIG ??=3D &quot;tcp-wrappers&quot;<br>
+PACKAGECONFIG[tcp-wrappers] =3D &quot;--with-tcp-wrappers,,tcp-wrappers&qu=
ot;<br>
+<br>
=C2=A0# Since we do not depend on libbsd, we do not want configure to use i=
t<br>
=C2=A0# just because it finds libutil.h.=C2=A0 But, specifying --disable-li=
butil<br>
=C2=A0# causes compile errors, so...<br>
<span class=3D""><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--047d7bb03ed2ab65ff0522c1b144--
