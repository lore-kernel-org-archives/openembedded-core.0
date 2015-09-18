Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD1573D13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 16:41:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 18 Sep 2015 09:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,553,1437462000"; d="scan'208";a="771982301"
Received: from ddperry-mobl4.amr.corp.intel.com (HELO [10.252.203.9])
	([10.252.203.9])
	by orsmga001.jf.intel.com with ESMTP; 18 Sep 2015 09:41:22 -0700
Message-ID: <55FC3F0B.4010207@linux.intel.com>
Date: Fri, 18 Sep 2015 11:42:51 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<bfec72e383e99ef94ded6164ae7a313853c5240e.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LZVqV-nzRRB-H1v=KOms-OOSyEL5J3QgwwA7k7e+AcmAA@mail.gmail.com>
In-Reply-To: <CAJTo0LZVqV-nzRRB-H1v=KOms-OOSyEL5J3QgwwA7k7e+AcmAA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] prserv/db: Use DELETE instead of WAL journal mode
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
X-List-Received-Date: Fri, 18 Sep 2015 16:41:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/17/2015 03:01 PM, Burton, Ross wrote:
> On 15 September 2015 at 15:59, <leonardo.sandoval.gonzalez@linux.intel.com>
> wrote:
>
>> -        self.connection.execute("PRAGMA journal_mode = WAL;")
>> +        self.connection.execute("PRAGMA journal_mode = DELETE;")
>>
>
> Richard probably has a better memory than me but I seem to recall that WAL
> was a pretty serious speed improvement for the local host case.  Did you
> benchmark the impact this change has?

Unfortunately, I didn't do any benchmark.

The problem with WAL is the following "All processes using a database 
must be on the same host computer; WAL does not work over a network 
filesystem." Using WAL, all PR values get lost after a PR server reboot, 
so we need a rollback journal. According to the documentation, the 
fastest of the these is "MEMORY" but it has its pros/cons:

"The MEMORY journaling mode stores the rollback journal in volatile RAM. 
This saves disk I/O but at the expense of database safety and integrity. 
If the application using SQLite crashes in the middle of a transaction 
when the MEMORY journaling mode is set, then the database file will very 
likely go corrupt."

>
> Ross
>

