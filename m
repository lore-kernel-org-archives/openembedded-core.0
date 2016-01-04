Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FADD60291
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 16:32:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u04GWO6I012904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jan 2016 08:32:24 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Jan 2016 08:32:23 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1451912446.git.ian.ray@ge.com>
	<4e736dcbaf5c32f9d7728990ad4ac0ca975dfd6d.1451912446.git.ian.ray@ge.com>
	<568A99CD.9000800@universe-factory.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <568A9E97.2050909@windriver.com>
Date: Mon, 4 Jan 2016 10:32:23 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <568A99CD.9000800@universe-factory.net>
Subject: Re: [PATCH 1/1] linux-firmware: remove hard-coded paths
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
X-List-Received-Date: Mon, 04 Jan 2016 16:32:25 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/4/16 10:11 AM, Matthias Schiffer wrote:
> On 01/04/2016 02:14 PM, Ian Ray wrote:
>> The recipe uses hard-coded paths (specifically /lib) in do_install
>> and in FILES, however on a merged /usr system this directory might
>> not exist. Prefer base_libdir.
>>
>> Signed-off-by: Ian Ray <ian.ray@ge.com>
>> ---
> 
> This should use nonarch_base_libdir, base_libdir defaults to /lib64 on
> ppc64, which is not where the firmware is expected.
> 

At a minimum, I would agree nonarch_base_libdir, however..

I believe that the kernel loader/modules/tools themselves actually have '/lib'
hard coded into them.  This is the reason why /lib/firmware was used and not one
of the variables.

This is one of the cases were /lib is actually correct, since that is what the
system is expecting.  We can make some kind of accommodation for systems where
/lib -> /usr/lib... but that should be done inside of the filesystem setup
processing and not the package itself.  (I'm referring to the
'meta/files/fs-perms.txt' file.

--Mark

