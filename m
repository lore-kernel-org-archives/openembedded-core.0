Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 987116B407
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 01:51:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,774,1367942400"; 
   d="scan'208";a="8062894"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 30 Jul 2013 09:48:53 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r6U1prS7016617;
	Tue, 30 Jul 2013 09:51:53 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013073009494260-237324 ;
	Tue, 30 Jul 2013 09:49:42 +0800 
Message-ID: <51F71C3A.8000701@cn.fujitsu.com>
Date: Tue, 30 Jul 2013 09:51:54 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <51F5E863.9010406@cn.fujitsu.com>	
	<51F5E948.4070107@cn.fujitsu.com>
	<1375112169.13247.44.camel@phil-desktop.brightsign>
In-Reply-To: <1375112169.13247.44.camel@phil-desktop.brightsign>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/07/30 09:49:42,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/07/30 09:49:42,
	Serialize complete at 2013/07/30 09:49:42
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 1/6]qemuarm.conf: provide a common qemuarm machine configuration
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
X-List-Received-Date: Tue, 30 Jul 2013 01:51:57 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8


said the following on 2013-7-29 23:36:, Phil Blundell wrote:
> On Mon, 2013-07-29 at 12:02 +0800, Bian Naimeng wrote:
>> qemux86.conf: provide a common qemux86 machine configuration, 
>> so developer/distributor can customize their specific one.
>>
>> Although, we can modify the meta/conf/machine/qemux86.conf to customize our 
>> configuration, but it's uncomfortable for developer/distributor maintaining
>> their branch.
>> After applying this patch, developer can tell poky using their machine
>> configuration by prepending their layer to BBPATH(Of course,
>> the bblayers.conf should be adapted to it).
> 
> I don't really understand the purpose of this patch.  Surely there is
> nothing to stop you from shipping an overlay qemux86.conf in some other
> layer today, right?  What exactly is the advantage of this extra
> indirection through an .inc file?
> 

What my purpose is that make it easy to implement the below case.
 1. I want inherit all the configuration item of qemux86.conf.
 2. I want add some new items to my qemux86.conf.
 3. If there're changes to qemux86.conf, i want merge them to my qemux86.conf

Yes, we can implement this case today.
 1. Copy the meta/conf/machine/qemux86.conf to my layer.
 2. Add new items to my qemux86.conf
 3. Rewrite my qemux86.conf to merge community changes.

However, if applying these patches, it becomes easy.
 1. add "require conf/machine/include/qemux86.inc" to my qemux86.conf
 2. add new items to my qemux86.conf
 3. modify qemux86.inc to update qemux86 configration at community, 
    so all community changes will be merged to my qemux86.conf automatically
    when merging the mainline.

> Also, as a side note, your patches 1/6, 2/6 and 6/6 all said
> "qemuarm.conf" in the subject lines but only the last of them actually
> contained changes to qemuarm.conf.

Sorry for my mistake. The correct one is following.
1/6: qemux86.conf.
2/6: qemux86-64.conf

> 
> Also also, the patches in this form are quite hard to follow.  Did you
> use "git format-patch -M" when creating them?

Yes, I used "git format-patch -M" to create them.
I will check them by linux/scripts/checkpatch.pl next time.

Thanks
 bian

> 
> p.
> 
> 


