Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 668A1606BF;
	Wed, 27 Jul 2016 17:58:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6RHwYAT010075
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 27 Jul 2016 10:58:35 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 10:58:34 -0700
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>, Patches
	and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
References: <5798ECAD.1060109@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <69a74e8b-5c4f-27d2-6563-0307f9c74dae@windriver.com>
Date: Wed, 27 Jul 2016 12:58:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <5798ECAD.1060109@linux.intel.com>
Subject: Re: Busybox drop systemd support
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
X-List-Received-Date: Wed, 27 Jul 2016 17:58:47 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 7/27/16 12:17 PM, Aníbal Limón wrote:
> Hi folks,
> 
> I was working debugging an issue for missing /var/log/messages in
> systemd/busybox images [1] and then i found that busybox drop support
> for systemd from 1.25 version [2].
> 
> This ends in a set of questions of what we need to do in systemd/busybox
> images since the next version of busybox will not support systemd,
> 
> I have a couple of ideas,
> 
> - Remove the support of busybox in systemd images?, this is the hard
> one, we need an sw alternative here may be toybox...
> - Maintain the systemd support in busybox?, the patch [2] is small atm
> but in the future may be this will cause problems for maintain it.

I know we've had customers who want a 'busybox free' system.  In YP 2.0 there
were still a few items provided by busybox, so just disabling it (blacklist)
wasn't easy.

This sounds like a good opportunity to make sure that you can make a system that
works with and without busybox.

With that said, looking at [2] below.  I don't see that busybox ever really
supported or not systemd (contrary to what it says.)

It just means if systemd is selected, and the user is using busybox -- you
should not use syslogd out of busybox.  I think this is a reasonable requirement
-- and something that should be fairly easy to implement.  (With systemd, I'm
not sure why you would want to use the busybox syslogd anyway.. it's too limited
IMHO.)

--Mark

> Best regards,
> 	alimon
> 
> [1]
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=alimon/debug_times2&id=aa143dbe3cb233ee50944ebb62c541c823179a04
> [2]
> https://git.busybox.net/busybox/commit/?id=accd9eeb719916da974584b33b1aeced5f3bb346
> 
> 
> 


