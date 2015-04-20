Return-Path: <zhengjunling@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [58.251.152.64])
	by mail.openembedded.org (Postfix) with ESMTP id 8425E71EC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:30:37 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMJ02153; Mon, 20 Apr 2015 09:30:36 +0800 (CST)
Received: from [127.0.0.1] (10.111.55.101) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 20 Apr 2015 09:30:32 +0800
Message-ID: <553456B2.8090004@huawei.com>
Date: Mon, 20 Apr 2015 09:30:26 +0800
From: Junling Zheng <zhengjunling@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Andre McCurdy <armccurdy@gmail.com>
References: <1429260608-3505-1-git-send-email-zhengjunling@huawei.com>
	<CAJ86T=VcRP1Fxc2+yb12K33TKqssuChAwHTAKjtAWyeMmqMrew@mail.gmail.com>
In-Reply-To: <CAJ86T=VcRP1Fxc2+yb12K33TKqssuChAwHTAKjtAWyeMmqMrew@mail.gmail.com>
X-Originating-IP: [10.111.55.101]
X-CFilter-Loop: Reflected
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmp: remove referencing paths from the build host
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
X-List-Received-Date: Mon, 20 Apr 2015 01:30:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 2015/4/18 2:24, Andre McCurdy wrote:
> On Fri, Apr 17, 2015 at 1:50 AM, Junling Zheng <zhengjunling@huawei.com> wrote:
>> Currently ${D}${includedir}/gmp.h references the path of build host
>> incorrectly, remove it.
>>
>> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
>> ---
>>  meta/recipes-support/gmp/gmp.inc | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
>> index 558ee06..a80b356 100644
>> --- a/meta/recipes-support/gmp/gmp.inc
>> +++ b/meta/recipes-support/gmp/gmp.inc
>> @@ -26,4 +26,8 @@ EXTRA_OECONF += " --enable-cxx=detect"
>>  PACKAGES =+ "libgmpxx"
>>  FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
>>
>> +do_install_append_class-target() {
>> +       sed -i "s+--sysroot=${STAGING_DIR_HOST}++g" ${D}${includedir}/gmp.h
>> +}
> 
> It's possible that STAGING_DIR_HOST could contain '+' characters, so
> '|' would be a safer sed separator to use here.
> 

Ok, thanks for your suggestion:)

>> +
>>  SSTATE_SCAN_FILES += "gmp.h"
>> --
>> 1.9.1
>>
> 
> 



