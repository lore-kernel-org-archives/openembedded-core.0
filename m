Return-Path: <andrej.valek@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 063A475580
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 07:49:00 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id w587mwFZ011772
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 8 Jun 2018 09:48:58 +0200
Received: from [192.168.253.100] ([163.242.57.90])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id w587mvSS021289
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Jun 2018 09:48:58 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20180607072501.27158-1-andrej.valek@siemens.com>
	<20180607073209.27240-1-andrej.valek@siemens.com>
	<59452b23-7470-588c-75fb-7445aaa13ba1@linux.intel.com>
	<e09f86d5-ef04-fa9c-8cbf-c0b0f4fa4172@siemens.com>
Openpgp: preference=signencrypt
Message-ID: <c407b9de-5921-0512-eeba-9ea6f9464386@siemens.com>
Date: Fri, 8 Jun 2018 09:48:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <e09f86d5-ef04-fa9c-8cbf-c0b0f4fa4172@siemens.com>
Subject: Re: [PATCH v2] feat(openssl-1.1): rework packaging
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
X-List-Received-Date: Fri, 08 Jun 2018 07:49:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi again,

after more testing, I think creating ${sysconfdir}/ssl links is highly
recommended. ca-certificate updating script (+ many other tools) has
hard-coded path to /etc/ssl. Debian has multiple links in /usr/lib/ssl/
to /etc/ssl/.

So I think, my previous patch is correct.

Now I am going to test your openssl-1.1.1 branch.

BR,
Andrej

On 06/08/18 08:33, Andrej Valek wrote:
> Hi Alex,
> 
> On 06/07/18 15:13, Alexander Kanavin wrote:
>> On 06/07/2018 10:32 AM, Andrej Valek wrote:
>>> -do_install_append_class-native () {
>>>           # Install a custom version of c_rehash that can handle sysroots properly.
>>>           # This version is used for example when installing ca-certificates during
>>>           # image creation.
>>>           install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
>>>           sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
>>
>> Why is this merged into the main do_install()? Please explain.
> c_rehash was not working on target exactly as on native. (Same perl
> erros). So I have copied this stuff from 1.0.2, it is working on both
> platforms as well.
>>
>>> +        # Create SSL structure
>>> +        install -d ${D}${sysconfdir}/ssl/
>>> +        mv ${D}${libdir}/ssl-1.1/openssl.cnf \
>>> +           ${D}${libdir}/ssl-1.1/certs \
>>> +           ${D}${libdir}/ssl-1.1/private \
>>> +           \
>>> +           ${D}${sysconfdir}/ssl/
>>> +        ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl-1.1/certs
>>> +        ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl-1.1/private
>>> +        ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl-1.1/openssl.cnf
>>
>> Please explain this change as well. Resend the patch with the 
>> explanations included in the commit log or (better), the recipe itself.
> During splitting to packages I have compared files with 1.0.2 and I
> wanted to have same file structure. Anyway Debian is using this location
> without modification and You don't like it, so I will revert it.
> 
> But note that bash-completion has the /etc path for openssl.cnf as
> default search path... .
>>
>> I would like to keep the new openssl recipe short and simple, and so 
>> anything that adds lines and complication should be well justified. :)
>>
>> Alex
>>
> 
> BR,
> Andrej
> 

