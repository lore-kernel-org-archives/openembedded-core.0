Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 099576186C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 06:58:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.90,866,1371052800"; 
   d="scan'208";a="8457568"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 09 Sep 2013 14:55:25 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r896wSRE010772;
	Mon, 9 Sep 2013 14:58:29 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013090914561248-1333088 ;
	Mon, 9 Sep 2013 14:56:12 +0800 
Message-ID: <522D7190.2010106@cn.fujitsu.com>
Date: Mon, 09 Sep 2013 14:58:24 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: poky@yoctoproject.org
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/09/09 14:56:12,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/09/09 14:56:17,
	Serialize complete at 2013/09/09 14:56:17
Cc: openembedded-core@lists.openembedded.org
Subject: [poky][Question]cross build error.
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
X-List-Received-Date: Mon, 09 Sep 2013 06:58:36 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

Hi all,

If link library of distribution which built by Yocto-1.4.x,
the following error will be caught.

 # /opt/poky-lsb/1.4.1/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc \
   -o helloworld helloworld.c -L /opt/mydistro/usr/lib -l xxx
   /opt/poky-lsb/1.4.1/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.7.2/ld: 
     skipping incompatible /lib/libc.so.6 when searching for /lib/libc.so.6
   /opt/poky-lsb/1.4.1/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.7.2/ld: 
     cannot find /lib/libc.so.6
   /opt/poky-lsb/1.4.1/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.7.2/ld: 
     skipping incompatible /usr/lib/libc_nonshared.a when searching for /usr/lib/libc_nonshared.a
   /opt/poky-lsb/1.4.1/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.7.2/ld:
     cannot find /usr/lib/libc_nonshared.a
   /opt/poky-lsb/1.4.1/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.7.2/ld:
     cannot find /lib/ld-linux-x86-64.so.2
   collect2: error: ld returned 1 exit status

It can be avoid by changing the sysroot to "/opt/mydistro".

 # /opt/poky-lsb/1.4.1/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc \
   -o helloworld helloworld.c -L /usr/lib -l xxx --sysroot /opt/mydistro

The default sysroot is "/opt/poky-lsb/1.4.1/sysroots/x86_64-poky-linux",
but why cross gcc finds libc.so.6 from /opt/mydistro/
 # cat /opt/poky-lsb/1.4.1/environment-setup-x86_64-poky-linux  | grep sysroot
   ... ...
   CC="x86_64-poky-linux-gcc  -m64 --sysroot=/opt/poky-lsb/1.4.1/sysroots/x86_64-poky-linux"
   ... ...

Any suggestion?

Thanks
 Bian


