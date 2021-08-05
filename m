Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.7176.1628161275110981581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 04:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:57018 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mBb7i-0008Ku-Lk
	for openembedded-core@lists.openembedded.org; Thu, 05 Aug 2021 07:01:13 -0400
Date: Thu, 5 Aug 2021 07:01:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: should recipes not come with their own systemd/user/group info?
Message-ID: <d9126d7b-13ed-6a37-1db8-2affecbca83@crashcourse.ca>
MIME-Version: 1.0
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


  style question here, but i'm perusing an OE/YP (actually wind river,
but effectively the same thing) layer that was handed to me, and i'm
puzzled by how the internally-written systemd-controlled services are
implemented.

  on the one hand, there are reasonable recipes that each represent
some service to be managed by systemd, and they all install their
executables in the right places and so on. however, rather than each
recipe also providing its own service file, there is a totally
separate recipe (call it "systemd-services.bb") which contains under
its files/ directory dozens and dozens of service files for all of
those recipes, and is responsible for installing all of them.

  in short, someone decided that -- for whatever reason -- all of the
systemd service files should be collected all in one place, and
installed en masse. is this ... normal? i would have thought that it's
the responsibility of each recipe to mannage all the content related
to it, and that would of course include the systemd service file to be
installed for it. i don't know the rationale for this, and it strikes
me as a recipe for disaster in trying to keep all these things synced
up. is there some rationale for doing it this way that i'm unaware
of?

  and closely related, the same trick was used when defining all the
new users and groups that would own these services. rather than each
service looking after itself, there is a recipe file (call it
"new_users_and_groups.bb") which is hundreds of lines of USERADD_PARAM
and GROUPADD_PARAM lines that define precisely (numerically) all the
new user and group accounts to be associated with all sorts of
services, whereupon i ask the same question -- isn't it more typical
that each service look after its own user and group info?

  in this second case, it *might* be that all of these values need to
be hard-coded to be consistent with, i don't know, something else i'm
unaware of, but it still looks strange.

  thoughts? the above actually works for the time being, but it does
seem a but unnatural.

rday
