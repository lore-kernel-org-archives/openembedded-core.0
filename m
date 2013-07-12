Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0176A45E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 02:05:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,649,1367942400"; 
   d="scan'208";a="7868745"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 12 Jul 2013 10:02:01 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r6C24vQo015435;
	Fri, 12 Jul 2013 10:04:58 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013071210031596-2881407 ;
	Fri, 12 Jul 2013 10:03:15 +0800 
Message-ID: <51DF6448.5010906@cn.fujitsu.com>
Date: Fri, 12 Jul 2013 10:04:56 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <51DBC97F.1090606@cn.fujitsu.com> <51DCCD6D.5050807@cn.fujitsu.com>
	<CAJTo0LYQ4MJ3CUDZaVfDexcaO=MATWj0syDTpY5Veb3m1TNiMQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYQ4MJ3CUDZaVfDexcaO=MATWj0syDTpY5Veb3m1TNiMQ@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/07/12 10:03:15,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/07/12 10:03:16,
	Serialize complete at 2013/07/12 10:03:16
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
X-List-Received-Date: Fri, 12 Jul 2013 02:05:04 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8



said the following on 2013-7-11 18:54:, Burton, Ross wrote:
> On 10 July 2013 03:56, Bian Naimeng <biannm@cn.fujitsu.com> wrote:
>> Sorry, it looks like i should post this patch to poky. please ignore this
> 
> You were right the first time, meta/ is oe-core. :)
> 

Thanks for your reminding.

In this case, the following error will be caught.

   | error: Bad owner/group:  .../tmp/work/i586-poky-linux/.../xxx.spec
   | Building target platforms: i586-poky-linux
   |
   |
   | RPM build errors:
   |     Bad owner/group: .../tmp/work/i586-poky-linux/.../xxx.spec

The following bb file can cause this error.
# cat xxx.bb
  SRC_URI="..../xxx.src.rpm"

  do_unpack2 () {
          cd ${WORKDIR}
          tar zxvf xxx.tar.gz
  }
  addtask do_unpack2 after do_unpack before do_configure

Of course, we can walk around it by append "extract=xxx.tar.gz" to SRC_URI,
but it's not good way when the xxx.src.rpm containing lots of necessary files.

Thanks
 Bian

> Ross
> 


