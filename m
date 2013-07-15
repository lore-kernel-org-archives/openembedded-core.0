Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 6F8B7619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 02:08:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,666,1367942400"; 
   d="scan'208";a="7890095"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 15 Jul 2013 10:05:33 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r6F28U4l011627;
	Mon, 15 Jul 2013 10:08:30 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013071510064370-2915098 ;
	Mon, 15 Jul 2013 10:06:43 +0800 
Message-ID: <51E3599E.5000807@cn.fujitsu.com>
Date: Mon, 15 Jul 2013 10:08:30 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <51DBC97F.1090606@cn.fujitsu.com>
	<CAJTo0LYQ4MJ3CUDZaVfDexcaO=MATWj0syDTpY5Veb3m1TNiMQ@mail.gmail.com>
	<51DF6448.5010906@cn.fujitsu.com> <7309265.hkedPcPrsU@helios>
In-Reply-To: <7309265.hkedPcPrsU@helios>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/07/15 10:06:43,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/07/15 10:06:44,
	Serialize complete at 2013/07/15 10:06:44
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
X-List-Received-Date: Mon, 15 Jul 2013 02:08:35 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

Hi Paul,

said the following on 2013-7-13 1:07:, Paul Eggleton wrote:
> Hi Bian,
> 
> On Friday 12 July 2013 10:04:56 Bian Naimeng wrote:
>> said the following on 2013-7-11 18:54:, Burton, Ross wrote:
>>> On 10 July 2013 03:56, Bian Naimeng <biannm@cn.fujitsu.com> wrote:
>>>> Sorry, it looks like i should post this patch to poky. please ignore this
>>>
>>> You were right the first time, meta/ is oe-core. :)
>>
>> Thanks for your reminding.
>>
>> In this case, the following error will be caught.
>>
>>    | error: Bad owner/group:  .../tmp/work/i586-poky-linux/.../xxx.spec
>>    | Building target platforms: i586-poky-linux
>>    | 
>>    | RPM build errors:
>>    |     Bad owner/group: .../tmp/work/i586-poky-linux/.../xxx.spec
>>
>> The following bb file can cause this error.
>> # cat xxx.bb
>>   SRC_URI="..../xxx.src.rpm"
>>
>>   do_unpack2 () {
>>           cd ${WORKDIR}
>>           tar zxvf xxx.tar.gz
>>   }
>>   addtask do_unpack2 after do_unpack before do_configure
>>
>> Of course, we can walk around it by append "extract=xxx.tar.gz" to SRC_URI,
>> but it's not good way when the xxx.src.rpm containing lots of necessary
>> files.
> 
> Wouldn't using subdir=xyz in the SRC_URI entry put the contents of the rpm 
> into a subdirectory and thus avoid this problem?
> 

Thanks for your suggestion.
Yes, it's can avoid this problem.

But, why we don't remove the xxx.spec file before doing rpmbuild xx.src.rpm if it's existed.
The old xxx.spec is unuseful.

In my opinion, it can make the bb file easier and clean than using subdir=xyz in the SRC_URI

Thanks,
 Bian

> Cheers,
> Paul
> 


