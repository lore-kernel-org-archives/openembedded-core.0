Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F2A5760670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6B8WFtq017727; Mon, 11 Jul 2016 09:32:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KtasD2l6u53z; Mon, 11 Jul 2016 09:32:15 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6B8W9JO017722
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 Jul 2016 09:32:12 +0100
Message-ID: <1468225929.28829.71.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 09:32:09 +0100
In-Reply-To: <20160710221056.GD8521@denix.org>
References: <20160710213559.GC8521@denix.org> <20160710221056.GD8521@denix.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Can NOT get PRAUTO, exception [Errno -3] Temporary failure in name resolution
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2016 08:32:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-07-10 at 18:10 -0400, Denys Dmytriyenko wrote:
> On Sun, Jul 10, 2016 at 05:35:59PM -0400, Denys Dmytriyenko wrote:
> > Has anyone ever seen this error message:
> > 
> > ERROR: blah-blah do_package: Can NOT get PRAUTO, exception [Errno 
> > -3] Temporary failure in name resolution
> > 
> > I'm using centralized PR Service over the network on a local
> > subnet. I just 
> 
> Oh, forgot to mention - this seems to be intermittent, as it works
> fine now. 
> Trying to prevent it from happening again in the future.
> 
> 
> > got this message on 2 different machines for 3 separate packages.
> > Should I be 
> > worried about it? Should I look into networking HW issues or into
> > PR server 
> > instance or something else? Should I switch over to using IP
> > address instead 
> > of FQDN and even more - use static IP? Any best practices? Thanks.

Failure in name resolution sounds like something went odd with the
network setup. It would be the host networking stack and the general
network setup that would be responsible for that rather than bitbake
specifically.

I assume you're using a FQDN which needs DNS resolution from a remote
DNS server? Any local caching of DNS?

It does sound like the DNS server became unreachable for a short period
and there wasn't a local cache. Its also possible we resolve the name
often enough (in many different processes) to trigger some kind of
repeat lookup protection on a DNS server if you have a more paranoid
security setup.

A static IP, or a static entry in hosts would likely work around the
issue, or simply using an IP address.

Cheers,

Richard

