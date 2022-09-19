X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <1a076f35-655f-bf9a-cb11-8489958ea829@bootlin.com>
Date: Mon, 19 Sep 2022 21:35:50 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [docs] [PATCH 1/7] common-tasks.rst: remove SRC_URI:append from examples
References: <20220912073221.16601-1-mikko.rapeli@linaro.org>
 <f0c891d5-ccdd-41fb-97b9-ce987818e18f@theobroma-systems.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
In-Reply-To: <f0c891d5-ccdd-41fb-97b9-ce987818e18f@theobroma-systems.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: quentin.schulz@theobroma-systems.com, Mikko Rapeli <mikko.rapeli@linaro.org>, openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org

Mikko, thanks for the patch series.
Quentin, thanks for the review.

Indeed, I think that the description of the commit should be improved 
too. See below.

On 9/19/22 16:04, Quentin Schulz via lists.openembedded.org wrote:
> Hi Mikko,
>
> On 9/12/22 09:32, Mikko Rapeli wrote:
>> Using SRC_URI:append without recipe, machine or architecture
>> specific limitations makes the :append'ed text unremovable
>> and thus users and custom layers can not change the variable
>> anymore. This makes it hard to e.g. override SRC_URI completely
>> in a bbappend to update the full recipe to a newer version.
>> Thus common, reusable layers which users are meant to re-use and
>> customize should not use SRC_URI:append but SRC_URI += instead.


What the following text instead?

Using SRC_URI:append without recipe, machine or architecture specific 
limitations makes the :append'ed text more difficult to override than if 
the "+=" operator was used. This makes it hard for example to override 
SRC_URI completely in a bbappend to update the full recipe to a newer 
version. Thus common, reusable layers which users are meant to re-use 
and customize should not use SRC_URI:append but SRC_URI += instead.

>>
>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>> ---
>>   documentation/dev-manual/common-tasks.rst | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/documentation/dev-manual/common-tasks.rst 
>> b/documentation/dev-manual/common-tasks.rst
>> index b08a55331d..3112f9b893 100644
>> --- a/documentation/dev-manual/common-tasks.rst
>> +++ b/documentation/dev-manual/common-tasks.rst
>> @@ -2577,7 +2577,7 @@ chapter of the BitBake User Manual.
>>           S = "${WORKDIR}/postfix-${PV}"
>>         CFLAGS += "-DNO_ASM"
>> -      SRC_URI:append = " file://fixup.patch"
>> +      CFLAGS:append = " --enable-important-feature"


Didn't you mean
+     SRC_URI += "file://fixup.patch"

instead here?

>>     -  *Functions:* Functions provide a series of actions to be 
>> performed.
>>      You usually use functions to override the default implementation 
>> of a
>> @@ -2708,19 +2708,20 @@ in the BitBake User Manual.
>>      to existing variables. This operator does not add any additional
>>      space. Also, the operator is applied after all the ``+=``, and 
>> ``=+``
>>      operators have been applied and after all ``=`` assignments have
>> -   occurred.
>> +   occurred. This means that if ``:append`` is used, that text can 
>> not be
>> +   removed.
>
> Pedantic: it can, with :remove. One should try really hard to not use 
> it though.


What about...

"This means that if ``:append`` is used in a recipe, it cannot only be 
overridden by another layer using the  special ``:remove`` operator, 
which in turn will prevent further layers from adding it back."

I'm not very happy with this wording, because ":remove" hasn't been 
introduced at this stage in this section. Maybe we should add a link 
to https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#conditional-syntax-overrides

Any thoughts?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

