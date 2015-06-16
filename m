Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 90EBE73BBE;
	Tue, 16 Jun 2015 14:20:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jun 2015 07:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="711979712"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.25.227])
	by orsmga001.jf.intel.com with ESMTP; 16 Jun 2015 07:20:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Tue, 16 Jun 2015 15:20:39 +0100
Message-ID: <3080821.5ZItofk0yx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <55802EE1.6040703@dresearch-fe.de>
References: <55802EE1.6040703@dresearch-fe.de>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: multiple git repos vs. AUTOREV?
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
X-List-Received-Date: Tue, 16 Jun 2015 14:20:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Steffen,

On Tuesday 16 June 2015 16:12:49 Steffen Sledz wrote:
> For development purposes we use this method to build always from the HEAD
> revision of a git repository.
> 
> -------------> snip <--------------
> SRCREV="${AUTOREV}"
> PV = "gitr${SRCPV}"
> 
> SRC_URI = "git://git@bitbucket.org/.../foo.git;protocol=ssh"
> -------------> snap <--------------
> 
> Now we like to do the same in one recipe which uses sources from two git
> repos.
> 
> Our first try was this one. But if failed..
> 
> -------------> snip <--------------
> SRCREV_foo="${AUTOREV_foo}"
> SRCREV_bar="${AUTOREV_bar}"
> PV = "gitr${SRCPV_foo}+${SRCPV_bar}"
> 
> SRC_URI = " \
> 	git://git@bitbucket.org/.../foo.git;protocol=ssh,name=foo \
> 	git://git@bitbucket.org/.../bar.git;protocol=ssh,name=bar \
> "
> -------------> snap <--------------
> 
> Is it possible to do what we want? And what's the right way to do it?

I believe this should work:

-------------> snip <--------------
SRCREV_FORMAT = "foo_bar"
SRCREV_foo = "${AUTOREV}"
SRCREV_bar = "${AUTOREV}"
PV = "gitr${SRCPV}"
 
SRC_URI = " \
	git://git@bitbucket.org/.../foo.git;protocol=ssh,name=foo \
 	git://git@bitbucket.org/.../bar.git;protocol=ssh,name=bar \
 "
-------------> snap <--------------

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

