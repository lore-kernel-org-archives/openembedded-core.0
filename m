Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 44C606C3AA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 14:56:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x92Eupne022072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Oct 2019 07:56:51 -0700 (PDT)
Received: from [128.224.56.212] (128.224.56.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 2 Oct 2019 07:56:51 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190927185642.29251-1-konrad.scherer@windriver.com>
	<4ad724ca50b35e495d2eae800edd83c60b7128bf.camel@linuxfoundation.org>
From: Konrad Scherer <Konrad.Scherer@windriver.com>
Message-ID: <34a7db7f-83b3-f51f-9628-615762b44e91@windriver.com>
Date: Wed, 2 Oct 2019 10:56:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4ad724ca50b35e495d2eae800edd83c60b7128bf.camel@linuxfoundation.org>
X-Originating-IP: [128.224.56.212]
Subject: Re: [master][PATCH] gen-lockedsig-cache: Replace glob lookup with hash to filename lookup
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
X-List-Received-Date: Wed, 02 Oct 2019 14:56:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/2/19 6:17 AM, Richard Purdie wrote:
> On Fri, 2019-09-27 at 14:56 -0400, Konrad Scherer wrote:
>> From: Konrad Scherer <Konrad.Scherer@windriver.com>
>>
>> Using the glob function to map signatures to sstate files is very
>> slow
>> when the sstate is large and accessed over nfs. The lookup now only
>> loads the necessary prefixes and doesn't use glob as all.
>>
>> Unfortunately I don't have access to the systems where the
>> performance
>> isse was noticed and on my test system the glob is fast enough that
>> the performance numbers aren't useful. I could verify that file list
>> returned by the new code is the same.
>>
>> [YOCTO #13539]
>>
>> Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
>> ---
>>   meta/lib/oe/copy_buildsystem.py |  3 ++-
>>   scripts/gen-lockedsig-cache     | 44 +++++++++++++++++++++++++++++
>> ----
>>   2 files changed, 41 insertions(+), 6 deletions(-)
> 
> Thanks for this, its hugely appreciated!
> 
> I aimed to do some profile measurements to show the difference in speed
> but when testing it failed with:
> 
> Filtering out gdb-cross-x86_64:do_patch
> Filtering out gdb-cross-x86_64:do_prepare_recipe_sysroot
> Filtering out gdb-cross-x86_64:do_unpack
> Gathering file list
> Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 77, in <module>
>      sstate_content_cache[prefix] = build_sha_cache(prefix)
>    File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 39, in build_sha_cache
>      map_sha_to_files(sstate_dir, prefix, sha_map)
>    File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 29, in map_sha_to_files
>      sha = extract_sha(f)
>    File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 21, in extract_sha
>      return filename.split(':')[7].split('_')[0]
> IndexError: list index out of range
> 
> and then when I fixed that by ignoring files which don't match the pattern:
> 
> Gathering file list
> Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 80, in <module>
>      sstate_content_cache[prefix] = build_sha_cache(prefix)
>    File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 45, in build_sha_cache
>      map_sha_to_files(native_sstate_dir, prefix, sha_map)
>    File "/home/pokybuild/yocto-worker/qa-extras/build/scripts/gen-lockedsig-cache", line 27, in map_sha_to_files
>      sstate_files = os.listdir(sstate_prefix_path)
> FileNotFoundError: [Errno 2] No such file or directory: '/srv/autobuilder/autobuilder.yoctoproject.org/pub/sstateuniversal/b6/'
> 
> 
> I therefore added:
> 
> diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
> index ae5e09d89f..48cb67112f 100755
> --- a/scripts/gen-lockedsig-cache
> +++ b/scripts/gen-lockedsig-cache
> @@ -26,10 +26,13 @@ def map_sha_to_files(dir_, prefix, sha_map):
>       sstate_prefix_path = dir_ + '/' + prefix + '/'
>       sstate_files = os.listdir(sstate_prefix_path)
>       for f in sstate_files:
> -        sha = extract_sha(f)
> -        if sha not in sha_map:
> -            sha_map[sha] = []
> -        sha_map[sha].append(sstate_prefix_path + f)
> +        try:
> +            sha = extract_sha(f)
> +            if sha not in sha_map:
> +                sha_map[sha] = []
> +            sha_map[sha].append(sstate_prefix_path + f)
> +        except IndexError:
> +            continue
>   
>   # given a prefix build a map of hash to list of files
>   def build_sha_cache(prefix):
> @@ -38,7 +41,7 @@ def build_sha_cache(prefix):
>       sstate_dir = sys.argv[2]
>       map_sha_to_files(sstate_dir, prefix, sha_map)
>   
> -    native_sstate_dir = sys.argv[2] + sys.argv[4]
> +    native_sstate_dir = sys.argv[2] + '/' + sys.argv[4]
>       map_sha_to_files(native_sstate_dir, prefix, sha_map)
>   
>       return sha_map
> 
> 
> My benchmark before was seeing it spend over 30 minutes in bitbake
> core-image-minimal:do_populate_sdk_ext on an otherwise idle autobuilder
> cluster/NAS (35 minutes from a clean tmpdir).
> 
> With the patch applied and my above tweak, I saw:
> 
> real	6m58.120s
> 
> and I'd note this was with a full build running on the other workers so
> the NAS was under load. I could try and get an exact time for the above
> but didn't really see the point in spending another 30 minutes on it.
> 
> This is the time for the whole SDK image, not just the time this script
> takes but its enough for me to say its a vast improvement! :)

Great! It was frustrating to develop the code without a good reproducer.

> Konrad: Mind if I squash in the above tweaks?

Not at all. Sorry that you had to spend time debugging my code. That sha extraction code should have been more robust.

> Also, the new code is a bit too chatty and leads to a lot of log
> output, we'll need to tweak that too.

Please do.

-- 
Konrad Scherer, MTS, Linux Products Group, Wind River

