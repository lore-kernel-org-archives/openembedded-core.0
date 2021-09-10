Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.6292.1631261387849651664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 01:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18A89kso006211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 01:09:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 01:09:45 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 10 Sep 2021 01:09:45 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] mc: fix CVE-2021-36370
Date: Fri, 10 Sep 2021 16:09:42 +0800
Message-ID: <20210910080942.10233-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 18A89kso006211
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2021-36370.

CVE: CVE-2021-36370

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mc/files/CVE-2021-36370.patch             | 609 ++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.26.bb         |   1 +
 2 files changed, 610 insertions(+)
 create mode 100644 meta/recipes-extended/mc/files/CVE-2021-36370.patch

diff --git a/meta/recipes-extended/mc/files/CVE-2021-36370.patch b/meta/r=
ecipes-extended/mc/files/CVE-2021-36370.patch
new file mode 100644
index 0000000000..d6a26871bd
--- /dev/null
+++ b/meta/recipes-extended/mc/files/CVE-2021-36370.patch
@@ -0,0 +1,609 @@
+Backport patch to fix CVE-2021-36370.
+
+Upstream-Status: Backport [https://github.com/MidnightCommander/mc/commi=
t/9235d3c]
+CVE: CVE-2021-36370
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 9235d3c232d13ad7f973346077c9cf2eaa77dc5f Mon Sep 17 00:00:00 2001
+From: Andrew Borodin <aborodin@vmail.ru>
+Date: Mon, 12 Jul 2021 08:48:18 +0300
+Subject: [PATCH] SFTPFS: verify server fingerprint (fix CVE-2021-36370).
+
+Use ~/.ssh/known_hosts file to verify server fingerprint
+using ssh way:
+
+$ ssh localhost
+The authenticity of host 'localhost (127.0.0.1)' can't be established.
+ED25519 key fingerprint is SHA256:FzqKTNTroFuNUj1wUzSeV2x/1lpcESnT0ZRCmq=
5H6o8.
+Are you sure you want to continue connecting (yes/no)? no
+ssh: Host key verification failed.
+
+$ ssh localhost
+The authenticity of host 'localhost (127.0.0.1)' can't be established.
+ED25519 key fingerprint is SHA256:FzqKTNTroFuNUj1wUzSeV2x/1lpcESnT0ZRCmq=
5H6o8.
+Are you sure you want to continue connecting (yes/no)? yes
+Warning: Permanently added 'localhost' (ED25519) to the list of known ho=
sts.
+andrew@localhost's password:
+
+Thanks the Curl project for the used code.
+
+Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
+Signed-off-by: Yury V. Zaytsev <yury.zaytsev@moneymeets.com>
+---
+ doc/man/mc.1.in             |  15 ++
+ doc/man/ru/mc.1.in          |  14 ++
+ src/vfs/sftpfs/connection.c | 428 +++++++++++++++++++++++++++++++++++-
+ src/vfs/sftpfs/internal.h   |   5 +-
+ 4 files changed, 452 insertions(+), 10 deletions(-)
+
+diff --git a/doc/man/mc.1.in b/doc/man/mc.1.in
+index c0c06e32f7..7a3d118384 100644
+--- a/doc/man/mc.1.in
++++ b/doc/man/mc.1.in
+@@ -3364,6 +3364,21 @@ Examples:
+     sftp://joe@noncompressed.ssh.edu/private
+     sftp://joe@somehost.ssh.edu:2222/private
+ .fi
++.PP
++When establishing the connection, server key fingerprint is verified us=
ing
++the ~/.ssh/known_hosts file. If the host/key pair is not found or the h=
ost is found,
++but the key doesn't match, an appropriate message is shown.
++There are three buttons in the message dialog:
++.PP
++.B [Yes]
++add new host/key pair to the ~/.ssh/known_hosts file and continue.
++.PP
++.B [Ignore]
++do not add new host/key pair to the ~/.ssh/known_hosts file, but contin=
ue
++nevertheless (at you own risk).
++.PP
++.B [No]
++abort connection.
+ .\"NODE "  Undelete File System"
+ .SH "  Undelete File System"
+ On Linux systems, if you asked configure to use the ext2fs undelete
+diff --git a/doc/man/ru/mc.1.in b/doc/man/ru/mc.1.in
+index 7609da1127..bc0c1810a9 100644
+--- a/doc/man/ru/mc.1.in
++++ b/doc/man/ru/mc.1.in
+@@ -3874,6 +3874,20 @@ bash\-=D1=81=D0=BE=D0=B2=D0=BC=D0=B5=D1=81=D1=82=D0=
=B8=D0=BC=D0=B0=D1=8F =D0=BE=D0=B1=D0=BE=D0=BB=D0=BE=D1=87=D0=BA=D0=B0 sh=
ell.
+     sftp://joe@noncompressed.ssh.edu/private
+     sftp://joe@somehost.ssh.edu:2222/private
+ .fi
++=D0=9F=D1=80=D0=B8 =D1=83=D1=81=D1=82=D0=B0=D0=BD=D0=BE=D0=B2=D0=BB=D0=B5=
=D0=BD=D0=B8=D0=B8 =D1=81=D0=BE=D0=B5=D0=B4=D0=B8=D0=BD=D0=B5=D0=BD=D0=B8=
=D1=8F =D0=BF=D1=80=D0=BE=D0=B8=D1=81=D1=85=D0=BE=D0=B4=D0=B8=D1=82 =D0=BF=
=D1=80=D0=BE=D0=B2=D0=B5=D1=80=D0=BA=D0=B0 =D0=BA=D0=BB=D1=8E=D1=87=D0=B0=
 =D1=81=D0=B5=D1=80=D0=B2=D0=B5=D1=80=D0=B0 =D1=81 =D0=B8=D1=81=D0=BF=D0=BE=
