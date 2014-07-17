Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75A3770613
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 09:38:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6H9cvW1006527
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Jul 2014 02:38:57 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 17 Jul 2014 02:38:57 -0700
Message-ID: <53C799AD.4070706@windriver.com>
Date: Thu, 17 Jul 2014 17:38:53 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1405583899-13188-1-git-send-email-ming.liu@windriver.com>
	<1405583899-13188-3-git-send-email-ming.liu@windriver.com>
	<CAJTo0LaqmvZ7yoXtEOShd0TKNGzTXidoOd_dLhEu=DiCoyvr=Q@mail.gmail.com>
In-Reply-To: <CAJTo0LaqmvZ7yoXtEOShd0TKNGzTXidoOd_dLhEu=DiCoyvr=Q@mail.gmail.com>
X-Originating-IP: [128.224.163.186]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gettext: fix implicit build result
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
X-List-Received-Date: Thu, 17 Jul 2014 09:38:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2014 05:21 PM, Burton, Ross wrote:
> On 17 July 2014 08:58, Ming Liu <ming.liu@windriver.com> wrote:
>> Some "once only" variants are being defined instead of standard autoconf
>> macros, for instance, AC_CHECK_HEADERS_ONCE like AC_CHECK_HEADERS. The
>> advantage is that the check for each of the headers will be put only once
>> into the 'configure' file, therefore it keeps the size down. But there
>> is also a drawback that the checks then will turn to be statically inserted
>> to the configure and cannot be conditionalized any more. It will
>> definitely break the dependencies chosen as internally included.
> I'm confused as to why this breaks anything, and if it does break
> gettext then it's not embedded-specific but an upstream bug in the
> configure script, surely.  Can you explain what the problem is?
Yes, I'd like to explain it a little more.
AC_CHECK_HEADERS_ONCE will statically add some code to 'configure' file 
to force checking headers no matter it's in a condition or not. For example:
   ......
   if test "$gl_cv_libxml_use_included" != yes; then
     ......
     AC_CHECK_HEADERS_ONCE([somehead.h])
     ......
   fi

will always check somehead.h even gl_cv_libxml_use_included equal to 
'yes', then there will be a problem if we want to choose some 
dependency, for instance, libxml2, to be internally included, that means 
not refer to any headers or libraries in system, but oppositely, 
AC_CHECK_HEADERS_ONCE will pull in the header that it's supposed to 
check, and that would break the dependency we intended to set.

//Ming Liu
>
> Ross
>
>


