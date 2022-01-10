Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2CDC433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:02:55 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.32155.1641823374587052262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eftxU5f8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641823372; i=@fujitsu.com;
	bh=1YkSS5Ha9Vg3M2z7olKTf5ZBpozmvvAE8m8sLASz1pA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eftxU5f8cmmXkDncV4kabjLY6FlnWW+8Qf3lxR4UCZfS2Ire0Iv3Ni2YI1fLgkui5
	 HqtY9y+xDWiXlcO3ZJsApWdnBX7AWwbm7kcKdzC5QHMl+guzoNo1P3ExMcXA3nKX1U
	 jQq9VyeIDob1Yk6nHtoXa++JMZ4gs6fupFSRBxIlCGw5GUr4HJjGK4EVW2rodm92uC
	 4Ah0t/fegc+u6ES6t576f7r3g+reUChLHq8Wn+lcAotfocwOcJpbDVdj0EOh2dwAOs
	 5F1NfEtRDd+U3NMQEeMyx+aIRMoiRdmGf3PiDTKmm5uLM+Xq367pEDvCJJA+06rfJY
	 Okugni34mIxQw==
Received: from [100.115.64.12] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 D2/CF-07141-C8C3CD16; Mon, 10 Jan 2022 14:02:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8ORqNtjcyf
  RYOtbdos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePctncsBZudK64uus/WwLjavIuRk0NI4DGj
  RNszhS5GLiD7PJPE4637GSGcE4wSHZePs4FUsQmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgIXE1pYHYOUsAqoSz/8fZgGxeQWcJE69XQxmSwgoSEx5+J4ZIi4ocXLmExaIORISB1
  +8YIaoUZSYfbkZqr5CYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRrukosz0jJLcxMwcXUM
  DA11DQ1NdM1NdQwsjvcQq3US91FLd5NS8kqJEoLReYnmxXmpxsV5xZW5yTopeXmrJJkZgaKYU
  O27bwXiq76feIUZJDiYlUd4nxncShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwJlgC5QSLUtNTK
  9Iyc4BxApOW4OBREuHVAEnzFhck5hZnpkOkTjEqSonz8loDJQRAEhmleXBtsNi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmYtwBkPE9mXgnc9FdAi5mAFidz3AZZXJKIkJJqYJI9FBQ0IYa
  badb3t/8q5uplxhiZlDrdmrZ1QtK26zfeCp5ZE8zzXWhN9fbVEQ4OWx8cWRKgtSzBJeRFwffE
  Jo9rU366catGRhh9srh9uUT+ucO3V+Zvg/RWrb11pSEy9fWpS2yVWQxHplx05nFI3Pdb5Md70
  72deToFvTOmHt676uUlLmbV/wvXs4kF8IuwmPEGbn7GqaeQ4BMcrOm8Seb3sr333nO49m13UI
  0TmurDEd9+5sGHPFX+hBV3XtY4rVizaor08fiw8zItbc68879N3/BbgGHGDEvzdddOrN/08nH
  kj32NP4qWHgx+kZ7Y+uvT1ynzL7B4HGwyaeBR0OSobNMP/mG2IfhAmtwNyVtKLMUZiYZazEXF
  iQD4ZFlASAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-545.messagelabs.com!1641823371!1737!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19629 invoked from network); 10 Jan 2022 14:02:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jan 2022 14:02:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 94161100193
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:02:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 677971001A3
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:02:51 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 10 Jan 2022 14:02:41 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bash: upgrade 5.1.8 -> 5.1.16
Date: Mon, 10 Jan 2022 22:02:28 +0800
Message-ID: <1641823351-62709-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:02:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160355

Changelog:
=========
1. New Features in Bash

a. 'bind -x' now supports different bindings for different editing modes and
   keymaps.

b. Bash attempts to optimize the number of times it forks when executing
   commands in subshells and from 'bash -c'.

c. Here documents and here strings now use pipes for the expanded document if
   it's smaller than the pipe buffer size, reverting to temporary files if it's
   larger.

d. There are new loadable builtins: mktemp, accept, mkfifo, csv, cut/lcut

e. In posix mode, 'trap -p' now displays signals whose disposition is SIG_DFL
   and those that were SIG_IGN when the shell starts.

f. The shell now expands the history number (e.g., in PS1) even if it is not
   currently saving commands to the history list.

g. 'read -e' may now be used with arbitrary file descriptors ('read -u N').

h. The 'select' builtin now runs traps if its internal call to the read builtin
   is interrupted by a signal.

i. SRANDOM: a new variable that expands to a 32-bit random number that is not
   produced by an LCRNG, and uses getrandom/getentropy, falling back to
   /dev/urandom or arc4random if available. There is a fallback generator if
   none of these are available.

j. shell-transpose-words: a new bindable readline command that uses the same
   definition of word as shell-forward-word, etc.

k. The shell now adds default bindings for shell-forward-word,
   shell-backward-word, shell-transpose-words, and shell-kill-word.

l. Bash now allows ARGV0 appearing in the initial shell environment to set $0.

m. If 'unset' is executed without option arguments, bash tries to unset a shell
   function if a name argument cannot be a shell variable name because it's not
   an identifier.

n. The 'test -N' operator uses nanosecond timestamp granularity if it's
   available.

o. Bash posix mode now treats assignment statements preceding shell function
   definitions the same as in its default mode, since POSIX has changed and
   no longer requires those assignments to persist after the function returns
   (POSIX interp 654).

p. BASH_REMATCH is no longer readonly.

