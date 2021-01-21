Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.7208.1611237108248179706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 05:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:48854 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1l2aNG-000262-1w
	for openembedded-core@lists.openembedded.org; Thu, 21 Jan 2021 08:51:46 -0500
Date: Thu, 21 Jan 2021 08:51:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] of (morty->zeus) ntp migration, and missing "autogen-native" DEPENDS
In-Reply-To: <165C367469DBF721.14278@lists.openembedded.org>
Message-ID: <834cd51a-d63f-e3fb-47a-6b352f9113f5@crashcourse.ca>
References: <165C367469DBF721.14278@lists.openembedded.org>
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

On Thu, 21 Jan 2021, Robert P. J. Day wrote:

>   colleague hands me the following curiosity ... approximately
> morty-based build, wherein ntp_4.2.8p10 has a bbappend file which
> contains (among other things) the line:
>
>   DEPENDS += "autogen-native perl-native"
>
> i'm always nervous when a bbappend file just adds new build
> dependencies but, apparently, this has worked fine all this time, as
> there was an autogen-native recipe back then.
>
>   dragging this recipe forward, unsurprisingly, it fails as there is
> no autogen-native recipe anymore. so i'm just going to drop that
> dependency, while poking aorund to figure out why it was ever needed
> in the first place.
>
>   and apparently, this is not the first time that a legacy recipe
> which contained an autogen-native DEPENDS line has caused problems, so
> what is the deal with autogen-native? clearly, i need to get rid of
> that, but is there an explanation as to how that migration was done
> elsewhere? i'm about to find out what happens when i go that, while
> going from ntp 4.2.8p10 to 4.2.8p13, and seeing what else breaks.

  ok, i've focused this down a bit more, and here's the problem. one
of the patches brought forward and applied to 4.2.8p13 is to add a
new flag to sntp/sntp-opts.def, where a flag has the format:

  flag = {
    name      = unprivport;
    value     = u;
    descrip   = "Use an unprivileged port";
    doc = <<-  _EndOfDoc_
	Use an unprivilegded UDP port for our queries.
	_EndOfDoc_;
  };

as long as the patch that adds that new flag is not applied, things
build fine. and if one looks at the top of that file as it comes with
ntp-4.2.8p13, one reads:

  autogen definitions options;

  #include autogen-version.def

argh.

  so, as i read it, if you modify that file, you will automatically
kick in the requirements for autogen, which is exactly what i am
trying to avoid.

  am i making sense? is there an alternative approach to doing this
that removes the need for autogen?

rday
