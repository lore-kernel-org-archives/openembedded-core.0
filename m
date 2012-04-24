Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SMhhS-00082W-Rh
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 17:30:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3OFL6qh011693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 08:21:07 -0700 (PDT)
Received: from msp-dhcp10.wrs.com (172.25.34.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 24 Apr 2012 08:21:06 -0700
Message-ID: <4F96C4E1.9000508@windriver.com>
Date: Tue, 24 Apr 2012 10:21:05 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAAA4K6J1SNRCr0uM1tT=DjyV47mk-KqGUZjT+B8qgujANw9ZTQ@mail.gmail.com>
In-Reply-To: <CAAA4K6J1SNRCr0uM1tT=DjyV47mk-KqGUZjT+B8qgujANw9ZTQ@mail.gmail.com>
Subject: Re: adding package nss in rootfs failed with dependency "/usr/local/bin/perl"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2012 15:30:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/12 8:23 AM, Jegan Chandru wrote:
> Hi,
>
> I have cross compiled NSS 3.13.1 for x86 64 bit environment, but when I try to
> add NSS package in rootfs, i am getting the following error,
>
> /error: Failed dependencies:
> /usr/local/bin/perl is needed by nss-3.13.1-r0.x86_64/
>
> I know perl is needed for nss, but the path which is trying to look perl, is
> quite confusing me, for perl doesn't exist in that location at all. Can anyone
> please tell me whats going on here and what have I missed?

This is a bug in the nss package.  It has an executable shell script that has a:

#! /usr/local/bin/perl

in it, which causes RPM to add a dependency on that specific path, and nothing 
is providing the path.

The fix is either, decide this is a sample/demo shell script and remove it from 
the nss package -- or fix the script to use the proper perl location of 
"${bindir}/perl"

> P.S: I am using Yocto-1.1.1 and Ubuntu host-11.10 64 bit.

--Mark

> Thanks all for your help,
> JC
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



