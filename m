Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EBC45759D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 14:56:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t99EuWlH004673
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Oct 2015 07:56:32 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 9 Oct 2015 07:56:32 -0700
Message-ID: <5617D59E.30307@windriver.com>
Date: Fri, 9 Oct 2015 22:56:30 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1444358567.git.liezhi.yang@windriver.com>
	<c1a0f5138542a1f120dd58958d19efb20adbb223.1444358567.git.liezhi.yang@windriver.com>
	<20151009141946.GA2384@jama>
In-Reply-To: <20151009141946.GA2384@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] bitbake.conf: set CONFFILES by default
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
X-List-Received-Date: Fri, 09 Oct 2015 14:56:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/09/2015 10:19 PM, Martin Jansa wrote:
> On Thu, Oct 08, 2015 at 07:44:36PM -0700, Robert Yang wrote:
>> There are a lot of binary packages have files in /etc/, but only a few
>> of them have set CONFFILES, 187 packages are not set in a world build.
>> So treat all the files in /etc/ as CONFILES as Debian does
>> - Move the file out of /etc/ if it is not a conffile
>> - If /etc/foo can't be moved out, and is changed during
>>    runtime, then create a symlink /etc/foo -> /var/foo
>>
>> [YOCTO #8436]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/conf/bitbake.conf |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 9ddd1c0..7a53819 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -269,6 +269,7 @@ PACKAGE_BEFORE_PN ?= ""
>>   PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
>>   PACKAGES_DYNAMIC = "^${PN}-locale-.*"
>>   FILES = ""
>> +CONFFILES = "${sysconfdir}/*"
>
> Should this be
> CONFFILS_${PN} ?

I think that CONFFILES is better than CONFFILES_${PN}, since package.bbclass
checks both CONFFILES and CONFFILES_pkg, if we use CONFFILES_${PN} here, then
it doesn't work for the pkg like openssh-sshd and openssh-ssh, but CONFFILES
works for them.

// Robert

>
>>
>>   FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
>>               ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

