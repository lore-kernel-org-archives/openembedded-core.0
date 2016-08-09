Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 27EC077201;
	Tue,  9 Aug 2016 15:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u79FOIPN009578; Tue, 9 Aug 2016 16:24:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0t3rKbB6_mmF; Tue,  9 Aug 2016 16:24:18 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u79FOFbA009573
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 9 Aug 2016 16:24:17 +0100
Message-ID: <1470756255.8166.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 09 Aug 2016 16:24:15 +0100
In-Reply-To: <DC67B803-475F-4992-8DFD-B8F5FA7B1D15@gmail.com>
References: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
	<1470637705.8166.29.camel@linuxfoundation.org>
	<8C207C42-3D61-4C3F-A1DE-F305AA6617BA@gmail.com>
	<1470644094.8166.37.camel@linuxfoundation.org>
	<1470646210.8166.38.camel@rpsys.net>
	<1470647765.4581.23.camel@andred.net>
	<ACB9AEF7-A7DF-4A88-9762-7569D91AD12D@gmail.com>
	<1470671991.8166.44.camel@linuxfoundation.org>
	<CAJTo0LY-MVSANSLRBzBGTL2ZJ=Ga=Xijps6jwAGosLK3aE4QLg@mail.gmail.com>
	<DC67B803-475F-4992-8DFD-B8F5FA7B1D15@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Yocto Discussion Mailing List <yocto@yoctoproject.org>
Subject: Re: [RFT] binutils 2.27
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
X-List-Received-Date: Tue, 09 Aug 2016 15:24:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-08-09 at 07:42 -0700, Khem Raj wrote:
> I could also see it on ppc. backtrace, shows the segfault is in exit
> path and happens in libc
> at this point, I think the problem is how libc is compiled with
> binutils 2.27, connman itself
> is ok. 

Its the issue here:

https://sourceware.org/ml/glibc-bugs/2015-01/msg00274.html
https://sourceware.org/bugzilla/show_bug.cgi?id=17908

Basically, if you remove the global _IO_stdin_used symbol, it triggers
compatibility code which crashes.

I've confirmed that if I add that symbol to the version-script in
connman, things work again.

Any idea how we raise the priority of this issue. There are no comments
on the bug despite it having been posted a while ago :(.

Cheers,

Richard

