Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.762.1616448585726581067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 14:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:53528 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lOS7M-00CbVo-2B
	for openembedded-core@lists.openembedded.org; Mon, 22 Mar 2021 17:29:44 -0400
Date: Mon, 22 Mar 2021 17:29:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: really strange usage of FILESPATH and FILESEXTRAPATHS
Message-ID: <cb3f5a5e-fe71-d4fb-7cd6-86f457238fde@crashcourse.ca>
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


  here's the next head-scratching oddity i just ran across in the
current layer (and there's more weirdness on its way).

  perusing a recipe only to see:

  FILESPATH =+ "${COMMON_STUFF_DIR}:"
  SRC_URI += "file://file1 file://file2 file://file 3 ... etc ..."

ok ... apparently, there are a number of recipes that want access to
some small set of common files, so the solution(?) was to put those
common files in some (out-of-layer) directory, and prepend to
FILESPATH in each of those recipe files so that SRC_URI could find
them.

  i am not going to ask if this is some wickedly clever trick, since
it can't be. it just can't.

  even stranger, one of the common files was a configuration script
that contributed the line:

  . config.sh

to the top of a number of common tasks like do_configure, do_compile,
do_install and so on.

  a similar tactic was to find this line in a class file:

  FILESEXTRAPATHS_prepend := "${COMMON_STUFF_DIR}:"

my head hurts.

  first, if i needed to do something in common at the beginning of
some basic tasks, i'd invent a bbclass file that "_prepend"ed to those
tasks, and just inherit it when necessary.

  as for a number of recipes needing access to common files for any
reason, well, thoughts? my first thought is to encapsulate those files
in a separate recipe, then make that recipe a build dependency so that
those files would be available from the sysroot, but i'm sure there
are better ideas.

  are there any OE recipes that demonstrate this sort of thing?
because extending FILESPATH to arbitrary out-of-layer directories just
makes me want to strangle kittens.

rday

