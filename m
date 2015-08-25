Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C1EB673DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 13:26:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7PDQUQM018701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 06:26:30 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Tue, 25 Aug 2015 06:26:30 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<6af40fe1752b8cf25efca4a906361c4437249841.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0LbMmZ9rf-Jq_XoGJzTCj_0E=1qene_ooyf_T_nWsH60Jw@mail.gmail.com>
	<1439372036.28153.29.camel@intel.com>
	<CAJTo0LYZg-gX1_-qeiJ2O1KDDhoYGi0BdJJp3z=hBhYhma9TVA@mail.gmail.com>
	<1440503201.24929.53.camel@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55DC6D05.7010107@windriver.com>
Date: Tue, 25 Aug 2015 08:26:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1440503201.24929.53.camel@intel.com>
Subject: Re: [PATCH 3/3] mtd-utils: keep xattr support enabled
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
X-List-Received-Date: Tue, 25 Aug 2015 13:26:30 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/25/15 6:46 AM, Patrick Ohly wrote:
> On Fri, 2015-08-14 at 11:51 +0100, Burton, Ross wrote:
>>
>> On 12 August 2015 at 10:33, Patrick Ohly <patrick.ohly@intel.com>
>> wrote:
>>         > There's a "xattr" DISTRO_FEATURE that should be respected
>>         here for
>>         > target builds (and explicitly enabled for native I guess).
>>         
>>         I can add that check, if you want.
>>         
>>         > Does enabling xattr mean adding build dependencies?
>>         
>>         No, the conditional code uses lgetxattr and llistxattr, which
>>         are in
>>         glibc.
>>
>>
>> From five seconds of google it looks like these are in musl and uclibc
>> too, so I've merged this  to MUT as-is.
> 
> However, it turned out that the XATTR code also introduces a dependency
> on sys/acl.h:
> 
> mkfs.jffs2.c:
> 
> #ifndef WITHOUT_XATTR
> #include <sys/xattr.h>
> #include <sys/acl.h>
> #endif
> 
> sys/acl.h gets provided by acl, so it may or may not work depending on
> build order and files on the host.
> 
> I hadn't caught that because I had only looked at library dependencies,
> sorry for that.
> 
> What's the right fix? Add the dependency on acl-native in the native
> case, disable XATTR support for target builds (same state as before) or
> make it somehow depend on both "xattr" and "acl" distro features?
> 
> Or only check for "xattr"? I'm uncertain how the two are related.
> 

Use PACKAGECONFIG, add xattr as a configuration that in turn adds the 'acl' as a
dependency.  Then acl-native will automatically be converted from 'acl' if the
'-native' version is built.

This is typically how I've seen it implemented in other places.  (Not necessary
xattr.. but with the push for more Linux Security Models coming from users and
other layers, I think xattr is something we need to make sure really works
properly.)

--Mark

