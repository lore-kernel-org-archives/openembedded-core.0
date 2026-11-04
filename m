Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9473.1793800358661301145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 05:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ihVOpocD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4E2F84E413FD
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 13:52:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C17F60770;
	Wed,  4 Nov 2026 13:52:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A81A6103291AD;
	Wed,  4 Nov 2026 14:52:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793800355; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vxy3aedpwOjC0KcQpFy1aZzzg3ssrWD97fF7N5iyPBk=;
	b=ihVOpocDOdsuqH8XPQJQzjz055HYNHtXfghx9gxeQyK/pWIYqZexhGYSjiWa9369RQ0bVv
	ecsthgutw7DSqrs+FFbgnSvG7Xvt8bJAhAo3MVC3NMqjb92gPNilfqavlQdGJcgbdCKV8e
	ipTiYUnBVKGmT+fV/+xA2AZ5IKAtDnEfmmDQtMjNF6AhNLwqcoRi+275HtIb78FwSM2XVA
	QMKQsRG0n43/qJP2RiSAco4fxZjRzh7TNaEupv+DdZwmtAVWhuweWzbVKXsM68z/QMGDTI
	GhyPKGbsO8f10S2/jn7GivO1g06iUB/sRCIzACKPVCOzx7EDwqmaR5tEX97aGg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 14:52:33 +0100
Message-Id: <DMMH5MBL0Y9R.19MJFCNHD82Q7@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/4] rsync: upgrade 3.5.1 -> 3.5.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261104113822.45520-1-jaipaul.cheernam@est.tech>
 <20261104113822.45520-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20261104113822.45520-2-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 13:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249380

On Wed Nov 4, 2026 at 12:38 PM CET, Jaipaul Cheernam wrote:
> NEWS: https://download.samba.org/pub/rsync/NEWS#3.5.2
>
> - Fixed interrupted `--append` and `--inplace` transfers writing the fina=
l
>   256 KiB buffer twice. An interrupted destination now remains a clean pr=
efix
>   which the next transfer can resume or repair.
> - Fixed uploads through `rrsync` when the destination file already exists=
.
>   Existing files are now reached beneath a pinned parent directory instea=
d of
>   being passed as an unwritable `/proc/self/fd/N` destination.
> - Fixed poor matching performance on large sparse and repeated-block file=
s
>   when duplicate checksum chains exhausted the search limit. Valid basis
>   blocks are no longer hidden behind duplicate entries.
> - Bounded strong-checksum work when a malicious receiver supplies weak
>   checksums that collide with consecutive rolling windows
>   (CVE-2026-119741).
> - Prevented the `--inplace` matcher from advancing its aligned basis inde=
x
>   beyond the available checksum entries. This avoids signed overflow on l=
arge
>   source files when the peer supplies a small block count.
> - Recovered from failed hard-link creation without aborting or hanging th=
e
>   generator. Remaining members fall back to a fresh hard-link group when =
the
>   original destination inode cannot accept another link.
> - Prevented an out-of-bounds write while invalidating a sender checksum a=
fter
>   a file read error when the negotiated checksum length is zero.
> - Fixed a daemon receiver stack overflow when queued deletion output reac=
hed
>   `--max-alloc`. Quiet daemon transfers no longer queue deletion messages
>   unless the client requested them.
> - Fixed a `--files-from` pull from a subdirectory of a daemon module, whi=
ch
>   read each listed file from the module root instead.  It could send, and=
 with
>   `--remove-source-files` delete, a same-named file the module's filter
>   excludes.
> - Fixed password files whose first line is empty. The parser no longer sk=
ips
>   the empty line and uses a later password.
> - Escaped terminal control characters in filenames and diagnostics writte=
n to
>   standard output, standard error and log files while preserving printabl=
e
>   text in the active locale.
> - Preserved Cygwin and MSYS2 UNC roots during ownership-checked path walk=
s.
> - Restored daemon startup from accepted named Unix sockets on standard in=
put,
>   including filesystem and Linux abstract sockets used for socket activat=
ion.
>   Unnamed local socket pairs remain non-daemon channels.
> - Fixed forward-DNS hostname entries in daemon `hosts allow` and `hosts d=
eny`
>   lists for IPv6 peers. Address comparison is now binary and family-aware=
.
> - Preserved Unix symlink permissions on systems which require `fchmodat()=
` to
>   change the mode of a symlink rather than its target.
> - Restored builds on systems without `O_CLOEXEC` or `O_DIRECTORY`, includ=
ing
>   Solaris 10.
>
> - Added `--nice` to adjust CPU and I/O scheduling priorities for local an=
d
>   remote rsync processes. Daemon clients and rrsync cannot raise server-s=
ide
>   priorities.
> - Human-readable output now uses dynamic precision to show three signific=
ant
>   digits and appends `i` to binary unit suffixes. `--progress` uses the s=
ame
>   formatter for transfer rates and labels byte counts and rates with `B` =
and
>   `B/s`. Example output includes `46.7M`, `48.8Mi`, `782,448B` and
>   `113,295B/s`. File-list, created-directory and skipped-deletion counts =
also
>   use thousands separators.
> - Added `--delay-symlinks` to defer creating new and changed symlinks unt=
il
>   other transferred files are in place. It implies `--no-inc-recursive` a=
nd
>   requires protocol 29 or newer with support on the receiving side. It ca=
nnot
>   be combined with `--remove-source-files`, `--hard-links`, `--compare-de=
st`,
>   `--copy-dest` or `--link-dest`.
>
> -------------------------------------------------------------------------=
-----
> | 04 Nov 2026  | 3.5.2  |                  | 33          |
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

https://download.samba.org looks down, so we can not fetch the sources
and put in in the mirror. I will try again later this week.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/5054

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

