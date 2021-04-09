Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.7036.1617963468248977926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 03:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:34678 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lUoCw-00BF2M-3g
	for openembedded-core@lists.openembedded.org; Fri, 09 Apr 2021 06:17:47 -0400
Date: Fri, 9 Apr 2021 06:17:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: want to clarify proper usage of EXTERNALSRC on per-recipe basis
Message-ID: <989a15f6-fcf6-add1-7c34-d6d2925d954@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  i've run across a rather odd scenario wherein part of the build of a
valid OE/YP layer is reaching across the filesystem and explicitly,
for a number of related recipes, running "make -C <dir1>" and "make -C
<dir2"> -- that is, do_compile() for that recipe is appended with
these calls to the "make" command to compile in an out-of-tree
directory -- after which explicit "cp" commands are run to copy the
generated artifacts from the compile results in that remote directory
into that recipe's WORKDIR, where they are manually installed in
do_install_append().

  the rationale here is that the remote content is being migrated, bit
by bit, into the existing layer, but it would be too much work to move
it all in in one shot, so this odd intermediate step is being used for
now until the migration can be done properly.

  last point which might be relevant -- the remote content is actually
partitioned into sub-builds of the same component, so let's assume
that the calls being made from do_compile_append() are to build
various parts of the "fubar" component/package:

    make -C ${REMOTEDIR}/fubar/client
    make -C ${REMOTEDIR}/fubar/server

  assuming i'm reading the current build structure correctly, i'm
going to recommend that proper recipes for "fubar" be added, which
would use "EXTERNALSRC" settings to pick up the source, and all the
rest of the building would work in a sane manner.

  more to the point, it seems that a single "fubar" recipe should
define packages "fubar-server" and "fubar-client", each of which can
set its own EXTERNALSRC values appropriately.

  does this seem reasonable? i'm not after exact recipe code, just
want to verify that this would be a reasonable approach that actually
fits within the framework of a proper OE build.

rday