=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D0=BD=D0=B8=D0=B5=D0=BC
++=D1=84=D0=B0=D0=B9=D0=BB=D0=B0 ~/.ssh/known_hosts file. =D0=95=D1=81=D0=
=BB=D0=B8 =D0=BF=D0=B0=D1=80=D0=B0 =D1=81=D0=B5=D1=80=D0=B2=D0=B5=D1=80/=D0=
=BA=D0=BB=D1=8E=D1=87 =D0=B2 =D1=8D=D1=82=D0=BE=D0=BC =D1=84=D0=B0=D0=B9=D0=
=BB=D0=B5 =D0=BD=D0=B5 =D0=BD=D0=B0=D0=B9=D0=B4=D0=B5=D0=BD=D0=B0
++=D0=B8=D0=BB=D0=B8 =D1=81=D0=B5=D1=80=D0=B2=D0=B5=D1=80 =D0=BD=D0=B0=D0=
=B9=D0=B4=D0=B5=D0=BD, =D0=BD=D0=BE =D0=BA=D0=BB=D1=8E=D1=87 =D0=BD=D0=B5=
 =D1=81=D0=BE=D0=BE=D1=82=D0=B2=D0=B5=D1=82=D1=81=D1=82=D0=B2=D1=83=D0=B5=
=D1=82, =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=
=D1=8E =D0=BF=D0=BE=D0=BA=D0=B0=D0=B7=D1=8B=D0=B2=D0=B0=D0=B5=D1=82=D1=81=
=D1=8F
++=D0=BE=D0=BA=D0=BD=D0=BE =D1=81 =D1=81=D0=BE=D0=BE=D1=82=D0=B2=D0=B5=D1=
=82=D1=81=D1=82=D0=B2=D1=83=D1=8E=D1=89=D0=B8=D0=BC =D1=81=D0=BE=D0=BE=D0=
=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC, =D1=81=D0=BE=D0=B4=D0=B5=D1=80=D0=
=B6=D0=B0=D1=89=D0=B5=D0=B5 =D1=82=D1=80=D0=B8 =D0=BA=D0=BD=D0=BE=D0=BF=D0=
=BA=D0=B8:
++.PP
++.B [=D0=94=D0=B0]
++=D0=B4=D0=BE=D0=B1=D0=B0=D0=B2=D0=B8=D1=82=D1=8C =D0=BD=D0=BE=D0=B2=D1=83=
=D1=8E =D0=BF=D0=B0=D1=80=D1=83 =D1=81=D0=B5=D1=80=D0=B2=D0=B5=D1=80/=D0=BA=
=D0=BB=D1=8E=D1=87 =D0=B2 =D1=84=D0=B0=D0=B9=D0=BB ~/.ssh/known_hosts =D0=
=B8 =D0=BF=D1=80=D0=BE=D0=B4=D0=BE=D0=BB=D0=B6=D0=B8=D1=82=D1=8C =D1=81=D0=
=BE=D0=B5=D0=B4=D0=B8=D0=BD=D0=B5=D0=BD=D0=B8=D0=B5.
++.PP
++.B [=D0=98=D0=B3=D0=BD=D0=BE=D1=80=D0=B8=D1=80=D0=BE=D0=B2=D0=B0=D1=82=D1=
=8C]
++=D0=BD=D0=B5 =D0=B4=D0=BE=D0=B1=D0=B0=D0=B2=D0=BB=D1=8F=D1=82=D1=8C =D0=
=BD=D0=BE=D0=B2=D1=83=D1=8E =D0=BF=D0=B0=D1=80=D1=83 =D1=81=D0=B5=D1=80=D0=
=B2=D0=B5=D1=80/=D0=BA=D0=BB=D1=8E=D1=87 =D0=B2 =D1=84=D0=B0=D0=B9=D0=BB =
~/.ssh/known_hosts =D0=B8 =D0=B2=D1=81=D1=91 =D1=80=D0=B0=D0=B2=D0=BD=D0=BE
++=D0=BF=D1=80=D0=BE=D0=B4=D0=BE=D0=BB=D0=B6=D0=B8=D1=82=D1=8C =D1=81=D0=BE=
=D0=B5=D0=B4=D0=B8=D0=BD=D0=B5=D0=BD=D0=B8=D0=B5 (=D0=BD=D0=B0 =D1=81=D0=B2=
=D0=BE=D0=B9 =D1=81=D1=82=D1=80=D0=B0=D1=85 =D0=B8 =D1=80=D0=B8=D1=81=D0=BA=
).
++.PP
++.B [=D0=9D=D0=B5=D1=82]
++=D0=BF=D1=80=D0=B5=D1=80=D0=B2=D0=B0=D1=82=D1=8C =D1=81=D0=BE=D0=B5=D0=B4=
=D0=B8=D0=BD=D0=B5=D0=BD=D0=B8=D0=B5.
+ .\"NODE "  Undelete File System"
+ .SH "  =D0=A4=D0=B0=D0=B9=D0=BB=D0=BE=D0=B2=D0=B0=D1=8F =D1=81=D0=B8=D1=
=81=D1=82=D0=B5=D0=BC=D0=B0 UFS (Undelete File System)"
+ =D0=92 =D0=9E=D0=A1 Linux =D0=BC=D0=BE=D0=B6=D0=BD=D0=BE =D1=81=D0=BA=D0=
=BE=D0=BD=D1=84=D0=B8=D0=B3=D1=83=D1=80=D0=B8=D1=80=D0=BE=D0=B2=D0=B0=D1=82=
=D1=8C =D1=84=D0=B0=D0=B9=D0=BB=D0=BE=D0=B2=D1=83=D1=8E =D1=81=D0=B8=D1=81=
=D1=82=D0=B5=D0=BC=D1=83 ext2fs, =D0=B8=D1=81=D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=
=D1=83=D0=B5=D0=BC=D1=83=D1=8E
+diff --git a/src/vfs/sftpfs/connection.c b/src/vfs/sftpfs/connection.c
+index 9f8ea5633b..acd5026515 100644
+--- a/src/vfs/sftpfs/connection.c
++++ b/src/vfs/sftpfs/connection.c
+@@ -42,6 +42,8 @@
+ #include "lib/util.h"
+ #include "lib/tty/tty.h"        /* tty_enable_interrupt_key () */
+ #include "lib/vfs/utilvfs.h"
++#include "lib/mcconfig.h"       /* mc_config_get_home_dir () */
++#include "lib/widget.h"         /* query_dialog () */
+=20
+ #include "internal.h"
+=20
+@@ -49,10 +51,37 @@
+=20
+ /*** file scope macro definitions *************************************=
***************************/
+=20
++#define SHA1_DIGEST_LENGTH 20
++
+ /*** file scope type declarations *************************************=
***************************/
+=20
+ /*** file scope variables *********************************************=
***************************/
+=20
++#ifdef LIBSSH2_KNOWNHOST_KEY_ED25519
++static const char *const hostkey_method_ssh_ed25519 =3D "ssh-ed25519";
++#endif
++#ifdef LIBSSH2_KNOWNHOST_KEY_ECDSA_521
++static const char *const hostkey_method_ssh_ecdsa_521 =3D "ecdsa-sha2-n=
istp521";
++#endif
++#ifdef LIBSSH2_KNOWNHOST_KEY_ECDSA_384
++static const char *const hostkey_method_ssh_ecdsa_384 =3D "ecdsa-sha2-n=
istp384";
++#endif
++#ifdef LIBSSH2_KNOWNHOST_KEY_ECDSA_256
++static const char *const hostkey_method_ssh_ecdsa_256 =3D "ecdsa-sha2-n=
istp256";
++#endif
++static const char *const hostkey_method_ssh_rsa =3D "ssh-rsa";
++static const char *const hostkey_method_ssh_dss =3D "ssh-dss";
++
++/**
++ *
++ * The current implementation of know host key checking has following l=
imitations:
++ *
++ *   - Only plain-text entries are supported (`HashKnownHosts no` OpenS=
SH option)
++ *   - Only HEX-encoded SHA1 fingerprint display is supported (`Fingerp=
rintHash` OpenSSH option)
++ *   - Resolved IP addresses are *not* saved/validated along with the h=
ostnames
++ *
++ */
++
+ static const char *kbi_passwd =3D NULL;
+ static const struct vfs_s_super *kbi_super =3D NULL;
+=20
+@@ -70,9 +99,12 @@ static const struct vfs_s_super *kbi_super =3D NULL;
+ static int
+ sftpfs_open_socket (struct vfs_s_super *super, GError ** mcerror)
+ {
++    sftpfs_super_t *sftpfs_super =3D SFTP_SUPER (super);
+     struct addrinfo hints, *res =3D NULL, *curr_res;
+     int my_socket =3D 0;
+     char port[BUF_TINY];
++    static char address_ipv4[INET_ADDRSTRLEN];
++    static char address_ipv6[INET6_ADDRSTRLEN];
+     int e;
+=20
+     mc_return_val_if_error (mcerror, LIBSSH2_INVALID_SOCKET);
+@@ -120,6 +152,30 @@ sftpfs_open_socket (struct vfs_s_super *super, GErr=
or ** mcerror)
+     {
+         int save_errno;
+=20
++        switch (curr_res->ai_addr->sa_family)
++        {
++        case AF_INET:
++            sftpfs_super->ip_address =3D
++                inet_ntop (AF_INET, &((struct sockaddr_in *) curr_res->=
ai_addr)->sin_addr,
++                           address_ipv4, INET_ADDRSTRLEN);
++            break;
++        case AF_INET6:
++            sftpfs_super->ip_address =3D
++                inet_ntop (AF_INET6, &((struct sockaddr_in6 *) curr_res=
->ai_addr)->sin6_addr,
++                           address_ipv6, INET6_ADDRSTRLEN);
++            break;
++        default:
++            sftpfs_super->ip_address =3D NULL;
++        }
++
++        if (sftpfs_super->ip_address =3D=3D NULL)
++        {
++            mc_propagate_error (mcerror, 0, "%s",
++                                _("sftp: failed to convert remote host =
IP address into text form"));
++            my_socket =3D LIBSSH2_INVALID_SOCKET;
++            goto ret;
++        }
++
+         my_socket =3D socket (curr_res->ai_family, curr_res->ai_socktyp=
e, curr_res->ai_protocol);
+=20
+         if (my_socket < 0)
+@@ -161,8 +217,358 @@ sftpfs_open_socket (struct vfs_s_super *super, GEr=
ror ** mcerror)
+ }
+=20
+ /* --------------------------------------------------------------------=
------------------------- */
++
++/**
++ * Read ~/.ssh/known_hosts file.
++ *
++ * @param super connection data
++ * @param mcerror pointer to the error handler
++ * @return TRUE on success, FALSE otherwise
++ *
++ * Thanks the Curl project for the code used in this function.
++ */
++static gboolean
++sftpfs_read_known_hosts (struct vfs_s_super *super, GError ** mcerror)
++{
++    sftpfs_super_t *sftpfs_super =3D SFTP_SUPER (super);
++    struct libssh2_knownhost *store =3D NULL;
++    int rc;
++    gboolean found =3D FALSE;
++
++    sftpfs_super->known_hosts =3D libssh2_knownhost_init (sftpfs_super-=
>session);
++    if (sftpfs_super->known_hosts =3D=3D NULL)
++        goto err;
++
++    sftpfs_super->known_hosts_file =3D
++        mc_build_filename (mc_config_get_home_dir (), ".ssh", "known_ho=
sts", (char *) NULL);
++    rc =3D libssh2_knownhost_readfile (sftpfs_super->known_hosts, sftpf=
s_super->known_hosts_file,
++                                     LIBSSH2_KNOWNHOST_FILE_OPENSSH);
++    if (rc > 0)
++    {
++        const char *kh_name_end =3D NULL;
++
++        while (!found && libssh2_knownhost_get (sftpfs_super->known_hos=
ts, &store, store) =3D=3D 0)
++        {
++            /* For non-standard ports, the name will be enclosed in
++             * square brackets, followed by a colon and the port */
++            if (store =3D=3D NULL)
++                continue;
++
++            if (store->name =3D=3D NULL)
++                found =3D TRUE;
++            else if (store->name[0] !=3D '[')
++                found =3D strcmp (store->name, super->path_element->hos=
t) =3D=3D 0;
++            else
++            {
++                int port;
++
++                kh_name_end =3D strstr (store->name, "]:");
++                if (kh_name_end =3D=3D NULL)
++                    /* Invalid host pattern */
++                    continue;
++
++                port =3D (int) g_ascii_strtoll (kh_name_end + 2, NULL, =
10);
++                if (port =3D=3D super->path_element->port)
++                {
++                    size_t kh_name_size;
++
++                    kh_name_size =3D strlen (store->name) - 1 - strlen =
(kh_name_end);
++                    found =3D strncmp (store->name + 1, super->path_ele=
ment->host, kh_name_size) =3D=3D 0;
++                }
++            }
++        }
++    }
++
++    if (found)
++    {
++        int mask;
++        const char *hostkey_method =3D NULL;
++
++        mask =3D store->typemask & LIBSSH2_KNOWNHOST_KEY_MASK;
++
++        switch (mask)
++        {
++#ifdef LIBSSH2_KNOWNHOST_KEY_ED25519
++        case LIBSSH2_KNOWNHOST_KEY_ED25519:
++            hostkey_method =3D hostkey_method_ssh_ed25519;
++            break;
++#endif
++#ifdef LIBSSH2_KNOWNHOST_KEY_ECDSA_521
++        case LIBSSH2_KNOWNHOST_KEY_ECDSA_521:
++            hostkey_method =3D hostkey_method_ssh_ecdsa_521;
++            break;
++#endif
++#ifdef LIBSSH2_KNOWNHOST_KEY_ECDSA_384
++        case LIBSSH2_KNOWNHOST_KEY_ECDSA_384:
++            hostkey_method =3D hostkey_method_ssh_ecdsa_384;
++            break;
++#endif
++#ifdef LIBSSH2_KNOWNHOST_KEY_ECDSA_256
++        case LIBSSH2_KNOWNHOST_KEY_ECDSA_256:
++            hostkey_method =3D hostkey_method_ssh_ecdsa_256;
++            break;
++#endif
++        case LIBSSH2_KNOWNHOST_KEY_SSHRSA:
++            hostkey_method =3D hostkey_method_ssh_rsa;
++            break;
++        case LIBSSH2_KNOWNHOST_KEY_SSHDSS:
++            hostkey_method =3D hostkey_method_ssh_dss;
++            break;
++        case LIBSSH2_KNOWNHOST_KEY_RSA1:
++            mc_propagate_error (mcerror, 0, "%s",
++                                _("sftp: found host key of unsupported =
type: RSA1"));
++            return FALSE;
++        default:
++            mc_propagate_error (mcerror, 0, "%s %d", _("sftp: unknown h=
ost key type:"), mask);
++            return FALSE;
++        }
++
++        rc =3D libssh2_session_method_pref (sftpfs_super->session, LIBS=
SH2_METHOD_HOSTKEY,
++                                          hostkey_method);
++        if (rc < 0)
++            goto err;
++    }
++
++    return TRUE;
++
++  err:
++    {
++        int sftp_errno;
++
++        sftp_errno =3D libssh2_session_last_errno (sftpfs_super->sessio=
n);
++        sftpfs_ssherror_to_gliberror (sftpfs_super, sftp_errno, mcerror=
);
++    }
++    return FALSE;
++}
++
++/* --------------------------------------------------------------------=
------------------------- */
++
++/**
++ * Write new host + key pair to the ~/.ssh/known_hosts file.
++ *
++ * @param super connection data
++ * @param remote_key he key for the remote host
++ * @param remote_key_len length of @remote_key
++ * @param type_mask info about format of host name, key and key type
++ * @return 0 on success, regular libssh2 error code otherwise
++ *
++ * Thanks the Curl project for the code used in this function.
++ */
++static int
++sftpfs_update_known_hosts (struct vfs_s_super *super, const char *remot=
e_key, size_t remote_key_len,
++                           int type_mask)
++{
++    sftpfs_super_t *sftpfs_super =3D SFTP_SUPER (super);
++    int rc;
++
++    /* add this host + key pair  */
++    rc =3D libssh2_knownhost_addc (sftpfs_super->known_hosts, super->pa=
th_element->host, NULL,
++                                 remote_key, remote_key_len, NULL, 0, t=
ype_mask, NULL);
++    if (rc < 0)
++        return rc;
++
++    /* write the entire in-memory list of known hosts to the known_host=
s file */
++    rc =3D libssh2_knownhost_writefile (sftpfs_super->known_hosts, sftp=
fs_super->known_hosts_file,
++                                      LIBSSH2_KNOWNHOST_FILE_OPENSSH);
++
++    if (rc < 0)
++        return rc;
++
++    (void) message (D_NORMAL, _("Information"),
++                    _("Permanently added\n%s (%s)\nto the list of known=
 hosts."),
++                    super->path_element->host, sftpfs_super->ip_address=
);
++
++    return 0;
++}
++
++/* --------------------------------------------------------------------=
------------------------- */
++/**
++ * Compute and return readable host key fingerprint hash.
++ *
++ * @param session libssh2 session handle
++ * @return pointer to static buffer on success, NULL otherwise
++ */
++static const char *
++sftpfs_compute_fingerprint_hash (LIBSSH2_SESSION * session)
++{
++    static char result[SHA1_DIGEST_LENGTH * 3 + 1];     /* "XX:" for ea=
ch byte, and EOL */
++    const char *fingerprint;
++    size_t i;
++
++    /* The fingerprint points to static storage (!), don't free() it. *=
/
++    fingerprint =3D libssh2_hostkey_hash (session, LIBSSH2_HOSTKEY_HASH=
_SHA1);
++    if (fingerprint =3D=3D NULL)
++        return NULL;
++
++    for (i =3D 0; i < SHA1_DIGEST_LENGTH && i * 3 < sizeof (result) - 1=
; i++)
++        g_snprintf ((gchar *) (result + i * 3), 4, "%02x:", (guint8) fi=
ngerprint[i]);
++
++    /* remove last ":" */
++    result[i * 3 - 1] =3D '\0';
++
++    return result;
++}
++
++/* --------------------------------------------------------------------=
------------------------- */
++
+ /**
+- * Recognize authenticaion types supported by remote side and filling i=
nternal 'super' structure by
++ * Process host info found in ~/.ssh/known_hosts file.
++ *
++ * @param super connection data
++ * @param mcerror pointer to the error handler
++ * @return TRUE on success, FALSE otherwise
++ *
++ * Thanks the Curl project for the code used in this function.
++ */
++static gboolean
++sftpfs_process_known_host (struct vfs_s_super *super, GError ** mcerror=
)
++{
++    sftpfs_super_t *sftpfs_super =3D SFTP_SUPER (super);
++    const char *remote_key;
++    const char *key_type;
++    const char *fingerprint_hash;
++    size_t remote_key_len =3D 0;
++    int remote_key_type =3D LIBSSH2_HOSTKEY_TYPE_UNKNOWN;
++    int keybit =3D 0;
++    struct libssh2_knownhost *host =3D NULL;
++    int rc;
++    char *msg =3D NULL;
++    gboolean handle_query =3D FALSE;
++
++    remote_key =3D libssh2_session_hostkey (sftpfs_super->session, &rem=
ote_key_len, &remote_key_type);
++    if (remote_key =3D=3D NULL || remote_key_len =3D=3D 0
++        || remote_key_type =3D=3D LIBSSH2_HOSTKEY_TYPE_UNKNOWN)
++    {
++        mc_propagate_error (mcerror, 0, "%s", _("sftp: cannot get the r=
emote host key"));
++        return FALSE;
++    }
++
++    switch (remote_key_type)
++    {
++    case LIBSSH2_HOSTKEY_TYPE_RSA:
++        keybit =3D LIBSSH2_KNOWNHOST_KEY_SSHRSA;
++        key_type =3D "RSA";
++        break;
++    case LIBSSH2_HOSTKEY_TYPE_DSS:
++        keybit =3D LIBSSH2_KNOWNHOST_KEY_SSHDSS;
++        key_type =3D "DSS";
++        break;
++#ifdef LIBSSH2_HOSTKEY_TYPE_ECDSA_256
++    case LIBSSH2_HOSTKEY_TYPE_ECDSA_256:
++        keybit =3D LIBSSH2_KNOWNHOST_KEY_ECDSA_256;
++        key_type =3D "ECDSA";
++        break;
++#endif
++#ifdef LIBSSH2_HOSTKEY_TYPE_ECDSA_384
++    case LIBSSH2_HOSTKEY_TYPE_ECDSA_384:
++        keybit =3D LIBSSH2_KNOWNHOST_KEY_ECDSA_384;
++        key_type =3D "ECDSA";
++        break;
++#endif
++#ifdef LIBSSH2_HOSTKEY_TYPE_ECDSA_521
++    case LIBSSH2_HOSTKEY_TYPE_ECDSA_521:
++        keybit =3D LIBSSH2_KNOWNHOST_KEY_ECDSA_521;
++        key_type =3D "ECDSA";
++        break;
++#endif
++#ifdef LIBSSH2_HOSTKEY_TYPE_ED25519
++    case LIBSSH2_HOSTKEY_TYPE_ED25519:
++        keybit =3D LIBSSH2_KNOWNHOST_KEY_ED25519;
++        key_type =3D "ED25519";
++        break;
++#endif
++    default:
++        mc_propagate_error (mcerror, 0, "%s",
++                            _("sftp: unsupported key type, can't check =
remote host key"));
++        return FALSE;
++    }
++
++    fingerprint_hash =3D sftpfs_compute_fingerprint_hash (sftpfs_super-=
>session);
++    if (fingerprint_hash =3D=3D NULL)
++    {
++        mc_propagate_error (mcerror, 0, "%s", _("sftp: can't compute ho=
st key fingerprint hash"));
++        return FALSE;
++    }
++
++    rc =3D libssh2_knownhost_checkp (sftpfs_super->known_hosts, super->=
path_element->host,
++                                   super->path_element->port, remote_ke=
y, remote_key_len,
++                                   LIBSSH2_KNOWNHOST_TYPE_PLAIN | LIBSS=
H2_KNOWNHOST_KEYENC_RAW |
++                                   keybit, &host);
++
++    switch (rc)
++    {
++    default:
++    case LIBSSH2_KNOWNHOST_CHECK_FAILURE:
++        /* something prevented the check to be made */
++        goto err;
++
++    case LIBSSH2_KNOWNHOST_CHECK_MATCH:
++        /* host + key pair matched -- OK */
++        break;
++
++    case LIBSSH2_KNOWNHOST_CHECK_NOTFOUND:
++        /* no host match was found -- add it to the known_hosts file */
++        msg =3D g_strdup_printf (_("The authenticity of host\n%s (%s)\n=
can't be established!\n"
++                                 "%s key fingerprint hash is\nSHA1:%s.\=
n"
++                                 "Do you want to add it to the list of =
known hosts and continue connecting?"),
++                               super->path_element->host, sftpfs_super-=
>ip_address,
++                               key_type, fingerprint_hash);
++        /* Select "No" initially */
++        query_set_sel (2);
++        rc =3D query_dialog (_("Warning"), msg, D_NORMAL, 3, _("&Yes"),=
 _("&Ignore"), _("&No"));
++        g_free (msg);
++        handle_query =3D TRUE;
++        break;
++
++    case LIBSSH2_KNOWNHOST_CHECK_MISMATCH:
++        msg =3D g_strdup_printf (_("%s (%s)\nis found in the list of kn=
own hosts but\n"
++                                 "KEYS DO NOT MATCH! THIS COULD BE A MI=
TM ATTACK!\n"
++                                 "Are you sure you want to add it to th=
e list of known hosts and continue connecting?"),
++                               super->path_element->host, sftpfs_super-=
>ip_address);
++        /* Select "No" initially */
++        query_set_sel (2);
++        rc =3D query_dialog (MSG_ERROR, msg, D_ERROR, 3, _("&Yes"), _("=
&Ignore"), _("&No"));
++        g_free (msg);
++        handle_query =3D TRUE;
++        break;
++    }
++
++    if (handle_query)
++        switch (rc)
++        {
++        case 0:
++            /* Yes: add this host + key pair, continue connecting */
++            if (sftpfs_update_known_hosts (super, remote_key, remote_ke=
y_len,
++                                           LIBSSH2_KNOWNHOST_TYPE_PLAIN
++                                           | LIBSSH2_KNOWNHOST_KEYENC_R=
AW | keybit) < 0)
++                goto err;
++            break;
++        case 1:
++            /* Ignore: do not add this host + key pair, continue connec=
ting anyway */
++            break;
++        case 2:
++        default:
++            mc_propagate_error (mcerror, 0, "%s", _("sftp: host key ver=
ification failed"));
++            /* No: abort connection */
++            goto err;
++        }
++
++    return TRUE;
++
++  err:
++    {
++        int sftp_errno;
++
++        sftp_errno =3D libssh2_session_last_errno (sftpfs_super->sessio=
n);
++        sftpfs_ssherror_to_gliberror (sftpfs_super, sftp_errno, mcerror=
);
++    }
++
++    return FALSE;
++}
++
++/* --------------------------------------------------------------------=
------------------------- */
++/**
++ * Recognize authentication types supported by remote side and filling =
internal 'super' structure by
+  * proper enum's values.
+  *
+  * @param super connection data
+@@ -461,6 +867,9 @@ sftpfs_open_connection (struct vfs_s_super *super, G=
Error ** mcerror)
+     if (sftpfs_super->session =3D=3D NULL)
+         return (-1);
+=20
++    if (!sftpfs_read_known_hosts (super, mcerror))
++        return (-1);
++
+     /* ... start it up. This will trade welcome banners, exchange keys,
+      * and setup crypto, compression, and MAC layers
+      */
+@@ -475,13 +884,8 @@ sftpfs_open_connection (struct vfs_s_super *super, =
GError ** mcerror)
+         return (-1);
+     }
+=20
+-    /* At this point we havn't yet authenticated.  The first thing to d=
o
+-     * is check the hostkey's fingerprint against our known hosts Your =
app
+-     * may have it hard coded, may go to a file, may present it to the
+-     * user, that's your call
+-     */
+-    sftpfs_super->fingerprint =3D
+-        libssh2_hostkey_hash (sftpfs_super->session, LIBSSH2_HOSTKEY_HA=
SH_SHA1);
++    if (!sftpfs_process_known_host (super, mcerror))
++        return (-1);
+=20
+     if (!sftpfs_recognize_auth_types (super))
+     {
+@@ -538,7 +942,13 @@ sftpfs_close_connection (struct vfs_s_super *super,=
 const char *shutdown_message
+         sftpfs_super->agent =3D NULL;
+     }
+=20
+-    sftpfs_super->fingerprint =3D NULL;
++    if (sftpfs_super->known_hosts !=3D NULL)
++    {
++        libssh2_knownhost_free (sftpfs_super->known_hosts);
++        sftpfs_super->known_hosts =3D NULL;
++    }
++
++    MC_PTR_FREE (sftpfs_super->known_hosts_file);
+=20
+     if (sftpfs_super->session !=3D NULL)
+     {
+diff --git a/src/vfs/sftpfs/internal.h b/src/vfs/sftpfs/internal.h
+index 5616fb8990..643ce5e3cc 100644
+--- a/src/vfs/sftpfs/internal.h
++++ b/src/vfs/sftpfs/internal.h
+@@ -42,6 +42,9 @@ typedef struct
+     sftpfs_auth_type_t auth_type;
+     sftpfs_auth_type_t config_auth_type;
+=20
++    LIBSSH2_KNOWNHOSTS *known_hosts;
++    char *known_hosts_file;
++
+     LIBSSH2_SESSION *session;
+     LIBSSH2_SFTP *sftp_session;
+=20
+@@ -51,7 +54,7 @@ typedef struct
+     char *privkey;
+=20
+     int socket_handle;
+-    const char *fingerprint;
++    const char *ip_address;
+     vfs_path_element_t *original_connection_info;
+ } sftpfs_super_t;
+=20
diff --git a/meta/recipes-extended/mc/mc_4.8.26.bb b/meta/recipes-extende=
d/mc/mc_4.8.26.bb
index 5c5e6790d8..6bc7e6e8e1 100644
--- a/meta/recipes-extended/mc/mc_4.8.26.bb
+++ b/meta/recipes-extended/mc/mc_4.8.26.bb
@@ -11,6 +11,7 @@ RRECOMMENDS_${PN} =3D "ncurses-terminfo"
 SRC_URI =3D "http://www.midnight-commander.org/downloads/${BPN}-${PV}.ta=
r.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
+           file://CVE-2021-36370.patch \
            "
 SRC_URI[sha256sum] =3D "9d6358d0a351a455a1410aab57f33b6b48b0fcf31344b9a1=
0b0ff497595979d1"
=20
--=20
2.17.1

