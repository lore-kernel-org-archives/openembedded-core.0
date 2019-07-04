Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 475A77D2FD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 11:57:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x64BvpL9012871
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jul 2019 04:57:53 -0700 (PDT)
Received: from [192.168.10.15] (172.25.59.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 4 Jul 2019 04:57:51 -0700
To: Adrian Bunk <bunk@stusta.de>, Martin Jansa <martin.jansa@gmail.com>
References: <20190702201609.78379-1-jason.wessel@windriver.com>
	<20190702201609.78379-4-jason.wessel@windriver.com>
	<CA+chaQdZmWmLYPLfzZ2s6ojCG1QwEGjy7O7fdpNOh2QGTE9vjA@mail.gmail.com>
	<20190704105726.GA21763@localhost>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <20567801-7441-e67a-59f0-e492ef60bacb@windriver.com>
Date: Thu, 4 Jul 2019 06:57:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190704105726.GA21763@localhost>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] glibc/glibc-locale: Fix do_stash_locale to work with usrmerge and multilibs
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
X-List-Received-Date: Thu, 04 Jul 2019 11:57:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/4/19 5:57 AM, Adrian Bunk wrote:
> On Thu, Jul 04, 2019 at 11:13:18AM +0200, Martin Jansa wrote:
>> I don't see how this change (or the previous glibc-locale one) would cause
>> that, but since the oe-core upgrade yesterday I'm seeing following
>> glibc-locale.do_package failure:
>> http://errors.yoctoproject.org/Errors/Details/250557/
>>
>> DEBUG: Executing shell function do_prep_locale_tree
>> tar: i18n: Cannot stat: No such file or directory
>> tar: Exiting with failure status due to previous errors
>> gzip:
>> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc-locale/2.29-r0/locale-tree//usr/share/i18n/charmaps/*gz.gz:
>> No such file or directory
>> WARNING:
>> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc-locale/2.29-r0/temp/run.do_prep_locale_tree.23303:1
>> exit 1 from 'gunzip $i'
>>
>> anyone else seeing this?
> 
> Yes.
> 


I don't know that it was specifically this change that causes the problem but rather any change to this function.   If that is not the case can either of you send me your local.conf file, and I'll try to reproduce it.  If the following doesn't work around the problem, there is clearly another corner case that is not well understood.

bitbake -c cleansstate glibc glibc-locale

I believe that any change to the .inc file which has locale stash function will cause the problem due to the fact it performs and "mv" operation to move the files.  When it runs a second time, there are no more files to move and you will not have them for use later on.  When I was experimenting earlier, I tried running the glibc temp/run.do_install script to put the files back, but then hit a problem with localdef being missing, because it comes from the temp/run.do_compile functions.

My conclusion thus far has been is that the ties between the glibc and glibc-locale are very subtle and break easily.  This is a separate problem than what I was attempting to fix, where the usrmerge + multilibs didn't even get the correct files in the first place.

Cheers,

Jason.

