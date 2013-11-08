Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C39166D350
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 16:54:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA8Gs2DA029117; Fri, 8 Nov 2013 16:54:02 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Xe5pp9jBmH6I; Fri,  8 Nov 2013 16:54:01 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA8Gruqn029112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 8 Nov 2013 16:53:58 GMT
Message-ID: <1383929632.2345.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Hart, Darren" <darren.hart@intel.com>
Date: Fri, 08 Nov 2013 16:53:52 +0000
In-Reply-To: <1383929280.5378.110.camel@dvhart-mobl4.amr.corp.intel.com>
References: <1383923827.2345.2.camel@ted>
	<1383929280.5378.110.camel@dvhart-mobl4.amr.corp.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use hardlinks during do_install for speed
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
X-List-Received-Date: Fri, 08 Nov 2013 16:54:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-08 at 16:48 +0000, Hart, Darren wrote:
> On Fri, 2013-11-08 at 15:17 +0000, Richard Purdie wrote:
> > Whilst the comment says we can't do this, its incorrect, install operates
> > on WORKDIR and its hard for different parts of WORKDIR to be on different
> 
> Is it hard? Or is it not possible / not supported?

Not really possible unless you try very hard. Its not supported. We
don't even support WORKDIR and sysroot on different disks really.

> My understanding was it was possible and therefor we couldn't hardlink.
> I'm thrilled at the prospect of being wrong there though!

I'm happy enough to decide we don't support it (and we never have).

> > filesystems. Hardlinking instead of copying is therefore a nice performance
> > gain.
> > 
> > Also, completely skip the Documentation directory (adding a dummy Makefile
> > to keep make happy) and tweak the other cp commands to link since if we
> > don't we'd get "this is the same file" type errors from cp for some kernel
> > versions.
> > 
> > For do_install on linux-yocto, this takes it from 227s -> 84s.
> 
> This, and the others, are fantastic improvements, thanks RP!

I'm rather happy to find something we can easily fix :)

Cheers,

Richard


