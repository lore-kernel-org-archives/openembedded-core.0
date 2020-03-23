Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.56807.1584980766620335860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 09:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:49806 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jGPts-0072gt-RT
	for openembedded-core@lists.openembedded.org; Mon, 23 Mar 2020 12:26:05 -0400
Date: Mon, 23 Mar 2020 12:26:04 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: wanting to clarify variables related to using host tools
Message-ID: <alpine.LFD.2.21.2003231207540.20339@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  (given some spare time these days, i'm trying to clean up some docs,
so yet another question regarding some OE variables.)

  i'm trying to organize OE variables into related sub-categories, and
there are a few related to using host tools i can see:

  ASSUME_PROVIDED
  HOSTTOOLS
  HOSTTOOLS_DIR
  HOSTTOOLS_NONFATAL

here's how i read it.

  first, ASSUME_PROVIDED (set initially in bitbake.conf) defines
simply those recipes that will not be built if required, as in:

  ASSUME_PROVIDED = "\
    bzip2-native \
    chrpath-native \
    file-native \
    findutils-native \
    gawk-native \
    git-native \
    grep-native \
    ... etc etc ...

now, AIUI, that variable says nothing about whether those
corresponding tools are actually *available* on the build system, only
that those recipes will not be built, is that correct?

  related to that (also in bitbake.conf), we have HOSTTOOLS which
(again, AIUI) reflects commands that *must* be on the host system:

# Tools needed to run builds with OE-Core
HOSTTOOLS += " \
    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
    cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
    head hostname iconv id install ld ldd ln ls make md5sum mkdir mknod \
    mktemp mv nm objcopy objdump od patch perl pr printf pwd \
    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
    sha1sum sha224sum sha256sum sha384sum sha512sum \
    sleep sort split stat strings strip tail tar tee test touch tr true uname \
    uniq wc wget which xargs \
"

any one of whose absence triggers an error based on this from
base.bbclass:

    ... snip ...
    if notfound and fatal:
        bb.fatal("The following required tools (as specified by
HOSTTOOLS) appear to be unavailable in PATH, please install them in
order to proceed:\n  %s" % " ".join(notfound))

  this suggests a strong correspondence between those two variables --
ASSUME_PROVIDED lists what will not be built (natively), while
HOSTTOOLS should then list the host tools that correspond to pretty
much the very host tools that those recipes would provide. IOW, adding
another native recipe to ASSUME_PROVIDED should require its
corresponding membership in HOSTTOOLS to make up for it not being
built (and vice versa).

  in that case, i notice this line from bitbake.conf regarding
ASSUME_PROVIDED:

  # gzip-native should be listed above?

which seems like a reasonable question since both gzip and gunzip are
listed in HOSTTOOLS, so why would gzip-native *not* be in
ASSUME_PROVIDED? (and possibly some others, as long as i am reading
this correctly.)

  just trying to clarify that those two variables should stay
reasonably in sync.

rday
