Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E0FF06067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 11:34:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2016 03:34:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,320,1449561600"; d="scan'208";a="885438653"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.14.26])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2016 03:34:40 -0800
Message-ID: <1453289679.3855.2.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 11:34:39 +0000
In-Reply-To: <1453094810-8670-1-git-send-email-akuster808@gmail.com>
References: <1453094810-8670-1-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.18.3 (3.18.3-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH][fido] openssh: CVE-2016-077x
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
X-List-Received-Date: Wed, 20 Jan 2016 11:34:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2016-01-17 at 21:26 -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> this address two CVE's.
> CVE-2016-0777 and CVE-2016-0778

Thank you, this is pushed to my joshuagl/fido-next branch.

Regards,

Joshua

> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../openssh/openssh/CVE-2016-077x.patch            | 56
> ++++++++++++++++++++++
>  meta/recipes-connectivity/openssh/openssh_6.7p1.bb |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-
> 2016-077x.patch
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2016-
> 077x.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2016-
> 077x.patch
> new file mode 100644
> index 0000000..4cc462d
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2016-077x.patch
> @@ -0,0 +1,56 @@
> +From e6c85f8889c5c9eb04796fdb76d2807636b9eef5 Mon Sep 17 00:00:00
> 2001
> +From: Damien Miller <djm@mindrot.org>
> +Date: Fri, 15 Jan 2016 01:30:36 +1100
> +Subject: [PATCH] forcibly disable roaming support in the client
> +
> +
> +Upstream-Status: Backport
> +CVE: CVE-2016-0777
> +CVE: CVE-2016-0778
> +
> +[Yocto #8935]
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + readconf.c | 5 ++---
> + ssh.c      | 3 ---
> + 2 files changed, 2 insertions(+), 6 deletions(-)
> +
> +Index: openssh-6.7p1/readconf.c
> +===================================================================
> +--- openssh-6.7p1.orig/readconf.c
> ++++ openssh-6.7p1/readconf.c
> +@@ -1597,7 +1597,7 @@ initialize_options(Options * options)
> + 	options->tun_remote = -1;
> + 	options->local_command = NULL;
> + 	options->permit_local_command = -1;
> +-	options->use_roaming = -1;
> ++	options->use_roaming = 0;
> + 	options->visual_host_key = -1;
> + 	options->ip_qos_interactive = -1;
> + 	options->ip_qos_bulk = -1;
> +@@ -1768,8 +1768,7 @@ fill_default_options(Options * options)
> + 		options->tun_remote = SSH_TUNID_ANY;
> + 	if (options->permit_local_command == -1)
> + 		options->permit_local_command = 0;
> +-	if (options->use_roaming == -1)
> +-		options->use_roaming = 1;
> ++	options->use_roaming = 0;
> + 	if (options->visual_host_key == -1)
> + 		options->visual_host_key = 0;
> + 	if (options->ip_qos_interactive == -1)
> +Index: openssh-6.7p1/ssh.c
> +===================================================================
> +--- openssh-6.7p1.orig/ssh.c
> ++++ openssh-6.7p1/ssh.c
> +@@ -1800,9 +1800,6 @@ ssh_session2(void)
> + 			fork_postauth();
> + 	}
> + 
> +-	if (options.use_roaming)
> +-		request_roaming();
> +-
> + 	return client_loop(tty_flag, tty_flag ?
> + 	    options.escape_char : SSH_ESCAPECHAR_NONE, id);
> + }
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> index 9246284..700bf7f 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> @@ -26,6 +26,7 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSS
> H/portable/openssh-${PV}.tar.
>             file://CVE-2015-6564.patch \
>             file://CVE-2015-6565.patch \
>             file://CVE-2015-5600.patch \
> +           file://CVE-2016-077x.patch \
>             "
>  
>  PAM_SRC_URI = "file://sshd"
> -- 
> 1.9.1
> 

