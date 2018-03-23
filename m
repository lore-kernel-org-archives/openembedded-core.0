Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACC7788AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 15:33:48 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2NFXlkO028341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 16:33:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1521819227;
	bh=Fk1UqaCiwzSxZmhNPO4hy/IHyfGHlT8NnokoB81XIQM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Sender;
	b=jOuIu9C6EnTLIewa7p3u41fegG7w6By1QZ2y/qtiDDMS/jdN03T/ssfftwUmdUyAn
	bNOJov1NCoOUgyF/xQ6cewNjX8N9sCxYEq+nO28uAsSJT5KtvvTrf0bCS3R5Z+Mh9j
	eBGItcL/8/6XL9qVV8wbP4vE8it77+FSFYYvB53M=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2NFXe9g002982 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 23 Mar 2018 16:33:41 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 30C52E88F56;
	Fri, 23 Mar 2018 16:24:22 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2NFXc9x002975
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Fri, 23 Mar 2018 16:33:38 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.90_1) (envelope-from <ensc@sigma-chemnitz.de>) id 1ezOhG-0008QN-Ij
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2018 16:33:38 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 23 Mar 2018 16:33:38 +0100
Message-ID: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.6
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,SPF_NEUTRAL,T_RP_MATCHES_RCVD
X-Scanned-By: MIMEDefang 2.83
Subject: pseudo: host user contamination
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
X-List-Received-Date: Fri, 23 Mar 2018 15:33:49 -0000
Content-Type: text/plain

Hello,

in some packages (e.g. ncurses or glibc) I get package-qa warnings due
to host user contamination; e.g.

| WARNING: ncurses-6.0+20170715-r0 do_package_qa: QA Issue: ncurses: /ncurses-terminfo-base/etc/terminfo/a/ansi is owned by uid 505, which is the same as the user running bitbake. This may be due to host contamination
| ncurses: /ncurses-terminfo-base/etc/terminfo/d/dumb is owned by uid 505, which is the same as the user running bitbake. This may be due to host contamination
| ...
| ncurses: /ncurses-terminfo-base/etc/terminfo/x/xterm-256color is owned by uid 505, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]


This is 100% reproducible by 'bitbake ncurses -c cleansstate && bitbake
ncurses'.


Pseudo log contains

| debug_logfile: fd 2
| pid 16096 [parent 16095], doing new pid setup and server start
| Setup complete, sending SIGUSR1 to pid 16095.
| path mismatch [2 links]: ino 382716451 db '/dev/shm/sem.mp-6eoy3v9n' req '/dev/shm/8JXYzj'.
| inode mismatch: '..../ncurses/6.0+20170715-r0/image/usr/share/terminfo/a/ansi' ino 39261519 in db, 39262517 in request.
| symlink mismatch: '..../ncurses/6.0+20170715-r0/image/usr/share/terminfo/a/ansi' [39261519] db mode 0100644, header mode 0120777 (unlinking db)

for all the reported files.and a lot of

| path mismatch [91 links]: ino 1605070 db ...

like messages for unrelated files (e.g  sysroot components).


Seen on recent rocko and master (1-2 weeks before).

System is Fedora 27 in a docker container; rootfs is on an overlaysfs,
recipes on a bind-mounted btrfs fs and build (TMPDIR) happens in an ext4
fs.  SELinux is active.



Is this issue known resp. does a solution exist?



Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz


