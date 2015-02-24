Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5702B71633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 23:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1ONWJ80013172; Tue, 24 Feb 2015 23:32:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KeSVOPmpFA_L; Tue, 24 Feb 2015 23:32:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1ONW3eL013165
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Feb 2015 23:32:15 GMT
Message-ID: <1424820723.26813.19.camel@rpsys.net>
From: Richard Purdie <rpurdie@rpsys.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Feb 2015 23:32:03 +0000
In-Reply-To: <1CD26AA6-733E-4DE9-836A-25F0E0FA4C64@gmail.com>
References: <1424801246-16399-1-git-send-email-ross.burton@intel.com>
	<1CD26AA6-733E-4DE9-836A-25F0E0FA4C64@gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] util-linux: disable systemd
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
X-List-Received-Date: Tue, 24 Feb 2015 23:32:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-02-24 at 12:48 -0800, Khem Raj wrote:
> > On Feb 24, 2015, at 10:07 AM, Ross Burton <ross.burton@intel.com> wrote:
> > 
> > systemd has a build-dependency on util-linux for libmount, and util-linux has an
> > optional build dependency on systemd.
> > 
> > The features in util-linux that enabling systemd gives you are:
> > * lslogins can show recent journal entries from the user
> > * uuidd can use socket activation and has a service file
> > * fstrim has a service file
> > * logger can write journal entries
> > 
> > These are not worth the overhead of maintaining two util-linux recipes to
> > bootstrap the cycle, so disable systemd support in util-linux.
> 
> I feel we are going out of way here since now on systemd based systemd you have to undo this change
> partly via re-introducing service files in some fashion
> how about just building and packaging uuidd and fstrim separately ?
> 
> atleast it should be reported to util-linux maintainers.

I'm going to merge this patch and I want to clearly explain why.

With systemd it does seem to pay to be one something approximating the
latest version. I can't do that without doing something about
util-linux.

In history we have no good example of successfully splitting one piece
of source over multiple recipes, apart from perhaps gcc which we'd all
agree is horrible in a variety of ways. Any time we have attempted this,
we've tended to revert or have calls to revert (e.g. avahi).

We're at M3 cutoff and we need to make some decision. If I choose not to
take this, nothing will make 1.8. If I take this, there is the
possibility we can fix up systemd util-linux in some way if it proves to
be that critical.

So whilst I don't think this is perfect and I agree it needs discussion
with the util-linux/systemd folks, I think its perhaps the least worst
option available to me and there are ways we can likely improve things
if/as needed.

Cheers,

Richard




