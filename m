Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id EF7F177193
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Apr 2016 16:42:06 +0000 (UTC)
Received: (qmail 19786 invoked by uid 1003); 9 Apr 2016 16:42:06 -0000
Received: from unknown (HELO ?192.168.1.23?) (philip@opensdr.com@66.87.64.10)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	9 Apr 2016 16:42:04 -0000
To: Alexander Kanevskiy <kad@kad.name>, Joshua Lock <joshua.g.lock@intel.com>
References: <1460106859-14007-1-git-send-email-joshua.g.lock@intel.com>
	<CANFkWp=ynO2J38+k=mBH6Y3GFOb2kZhbM9zea2T09EL2BDZHxA@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <570930BD.6070203@balister.org>
Date: Sat, 9 Apr 2016 09:41:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <CANFkWp=ynO2J38+k=mBH6Y3GFOb2kZhbM9zea2T09EL2BDZHxA@mail.gmail.com>
Cc: Joshua Lock <joshua.lock@collabora.co.uk>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic/utils/partitionedfs.py: assemble .wic images as sparse files
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
X-List-Received-Date: Sat, 09 Apr 2016 16:42:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 04/09/2016 03:36 AM, Alexander Kanevskiy wrote:
> On Fri, Apr 8, 2016 at 12:14 PM, Joshua Lock <joshua.g.lock@intel.com>
> wrote:
> 
>> From: Joshua Lock <joshua.lock@collabora.co.uk>
>>
>> The individual partitions created by wic are sparse but without
>> this change the assembled image is written as one (potentially
>> very) large file.
>>
>> Preserve sparseness in the assembled image by passing the sparse
>> conversion symbol.
>>
>> [YOCTO #9099]
>>
>> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
>> ---
>>  scripts/lib/wic/utils/partitionedfs.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/lib/wic/utils/partitionedfs.py
>> b/scripts/lib/wic/utils/partitionedfs.py
>> index 5a103bb..3e2b420 100644
>> --- a/scripts/lib/wic/utils/partitionedfs.py
>> +++ b/scripts/lib/wic/utils/partitionedfs.py
>> @@ -340,7 +340,7 @@ class Image(object):
>>              source = part['source_file']
>>              if source:
>>                  # install source_file contents into a partition
>> -                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d
>> conv=notrunc" % \
>> +                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d
>> conv=notrunc,sparse" % \
>>                        (source, image_file, self.sector_size,
>>                         part['start'], part['size'])
>>                  exec_cmd(cmd)
>>
> 
> 
> 
> This might be dangerous. Even in recent version of DD (coreutils 8.25), it
> might not detect in source file mapped/unmapped blocks properly,
> (just use is_nul() function to check if block contains only zeros, instead
> of e.g. fiemap).
> Result might be so, that in output file block which must be zeros is
> actually become unmapped. And as consequence, if it might not be written to
> destination drive.

Does it work with bmaptool?

Philip

> 
> Let me show example based on Ostro Project sparse images:
> 
> kad@orava:/tmp> ls -ls 2222
> 308416 -rw-r--r-- 1 kad users 5280628736 Apr  6 00:53 2222
> kad@orava:/tmp> grep /MappedBlocksCount 2222.bmap
>     <MappedBlocksCount> 77104   </MappedBlocksCount>
> 
> Now, let's copy it with dd:
> kad@orava:/tmp> ~/cu/coreutils-8.25/src/dd if=2222 of=4444
> conv=notrunc,sparse bs=4096
> 1289216+0 records in
> 1289216+0 records out
> 5280628736 bytes (5.3 GB, 4.9 GiB) copied, 1.31239 s, 4.0 GB/s
> kad@orava:/tmp> bmaptool create 4444 -o 4444.bmap
> kad@orava:/tmp> ls -ls 4444
> 308348 -rw-r--r-- 1 kad users 5280628736 Apr  9 13:22 4444
> kad@orava:/tmp> grep /MappedBlocksCount 4444.bmap
>     <MappedBlocksCount> 77087   </MappedBlocksCount>
> kad@orava:/tmp>
> 
> As you can see, in result of dd copied file we have less blocks mapped than
> in original.
> 
> Diffing block ranges:  (- original file, + dd copied)
>      <BlockMap>
> -        <Range> 0-4 </Range>
> -        <Range> 768-3321 </Range>
> -        <Range> 4608-7161 </Range>
> +        <Range> 0 </Range>
> +        <Range> 768-770 </Range>
> +        <Range> 772-774 </Range>
> +        <Range> 776 </Range>
> +        <Range> 780-3321 </Range>
> +        <Range> 4608-4610 </Range>
> +        <Range> 4612-4614 </Range>
> +        <Range> 4616 </Range>
> +        <Range> 4620-7161 </Range>
> -        <Range> 1289211-1289215 </Range>
> +        <Range> 1289211 </Range>
> +        <Range> 1289215 </Range>
>      </BlockMap>
> 
> As you can see, some blocks that must be cleaned (e.g. 1-3 around MBR or in
> the end, 1289211-1289215 where GPT bits located) are not marked as mapped,
> thus in case of sparse aware writing tool used to write to destination
> drive it might result as unwritten zero blocks, thus some old data would
> left on device.
> 
> I would suggest not to accept this patch right now, and do copy function
> that would be aware about real mapped/unmapped blocks.
> Something similar that I've did for Ostro Project here:
> https://github.com/ostroproject/meta-ostro/commit/d883169c3266c3c44f22db5f75ae94c4cf0f2924
> 
> but adopted to be generic for use inside wic.
> 
> 
> 
> 

