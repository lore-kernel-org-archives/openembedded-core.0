Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.2059.1586541165830097920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2020 10:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:51038 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jMxpc-00D8JC-2N
	for openembedded-core@lists.openembedded.org; Fri, 10 Apr 2020 13:52:44 -0400
Date: Fri, 10 Apr 2020 13:52:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: looking for clarification re: "rm_work" features and variations
Message-ID: <alpine.LFD.2.21.2004101340380.7834@localhost.localdomain>
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


  was looking to expand on the whole "rm_work" documentation, only to
discover i was profoundly ignorant of some of its features (don't say
it :-).

  so, first, there's the basic stuff (which is already in the YP
documentation):

  INHERIT += "rm_work"
  RM_WORK_EXCLUDE += "pkg1 pkg2 ..."

then in rm_work.bbclass, i see this:

  # Recipes can also configure which entries in their ${WORKDIR}
  # are preserved besides temp, which already gets excluded by default
  # because it contains logs:
  # do_install_append () {
  #     echo "bar" >${WORKDIR}/foo
  # }
  # RM_WORK_EXCLUDE_ITEMS += "foo"
  RM_WORK_EXCLUDE_ITEMS = "temp"

of which i was totally unaware, so let's start there. the above
suggests that recipes can configure, selectively, what in their
WORKDIR gets preserved, but it makes little sense to set that sort of
thing in an actual recipe file; it's clearly the sort of thing a
developer would put in a local.conf.

  so what form would that take? is that meant to be set build-wide
across all recipes, as in:

  RM_WORK_EXCLUDE_ITEMS = "image"

to preserve all "image" directories? or can one use, say, "pn-"
overrides:

  RM_WORK_EXCLUDE_ITEMS_pn-<recipename> = "image pseudo"

(none of the above seems to be mentioned in the YP docs.)

  finally, there is the related rm_work_and_downloads class file,
which can probably be shoehorned into that explanation somewhere (also
not apparently anywhere in the YP docs).

  so what's the proper usage of the above?

rday


