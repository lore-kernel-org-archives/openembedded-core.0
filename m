X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <c97c1296-81b6-5900-eadd-dc3f711e82b2@pr.hu>
Date: Fri, 13 May 2022 16:02:48 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 2/2] staging.bbclass: Ignore installing multiple symlinks of the same name
References: <20220513134829.1895574-1-zboszor@pr.hu>
 <20220513134829.1895574-3-zboszor@pr.hu>
 <CANNYZj9-ZWBBo=+FLAECu=Eg8ZtumcuijWQ8_mU0D-hkSRZEWw@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <CANNYZj9-ZWBBo=+FLAECu=Eg8ZtumcuijWQ8_mU0D-hkSRZEWw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

2022. 05. 13. 15:55 keltezéssel, Alexander Kanavin írta:
> Apologies, but special-casing this in staging class is not right
> either. The problem should be addressed at the making of
> sysroot-destdir/ step from the npm class.

npm.bbclass creates the symlink in sysroot-destdir for recipe A

But then it's the job of staging.bbclass to populate a recipe B's
recipe-sysroot and recipe-sysroot-native from recipe A.

How can this be worked around from npm.bbclass?

> 
> Alex
> 
> 
> On Fri, 13 May 2022 at 15:49, Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
>>
>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>
>> Recipes using "inherit npm" install the same /usr/lib/node symlink
>> that points to node_modules. When a recipe DEPENDS on multiple
>> npm based recipe, do_prepare_recipe_sysroot() fails.
>>
>> Ignore this symlink in a way that the set of ignored symlinks
>> can be extended later if needed.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/classes/staging.bbclass | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
>> index 9fc8f4f283..f7b6056219 100644
>> --- a/meta/classes/staging.bbclass
>> +++ b/meta/classes/staging.bbclass
>> @@ -528,6 +528,7 @@ python extend_recipe_sysroot() {
>>
>>               with open(manifest, "r") as f:
>>                   manifests[dep] = manifest
>> +                ignored_dests = [ ''.join([d.getVar('nonarch_libdir'), '/node' ]) ]
>>                   for l in f:
>>                       l = l.strip()
>>                       if l.endswith("/fixmepath"):
>> @@ -545,7 +546,10 @@ python extend_recipe_sysroot() {
>>                       hashname = targetdir + dest
>>                       if not hashname.endswith("/"):
>>                           if hashname in fileset:
>> -                            bb.fatal("The file %s is installed by both %s and %s, aborting" % (dest, c, fileset[hashname]))
>> +                            if os.path.islink(hashname) and  dest in ignored_dests:
>> +                                bb.note("The symlink '%s' %s wants to install is already installed by %s, ignoring" % (dest, c, fileset[hashname]))
>> +                            else:
>> +                                bb.fatal("The file %s is installed by both %s and %s, aborting" % (dest, c, fileset[hashname]))
>>                           else:
>>                               fileset[hashname] = c
>>
>> --
>> 2.36.1
>>
>>
>>
>>
>>
>>
>> 
>>

