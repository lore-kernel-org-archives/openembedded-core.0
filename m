X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <976419e0-eb32-d33e-d90d-b2eefc711034@pr.hu>
Date: Thu, 14 Oct 2021 08:54:35 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] libpam: Fix build with DISTRO_FEATURES usrmerge
References: <20211012111726.493810-1-zboszor@pr.hu>
 <CACS+7ZTXToShB1BjSA3WBB7CbcqWCeRotU3Ki3+WrzJDLLajqg@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <CACS+7ZTXToShB1BjSA3WBB7CbcqWCeRotU3Ki3+WrzJDLLajqg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>

On 2021. 10. 13. 21:38, Dan McGregor wrote:
> Thanks for this. I hit it pretty immediately.
> 
> On Tue, 12 Oct 2021 at 05:17, Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
>>
>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/recipes-extended/pam/libpam_1.5.2.bb | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
>> index a3c4a50cb3..ee3a84a3b6 100644
>> --- a/meta/recipes-extended/pam/libpam_1.5.2.bb
>> +++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
>> @@ -147,8 +147,10 @@ do_install() {
>>          if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>>                  echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
>>          fi
>> -        install -d ${D}/${libdir}/
>> -       mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
>> +       if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}; then
> 
> In the patch I made that I kept local for now my condition was
> 
> if [ "${base_libdir}" != "${libdir}" ]
> 
> It could be that a user sets libdir and base_libdir to be equal
> without enabling usrmerge, but both checks solve the immediate
> problem.

Right, this is the correct solution.

> 
> 
>> +               install -d ${D}/${libdir}/
>> +               mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
>> +       fi
>>   }
>>
>>   do_install_ptest() {
>> --
>> 2.31.1
>>
>>
>>
>>
>>
>>
>> 
>>

