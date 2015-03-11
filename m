Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1016F739F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 02:05:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2B25PhV020009
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Mar 2015 19:05:25 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 19:05:25 -0700
Message-ID: <54FFA2E4.5080500@windriver.com>
Date: Wed, 11 Mar 2015 10:05:24 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1425979509.git.liezhi.yang@windriver.com>
	<30f590c7e3d62ff1adb5d6b14fe0dca71f555f5f.1425979509.git.liezhi.yang@windriver.com>
	<CAMKF1sqgaHnXqynr2rEihsJ62QPnUyTw8q07-YihWA=3kUyZ=Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqgaHnXqynr2rEihsJ62QPnUyTw8q07-YihWA=3kUyZ=Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] btrfs-tools: workaround DEBUG_BUILD for arm
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
X-List-Received-Date: Wed, 11 Mar 2015 02:05:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/11/2015 12:28 AM, Khem Raj wrote:
> On Tue, Mar 10, 2015 at 2:25 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Workaround when:
>> MACHINE = "qemuarm"
>> DEBUG_BUILD = "1"
>>
>> Errors:
>> {standard input}: Assembler messages:
>> {standard input}:3383: Error: invalid operands (.text and *UND* sections) for `-'
>> {standard input}:3389: Error: invalid operands (.text and *UND* sections) for `-'
>> make: *** [cmds-fi-disk_usage.o] Error 1
>>
>
> can you post full compiler command ?

Sorry, there is no detailed compile log by default, I will try to print them
later, here is default log:

     [CC]     cmds-qgroup.o
     [CC]     cmds-check.o
     [CC]     cmds-replace.o
     [CC]     cmds-restore.o
     [CC]     chunk-recover.o
     [CC]     cmds-rescue.o
     [CC]     super-recover.o
     [CC]     cmds-property.o
     [CC]     cmds-fi-disk_usage.o
     [CC]     btrfs-map-logical.o
     [CC]     btrfs-image.o
     [CC]     btrfs-zero-log.o
     [CC]     btrfs-convert.o
     [CC]     btrfs-find-root.o
     [CC]     btrfstune.o
     [CC]     btrfs-show-super.o
{standard input}: Assembler messages:
{standard input}:3368: Error: invalid operands (.text and *UND* sections) for `-'
{standard input}:3374: Error: invalid operands (.text and *UND* sections) for `-'
     [AR]     libbtrfs.a
     [LD]     libbtrfs.so.0.1
Makefile:129: recipe for target 'cmds-fi-disk_usage.o' failed
make: *** [cmds-fi-disk_usage.o] Error 1
make: *** Waiting for unfinished jobs....


// RObert

>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../btrfs-tools/btrfs-tools_git.bb                 |    7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> index d86075c..382ee7c 100644
>> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> @@ -28,3 +28,10 @@ do_install () {
>>   }
>>
>>   BBCLASSEXTEND = "native"
>> +
>> +# Workaround when DEBUG_BUILD:
>> +# {standard input}: Assembler messages:
>> +# {standard input}:3383: Error: invalid operands (.text and *UND* sections) for `-'
>> +# {standard input}:3389: Error: invalid operands (.text and *UND* sections) for `-'
>> +# make: *** [cmds-fi-disk_usage.o] Error 1
>> +CFLAGS_append_arm = " -O2"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

