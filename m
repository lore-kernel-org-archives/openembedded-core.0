Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 631A87837E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:02:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2017 07:02:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="99843133"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2017 07:02:22 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1497534748.git.pkj@axis.com>
	<8066cc468e1880f07dfeafe5fdcab2e5516792f8.1497534748.git.pkj@axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <485ef905-084f-6485-c45e-238177e72402@linux.intel.com>
Date: Thu, 15 Jun 2017 17:02:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <8066cc468e1880f07dfeafe5fdcab2e5516792f8.1497534748.git.pkj@axis.com>
Subject: Re: [PATCH 11/11] package.bbclass: Restore functionality to detect RPM dependencies
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
X-List-Received-Date: Thu, 15 Jun 2017 14:02:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2017 04:53 PM, Peter Kjellerstedt wrote:
> During the transition to dnf and rpm4, the functionality to
> automatically make RPM determine dependencies was lost.
>
> Before the transition, an OE specific tool called rpmdeps-oecore had
> been added to the rpm suit. It was based on the rpmdeps tool that is
> part of rpm. For each file specified on its command line, it would
> output the provides and requires that RPM could determine.
>
> During the transition to rpm4, rpmdeps-oecore was replaced with the
> standard rpmdeps. However, what no one noticed was that unless rpmdeps
> is given options, e.g., -P or -R, to tell it what it should output, it
> will not output anything. Thus, it would do all the work to determine
> the requirements, but would keep silent about it. And since no output
> from rpmdeps is expected unless there are requirements, there were no
> warnings indicating that everything was not working as expected.
>
> Porting the old rpmdeps-oecore to work with rpm4 is not really
> possible since it relied on being able to access internals of RPM that
> are no longer available. However, it turned out that rpmdeps had a
> debug option, --rpmfcdebug, that would output exactly the information
> that we need, albeit in a different format and to stderr. To make this
> usable, rpmdeps has now received a new option, --alldeps, which sends
> the information we need to stdout.

I'd like you to address my previous comment: how do you ensure this will 
continue to work going forward? Is it taken into use by default, and if 
it breaks, will we notice?

Alex


