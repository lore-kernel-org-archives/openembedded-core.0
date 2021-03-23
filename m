Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.6785.1616495234211271553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 03:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:52440 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lOeFk-00FYOg-PU
	for openembedded-core@lists.openembedded.org; Tue, 23 Mar 2021 06:27:13 -0400
Date: Tue, 23 Mar 2021 06:27:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: personal naming convention for tasks versus functions
Message-ID: <321265eb-fe8c-7123-d55b-11ab6ddb5e8@crashcourse.ca>
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


  more a style thing than anything else, but i've noticed in the layer
i'm perusing a number of examples of the form:


  do_something() {
	... doing something ...
  }

  do_unpack[postfuncs] += "do_something"


i mention this only because my preference is to reserve the "do_"
prefix for things that will be upgraded to tasks, so that things are
clearer visually. of course the above is perfectly valid, just
something i would rather avoid. (i verified that do_something() is
nowhere being upgraded to a task.)

  to that end, i grep'ped the OE code base to see the consensus, and
ran across the following in insane.bbclass:

  # The Staging Func, to check all staging
  #addtask qa_staging after do_populate_sysroot before do_build
  do_populate_sysroot[postfuncs] += "do_qa_staging "

  # Check for patch fuzz
  do_patch[postfuncs] += "do_qa_patch "

  # Check broken config.log files, for packages requiring Gettext which
  # don't have it in DEPENDS.
  #addtask qa_configure after do_configure before do_compile
  do_configure[postfuncs] += "do_qa_configure "

the comments seem out of sync with the code, as there is no "addtask"
being run for those listed examples, they're simply being added as
postfuncs. the effect might be the same, but the comments seem
misleading. thoughts?

rday
