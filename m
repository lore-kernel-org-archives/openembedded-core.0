Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 6D72C6E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 16:02:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id EB6D33C88761
Message-ID: <1442332955.3357.37.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 17:02:35 +0100
In-Reply-To: <1441758146-24139-1-git-send-email-akuster808@gmail.com>
References: <1441758146-24139-1-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH][fido] openssh: CVE-2015-6563 CVE-2015-6564 CVE-2015-6565
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
X-List-Received-Date: Tue, 15 Sep 2015 16:02:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-08 at 17:22 -0700, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> three security fixes.
> 
> CVE-2015-6563 (Low) openssh: Privilege separation weakness related to
> PAM support
> CVE-2015-6564 (medium)  openssh: Use-after-free bug related to PAM
> support
> CVE-2015-6565 (High)  openssh: Incorrectly set TTYs to be world
> -writable
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>

Patch queued in my joshuagl/fido-next tree - thanks!

Joshua

http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/
fido-next

> ---
>  .../openssh/openssh/CVE-2015-6563.patch            | 36
> ++++++++++++++++++++++
>  .../openssh/openssh/CVE-2015-6564.patch            | 34
> ++++++++++++++++++++
>  .../openssh/openssh/CVE-2015-6565.patch            | 35
> +++++++++++++++++++++
>  meta/recipes-connectivity/openssh/openssh_6.7p1.bb |  6 +++-
>  4 files changed, 110 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE
> -2015-6563.patch
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE
> -2015-6564.patch
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE
> -2015-6565.patch
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2015
> -6563.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2015
> -6563.patch
> new file mode 100644
> index 0000000..19cea41
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2015-6563.patch
> @@ -0,0 +1,36 @@
> +CVE-2015-6563
> +
> +Don't resend username to PAM; it already has it. 
> +Pointed out by Moritz Jodeit; ok dtucker@
> +
> +Upstream-Status: Backport
> +https://github.com/openssh/openssh-portable/commit/d4697fe9a28dab725
> 5c60433e4dd23cf7fce8a8b
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +Index: openssh-6.7p1/monitor.c
> +===================================================================
> +--- openssh-6.7p1.orig/monitor.c
> ++++ openssh-6.7p1/monitor.c
> +@@ -1046,9 +1046,7 @@ extern KbdintDevice sshpam_device;
> + int
> + mm_answer_pam_init_ctx(int sock, Buffer *m)
> + {
> +-
> + 	debug3("%s", __func__);
> +-	authctxt->user = buffer_get_string(m, NULL);
> + 	sshpam_ctxt = (sshpam_device.init_ctx)(authctxt);
> + 	sshpam_authok = NULL;
> + 	buffer_clear(m);
> +Index: openssh-6.7p1/monitor_wrap.c
> +===================================================================
> +--- openssh-6.7p1.orig/monitor_wrap.c
> ++++ openssh-6.7p1/monitor_wrap.c
> +@@ -826,7 +826,6 @@ mm_sshpam_init_ctx(Authctxt *authctxt)
> + 
> + 	debug3("%s", __func__);
> + 	buffer_init(&m);
> +-	buffer_put_cstring(&m, authctxt->user);
> + 	mm_request_send(pmonitor->m_recvfd,
> MONITOR_REQ_PAM_INIT_CTX, &m);
> + 	debug3("%s: waiting for MONITOR_ANS_PAM_INIT_CTX",
> __func__);
> + 	mm_request_receive_expect(pmonitor->m_recvfd,
> MONITOR_ANS_PAM_INIT_CTX, &m);
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2015
> -6564.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2015
> -6564.patch
> new file mode 100644
> index 0000000..588d42d
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2015-6564.patch
> @@ -0,0 +1,34 @@
> +CVE-2015-6564
> +
> + set sshpam_ctxt to NULL after free
> +
> + Avoids use-after-free in monitor when privsep child is compromised.
> + Reported by Moritz Jodeit; ok dtucker@
> +
> +Upstream-Status: Backport
> +https://github.com/openssh/openssh-portable/commit/5e75f519876905608
> 9fb06c4d738ab0e5abc66f7
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +Index: openssh-6.7p1/monitor.c
> +===================================================================
> +--- openssh-6.7p1.orig/monitor.c
> ++++ openssh-6.7p1/monitor.c
> +@@ -1128,14 +1128,16 @@ mm_answer_pam_respond(int sock, Buffer *
> + int
> + mm_answer_pam_free_ctx(int sock, Buffer *m)
> + {
> ++    int r = sshpam_authok != NULL && sshpam_authok == sshpam_ctxt;
> + 
> + 	debug3("%s", __func__);
> + 	(sshpam_device.free_ctx)(sshpam_ctxt);
> ++    sshpam_ctxt = sshpam_authok = NULL;
> + 	buffer_clear(m);
> + 	mm_request_send(sock, MONITOR_ANS_PAM_FREE_CTX, m);
> + 	auth_method = "keyboard-interactive";
> + 	auth_submethod = "pam";
> +-	return (sshpam_authok == sshpam_ctxt);
> ++	return r;
> + }
> + #endif
> + 
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2015
> -6565.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2015
> -6565.patch
> new file mode 100644
> index 0000000..42667b0
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2015-6565.patch
> @@ -0,0 +1,35 @@
> +CVE-2015-6565 openssh: Incorrectly set TTYs to be world-writable
> +
> +fix pty permissions; patch from Nikolay Edigaryev; ok deraadt
> +
> +Upstream-Status: Backport
> +
> +merged two changes into one.
> +[1] https://anongit.mindrot.org/openssh.git/commit/sshpty.c?id=a5883
> d4eccb94b16c355987f58f86a7dee17a0c2
> +tighten permissions on pty when the "tty" group does not exist;
> pointed out by Corinna Vinschen; ok markus
> +
> +[2] https://anongit.mindrot.org/openssh.git/commit/sshpty.c?id=6f941
> 396b6835ad18018845f515b0c4fe20be21a
> +fix pty permissions; patch from Nikolay Edigaryev; ok deraadt
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +Index: openssh-6.7p1/sshpty.c
> +===================================================================
> +--- openssh-6.7p1.orig/sshpty.c
> ++++ openssh-6.7p1/sshpty.c
> +@@ -196,13 +196,8 @@ pty_setowner(struct passwd *pw, const ch
> + 
> + 	/* Determine the group to make the owner of the tty. */
> + 	grp = getgrnam("tty");
> +-	if (grp) {
> +-		gid = grp->gr_gid;
> +-		mode = S_IRUSR | S_IWUSR | S_IWGRP;
> +-	} else {
> +-		gid = pw->pw_gid;
> +-		mode = S_IRUSR | S_IWUSR | S_IWGRP | S_IWOTH;
> +-	}
> ++    gid = (grp != NULL) ? grp->gr_gid : pw->pw_gid;
> ++    mode = (grp != NULL) ? 0620 : 0600;
> + 
> + 	/*
> + 	 * Change owner and mode of the tty as required.
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> index a272629..aa71cc1 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> @@ -21,7 +21,11 @@ SRC_URI = "
> ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>             file://volatiles.99_sshd \
>             file://add-test-support-for-busybox.patch \
>             file://run-ptest \
> -           file://auth2-none.c-avoid-authenticate-empty-passwords-to
> -m.patch"
> +           file://auth2-none.c-avoid-authenticate-empty-passwords-to
> -m.patch \
> +           file://CVE-2015-6563.patch  \
> +           file://CVE-2015-6564.patch \
> +           file://CVE-2015-6565.patch \
> +           "
>  
>  PAM_SRC_URI = "file://sshd"
>  
> -- 
> 2.3.5
> 

