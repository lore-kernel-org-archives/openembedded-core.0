Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C2CC77BF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 01:49:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6I1nR9c012256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 17 Jul 2017 18:49:27 -0700
Received: from [128.224.162.203] (128.224.162.203) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 18:49:26 -0700
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <1500282788-218393-1-git-send-email-zhenbo.gao@windriver.com>
	<1500299820.5349.102.camel@linux.intel.com>
From: zhenbo <zhenbo.gao@windriver.com>
Message-ID: <596D68E8.60003@windriver.com>
Date: Tue, 18 Jul 2017 09:48:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1500299820.5349.102.camel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lsb: add checking for chkconfig existence when creating the symbolic
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
X-List-Received-Date: Tue, 18 Jul 2017 01:49:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2017年07月17日 21:57, Leonardo Sandoval wrote:
> On Mon, 2017-07-17 at 17:13 +0800, Zhenbo Gao wrote:
>> remove_initd and remove_initd will be created as the symbolic file
> I believe you mean 'install_initd and remove_initd'...
Hi Leonardo,

Thanks for pointing this mistake, sorry about that.
I will send a V2 patch later to correct this.

Thanks,
Zhenbo

>> of chkconfig, which will be not existed when systemd is configured,
>> so adding the check for the existence of chkconfig before creating
>> the symbolic.
>>
>> Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
>> ---
>>   meta/recipes-extended/lsb/lsb_4.1.bb | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
>> index cedf39e..c8db1a8 100644
>> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
>> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
>> @@ -90,11 +90,13 @@ do_install_append() {
>>          install -m 0755 ${WORKDIR}/init-functions ${D}${nonarch_base_libdir}/lsb
>>   
>>          # create links for LSB test
>> -       if [ "${nonarch_base_libdir}" != "${nonarch_libdir}" ] ; then
>> -               install -d ${D}${nonarch_libdir}/lsb
>> +       if [ -e ${sbindir}/chkconfig ]; then
>> +               if [ "${nonarch_base_libdir}" != "${nonarch_libdir}" ] ; then
>> +                       install -d ${D}${nonarch_libdir}/lsb
>> +               fi
>> +               ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/install_initd
>> +               ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/remove_initd
>>          fi
>> -       ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/install_initd
>> -       ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/remove_initd
>>   
>>          if [ "${TARGET_ARCH}" = "x86_64" ]; then
>>                  if [ "${base_libdir}" != "${base_prefix}/lib64" ]; then
>> -- 
>> 1.9.1
>>
>


