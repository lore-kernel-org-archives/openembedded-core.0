Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 02E9E73CF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 08:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u188qcnc029257; Mon, 8 Feb 2016 08:52:38 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7tk1QXGs3Q16; Mon,  8 Feb 2016 08:52:38 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u188qXZB029253
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 8 Feb 2016 08:52:34 GMT
Message-ID: <1454921553.16142.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 08 Feb 2016 08:52:33 +0000
In-Reply-To: <1454914617-2042-1-git-send-email-patrick.ohly@intel.com>
References: <1454914617-2042-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: paul.eggleton@intel.com
Subject: Re: [PATCH] buildhistory.bbclass: remove out-dated information on request
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
X-List-Received-Date: Mon, 08 Feb 2016 08:52:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-08 at 07:56 +0100, Patrick Ohly wrote:
> buildhistory.bbclass by design is incremental: each build adds or
> updates information. Information is never removed.
> 
> Sometimes it can be useful to reduce the information only to those
> recipes that were build during a specific bitbake invocation, for
> example when the invocation does a full world build.
> 
> This is now possible by invoking bitbake with:
>    BB_ENV_EXTRAWHITE=BUILDHISTORY_REMOVE_OLD
> BUILDHISTORY_REMOVE_OLD=1 bitbake
> 
> In this mode, buildhistory.bbclass first moves all existing
> information into a temporary directory called "old" inside the build
> history directory. There the information is used for the "version
> going backwards QA check". Then when the build is complete and before
> (potentially) committing to git, the temporary directory gets
> deleted.
> 
> Because information that has not changed during the build will be
> reconstructed, a git log will then only show real updates, additions
> and removals.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>

The implicit assumption here is that you'd only every build large
targets like "world". A "bitbake bash" isn't really going to do what
you'd expect/want.

I think we need to make that clearer in the comments and that this is
only useful on automated infrastructure.

Cheers,

Richard