q. wait: has a new -p VARNAME option, which stores the PID returned by 'wait -n'
   or 'wait' without arguments.

r. Sorting the results of pathname expansion now uses byte-by-byte comparisons
   if two strings collate equally to impose a total order; the result of a
   POSIX interpretation.

s. Bash now allows SIGINT trap handlers to execute recursively.

t. Bash now saves and restores state around setting and unsetting posix mode,
   instead of having unsetting posix mode set a known state.

u. Process substitution is now available in posix mode.

v. READLINE_MARK: a new variable available while executing commands bound with
   'bind -x', contains the value of the mark.

w. Bash removes SIGCHLD from the set of blocked signals if it's blocked at shell
   startup.

x. 'test -v N' can now test whether or not positional parameter N is set.

y. 'local' now honors the '-p' option to display all local variables at the
    current context.

z. The '@a' variable transformation now prints attributes for unset array
   variables.

aa. The '@A' variable transformation now prints a declare command that sets a
    variable's attributes if the variable has attributes but is unset.

bb. 'declare' and 'local' now have a -I option that inherits attributes and
    value from a variable with the same name at a previous scope.

cc. When run from a -c command, 'jobs' now reports the status of completed jobs.

dd. New 'U', 'u', and 'L' parameter transformations to convert to uppercase,
    convert first character to uppercase, and convert to lowercase,
    respectively.

ee. PROMPT_COMMAND: can now be an  array variable, each element of which can
    contain a command to be executed like a string PROMPT_COMMAND variable.

ff. 'ulimit' has a -R option to report and set the RLIMIT_RTTIME resource.

gg. Associative arrays may be assigned using a list of key-value pairs within
    a compound assignment. Compound assignments where the words are not of
    the form [key]=value are assumed to be key-value assignments. A missing or
    empty key is an error; a missing value is treated as NULL. Assignments may
    not mix the two forms.

hh. New 'K' parameter transformation to display associative arrays as key-
    value pairs.

ii. Writing history to syslog now handles messages longer than the syslog max
    length by writing multiple messages with a sequence number.

jj. SECONDS and RANDOM may now be assigned using arithmetic expressions, since
    they are nominally integer variables. LINENO is not an integer variable.

kk. Bash temporarily suppresses the verbose option when running the DEBUG trap
    while running a command from the 'fc' builtin.

ll. 'wait -n' now accepts a list of job specifications as arguments and will
    wait for the first one in the list to change state.

mm. The associative array implementation can now dynamically increase the
    size of the hash table based on insertion patterns.

nn. HISTFILE is now readonly in a restricted shell.

oo. The bash malloc now returns memory that is 16-byte aligned on 64-bit
    systems.

pp. If the hash builtin is listing hashed filenames portably, don't print
   anything if the table is empty.

qq. GLOBIGNORE now ignores '.' and '..' as a terminal pathname component.

rr. Bash attempts to optimize away forks in the last command in a function body
    under appropriate circumstances.

ss. The globbing code now uses fnmatch(3) to check collation elements (if
    available) even in cases without multibyte characters.

tt. The 'fg' and 'bg' builtins now return an error in a command substitution
    when asked to restart a job inherited from the parent shell.

uu. The shell now attempts to unlink all FIFOs on exit, whether a consuming
    process has finished with them or not.

vv. There is a new contributed loadable builtin: asort.

2. New Features in Readline

a. If a second consecutive completion attempt produces matches where the first
   did not, treat it as a new completion attempt and insert a match as
   appropriate.

b. Bracketed paste mode works in more places: incremental search strings, vi
   overstrike mode, character search, and reading numeric arguments.

c. Readline automatically switches to horizontal scrolling if the terminal has
   only one line.

d. Unbinding all key sequences bound to a particular readline function now
   descends into keymaps for multi-key sequences.

e. rl-clear-display: new bindable command that clears the screen and, if
   possible, the scrollback buffer (bound to emacs mode M-C-l by default).

f. New active mark and face feature: when enabled, it will highlight the text
   inserted by a bracketed paste (the 'active region') and the text found by
   incremental and non-incremental history searches. This is tied to bracketed
   paste and can be disabled by turning off bracketed paste.

g. Readline sets the mark in several additional commands.

h. Bracketed paste mode is enabled by default.

i. Readline tries to take advantage of the more regular structure of UTF-8
   characters to identify the beginning and end of characters when moving
   through the line buffer.

j. The bindable operate-and-get-next command (and its default bindings) are
   now part of readline instead of a bash-specific addition.

k. The signal cleanup code now blocks SIGINT while processing after a SIGINT.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/bash/{bash_5.1.8.bb => bash_5.1.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/bash/{bash_5.1.8.bb => bash_5.1.16.bb} (89%)

diff --git a/meta/recipes-extended/bash/bash_5.1.8.bb b/meta/recipes-extended/bash/bash_5.1.16.bb
similarity index 89%
rename from meta/recipes-extended/bash/bash_5.1.8.bb
rename to meta/recipes-extended/bash/bash_5.1.16.bb
index 9400835b8a..468964ff94 100644
--- a/meta/recipes-extended/bash/bash_5.1.8.bb
+++ b/meta/recipes-extended/bash/bash_5.1.16.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://makerace2.patch \
            "
 
-SRC_URI[tarball.sha256sum] = "0cfb5c9bb1a29f800a97bd242d19511c997a1013815b805e0fdd32214113d6be"
+SRC_URI[tarball.sha256sum] = "5bac17218d3911834520dad13cd1f85ab944e1c09ae1aba55906be1f8192f558"
 
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.25.1


