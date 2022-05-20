Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <1e18c14a-81dc-0b96-91db-dee45762be58@gmail.com>
Date: Fri, 20 May 2022 14:33:58 +0200
MIME-Version: 1.0
Subject: Re: [OE-core][PATCH] webkitgtk: limit the number of compilation threads
References: <20220520121617.2993631-1-thomas.perrot@bootlin.com>
 <6eed596f-6ca3-5977-bb1a-4d3d904bb154@gmail.com>
 <4f4d15ca5a76650c374d0af976dae859519197e7.camel@bootlin.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
In-Reply-To: <4f4d15ca5a76650c374d0af976dae859519197e7.camel@bootlin.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Thomas Perrot <thomas.perrot@bootlin.com>, openembedded-core@lists.openembedded.org

On 5/20/22 14:30, Thomas Perrot wrote:
> Hello Jacob,
> 
> On Fri, 2022-05-20 at 14:19 +0200, Jacob Kroon wrote:
>> On 5/20/22 14:16, Thomas Perrot via lists.openembedded.org wrote:
>>> Otherwise the compilation may lead to out-of-memories.
>>>
>>> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
>>> ---
>>>    meta/recipes-sato/webkit/webkitgtk_2.36.1.bb | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
>>> b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
>>> index 65757c36a733..e7cfe49e2b87 100644
>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
>>> @@ -80,6 +80,8 @@ setup_python_link() {
>>>          fi
>>>    }
>>>    
>>> +PARALLEL_MAKE = ""
>>> +
>>>    EXTRA_OECMAKE = " \
>>>                  -DPORT=GTK \
>>>                  ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-
>>> DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
>>> @@ -164,4 +166,3 @@ src_package_preprocess () {
>>>                ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
>>>    
>>>    }
>>> -
>>>
>>
>> Why punish build machines with lots of RAM ? Maybe it could be set
>> depending on available RAM/number of cores ?
>>
> 
> Why not.
> 

Because it slows down the build for them, which is not good.

> I tested on a build server with more than ~12GB ram available and 16
> cores, then I tried to reduce the number of threads and when the value
> is greater than 1 the build fails.
> 

12GB RAM does not sound like much for a 16 core system.

Jacob
