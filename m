Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55487781DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 14:46:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1REjxAG006400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 27 Feb 2018 06:45:59 -0800
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 27 Feb 2018 06:45:58 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Ovidiu Panait
	<ovidiu.panait@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20180227134541.147175-1-ovidiu.panait@windriver.com>
	<af855f84-4b86-d8d6-94ee-7ef56915ef05@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <0668e9a6-bf11-b150-fd1c-7f2c742c983f@windriver.com>
Date: Tue, 27 Feb 2018 08:46:23 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <af855f84-4b86-d8d6-94ee-7ef56915ef05@linux.intel.com>
Subject: Re: [PATCH] nativesdk-rpm: Add wrappers for nativesdk support
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
X-List-Received-Date: Tue, 27 Feb 2018 14:46:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/27/18 8:09 AM, Alexander Kanavin wrote:
> On 02/27/2018 03:45 PM, Ovidiu Panait wrote:
>> +do_install_append_class-nativesdk() {
>> +        tools="\
>> +                ${bindir}/rpm \
>> +                ${bindir}/rpm2archive \
>> +                ${bindir}/rpm2cpio \
>> +                ${bindir}/rpmbuild \
>> +                ${bindir}/rpmdb \
>> +                ${bindir}/rpmgraph \
>> +                ${bindir}/rpmkeys \
>> +                ${bindir}/rpmsign \
>> +                ${bindir}/rpmspec \
>> +                ${libdir}/rpm/rpmdeps \
>> +        "
>> +
>> +        for tool in $tools; do
>> +                create_wrapper ${D}$tool \
>> +                        RPM_CONFIGDIR='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
>> +                        RPM_ETCCONFIGDIR='$'{RPM_ETCCONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/..} \
>> +                        MAGIC='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/misc/magic.mgc \
>> +                        RPM_NO_CHROOT_FOR_SCRIPTS=1
>> +        done
>> +
>> +        rm -rf ${D}/var
>> +}
> 
> Can this be done without copy-pasting an existing function please?

The code can't run in class-target, this would screw up the target.
The code in class-native has a different set of arguments to the create_wrapper.
The rm -rf ${D}/var is not done on class-native, but is done on class-target.

So no.  We need two copies, as they are different.

--Mark

> Alex
> 


