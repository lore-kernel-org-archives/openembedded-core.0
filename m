Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D85DC6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 15:56:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2HFuaeL002312
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Mar 2016 08:56:36 -0700 (PDT)
Received: from soho-mhatle-m.local (147.11.116.119) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 17 Mar 2016 08:56:35 -0700
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>, Richard
	Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1457939741-29071-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1457943238.2804.294.camel@linuxfoundation.org>
	<50B33AC5ED75F74F991980326F1C438D191CB5C4@PGSMSX103.gar.corp.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56EAD3B4.2080206@windriver.com>
Date: Thu, 17 Mar 2016 08:56:36 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <50B33AC5ED75F74F991980326F1C438D191CB5C4@PGSMSX103.gar.corp.intel.com>
Subject: Re: [master][PATCH] rpm: enable xz/lzma compression
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
X-List-Received-Date: Thu, 17 Mar 2016 15:56:56 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/14/16 1:18 AM, Chang, Rebecca Swee Fun wrote:
> We are having issues on decompressing tarball with xz format and rpm installation on target.
> We have this solution implemented to resolve it internally and would like to enable it in OE-core in order we wouldn't revisit this issue in future.
> Do I need to resend the patch with revised commit message?

When the packages are produced by the build environment then no issues should be
occurring.

The only time you should be having problems is if you are trying to install
packages (source or binary) produced from outside the build environment.  In the
source case, you can use the workaround of rpm2cpio <whatever> | cpio -id to
extract it.  Then when you build it fresh it will use the standard format.
(Yes, bz2/zlib is less efficient -- but is also more standard.)

If you require the xz/lzma compression, you should be doing this in your own
project's configuration.  I don't think it makes sense to add xz to all RPM
based filesystems.

(If you can profile what adding the xz option does to a filesystem, I may change
my mind.  The profiling needs to include the size change to RPM program itself,
the produced filesystem (as it now has additional dependencies), and the package
feeds size.

My guess, is:  RPM binary will increase in size marginally..  including XZ and
associated items could be potentially 'large'.. and the size of the package
feeds will be reduced, but I don't have a good feeling as to how much.

--Mark

> Regards,
> Rebecca
> 
> -----Original Message-----
> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org] 
> Sent: Monday, March 14, 2016 4:14 PM
> To: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [master][PATCH] rpm: enable xz/lzma compression
> 
> On Mon, 2016-03-14 at 15:15 +0800, Rebecca Chang wrote:
>> From: Anuj Mittal <anujx.mittal@intel.com>
>>
>> Enable lzma compression support in rpm.
> 
> Your commit message says what the patch does but not why? Presumably this change increases the size of the rpm install so what is the benefit?
> 
> Cheers,
> 
> Richard
> 


