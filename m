Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 08FF06FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 15:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0PFqxl7016921; Mon, 25 Jan 2016 15:52:59 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WgOT_J2ayY-3; Mon, 25 Jan 2016 15:52:59 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0PFquZe016918
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 25 Jan 2016 15:52:57 GMT
Message-ID: <1453737176.25948.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jan 2016 15:52:56 +0000
In-Reply-To: <56A64385.1020804@windriver.com>
References: <1453734454.25948.13.camel@linuxfoundation.org>
	<56A64385.1020804@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] kernel: Clean DEPLOYDIR before do_deploy runs
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
X-List-Received-Date: Mon, 25 Jan 2016 15:53:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-25 at 10:47 -0500, Bruce Ashfield wrote:
> On 2016-01-25 10:07 AM, Richard Purdie wrote:
> > If we don't do this, the deploy sstate object contains an every
> > increasing number of modules tarballs and kernel images, one per
> > execution of "-c deploy -f".
> > 
> 
> Stupid question, since my sstate/deploy foo is weak at times.
> Does this mean that only a single set of modules + kernel images
> will be in tmp/deploy ? Or is it only sstate that is being
> cleaned ?

One side effect is that it will remove the older copies. The older
copies were being built into each new sstate object which was growing
huge.

> I sometimes need multiple copies around for debug purposes, so
> I'm wondering if that is still possible with this change ?

You'd need to archive them before running another build since this
effectively cleans up the older copies now. This is due to the system
removing the old sstate "object", then installing a new one to replace
it. You can't keep the old ones around easily as they're named to
conflict (and hence replace each other).

Cheers,

Richard

