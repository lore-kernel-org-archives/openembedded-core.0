Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 021F5731A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 19:39:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u72JdkLZ017982
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Aug 2016 12:39:46 -0700 (PDT)
Received: from msp-dhcp4.wrs.com (172.25.34.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 2 Aug 2016 12:39:46 -0700
To: Seebs <seebs@seebs.net>, <openembedded-core@lists.openembedded.org>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
	<579EE4BB.6070709@windriver.com>
	<F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
	<579F0EE8.3080009@windriver.com>
	<39329191-8DC4-43B6-9B38-5AD173C8F0DC@seebs.net>
	<1470081674.9142.108.camel@linuxfoundation.org>
	<BDA8434F-AE7B-4D8D-B6C3-2D4ED599E9E8@seebs.net>
	<1470092106.9142.113.camel@linuxfoundation.org>
	<579FFCEB.6090200@windriver.com>
	<47AE4E78-D57B-44C1-B5D5-4509B15AD3BC@seebs.net>
	<57A03888.1@windriver.com>
	<E145B74B-3968-45C3-A0B0-D557C76ADC38@seebs.net>
	<57A04154.1050909@windriver.com>
	<9BFBB743-6513-4791-9046-6BFBED50A347@seebs.net>
	<9034b8dd-a4dc-e2c4-fcb0-8e488e78296c@windriver.com>
	<5B4A0BBD-1322-4DE4-85DB-3D7216CB6BC4@seebs.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <dc38a32e-ba20-f2f3-cd77-73afe3db825a@windriver.com>
Date: Tue, 2 Aug 2016 14:39:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <5B4A0BBD-1322-4DE4-85DB-3D7216CB6BC4@seebs.net>
Subject: Re: About pseudo's chmod
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
X-List-Received-Date: Tue, 02 Aug 2016 19:39:47 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/2/16 2:19 PM, Seebs wrote:
> On 2 Aug 2016, at 10:12, Mark Hatle wrote:
> 
>> So the problem is -- pseudo is modifying the 'original' file perms, 
>> which on a
>> new instance of the pseudo database then gets inherited.  So we get
>> unpredictable results if this is the first time through -- or not the 
>> first time
>> through.
> 
> Yeah. And the problem here is in part that we're calling chmod on a file 
> linked to a file external to pseudo, but we're also checking that file's 
> mode to find out what permissions we want it to have. Which is probably 
> an error.
> 
> So, it does look like we need the tracking, but also if we stopped 
> doing:
> 
> 	stat file1 # obtain mode
> 	ln file1 file2
> 	chmod <mode> file2
> 
> we'd save significant time AND avoid the problem.
> 
> -s
> 

The alternative to the 'ln' is a 'cp' operation.  This is how it used to work
until optimizations were added a few releases ago.  It was observed that this
saves a large amount of space -- but it had the unintended consequence of
suddenly files are now changes as the do_install/do_package processing
manipulates files and modes change...

I almost wonder if in pseudo we should avoid changing any modes internal to the
file -- until something tries to write to the file.  (Can we even capture that
and try to fix it?  If not, what we're doing is likely the only answer.)

--Mark

