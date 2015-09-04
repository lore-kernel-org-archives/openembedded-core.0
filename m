Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58F6C77002
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 01:37:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t841bACi013834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Sep 2015 18:37:10 -0700 (PDT)
Received: from seebs-worktop (172.25.40.228) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 3 Sep 2015 18:37:10 -0700
Date: Thu, 3 Sep 2015 20:37:09 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150903203709.1e0d73e5@seebs-worktop>
In-Reply-To: <1441269830.24871.90.camel@linuxfoundation.org>
References: <cover.1441219463.git.peter.seebach@windriver.com>
	<b27a8d540bc9724008d5be09c7ea83ffdbdd6c20.1441219463.git.peter.seebach@windriver.com>
	<1441269830.24871.90.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.7.1.bb: New version of pseudo
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
X-List-Received-Date: Fri, 04 Sep 2015 01:37:16 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 3 Sep 2015 09:43:50 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> This is better however opkg is still unhappy. This is build with this
> pseudo patch applied:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/469

I've found the cause of that particular bit. During my attempts to reproduce
this, I ran into segfaults in cross-localedef that I cannot now reproduce.

The cause of this was fixing up filesystem modes for the case where umask
contains 0200, which wasn't originally expected to work, but which was
breaking the xattrdb code. (There are a few things in the system which create
files with umask 0777, it turns out; this is arguably bad, but now there's a
workaround.)

But when I put in the workaround, I used 0600 as the "definitely at least
these bits" mode, instead of the requested mode, and that breaks scripts
which were expecting, say, 0700. So the things which have a specified mode
now use that | 0600 instead of just 0600.

I want to run a couple more things to see whether I can get any of the other
failures to come back again.

I also partially know why I wasn't seeing this on one of my systems, but only
partially. When I do my builds on CentOS 6.5, the .postinst files in question
either don't come into existence, or get run successfully anyway. So far as
I can tell, opkg is doing "sh -c /path/to/script" on those, which requires
0700 to run. I'm not sure what's causing the difference between the hosts.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

