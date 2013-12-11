Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8BF6D815
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 01:54:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBB1sLbU016036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Dec 2013 17:54:21 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 10 Dec 2013 17:54:21 -0800
Message-ID: <52A7C5CB.8060406@windriver.com>
Date: Wed, 11 Dec 2013 09:54:19 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1384331128.git.kai.kang@windriver.com>
	<bb068bc66bcdbf96dd84e5cd18e1765b9a32f2cc.1384331128.git.kai.kang@windriver.com>
	<52A76E46.2010008@linux.intel.com>
In-Reply-To: <52A76E46.2010008@linux.intel.com>
X-Enigmail-Version: 1.6
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] lsb: update directory of install_initd and remove_initd
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
X-List-Received-Date: Wed, 11 Dec 2013 01:54:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On 2013年12月11日 03:40, Saul Wold wrote:
> On 11/13/2013 12:27 AM, Kai Kang wrote:
>> According to LSB specification:
>>
>> http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/installinitd.html
>>
>> http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/removeinitd.html
>>
>>
>> commands install_initd and remove_initd should under directory
>> /usr/lib/lsb/.
>>
>> lsb recipe creates these commands under directory ${libdir} which may
>> expand to /usr/lib64 when multilib is enabled on qemux86-64. That will
>> cause LSB command check for install_initd and remove_initd fail. So
>> correct it.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> meta/recipes-extended/lsb/lsb_4.1.bb | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb
>> b/meta/recipes-extended/lsb/lsb_4.1.bb
>> index c80ff59..8105e59 100644
>> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
>> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
>> @@ -79,8 +79,8 @@ do_install_append(){
>>
>> # creat links for LSB test
>> install -d ${D}/${libdir}/lsb
>> - ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
>> - ln -sf ${sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
>> + ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/install_initd
>> + ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/remove_initd
> It's arguable that this should be ${prefix}/lib since there is a
> possibly case of libdir not being /usr/lib or /usr/lib64. It also goes
> to LSB explictly requires /usr/lib/lsb so for an LSB machine /usr/lib
> will aways exist.
>
> I will put this in the next C-Pull.

Hi Saul,

Sorry, please drop it for now and there is something wrong with this patch.
I intended to send a V2 version and with other changes for lsbtest.

Thanks,
Kai

>
> Sau!
>
>> ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
>>
>> if [ "${TARGET_ARCH}" = "x86_64" ];then
>>
>
>


-- 
Regards,
Neil | Kai Kang


