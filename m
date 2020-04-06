Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.14170.1586189118949729718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 09:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:43910 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jLUFR-00EGo9-5l
	for openembedded-core@lists.openembedded.org; Mon, 06 Apr 2020 12:05:17 -0400
Date: Mon, 6 Apr 2020 12:05:15 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: couple questions on PACKAGECONFIG (for improving docs)
Message-ID: <alpine.LFD.2.21.2004061153450.16686@localhost.localdomain>
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


  wanted to tweak the ref manual entry for PACKAGECONFIG, so a couple
issues. first, the ref manual entry:

https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG

says nothing about the possible *sixth* entry, described in
base.bbclass as "foo_conflict_packageconfig", so i can add that but
i'm open to proper wording since i'd probably screw it up.
(i'd add an actual example from poky/ demonstrating this, such as:

meta/recipes-support/curl/curl_7.69.1.bb:PACKAGECONFIG[threaded-resolver]
  = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"

  i'd be tempted to show some of the simpler variations of
PACKAGECONFIG, such as (if i read it correctly) being equivalent to
simply adding RDEPENDS values (right?):

meta/recipes-support/boost/boost.inc:PACKAGECONFIG[graph_parallel] =
  ",,,boost-mpi mpich"

  finally, i'd toss in explaining this, which might confuse people:

meta/recipes-multimedia/pulseaudio/pulseaudio.inc:PACKAGECONFIG[autospawn-for-root]
  = ",,,"

i'm betting some developers might wonder what that is all about and,
for every example i've seen for that, it involves *something*
explicitly checking for that config setting somewhere in the recipe,
as in the case above:

do_compile_append () {
  if ${@bb.utils.contains('PACKAGECONFIG', 'autospawn-for-root', 'true', 'false', d)}; then
    set_cfg_value src/client.conf allow-autospawn-for-root yes
  fi
}

  all that make sense?

rday
