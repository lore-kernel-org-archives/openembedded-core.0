Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4B4C744AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 08:21:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8J8KwDj001057
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Sep 2018 01:21:08 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 19 Sep 2018 01:20:47 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1537327350-27510-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1spULQDLXWp7bkq-TAgEkKpuUDVY2HZCiqcu_UuXpUuMZw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <e1613497-e469-46c3-ea77-3fef212a07b5@windriver.com>
Date: Wed, 19 Sep 2018 16:20:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spULQDLXWp7bkq-TAgEkKpuUDVY2HZCiqcu_UuXpUuMZw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: upgrade 7.8p1 -> 7.8p2 to support openssl 1.1.x
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
X-List-Received-Date: Wed, 19 Sep 2018 08:21:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月19日 11:46, Khem Raj wrote:
> On Tue, Sep 18, 2018 at 8:12 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> - Convert from tarball to git repository which support
>>    openssl 1.1.x
>>
>> - There is no specific minor version that contains the
>>    openssl fix (it was merged to master a few days agao),
>>    but their next minor version will be p2.
>>
> I think we should test this patch and it would be good to get this in release
>

Got it,  I am doing the ptest on qemu

//Hongxu

>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../openssh/{openssh_7.8p1.bb => openssh_7.8p2.bb}             | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>   rename meta/recipes-connectivity/openssh/{openssh_7.8p1.bb => openssh_7.8p2.bb} (94%)
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb b/meta/recipes-connectivity/openssh/openssh_7.8p2.bb
>> similarity index 94%
>> rename from meta/recipes-connectivity/openssh/openssh_7.8p1.bb
>> rename to meta/recipes-connectivity/openssh/openssh_7.8p2.bb
>> index f4b295f..b74461e 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_7.8p2.bb
>> @@ -8,11 +8,10 @@ SECTION = "console/network"
>>   LICENSE = "BSD"
>>   LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
>>
>> -# openssl 1.1 patches are proposed at https://github.com/openssh/openssh-portable/pull/48
>> -DEPENDS = "zlib openssl10"
>> +DEPENDS = "zlib openssl"
>>   DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>>
>> -SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
>> +SRC_URI = "git://github.com/openssh/openssh-portable;branch=master \
>>              file://sshd_config \
>>              file://ssh_config \
>>              file://init \
>> @@ -29,8 +28,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>>
>>   PAM_SRC_URI = "file://sshd"
>>
>> -SRC_URI[md5sum] = "ce1d090fa6239fd38eb989d5e983b074"
>> -SRC_URI[sha256sum] = "1a484bb15152c183bb2514e112aa30dd34138c3cfb032eee5490a66c507144ca"
>> +SRCREV = "cce8cbe0ed7d1ba3a575310e0b63c193326ae616"
>> +
>> +S = "${WORKDIR}/git"
>>
>>   inherit useradd update-rc.d update-alternatives systemd
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



