Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 39D8F7FEBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 18:08:37 +0000 (UTC)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00SI8Yqi015842
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Tue, 28 Jan 2020 12:08:35 -0600
To: Khem Raj <raj.khem@gmail.com>
References: <20200122002702.166957-1-mark.hatle@kernel.crashing.org>
	<20200122002702.166957-2-mark.hatle@kernel.crashing.org>
	<CAMKF1sryZBqOsM=ntW1S-QujuF19Gw74Ld9evNOkeAsGp0DFSg@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <4b908a1d-56d1-ac67-7b1d-447fa38c8063@kernel.crashing.org>
Date: Tue, 28 Jan 2020 12:08:34 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sryZBqOsM=ntW1S-QujuF19Gw74Ld9evNOkeAsGp0DFSg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libgcc.inc: Fix an issue w/ a recursive symlink
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
X-List-Received-Date: Tue, 28 Jan 2020 18:08:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/22/20 12:48 AM, Khem Raj wrote:
> On Tue, Jan 21, 2020 at 4:43 PM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
>>
>> From: Mark Hatle <mark.hatle@xilinx.com>
>>
>> If the OS is not Linux, the code could end up generating a recursive symlink.
>> This can happen because the same symlink can be created twice in a row.  If this
>> happenes, the second symlink becomes a link to itself within the directory
>> pointed to by the original link.
>>
>> In order to prevent this, verify that the destination does not already exist.
>>
> 
> does this happen with ln -sf too ? if not then perhaps that will be simpler

Yes, because the path being listed is assumed to be a directory path instead of
a file path.

--Mark

>> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>>  meta/recipes-devtools/gcc/libgcc.inc | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
>> index e008d14f36..6d48ec9809 100644
>> --- a/meta/recipes-devtools/gcc/libgcc.inc
>> +++ b/meta/recipes-devtools/gcc/libgcc.inc
>> @@ -9,14 +9,18 @@ do_install_append_class-target () {
>>                         "linux-musleabi") extra_target_os="linux-gnueabi";;
>>                         *) extra_target_os="linux";;
>>                 esac
>> -               ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
>> +               if [ ! -e ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os ]; then
>> +                       ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
>> +               fi
>>         fi
>>         if [ -n "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}" ]; then
>>                 case "${TARGET_OS}" in
>>                         "linux-musleabi") extra_target_os="linux-musleabihf";;
>>                         "linux-gnueabi") extra_target_os="linux-gnueabihf";;
>>                 esac
>> -               ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
>> +               if [ ! -e ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os ]; then
>> +                       ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
>> +               fi
>>         fi
>>  }
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

