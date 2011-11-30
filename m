Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RVjbL-00054w-It
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 13:49:27 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 02A0F5BA8B0; Wed, 30 Nov 2011 05:42:49 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4FD805BA8AE;
	Wed, 30 Nov 2011 05:42:46 -0700 (MST)
Message-ID: <4ED624C6.5070505@mlbassoc.com>
Date: Wed, 30 Nov 2011 05:42:46 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED61F56.8050409@mlbassoc.com>
	<20111130123743.GA27310@novatech.datenfreihafen.org>
In-Reply-To: <20111130123743.GA27310@novatech.datenfreihafen.org>
Subject: Re: [PATCH] Alter order of file systems tried by mount
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 12:49:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-11-30 05:37, Stefan Schmidt wrote:
> Hello.
>
> On Wed, 2011-11-30 at 05:19, Gary Thomas wrote:
>>   The file /etc/filesystems is used by busybox 'mount' when
>>   attempting to mount a file system when the type is not
>>   specified.  This change alters the order so that more
>>   capable systems are tried first.  Without this change, an
>>   EXT3 system will mount as EXT2 which disables many of the
>>   EXT3 features.  With the change, EXT3 systems are mounted
>>   properly.
>>
>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>
>> ---
>>   .../recipes-core/base-files/base-files/filesystems |    8 ++++----
>>   meta/recipes-core/base-files/base-files_3.0.14.bb  |    2 +-
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files/filesystems b/meta/recipes-core/base-files/base-files/filesystems
>> index 2af6a7e..14f5abb 100644
>> --- a/meta/recipes-core/base-files/base-files/filesystems
>> +++ b/meta/recipes-core/base-files/base-files/filesystems
>> @@ -1,7 +1,7 @@
>> -minix
>> -fat
>> -vfat
>> -ext2
>>   ext3
>> +ext2
>> +vfat
>> +fat
>>   btrfs
>> +minix
>
> In the commit message you explain the problem with ext2/3. And I agree
> that it makes sense to start with ext3. Actually, adding ext4 would
> make sense, too.

Agreed.

>
> What is the deal with the re-ordering of fat/vfat/minix though? Looks
> unrelated to me.

Same argument as above - try more capable file systems first.
I also moved minix to the end as it is rarely, if ever, used.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


