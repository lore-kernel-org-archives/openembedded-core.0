X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <ec556aa3-fb74-47a7-94cf-63a27199ba7c@pr.hu>
Date: Fri, 13 May 2022 18:48:42 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [meta-oe][PATCH v2 3/3] nodejs: Add /usr/lib/node -> node_modules symlink
References: <16EEAE47FC3C363C.27599@lists.openembedded.org>
 <20220513153031.1032716-1-zboszor@pr.hu>
 <20220513153031.1032716-3-zboszor@pr.hu>
 <CANNYZj8iwdYLGZ++GXsg4hcwZF9kQORzWF3Bv9QRRiYOV-95vw@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <CANNYZj8iwdYLGZ++GXsg4hcwZF9kQORzWF3Bv9QRRiYOV-95vw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>, =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>

2022. 05. 13. 17:42 keltezéssel, Alexander Kanavin írta:
> This needs to be sent to the openembedded-devel list.

Is it ok just to cc openembedded-devel? Because applying
this 3rd patch to meta-oe without applying the second to
oe-core will cause conflicts and has a high chance to be
rejected.

> 
> Alex
> 
> On Fri, 13 May 2022 at 17:31, Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
>>
>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>
>> While /usr/lib/node_modules and all npm-related modules are
>> shipped in the npm subpackage, keep the symlink in the main
>> package because 3rd party modules that don't need npm are
>> also installed into /usr/lib/node_modules.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
>> index 62188f94a..be68afd4c 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
>> @@ -159,6 +159,10 @@ do_compile () {
>>
>>   do_install () {
>>       oe_runmake install DESTDIR=${D}
>> +
>> +    # node(1) is using /usr/lib/node as default include directory and npm(1) is
>> +    # using /usr/lib/node_modules as install directory. Let's make both happy.
>> +    ln -fs node_modules ${D}/${nonarch_libdir}/node
>>   }
>>
>>   BINARIES = " \
>> @@ -176,6 +180,7 @@ do_install:append:class-native() {
>>   }
>>
>>   PACKAGES =+ "${PN}-npm"
>> +FILES:${PN} += "${nonarch_libdir}/node"
>>   FILES:${PN}-npm = "${nonarch_libdir}/node_modules ${bindir}/npm ${bindir}/npx"
>>   RDEPENDS:${PN}-npm = "bash python3-core python3-shell python3-datetime \
>>       python3-misc python3-multiprocessing"
>> --
>> 2.36.1
>>
>>
>> 
>>

