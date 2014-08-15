Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C17CF601A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 03:00:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7F30UE8021761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Aug 2014 20:00:30 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 14 Aug 2014 20:00:29 -0700
Message-ID: <53ED77DE.7020208@windriver.com>
Date: Fri, 15 Aug 2014 11:00:46 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <cover.1408005909.git.Qi.Chen@windriver.com>	
	<d77cfaf8b63e3dd1d7b05ff4b547b6a4a4fc6b47.1408005909.git.Qi.Chen@windriver.com>	
	<20140814085432.GG14848@jama> <1408009147.22187.87.camel@ted>
In-Reply-To: <1408009147.22187.87.camel@ted>
X-Originating-IP: [128.224.162.187]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] systemd: add libdw to RDEPENDS
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
X-List-Received-Date: Fri, 15 Aug 2014 03:00:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2014 05:39 PM, Richard Purdie wrote:
> On Thu, 2014-08-14 at 10:54 +0200, Martin Jansa wrote:
>> On Thu, Aug 14, 2014 at 04:46:01PM +0800, Chen Qi wrote:
>>> Add libdw to RDEPENDS of systemd to avoid build-deps QA warning.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta/recipes-core/systemd/systemd_215.bb |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_215.bb b/meta/recipes-core/systemd/systemd_215.bb
>>> index 770787b..a52a042 100644
>>> --- a/meta/recipes-core/systemd/systemd_215.bb
>>> +++ b/meta/recipes-core/systemd/systemd_215.bb
>>> @@ -244,7 +244,7 @@ FILES_${PN} = " ${base_bindir}/* \
>>>   FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
>>>   FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>>>   
>>> -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
>>> +RDEPENDS_${PN} += "libdw kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
>> Shouldn't it be build-time dependency?
>>
>> If it's detected from sysroot in do_configure then it has to be in
>> DEPENDS to get deterministic results.
> Right. Secondly, what benefit does this library bring us?
>
> Cheers,
>
> Richard
>
>
>

Richard & Martin,

Thanks for reminding me about this.
I shouldn't have rushed into fixing the QA warning without looking into 
the configure.ac file.

It should really be a PACKAGECONFIG for 'elfutils'.
PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,libelf 
libdw,libelf libdw"

I will send out V2 of this patchset.

Best Regards,
Chen Qi

