Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.9975.1620393101657255137
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 06:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:60494 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lf0GZ-0000oN-Vo
	for openembedded-core@lists.openembedded.org; Fri, 07 May 2021 09:11:40 -0400
Date: Fri, 7 May 2021 09:11:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: SDK question: does "-c populate_sdk" build SDK based on entire image?
Message-ID: <36cf577f-e2e2-4c58-5cb5-37eafa42b266@crashcourse.ca>
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


  almost certainly a silly question as i'm still poring over the
mechanics of standard SDK creation, but if i define a perfectly normal
image, then build the corresponding SDK with:

  $ bitbake -c populate_sdk my_image

is the resulting SDK populated based on the entire contents of the
target image? that is, if i subsequently add a new package to the
target and rebuild the SDK, will the new SDK now contain the
corresponding content from that newly-added package? (i'm just about
to test this with a build but that's going to take over an hour on
this server. *sigh* ...)

  now, i realize that if i just want to add content to the SDK without
adding to target, i can use one or both of:

  TOOLCHAIN_HOST_TASK
  TOOLCHAIN_TARGET_TASK

but if someone asks for new content both for the target and the SDK,
is it sufficient to just add to target?

  and one more question that inspired all of this. i was asked to add
a particular executable to an SDK, call it /usr/bin/fubar. fair
enough, i thought, it was short work to determine that that binary
came from the recipe fubar_1.0.bb. but i checked and that package was,
in fact, being installed in the target, so i was puzzled as to why it
wasn't in the SDK as well.

  i checked the recipe for fubar and, to my chagrin, it contained the
snippet:

  do_install_append() {
    rm -rf ${D}/usr/bin/fubar
  }

well, that explained it, so as a first test, i'm just going to dump
that snippet from the recipe, which will install the executable on the
target, and will(?) also install it in the SDK?

rday
