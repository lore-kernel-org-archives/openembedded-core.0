Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A0E2E6B0DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 17:08:04 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Jul 2013 10:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,654,1367996400"; d="scan'208";a="267503648"
Received: from unknown (HELO helios.localnet) ([10.252.122.54])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Jul 2013 10:08:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Date: Fri, 12 Jul 2013 18:07:58 +0100
Message-ID: <7309265.hkedPcPrsU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <51DF6448.5010906@cn.fujitsu.com>
References: <51DBC97F.1090606@cn.fujitsu.com>
	<CAJTo0LYQ4MJ3CUDZaVfDexcaO=MATWj0syDTpY5Veb3m1TNiMQ@mail.gmail.com>
	<51DF6448.5010906@cn.fujitsu.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1]package_rpm.bbclass: remove xx.spec before doing rpmbuild xx.src.rpm
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
X-List-Received-Date: Fri, 12 Jul 2013 17:08:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bian,

On Friday 12 July 2013 10:04:56 Bian Naimeng wrote:
> said the following on 2013-7-11 18:54:, Burton, Ross wrote:
> > On 10 July 2013 03:56, Bian Naimeng <biannm@cn.fujitsu.com> wrote:
> >> Sorry, it looks like i should post this patch to poky. please ignore this
> > 
> > You were right the first time, meta/ is oe-core. :)
> 
> Thanks for your reminding.
> 
> In this case, the following error will be caught.
> 
>    | error: Bad owner/group:  .../tmp/work/i586-poky-linux/.../xxx.spec
>    | Building target platforms: i586-poky-linux
>    | 
>    | RPM build errors:
>    |     Bad owner/group: .../tmp/work/i586-poky-linux/.../xxx.spec
> 
> The following bb file can cause this error.
> # cat xxx.bb
>   SRC_URI="..../xxx.src.rpm"
> 
>   do_unpack2 () {
>           cd ${WORKDIR}
>           tar zxvf xxx.tar.gz
>   }
>   addtask do_unpack2 after do_unpack before do_configure
> 
> Of course, we can walk around it by append "extract=xxx.tar.gz" to SRC_URI,
> but it's not good way when the xxx.src.rpm containing lots of necessary
> files.

Wouldn't using subdir=xyz in the SRC_URI entry put the contents of the rpm 
into a subdirectory and thus avoid this problem?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

