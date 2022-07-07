Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <d69830cf-1659-4110-84ce-ddda3800c4b3@gmail.com>
Date: Thu, 7 Jul 2022 15:46:25 +0200
MIME-Version: 1.0
Subject: Re: [poky] [PATCH] perl: Fix perms to avoid patch fails
References: <20220617071314.3362109-1-kayo@illumium.org>
 <57bbb930-8343-5aa2-e4a4-d7aa92997e2a@windriver.com>
From: "Paulo Neves" <ptsneves@gmail.com>
In-Reply-To: <57bbb930-8343-5aa2-e4a4-d7aa92997e2a@windriver.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Randy MacLeod <randy.macleod@windriver.com>, "K." <kayo@illumium.org>, Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>

On 7/7/22 03:26, Randy MacLeod wrote:
> Hi K,
>
> Add oe-core list and move poky to BCC to ensure follow to the main 
> oe-core code review list.
>
> On 2022-06-17 03:13, K. wrote:
>> Fix missing write permissions to avoid problems with applying patches 
>> in particular on compressed filesystems:
>>
>> ERROR: perl-5.34.1-r0 do_patch: Applying patch 
>> '0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch' on 
>> target directory 
>> '/home/kayo/devel/elpitech/poc/openbmc/build/evb-ast2600/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/perl/5.34.1-r0/perl-5.34.1'
>> CmdError('quilt --quiltrc 
>> /home/kayo/devel/elpitech/poc/openbmc/build/evb-ast2600/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/perl/5.34.1-r0/recipe-sysroot-native/etc/quiltrc 
>> push', 0, 'stdout: Applying patch 
>> 0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
>> File cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm is read-only; 
>> trying to patch anyway
>> patching file cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
>> Hunk #1 succeeded at 1147 (offset 37 lines).
>> Hunk #2 succeeded at 2086 (offset 77 lines).
>> patch: setting attribute btrfs.compression for btrfs.compression: 
>> Permission denied
>> Patch 0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch 
>> does not apply (enforce with -f)
>>
>> Signed-off-by: K <kayo@illumium.org>
>> ---
>>   meta/recipes-devtools/perl/perl_5.36.0.bb | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb 
>> b/meta/recipes-devtools/perl/perl_5.36.0.bb
>> index 4456cdbcfb..6374717ab0 100644
>> --- a/meta/recipes-devtools/perl/perl_5.36.0.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
>> @@ -45,6 +45,13 @@ PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
>>   # Don't generate comments in enc2xs output files. They are not 
>> reproducible
>>   export ENC2XS_NO_COMMENTS = "1"
>>   +# Fix missing write permissions to avoid troubles
>> +# with applying patches on compressed filesystems
>> +do_fix_perms() {
>> +    find ${S} -type f ! -perm -u=w -exec chmod u+w {} \;
>> +}
>
> I've never done a build on btrfs let alone on a compressed btrfs volume.
> This does seem like it should affect many patches and not just the 
> perl ones.
>
> Any idea why only perl was affected and why it only shows up on that 
> FS type?
> This seems like a work-around rather than a proper fix to me so far.
>
> ../Randy
>
>
>> +addtask do_fix_perms after do_unpack before do_patch
>> +
>>   do_configure:prepend() {
>>       cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
>>   }
>>
>>
>>
This patch is not needed as the issue has been fixed in open embedded 
already in [1]. I think it is not yet in poky though.

[1] 
https://github.com/openembedded/openembedded-core/commit/47973fd4f3fbb0af1a0d1bc2c39f2900a963177d
