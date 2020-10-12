Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web11.7139.1602531100587368306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 12:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 81E8F2E8922;
	Mon, 12 Oct 2020 14:31:39 -0500 (CDT)
Date: Mon, 12 Oct 2020 14:31:37 -0500
From: "Seebs" <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/9] pseudo: Add support for ignoring paths from the pseudo DB
Message-ID: <20201012143137.6b4cbe34@seebsdell>
In-Reply-To: <20201007101449.3132127-2-richard.purdie@linuxfoundation.org>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
	<20201007101449.3132127-2-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Oct 2020 11:14:42 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> ++int pseudo_client_ignore_path_chroot(const char *path, int
> ignore_chroot) { ++	char *env;
> ++	if (path) {
> ++		if (ignore_chroot && pseudo_chroot && strncmp(path,
> pseudo_chroot, pseudo_chroot_len) == 0) ++
> return 0; ++		env =
> pseudo_get_value("PSEUDO_IGNORE_PATHS"); ++		if (env) {
> ++			char *p = env;
> ++        	        while (*p) {
> ++				char *next = strchr(p, ',');
> ++				if (!next)
> ++				    next = strchr(p, '\0');
> ++				if ((next - p) && !strncmp(path, p,
> next - p)) { ++
> pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n",
> path); ++					return 1;
> ++				} ++
> if (next && *next != '\0') ++
> p = next+1; ++				else
> ++					break;
> ++			}
> ++			free(env);
> ++		}
> ++	}
> ++	return 0;

This seems like it might merit caching; parse PSEUDO_IGNORE_PATHS at
startup, build a table of paths (and probably their lengths), and use
those? Seems like there's gonna be a LOT of hits on this.

Apart from that, this looks plausible. It's certainly a large change,
but I do think that reducing the size of the database like this is
probably a big win.

-s
