Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13A3D7289E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 17:39:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBIHdpxH006817
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 09:39:52 -0800 (PST)
Received: from server.local (128.224.21.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 18 Dec 2014 09:39:51 -0800
Message-ID: <54931166.2050006@windriver.com>
Date: Thu, 18 Dec 2014 12:39:50 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
	<b18c4c9970004784d031a0776245fad792fc6a28.1418220684.git.bruce.ashfield@windriver.com>
	<CAJTo0Lb3-sYAyMreFv2AFhEo4Ejzmg3eDYOs6avJMjVO5SVjOQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lb3-sYAyMreFv2AFhEo4Ejzmg3eDYOs6avJMjVO5SVjOQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] linux-libc-headers: update to 3.17
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
X-List-Received-Date: Thu, 18 Dec 2014 17:39:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-12-18, 12:13 PM, Burton, Ross wrote:
>
> On 10 December 2014 at 14:16, Bruce Ashfield
> <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>> wrote:
>
>     -LINUXLIBCVERSION ?= "3.16"
>     +LINUXLIBCVERSION ?= "3.17"
>
>
> So this is causing (at least) socat to fail to build as the configure
> script does a test for a working <linux/errqueue.h> but that is now failing:
>
> /data/poky-master/tmp/sysroots/nuc/usr/include/linux/errqueue.h:33:18:
> error: array type has incomplete element type
>
> Line 33 is this member in a struct:
>
>     struct timespec ts[3];
>
> Presumably everything else that includes that header also includes
> something that defines struct timespec.  Socat has a missing feature
> check so whilst the configure test says that linux/errqueue.h isn't
> present and continues, the build then fails.  Presumably the user-space
> linux/errqueue.h needs another #include?

This is unlikely to be fixed in the kernel header, but in the
applications themselves.

In this case, I see no changes to errqueue.h itself since 2012,
but the uapi did go through some changes in 3.17 .. but then no
more changes for 3.18.

So if this is broken, socat should be breaking on every distro that
uses 3.17+ kernel headers.

I see that our socat is still the latest.

.. and a quick search shows a fix:

http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-misc/socat/files/socat-1.7.2.4-linux-3.17.patch?view=markup

Did you want me to try a build and stack up the fix ?

Bruce





>
> Ross


